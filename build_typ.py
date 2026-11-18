#!/usr/bin/env python3
"""Rebuild the Typst report source from the structured DOCX (post-recovery)."""
import re, sys, json
import docx
from docx.table import Table
from docx.text.paragraph import Paragraph
from PIL import Image

DOCX = ('/home/user/Rp/Rapport_Diagnostic_Operationnel_Rapide_ESS_EpiC_RDC_ICHESS_FHI360'
        '_Edition_Refondue_2026.docx')
IMG = '/home/user/Rp/assets/img'
W = '{http://schemas.openxmlformats.org/wordprocessingml/2006/main}'

BG = 'rgb("#c2cfea")'; NAVY = 'rgb("#131d44")'; INDIGO = 'rgb("#5166b7")'; INK = 'rgb("#0f1015")'
CREAM = 'rgb("#fffbf7")'; ZEBRA = 'rgb("#eef2fd")'; LAV = 'rgb("#ced6f8")'
SPECIAL = set('#$[]*_\\`<>@')


def esc(t):
    out = []
    for i, ch in enumerate(t):
        if ch in SPECIAL:
            out.append('\\' + ch)
        elif ch in '-+/' and (i == 0 or t[i - 1] in ' \t\n'):
            out.append('\\' + ch)
        elif ch == '~':
            out.append('\\~')
        else:
            out.append(ch)
    return ''.join(out)


def markup(par):
    parts = []
    for r in par.runs:
        t = r.text
        if not t:
            continue
        t = esc(t)
        if r.bold and r.italic:
            t = f'*_{t}_*'
        elif r.bold:
            t = f'*{t}*'
        elif r.italic:
            t = f'_{t}_'
        parts.append(t)
    s = ''.join(parts).strip()
    while '**' in s:
        s = s.replace('**', '')
    while '__' in s:
        s = s.replace('__', '')
    return s


def cell_paras(tbl):
    """List of paragraph-text lists, one per cell of the first row."""
    out = []
    for tc in tbl.rows[0]._tr.tc_lst:
        ps = []
        for p in tc.findall(W + 'p'):
            txt = ''.join((t.text or '') for t in p.findall('.//' + W + 't')).strip()
            if txt:
                ps.append(txt)
        out.append(ps)
    return out


def row_spans(tbl):
    """Return [[(gridspan, text), ...], ...] honouring w:gridSpan."""
    out = []
    for row in tbl.rows:
        cells = []
        for tc in row._tr.tc_lst:
            gs = tc.tcPr.gridSpan.val if tc.tcPr.gridSpan is not None else 1
            paras = []
            for p in tc.findall(W + 'p'):
                ptxt = ''.join((t.text or '') for t in p.findall('.//' + W + 't'))
                if ptxt.strip():
                    paras.append(ptxt)
            txt = ' '.join(paras).strip()
            cells.append((gs, re.sub(r'\s+', ' ', txt)))
        out.append(cells)
    return out


