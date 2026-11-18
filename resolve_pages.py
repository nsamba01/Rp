"""Two-pass resolution of LOF/LOT page numbers.

Builds report.typ with a pages dict, compiles, scrapes the real first page of
every "Figure N :" / "Tableau N :" caption from the produced PDF, and repeats
until the numbering stops moving.
"""
import re
import sys
import json

import typst
import pymupdf
import build_typ

OUT = '/home/user/Rp/report.typ'
PDF = '/home/user/Rp/report.pdf'
FONTS = ['/home/user/Rp/assets/fonts']

FIG = re.compile(r'Figure\s+(\d+)\s*:')
TAB = re.compile(r'Tableau\s+([A-Z]?\d+)\s*:')


def compile_pdf():
    typst.compile(OUT, output=PDF, font_paths=FONTS, root='/')


def scrape():
    """Return {(kind, num): 'page'} using the first body occurrence of each caption."""
    doc = pymupdf.open(PDF)
    hits = {'fig': {}, 'tab': {}}
    for pno in range(len(doc)):
        txt = doc[pno].get_text()
        f = set(FIG.findall(txt))
        t = set(TAB.findall(txt))
        # skip index pages (LOF/LOT) that list many captions at once
        if len(f) > 5:
            f = set()
        if len(t) > 5:
            t = set()
        for n in f:
            hits['fig'].setdefault(n, str(pno + 1))
        for n in t:
            hits['tab'].setdefault(n, str(pno + 1))
    doc.close()
    return hits


def main():
    pages = {}
    prev = None
    for it in range(6):
        build_typ.build(OUT, pages)
        compile_pdf()
        hits = scrape()
        new = {}
        for kind in ('fig', 'tab'):
            for num, pg in hits[kind].items():
                new[(kind, num)] = pg
        n_fig = len([k for k in new if k[0] == 'fig'])
        n_tab = len([k for k in new if k[0] == 'tab'])
        print(f'pass {it}: fig={n_fig} tab={n_tab}')
        if new == pages:
            print('stable')
            break
        pages = new
    build_typ.build(OUT, pages)
    compile_pdf()
    doc = pymupdf.open(PDF)
    txt = ''.join(doc[i].get_text() for i in range(len(doc)))
    print('pages', len(doc), 'unresolved 00:', len(re.findall(r'\b00\b', txt)))
    doc.close()
    json.dump({f'{k[0]}:{k[1]}': v for k, v in pages.items()},
              open('/home/user/Rp/pages_map.json', 'w'), indent=0)


if __name__ == '__main__':
    main()