class Gen:
    def __init__(self, doc, pages=None):
        self.doc = doc
        self.pages = pages or {}
        self.body = list(doc.element.body.iterchildren())
        self.out = []
        self.ir = []
        self.fig_list = []
        self.tab_list = []
        self.part_titles = []

    # ---------- scanning ----------
    def scan(self, start=154):
        i = start
        body = self.body
        while i < len(body):
            ch = body[i]
            tag = ch.tag.split('}')[1]
            if tag == 'p':
                p = Paragraph(ch, self.doc)
                txt = p.text.strip()
                st = p.style.name
                if st == 'Heading 2':
                    self.ir.append(('h', 2, txt))
                elif st == 'Heading 3':
                    self.ir.append(('h', 3, txt))
                elif st == 'Heading 4':
                    self.ir.append(('h', 4, txt))
                elif st == 'List Bullet':
                    self.ir.append(('bullet', markup(p)))
                elif txt:
                    if p.runs and p.runs[0].bold and len(p.runs) > 1 and txt.startswith(
                            ('Lecture du tableau', 'Lecture', 'Source', 'Note')):
                        self.ir.append(('note', markup(p)))
                    else:
                        self.ir.append(('par', markup(p)))
                i += 1
                continue
            if tag != 'tbl':
                i += 1
                continue

            tbl = Table(ch, self.doc)
            ncols = len(tbl.columns)
            # part divider
            if ncols == 1 and len(tbl.rows) == 2 and any(
                    pp.style.name.startswith('Heading 1') for pp in tbl.rows[0].cells[0].paragraphs):
                lines = [pp.text.strip() for pp in tbl.rows[0].cells[0].paragraphs if pp.text.strip()]
                title = lines[0] if lines else ''
                sub = lines[1] if len(lines) > 1 else ''
                label = lines[2] if len(lines) > 2 else ''
                self.ir.append(('part', title, sub, label))
                self.part_titles.append(title)
                i += 1
                continue
            # figure card
            if ncols == 1 and len(tbl.rows) == 1 and 'graphicData' in tbl._tbl.xml:
                img = self.image_of(tbl)
                cap = ''
                note = ''
                if i + 1 < len(body) and body[i + 1].tag.endswith('}p'):
                    cap = Paragraph(body[i + 1], self.doc).text.strip()
                    i += 1
                if i + 1 < len(body) and body[i + 1].tag.endswith('}p'):
                    cand = Paragraph(body[i + 1], self.doc)
                    if cand.runs and cand.runs[0].italic:
                        note = cand.text.strip()
                        i += 1
                self.ir.append(('fig', img, cap, note))
                self.fig_list.append(cap)
                i += 1
                continue
            text0 = tbl.rows[0].cells[0].text.strip()
            # KPI strip: one row, >=4 cols, every cell = short number + label
            if ncols >= 4 and len(tbl.rows) == 1 and 'graphicData' not in tbl._tbl.xml:
                cps = cell_paras(tbl)
                if cps and all(len(c) >= 2 and len(c[0]) <= 12 for c in cps):
                    self.ir.append(('kpi', [(c[0], ' '.join(c[1:])) for c in cps]))
                    i += 1
                    continue
            # callout
            if ncols == 1 and text0.startswith('★'):
                ps = [pp.text.strip() for pp in tbl.rows[0].cells[0].paragraphs if pp.text.strip()]
                label = ps[1] if len(ps) > 1 else 'À retenir'
                title = ps[2] if len(ps) > 2 else ''
                body_c = ps[3:]
                self.ir.append(('callout', label, title, body_c))
                i += 1
                continue
            # table with caption row
            if text0.startswith('Tableau'):
                ncols = len(tbl.columns)
                allrows = row_spans(tbl)
                # row 0 = caption; then optional full-width group rows, then header
                hdr_i = 1
                while hdr_i < len(allrows) and any(sp != 1 for sp, _ in allrows[hdr_i]):
                    hdr_i += 1
                header = allrows[hdr_i] if hdr_i < len(allrows) else [(1, '')]
                rows = allrows[hdr_i + 1:]
                grid = tbl._tbl.find(W + 'tblGrid')
                widths = [int(gc.get(W + 'w') or 100) for gc in grid.findall(W + 'gridCol')] if grid is not None else []
                if len(widths) != ncols:
                    widths = [1] * ncols
                self.ir.append(('table', text0, ncols, header, rows, widths))
                self.tab_list.append(text0)
                i += 1
                continue
            # generic table (e.g. abbreviations)
            allrows = row_spans(tbl)
            header = allrows[0]
            rows = allrows[1:]
            grid = tbl._tbl.find(W + 'tblGrid')
            widths = [int(gc.get(W + 'w') or 100) for gc in grid.findall(W + 'gridCol')] if grid is not None else []
            if len(widths) != ncols:
                widths = [1] * ncols
            self.ir.append(('table', text0 if text0 else '', ncols, header, rows, widths))
            i += 1
        return self.ir

    def image_of(self, tbl):
        xml = tbl._tbl.xml
        m = re.search(r'r:embed="([^"]+)"', xml)
        if not m:
            return None
        rel = self.doc.part.rels[m.group(1)]
        name = str(rel.target_part.partname).split('/')[-1]
        return f'{IMG}/{name}'

    # ---------- emitters ----------
    def A(self, s):
        self.out.append(s)

    def cover(self):
        self.A(f'''
#page(fill: {BG}, header: none, footer: none,
  margin: (x: 21mm, top: 23mm, bottom: 27mm))[
  #place(top + left, dx: -21mm, dy: -23mm, rect(width: 210mm, height: 29pt, fill: {NAVY}))
  #place(bottom + left, dx: -21mm, dy: 27mm, rect(width: 210mm, height: 26pt, fill: {NAVY}))
  #grid(columns: (1fr, 1fr), align: (left + horizon, right + horizon),
    image("{IMG}/image1.png", width: 6.3cm),
    image("{IMG}/image2.png", width: 5.3cm))
  #v(14mm)
  #align(center)[
    #text(size: 8.6pt, fill: {NAVY}, tracking: 3.2pt)[RÉPUBLIQUE DÉMOCRATIQUE DU CONGO]
    #v(10pt)
    #line(length: 26%, stroke: 0.9pt + {NAVY})
  ]
  #v(22mm)
  #align(center)[
    #text(font: display, size: 30pt, fill: {INK}, tracking: 0.4pt)[RAPPORT DU DIAGNOSTIC OPÉRATIONNEL RAPIDE]
    #v(-2pt)
    #text(font: script, size: 26pt, fill: {INK})[Des établissements de soins de santé]
    #v(14pt)
    #text(size: 8.8pt, fill: {NAVY}, tracking: 2.6pt)[APPUYÉS PAR LE PROJET EPIC]
    #v(3pt)
    #text(size: 8.8pt, fill: {NAVY}, tracking: 2.6pt)[EN RÉPUBLIQUE DÉMOCRATIQUE DU CONGO]
  ]
  #v(1fr)
  #align(center)[
    #image("{IMG}/image3.png", width: 3.9cm)
    #v(8pt)
    #text(size: 9.6pt, fill: {NAVY})[Kinshasa, Octobre 2026]
  ]
]
#pagebreak()
''')

    def front(self):
        self.A(f'#part-page("SOMMAIRE", "Navigation du rapport", "TABLE DES MATIÈRES", 34pt)\n'
               f'#set page(fill: {BG}, header: hdr(), footer: ftr())\n')
        self.A(f'''
#block(above: 0pt, below: 4pt)[#text(size: 19pt, weight: "bold", fill: {NAVY})[Table des matières]]
#line(length: 100%, stroke: 1pt + {NAVY})
#v(10pt)
#show outline.entry.where(level: 1): it => block(above: 8pt, below: 2pt, width: 100%)[
  #text(size: 11.6pt, weight: "bold", fill: NAVY)[#it.element.body]
  #box(width: 1fr, height: 0.7em, place(center + horizon, line(length: 100%, stroke: (thickness: 0.55pt, dash: "dotted"))))
  #context text(size: 10pt, weight: "bold", fill: NAVY)[#counter(page).at(it.element.location()).first()]
]
#show outline.entry.where(level: 2): it => block(above: 1pt, below: 1pt, width: 100%, inset: (left: 14pt))[
  #text(size: 9.2pt)[#it.element.body]
  #box(width: 1fr, height: 0.7em, place(center + horizon, line(length: 100%, stroke: (thickness: 0.45pt, dash: "dotted"))))
  #context text(size: 9.2pt)[#counter(page).at(it.element.location()).first()]
]
#outline(title: none, depth: 2)
#pagebreak()
#block(above: 0pt, below: 4pt)[#text(size: 19pt, weight: "bold", fill: {NAVY})[Liste des figures]]
#line(length: 100%, stroke: 1pt + {NAVY})
#v(10pt)
''')
        for cap in self.fig_list:
            m = re.match(r'^Figure\s+(\d+)', cap)
            pg = self.pages.get(('fig', m.group(1)), '00') if m else '00'
            self.A(f'#toc-entry([{esc(cap)}], [{pg}])\n')
        self.A(f'''
#pagebreak()
#block(above: 0pt, below: 4pt)[#text(size: 19pt, weight: "bold", fill: {NAVY})[Liste des tableaux]]
#line(length: 100%, stroke: 1pt + {NAVY})
#v(10pt)
''')
        for cap in self.tab_list:
            m = re.match(r'^Tableau\s+([A-Z]?\d+)', cap)
            pg = self.pages.get(('tab', m.group(1)), '00') if m else '00'
            self.A(f'#toc-entry([{esc(cap)}], [{pg}])\n')
        self.A('#pagebreak()\n')

    def body_out(self):
        for node in self.ir:
            k = node[0]
            if k == 'part':
                _, title, sub, label = node
                size = 34 if len(title) <= 20 else 26 if len(title) <= 30 else 21
                self.A(f'''
#pagebreak()
#set page(fill: {NAVY}, header: none, footer: none)
#block(width: 100%, height: 100%)[
  #align(center + horizon)[
    #block(above: 0pt, below: 8pt)[#text(size: 8.2pt, tracking: 4pt, fill: {LAV})[#upper[{esc(label)}]]]
    #context part-size.update({size}pt)
    #heading(level: 1)[{esc(title)}]
    #v(9pt)
    #text(font: script, size: {round(size * 0.64)}pt, fill: {LAV})[{esc(sub)}]
  ]
]
#context head-state.update({json.dumps(title, ensure_ascii=False)})
#pagebreak()
#set page(fill: {BG}, header: hdr(), footer: ftr())
''')
            elif k == 'h':
                self.A(f'#heading(level: {node[1]})[{esc(node[2])}]\n')
            elif k == 'par':
                self.A(f'#para[{node[1]}]\n')
            elif k == 'bullet':
                self.A(f'- {node[1]}\n')
            elif k == 'note':
                self.A(f'#note-block[{node[1]}]\n')
            elif k == 'fig':
                _, img, cap, note = node
                w = 15.9
                try:
                    iw, ih = Image.open(img).size
                    if ih / iw * w > 11.6:
                        w = 11.6 * iw / ih
                except Exception:
                    pass
                self.A(f'''
#block(width: 100%, above: 11pt, below: 3pt, breakable: false,
  block(width: 100%, fill: {CREAM}, radius: 12pt, stroke: 1.1pt + rgb("#0f1015"), inset: 7pt,
    align(center, image("{img}", width: {w:.1f}cm))))
#fig-cap[{esc(cap)}]
''')
                if note:
                    self.A(f'#fig-note[{esc(note)}]\n')
            elif k == 'callout':
                _, label, title, body = node
                txt = ' '.join(esc(x) for x in body)
                self.A(f'''
#block(width: 100%, above: 11pt, below: 9pt, breakable: false,
  block(width: 100%, fill: {CREAM}, radius: 12pt, stroke: 1.4pt + black, inset: (x: 13pt, y: 11pt))[
    #text(font: "DejaVu Sans", size: 14pt, fill: {NAVY})[★]
    #v(-4pt)
    #text(size: 7.2pt, tracking: 2.4pt, fill: {INDIGO})[#upper[{esc(label)}]]
    #v(1pt)
    #block(above: 3pt, below: 9pt)[#text(size: 11.2pt, weight: "bold", fill: {NAVY})[{esc(title)}]]
    #text(size: 9.2pt, fill: {INK})[{txt}]
  ])
''')
            elif k == 'kpi':
                parts = []
                for num, label in node[1]:
                    if not num and not label:
                        continue
                    parts.append(f'    [#text(font: display, size: 19pt, fill: {NAVY})[{esc(num)}]\\\n'
                                 f'     #text(size: 7.3pt, fill: {INDIGO})[{esc(label)}]],')
                if not parts:
                    continue
                cols = ', '.join(['1fr'] * len(parts))
                self.A(f'''
#block(width: 100%, above: 9pt, below: 9pt, breakable: false,
  block(width: 100%, fill: {CREAM}, radius: 12pt, stroke: 1.1pt + black, inset: (x: 12pt, y: 10pt))[
    #grid(columns: ({cols}), column-gutter: 9pt,
{chr(10).join(parts)}
    )])
''')
            elif k == 'table':
                _, cap, ncols, header, rows, widths = node
                self.table(cap, ncols, header, rows, widths)

    def table(self, cap, ncols, header, rows, widths):
        tot = sum(widths)
        fr = [f'{w / tot:.4f}fr' for w in widths]
        size = 9.0 if ncols <= 4 else 8.2 if ncols <= 6 else 7.4 if ncols <= 9 else 6.6
        if cap and cap.strip().lower() == header[0][1].strip().lower():
            cap = ''
        def hcell(h):
            sp, txt = h
            cs = f'colspan: {sp}, ' if sp > 1 else ''
            return (f'table.cell({cs}fill: {NAVY})[#block(breakable: false)'
                    f'[#text(fill: white, weight: "bold")[{esc(txt)}]]]')
        hdr = ', '.join(hcell(h) for h in header)
        body = []
        for row in rows:
            parts = []
            for sp, txt in row:
                if sp > 1:
                    parts.append(f'table.cell(colspan: {sp}, fill: {LAV}, align: left, '
                                 f'[#text(fill: {NAVY}, weight: "bold")[{esc(txt)}]])')
                else:
                    parts.append(f'[#block(breakable: false)[{esc(txt)}]]')
            body.append('    ' + ', '.join(parts) + ',')
        caption_block = (f'#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)['
                         f'#text(size: {size + 0.6}pt, weight: "bold", fill: {NAVY})[{esc(cap)}]]\n') if cap else ''
        inner = (caption_block +
                 f'#set par(justify: false, leading: 0.62em)\n'
                 f'#set text(size: {size}pt)\n'
                 f'#table(\n  columns: ({", ".join(fr)}),\n'
                 f'  inset: (x: 4.4pt, y: {2.3 if len(rows) >= 16 else 3.2}pt),\n  align: left + top,\n'
                 f'  stroke: (x, y) => if y == 0 {{ (bottom: 0.9pt + {NAVY}) }} else {{ (bottom: 0.35pt + rgb("#c9d2ee")) }},\n'
                 f'  fill: (col, row) => if row == 0 {{ {NAVY} }} else if calc.odd(row) {{ {CREAM} }} else {{ {ZEBRA} }},\n'
                 f'  table.header(repeat: true, {hdr}),\n'
                 f'{chr(10).join(body)}\n)\n')
        if ncols >= 12 and len(rows) >= 10:
            self.A('#v(6pt)\n#pagebreak(weak: true)\n#set page(flipped: true)\n' + inner +
                   '#pagebreak()\n#set page(flipped: false)\n')
        else:
            self.A('#v(6pt)\n' + inner + '#v(4pt)\n')

    def back_cover(self):
        self.A(f'''
#pagebreak()
#set page(fill: {BG}, header: none, footer: none)
#block(width: 100%, height: 100%)[
  #place(top + left, dx: -21mm, dy: -23mm, rect(width: 210mm, height: 29pt, fill: {NAVY}))
  #place(bottom + left, dx: -21mm, dy: 27mm, rect(width: 210mm, height: 26pt, fill: {NAVY}))
  #align(center + horizon)[
    #image("{IMG}/image3.png", width: 5.2cm)
    #v(14pt)
    #text(font: display, size: 21pt, fill: {NAVY})[DIAGNOSTIC OPÉRATIONNEL RAPIDE]
    #v(2pt)
    #text(font: script, size: 17pt, fill: {NAVY})[Établissements de soins de santé · RDC]
    #v(12pt)
    #line(length: 34%, stroke: 0.9pt + {NAVY})
    #v(12pt)
    #text(size: 8.8pt, fill: {INK})[ICHESS, LLC · Projet EpiC RDC · FHI 360]
    #v(3pt)
    #text(size: 8.8pt, fill: {INK})[Kinshasa, RDC · Octobre 2026]
    #v(18pt)
    #image("{IMG}/image2.png", width: 4.4cm)
  ]
]
''')


PREAMBLE = f'''
#set document(title: "Rapport du diagnostic opérationnel rapide des établissements de soins de santé appuyés par le projet EpiC en République Démocratique du Congo", author: "ICHESS LLC")
#set page(paper: "a4", fill: {BG}, margin: (x: 21mm, top: 23mm, bottom: 27mm))
#set text(font: ("Glacial Indifference", "DejaVu Sans"), size: 10pt, fill: {INK}, lang: "fr")
#set par(justify: true, leading: 0.72em, spacing: 0.95em)
#set heading(numbering: none)

#let NAVY = rgb("#131d44")
#let INDIGO = rgb("#5166b7")
#let INK = rgb("#0f1015")
#let CREAM = rgb("#fffbf7")
#let LAV = rgb("#ced6f8")
#let BG = rgb("#c2cfea")
#let display = "New Icon Serif"
#let script = "New Icon Script"
#let head-state = state("head", "")
#let part-size = state("part-size", 30pt)
#let toc-entry(title, page) = block(above: 0pt, below: 2.1pt, width: 100%, text(size: 9pt, hyphenate: false, grid(
  columns: (auto, 1fr, auto), column-gutter: 5pt,
  align: (left, center, right),
  [#title],
  box(width: 100%, height: 0.62em, place(center + horizon, line(length: 100%, stroke: (thickness: 0.5pt, dash: "dotted")))),
  text(size: 8.6pt, fill: NAVY)[#page],
)))

#let hdr() = context {{
  place(top + left, dx: -21mm, dy: 0pt, rect(width: 210mm, height: 29pt, fill: NAVY))
  place(top + left, dx: 0pt, dy: 11pt, block(width: 100%, grid(
    columns: (1fr, auto), align: (left, right),
    text(size: 7.3pt, fill: LAV, tracking: 1.1pt)[#upper[#head-state.get()]],
    text(size: 7.3pt, fill: LAV, tracking: 1.1pt)[ICHESS · EPIC RDC],
  )))
}}
#let ftr() = {{
  place(bottom + left, dx: -21mm, dy: 0pt, rect(width: 210mm, height: 26pt, fill: NAVY))
  place(bottom + center, dy: -13pt, context text(size: 8pt, fill: LAV)[#counter(page).display()])
}}

#show heading.where(level: 1): it => context block(above: 0pt, below: 0pt)[
  #set text(font: display, fill: LAV)
  #align(center, text(size: part-size.get(), tracking: 0.4pt, upper[#it.body]))
]
#show heading.where(level: 2): it => block(above: 17pt, below: 8pt)[
  #text(size: 15.2pt, weight: "bold", fill: NAVY)[#it.body]
  #v(4pt)
  #line(length: 100%, stroke: 0.9pt + NAVY)
]
#show heading.where(level: 3): it => block(above: 13pt, below: 5pt)[
  #text(size: 11.4pt, weight: "bold", fill: NAVY)[#it.body]
]
#show heading.where(level: 4): it => block(above: 10pt, below: 4pt)[
  #text(size: 10.1pt, weight: "bold", fill: INDIGO)[#it.body]
]

#let para(body) = block(above: 2pt, below: 6pt)[#body]
#let note-block(body) = block(above: 3pt, below: 8pt, inset: (left: 9pt), stroke: (left: 1.4pt + INDIGO))[
  #text(size: 9pt)[#body]
]
#let fig-cap(body) = block(width: 100%, above: 3pt, below: 2pt, align(center,
  text(size: 8.7pt, weight: "bold", fill: NAVY, hyphenate: false)[#body]))
#let fig-note(body) = block(width: 100%, above: 0pt, below: 8pt, align(center,
  text(size: 7.9pt, style: "italic", fill: INDIGO)[#body]))

#let part-page(titre, sous, num, tsize) = {{
  set page(fill: NAVY, header: none, footer: none)
  block(width: 100%, height: 100%)[
    #align(center + horizon)[
      #block(above: 0pt, below: 8pt)[#text(size: 8.2pt, tracking: 4pt, fill: LAV)[#upper[#num]]]
      #context part-size.update(tsize)
      #heading(level: 1, outlined: false)[#titre]
      #v(9pt)
      #text(font: script, size: tsize * 0.64, fill: LAV)[#sous]
    ]
  ]
  set page(fill: BG, header: hdr(), footer: ftr())
}}
'''


def build(out_path, pages=None):
    d = docx.Document(DOCX)
    g = Gen(d, pages)
    g.scan()
    parts = [PREAMBLE]
    g.out = []
    g.cover(); g.front(); g.body_out(); g.back_cover()
    parts.append('\n'.join(g.out))
    src = '\n'.join(parts)
    open(out_path, 'w').write(src)
    return src


if __name__ == '__main__':
    out = sys.argv[1] if len(sys.argv) > 1 else '/home/user/Rp/report.typ'
    s = build(out)
    print('wrote', out, len(s), 'bytes')
