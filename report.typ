
#set document(title: "Rapport du diagnostic opérationnel rapide des établissements de soins de santé appuyés par le projet EpiC en République Démocratique du Congo", author: "ICHESS LLC")
#set page(paper: "a4", fill: rgb("#c2cfea"), margin: (x: 21mm, top: 23mm, bottom: 27mm))
#set text(font: ("Glacial Indifference", "DejaVu Sans"), size: 10pt, fill: rgb("#0f1015"), lang: "fr")
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

#let hdr() = context {
  place(top + left, dx: -21mm, dy: 0pt, rect(width: 210mm, height: 29pt, fill: NAVY))
  place(top + left, dx: 0pt, dy: 11pt, block(width: 100%, grid(
    columns: (1fr, auto), align: (left, right),
    text(size: 7.3pt, fill: LAV, tracking: 1.1pt)[#upper[#head-state.get()]],
    text(size: 7.3pt, fill: LAV, tracking: 1.1pt)[ICHESS · EPIC RDC],
  )))
}
#let ftr() = {
  place(bottom + left, dx: -21mm, dy: 0pt, rect(width: 210mm, height: 26pt, fill: NAVY))
  place(bottom + center, dy: -13pt, context text(size: 8pt, fill: LAV)[#counter(page).display()])
}

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

#let part-page(titre, sous, num, tsize) = {
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
}


#page(fill: rgb("#c2cfea"), header: none, footer: none,
  margin: (x: 21mm, top: 23mm, bottom: 27mm))[
  #place(top + left, dx: -21mm, dy: -23mm, rect(width: 210mm, height: 29pt, fill: rgb("#131d44")))
  #place(bottom + left, dx: -21mm, dy: 27mm, rect(width: 210mm, height: 26pt, fill: rgb("#131d44")))
  #grid(columns: (1fr, 1fr), align: (left + horizon, right + horizon),
    image("/home/user/Rp/assets/img/image1.png", width: 6.3cm),
    image("/home/user/Rp/assets/img/image2.png", width: 5.3cm))
  #v(14mm)
  #align(center)[
    #text(size: 8.6pt, fill: rgb("#131d44"), tracking: 3.2pt)[RÉPUBLIQUE DÉMOCRATIQUE DU CONGO]
    #v(10pt)
    #line(length: 26%, stroke: 0.9pt + rgb("#131d44"))
  ]
  #v(22mm)
  #align(center)[
    #text(font: display, size: 30pt, fill: rgb("#0f1015"), tracking: 0.4pt)[RAPPORT DU DIAGNOSTIC OPÉRATIONNEL RAPIDE]
    #v(-2pt)
    #text(font: script, size: 26pt, fill: rgb("#0f1015"))[Des établissements de soins de santé]
    #v(14pt)
    #text(size: 8.8pt, fill: rgb("#131d44"), tracking: 2.6pt)[APPUYÉS PAR LE PROJET EPIC]
    #v(3pt)
    #text(size: 8.8pt, fill: rgb("#131d44"), tracking: 2.6pt)[EN RÉPUBLIQUE DÉMOCRATIQUE DU CONGO]
  ]
  #v(1fr)
  #align(center)[
    #image("/home/user/Rp/assets/img/image3.png", width: 3.9cm)
    #v(8pt)
    #text(size: 9.6pt, fill: rgb("#131d44"))[Kinshasa, Octobre 2026]
  ]
]
#pagebreak()

#part-page("SOMMAIRE", "Navigation du rapport", "TABLE DES MATIÈRES", 34pt)
#set page(fill: rgb("#c2cfea"), header: hdr(), footer: ftr())


#block(above: 0pt, below: 4pt)[#text(size: 19pt, weight: "bold", fill: rgb("#131d44"))[Table des matières]]
#line(length: 100%, stroke: 1pt + rgb("#131d44"))
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
#block(above: 0pt, below: 4pt)[#text(size: 19pt, weight: "bold", fill: rgb("#131d44"))[Liste des figures]]
#line(length: 100%, stroke: 1pt + rgb("#131d44"))
#v(10pt)

#toc-entry([Figure 1 : Établissements évalués par province et par niveau de soins], [30])

#toc-entry([Figure 2 : Classification des 28 fonctions traceuses, ensemble des établissements], [32])

#toc-entry([Figure 3 : Préparation opérationnelle des 17 fonctions communes aux trois niveaux de soins], [34])

#toc-entry([Figure 4 : Part de fonctions rouges par fonction et par province], [35])

#toc-entry([Figure 5 : Préparation opérationnelle par domaine technique et par niveau de soins], [36])

#toc-entry([Figure 6 : État opérationnel des fonctions vitales dont le service est déclaré offert, par niveau de soins], [37])

#toc-entry([Figure 7 : Préparation aux urgences : ensemble, par niveau de soins et par province], [38])

#toc-entry([Figure 8 : Couples de prestations documentés, par niveau de soins], [42])

#toc-entry([Figure 9 : Jours de présence des prestataires déclarés sur trois mois, par service et par niveau], [43])

#toc-entry([Figure 10 : État de la fonction d’aval lorsque la fonction d’amont est classée verte ou jaune], [45])

#toc-entry([Figure 11 : Chaîne surveillance-réponse et chaîne des données : composantes et points de rupture], [46])

#toc-entry([Figure 12 : Dimensions bloquantes des fonctions rouges et fragilités des fonctions jaunes], [48])

#toc-entry([Figure 13 : Nombre de dimensions bloquantes par fonction rouge, selon le niveau de soins], [49])

#toc-entry([Figure 14 : Les douze configurations de blocage les plus fréquentes parmi les fonctions rouges], [49])

#toc-entry([Figure 15 : Fonctions jaunes à une seule fragilité du vert], [50])

#toc-entry([Figure 16 : Fonctions rouges libérées par le rétablissement d’un seul élément critique], [52])

#toc-entry([Figure 17 : Part de fonctions vitales rouges dans les CS selon la présence déclarée d’une catégorie de personnel], [54])

#toc-entry([Figure 18 : Composantes de la référence, de l’eau et de l’hygiène, de l’électricité et de la communication], [55])

#toc-entry([Figure 19 : Profil des dimensions bloquantes par province], [58])

#toc-entry([Figure 20 : Paquets cumulatifs de leviers : fonctions rouges libérées à mesure que les dimensions sont résolues], [65])

#toc-entry([Figure 21 : Gain simulé de chaque levier, par province (part des fonctions rouges libérées)], [68])


#pagebreak()
#block(above: 0pt, below: 4pt)[#text(size: 19pt, weight: "bold", fill: rgb("#131d44"))[Liste des tableaux]]
#line(length: 100%, stroke: 1pt + rgb("#131d44"))
#v(10pt)

#toc-entry([Tableau 1 : Périmètre du diagnostic], [21])

#toc-entry([Tableau 2 : Base de sondage et échantillon réalisé, par niveau géographique], [23])

#toc-entry([Tableau 3 : Les 28 fonctions traceuses (71 spécifications selon le niveau)], [25])

#toc-entry([Tableau 4 : Les huit règles de décision de l'algorithme de classification Vert \/ Jaune \/ Rouge], [26])

#toc-entry([Tableau 5 : Rôle des douze dimensions dans les 71 spécifications], [27])

#toc-entry([Tableau 6 : Modalités d’application des règles de classification], [27])

#toc-entry([Tableau 7 : Classification des 28 fonctions traceuses, par ordre de criticité], [32])

#toc-entry([Tableau 8 : Élément critique le plus souvent en déficit, par fonction], [33])

#toc-entry([Tableau 9 : Blocages dominants des fonctions d’urgence, par niveau de soins], [38])

#toc-entry([Tableau 10 : Principaux éléments critiques d’urgence manquants ou en rupture], [39])

#toc-entry([Tableau 11 : Menaces immédiates et contraintes déclarées d'accès à la référence], [39])

#toc-entry([Tableau 12 : Correspondance documentaire avec les fonctions signal SONU (référentiel classique)], [40])

#toc-entry([Tableau 13 : Références au cours des trois derniers mois, par motif], [43])

#toc-entry([Tableau 14 : Contraintes déclarées au départ lorsque la référence est décidée (centres de santé)], [44])

#toc-entry([Tableau 15 : Difficultés déclarées à la réception des patients référés (CSR et HGR)], [44])

#toc-entry([Tableau 16 : État des fonctions vitales d'aval à la destination de référence enquêtée], [45])

#toc-entry([Tableau 17 : Points de rupture du circuit de surveillance, par niveau et par province], [47])

#toc-entry([Tableau 18 : Les dimensions de blocage : ce qu'elles bloquent, ce qu'elles fragilisent et ce que leur résolution libère], [48])

#toc-entry([Tableau 19 : Disponibilité des intrants critiques, tous niveaux], [51])

#toc-entry([Tableau 20 : Disponibilité des équipements critiques, tous niveaux], [51])

#toc-entry([Tableau 21 : Effectifs déclarés par catégorie et par niveau (roster du personnel)], [52])

#toc-entry([Tableau 22 : Formations déclarées au cours des deux dernières années, par thème et par niveau], [53])

#toc-entry([Tableau 23 : Conditions transversales au niveau des établissements], [54])

#toc-entry([Tableau 24 : Composantes du mécanisme de référence en cause dans les fonctions rouges de la référence urgente, par niveau], [55])

#toc-entry([Tableau 25 : Perturbations déclarées au cours des trois derniers mois, par province (% d’établissements)], [56])

#toc-entry([Tableau 26 : Conjoncturel ou structurel : perturbation déclarée et blocage observé], [56])

#toc-entry([Tableau 27 : Causes déclarées des interruptions et blocages observés de la fonction correspondante], [57])

#toc-entry([Tableau 28 : Constance intra-zone de la dimension bloquante dominante], [58])

#toc-entry([Tableau 29 : Synthèse des goulots opérationnels, de leurs conséquences et des risques sanitaires associés], [59])

#toc-entry([Tableau 30 : Matrice consolidée d'analyse et de correction des goulots d'étranglement, par contrainte transversale], [59])

#toc-entry([Tableau 31 : Intrants et équipements prioritaires les plus souvent manquants pour les fonctions vitales (tous niveaux)], [64])

#toc-entry([Tableau 32 : Gains simulés des paires de leviers et complémentarité], [66])

#toc-entry([Tableau 33 : Lecture programmatique des priorités d’investissement], [66])

#toc-entry([Tableau 34 : Profil provincial des blocages et des leviers (ordre alphabétique)], [67])

#toc-entry([Tableau 35 : Les quinze zones de santé où un seul levier débloque le plus de fonctions rouges, et la meilleure combinaison de deux leviers], [68])

#toc-entry([Tableau 36 : Rapprochement de quelques indicateurs avec les enquêtes antérieures], [71])

#toc-entry([Tableau 37 : Plan d'action priorisé : responsables, indicateurs, valeurs de départ et cibles indicatives], [80])

#toc-entry([Tableau A1 : Classification des 28 fonctions traceuses, Haut-Katanga], [87])

#toc-entry([Tableau A2 : Dimensions bloquantes des fonctions rouges, par fonction (n), Haut-Katanga], [88])

#toc-entry([Tableau A3 : Dimensions bloquantes et fragilités, Haut-Katanga], [89])

#toc-entry([Tableau A4 : Conditions transversales et profil d'urgence, Haut-Katanga], [89])

#toc-entry([Tableau A5 : Leviers simples et paire optimale, Haut-Katanga], [89])

#toc-entry([Tableau A6 : Lecture par zone de santé, Haut-Katanga], [89])

#toc-entry([Tableau A7 : Établissements où un seul levier libère le plus de fonctions rouges, Haut-Katanga], [89])

#toc-entry([Tableau A8 : Classification des 28 fonctions traceuses, Haut-Lomami], [90])

#toc-entry([Tableau A9 : Dimensions bloquantes des fonctions rouges, par fonction (n), Haut-Lomami], [92])

#toc-entry([Tableau A10 : Dimensions bloquantes et fragilités, Haut-Lomami], [93])

#toc-entry([Tableau A11 : Conditions transversales et profil d'urgence, Haut-Lomami], [93])

#toc-entry([Tableau A12 : Leviers simples et paire optimale, Haut-Lomami], [93])

#toc-entry([Tableau A13 : Lecture par zone de santé, Haut-Lomami], [93])

#toc-entry([Tableau A14 : Établissements où un seul levier libère le plus de fonctions rouges, Haut-Lomami], [93])

#toc-entry([Tableau A15 : Classification des 28 fonctions traceuses, Kasaï-Central], [94])

#toc-entry([Tableau A16 : Dimensions bloquantes des fonctions rouges, par fonction (n), Kasaï-Central], [95])

#toc-entry([Tableau A17 : Dimensions bloquantes et fragilités, Kasaï-Central], [96])

#toc-entry([Tableau A18 : Conditions transversales et profil d'urgence, Kasaï-Central], [96])

#toc-entry([Tableau A19 : Leviers simples et paire optimale, Kasaï-Central], [96])

#toc-entry([Tableau A20 : Lecture par zone de santé, Kasaï-Central], [96])

#toc-entry([Tableau A21 : Établissements où un seul levier libère le plus de fonctions rouges, Kasaï-Central], [96])

#toc-entry([Tableau A22 : Classification des 28 fonctions traceuses, Kasaï-Oriental], [97])

#toc-entry([Tableau A23 : Dimensions bloquantes des fonctions rouges, par fonction (n), Kasaï-Oriental], [98])

#toc-entry([Tableau A24 : Dimensions bloquantes et fragilités, Kasaï-Oriental], [99])

#toc-entry([Tableau A25 : Conditions transversales et profil d'urgence, Kasaï-Oriental], [99])

#toc-entry([Tableau A26 : Leviers simples et paire optimale, Kasaï-Oriental], [99])

#toc-entry([Tableau A27 : Lecture par zone de santé, Kasaï-Oriental], [99])

#toc-entry([Tableau A28 : Établissements où un seul levier libère le plus de fonctions rouges, Kasaï-Oriental], [99])

#toc-entry([Tableau A29 : Classification des 28 fonctions traceuses, Lomami], [100])

#toc-entry([Tableau A30 : Dimensions bloquantes des fonctions rouges, par fonction (n), Lomami], [101])

#toc-entry([Tableau A31 : Dimensions bloquantes et fragilités, Lomami], [102])

#toc-entry([Tableau A32 : Conditions transversales et profil d'urgence, Lomami], [102])

#toc-entry([Tableau A33 : Leviers simples et paire optimale, Lomami], [102])

#toc-entry([Tableau A34 : Lecture par zone de santé, Lomami], [102])

#toc-entry([Tableau A35 : Établissements où un seul levier libère le plus de fonctions rouges, Lomami], [102])

#toc-entry([Tableau A36 : Classification des 28 fonctions traceuses, Lualaba], [103])

#toc-entry([Tableau A37 : Dimensions bloquantes des fonctions rouges, par fonction (n), Lualaba], [104])

#toc-entry([Tableau A38 : Dimensions bloquantes et fragilités, Lualaba], [105])

#toc-entry([Tableau A39 : Conditions transversales et profil d'urgence, Lualaba], [105])

#toc-entry([Tableau A40 : Leviers simples et paire optimale, Lualaba], [105])

#toc-entry([Tableau A41 : Lecture par zone de santé, Lualaba], [105])

#toc-entry([Tableau A42 : Établissements où un seul levier libère le plus de fonctions rouges, Lualaba], [105])

#toc-entry([Tableau A43 : Classification des 28 fonctions traceuses, Sankuru], [106])

#toc-entry([Tableau A44 : Dimensions bloquantes des fonctions rouges, par fonction (n), Sankuru], [107])

#toc-entry([Tableau A45 : Dimensions bloquantes et fragilités, Sankuru], [108])

#toc-entry([Tableau A46 : Conditions transversales et profil d'urgence, Sankuru], [108])

#toc-entry([Tableau A47 : Leviers simples et paire optimale, Sankuru], [108])

#toc-entry([Tableau A48 : Lecture par zone de santé, Sankuru], [108])

#toc-entry([Tableau A49 : Établissements où un seul levier libère le plus de fonctions rouges, Sankuru], [108])

#toc-entry([Tableau A50 : Classification des 28 fonctions traceuses, Tanganyika], [109])

#toc-entry([Tableau A51 : Dimensions bloquantes des fonctions rouges, par fonction (n), Tanganyika], [110])

#toc-entry([Tableau A52 : Dimensions bloquantes et fragilités, Tanganyika], [111])

#toc-entry([Tableau A53 : Conditions transversales et profil d'urgence, Tanganyika], [111])

#toc-entry([Tableau A54 : Leviers simples et paire optimale, Tanganyika], [111])

#toc-entry([Tableau A55 : Lecture par zone de santé, Tanganyika], [111])

#toc-entry([Tableau A56 : Établissements où un seul levier libère le plus de fonctions rouges, Tanganyika], [111])

#toc-entry([Tableau A57 : Éléments et composantes en cause dans les fonctions d’urgence rouges, par fonction et par niveau], [112])

#toc-entry([Tableau A58 : Nombre de dimensions bloquantes par fonction rouge, par niveau], [117])

#toc-entry([Tableau A59 : Fonctions jaunes à fragilité unique, par fonction], [118])

#toc-entry([Tableau A60 : Rétablissement conjoint de tous les éléments critiques en déficit, par niveau], [118])

#toc-entry([Tableau A61 : Fonctions rouges libérées par le rétablissement d’un seul élément critique, par niveau], [119])

#toc-entry([Tableau A62 : Fonctions rouges libérées à chaque étape du paquet cumulatif], [120])

#toc-entry([Tableau A63 : Observations lues dans plusieurs dimensions de la grille], [120])

#toc-entry([Tableau A64 : Effet du rattachement unique sur les principaux indicateurs], [121])

#pagebreak()


#pagebreak()
#set page(fill: rgb("#131d44"), header: none, footer: none)
#block(width: 100%, height: 100%)[
  #align(center + horizon)[
    #block(above: 0pt, below: 8pt)[#text(size: 8.2pt, tracking: 4pt, fill: rgb("#ced6f8"))[#upper[SECTION]]]
    #context part-size.update(34pt)
    #heading(level: 1)[PRÉFACE]
    #v(9pt)
    #text(font: script, size: 22pt, fill: rgb("#ced6f8"))[Avant-propos]
  ]
]
#context head-state.update("PRÉFACE")
#pagebreak()
#set page(fill: rgb("#c2cfea"), header: hdr(), footer: ftr())

#para[La République Démocratique du Congo (RDC) évolue dans un contexte sanitaire marqué par des besoins importants, des vulnérabilités structurelles persistantes et la survenue récurrente d’épidémies et d’autres urgences de santé publique. Dans ce contexte, la capacité des établissements de soins de santé à assurer de manière continue, sûre et efficace les services essentiels constitue un déterminant majeur de la performance et de la résilience du système de santé.]

#para[C’est dans cette perspective qu’a été réalisé le présent Diagnostic opérationnel rapide des établissements de soins de santé, avec un accent particulier sur les services de santé maternelle, néonatale et infantile, de lutte contre le paludisme et de nutrition. L’exercice a permis d’apprécier leur niveau réel de préparation opérationnelle, au-delà de la seule disponibilité des infrastructures et des équipements.]

#para[Le diagnostic a notamment examiné la capacité des établissements à réunir les conditions essentielles à la prestation effective des soins : ressources humaines compétentes, médicaments et intrants essentiels, équipements fonctionnels, eau, hygiène et assainissement, systèmes d’information, organisation des services et mécanismes de référence et contre-référence. Il a ainsi permis d’identifier ce qui fonctionnait, les principaux goulots d’étranglement et leurs causes, ainsi que les actions prioritaires nécessaires pour les lever.]

#para[Les résultats présentés dans ce rapport constituent une contribution importante à la compréhension des contraintes opérationnelles affectant la prestation des services et fournissent des éléments utiles pour orienter la planification et la priorisation des interventions. Ils devraient contribuer à renforcer durablement la capacité des établissements de soins de santé à offrir des services essentiels de manière sûre, fiable et continue, et à mieux faire face aux urgences sanitaires.]

#para[Je tiens à exprimer ma profonde gratitude aux autorités sanitaires, aux responsables des établissements de soins de santé, aux professionnels de santé, aux équipes techniques ainsi qu’à l’ensemble des partenaires qui ont contribué à la réalisation de ce diagnostic.]

#para[J’adresse une reconnaissance particulière au Dr Ngashi Ngongo, au Dr Gullit Lufiauluisu et à l’ensemble de l’équipe d’ICHESS pour avoir conduit ce travail avec rigueur, professionnalisme et engagement. Ce diagnostic réalisé par le cabinet ICHESS présente une analyse structurée des principaux constats et formule des recommandations visant à orienter les actions d’amélioration et de renforcement des systèmes et des services de santé.]

#para[J’encourage toutes les parties prenantes à s’approprier les résultats et recommandations de ce rapport et à les traduire en actions concrètes, priorisées et mesurables, afin d’améliorer durablement la disponibilité, la qualité et la continuité des services de santé maternelle, néonatale et infantile, de lutte contre le paludisme et de nutrition au bénéfice des populations.]

#para[*Narcisse Naia Embeke, MD, MPH*]

#para[*Directeur Technique, Projet EpiC RDC*]


#pagebreak()
#set page(fill: rgb("#131d44"), header: none, footer: none)
#block(width: 100%, height: 100%)[
  #align(center + horizon)[
    #block(above: 0pt, below: 8pt)[#text(size: 8.2pt, tracking: 4pt, fill: rgb("#ced6f8"))[#upper[SECTION]]]
    #context part-size.update(34pt)
    #heading(level: 1)[REMERCIEMENTS]
    #v(9pt)
    #text(font: script, size: 22pt, fill: rgb("#ced6f8"))[Contributions]
  ]
]
#context head-state.update("REMERCIEMENTS")
#pagebreak()
#set page(fill: rgb("#c2cfea"), header: hdr(), footer: ftr())

#para[La réalisation de cette évaluation a reposé sur la mobilisation de nombreuses institutions, équipes et personnes ayant contribué à sa conception, sa mise en œuvre, à l’analyse des données et à la production du présent rapport. ICHESS leur exprime sa profonde gratitude pour leur confiance, leur disponibilité et leur engagement.]

#para[Nos premiers remerciements s’adressent à FHI 360, pour la confiance accordée à ICHESS et son accompagnement technique et institutionnel. Une reconnaissance particulière est adressée à Joyce Kakesa, Narcisse Embeke, Teddy Matadi, Elie Alimasi, Peter Diakumpuna et Milan Milambu pour leurs orientations et contributions aux différentes étapes de l’évaluation.]

#para[Nous remercions les Divisions Provinciales de la Santé (DPS) et les Équipes Cadres des Zones de Santé (ECZ) pour leur collaboration et la facilitation des activités de terrain. Notre gratitude va également aux responsables et personnels des établissements de soins de santé (ESS) ainsi qu’aux enquêteurs et enquêtrices, dont la disponibilité et la rigueur ont contribué à la qualité des données recueillies.]

#para[Une reconnaissance particulière est adressée aux superviseurs provinciaux : Gullit Lufiauluisu (Lualaba), Prince Lumbu (Haut-Katanga), Cédric Kabala (Haut-Lomami), Lucien Banze (Tanganyika), Mireille Meta (Kasaï-Oriental), Toto Ezombe (Lomami), Olivier Kingulu (Kasaï-Central) et Clovis Ludiala (Sankuru), pour la coordination des équipes et l’assurance qualité des opérations.]

#para[ICHESS remercie particulièrement Ngashi Ngongo, Investigateur Principal, pour la direction scientifique et méthodologique de l’étude, et Gullit Lufiauluisu, Co-investigateur et Coordonnateur terrain, pour la coordination opérationnelle. Nos remerciements vont également à Glody Kanga, Statisticien, pour le traitement et l’analyse des données, et à Prince Nsamba, Informaticien, pour la gestion des outils numériques et des données.]

#para[Enfin, nous remercions Jean Lubuanga et Emmanuel Nsamba, ainsi que l’équipe administrative et financière d’ICHESS, pour leur appui logistique et administratif. La complémentarité de toutes ces expertises a permis de produire des analyses robustes et utiles à la décision pour améliorer la préparation opérationnelle des ESS.]

#para[*Ngashi Ngongo, PhD, MD, MPH*]

#para[*Directeur Exécutif, ICHESS*]


#pagebreak()
#set page(fill: rgb("#131d44"), header: none, footer: none)
#block(width: 100%, height: 100%)[
  #align(center + horizon)[
    #block(above: 0pt, below: 8pt)[#text(size: 8.2pt, tracking: 4pt, fill: rgb("#ced6f8"))[#upper[SECTION]]]
    #context part-size.update(26pt)
    #heading(level: 1)[ABRÉVIATIONS ET ACRONYMES]
    #v(9pt)
    #text(font: script, size: 17pt, fill: rgb("#ced6f8"))[Sigles et acronymes]
  ]
]
#context head-state.update("ABRÉVIATIONS ET ACRONYMES")
#pagebreak()
#set page(fill: rgb("#c2cfea"), header: hdr(), footer: ftr())

#v(6pt)
#set par(justify: false, leading: 0.62em)
#set text(size: 9.0pt)
#table(
  columns: (0.1348fr, 0.8652fr),
  inset: (x: 4.4pt, y: 2.3pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Sigle]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Signification]]]),
    [#block(breakable: false)[AL]], [#block(breakable: false)[Artéméther-Luméfantrine]],
    [#block(breakable: false)[AMIU]], [#block(breakable: false)[Aspiration Manuelle Intra-Utérine]],
    [#block(breakable: false)[ARV]], [#block(breakable: false)[Antirétroviraux]],
    [#block(breakable: false)[AS-AQ]], [#block(breakable: false)[Artésunate-Amodiaquine]],
    [#block(breakable: false)[ASC]], [#block(breakable: false)[Agent de Santé Communautaire]],
    [#block(breakable: false)[ATPE]], [#block(breakable: false)[Aliment Thérapeutique Prêt à l'Emploi]],
    [#block(breakable: false)[CAC]], [#block(breakable: false)[Cellule d'Animation communautaire]],
    [#block(breakable: false)[CAPI]], [#block(breakable: false)[Computer-Assisted Personal Interviewing (entretien assisté par tablette)]],
    [#block(breakable: false)[CARAMAL]], [#block(breakable: false)[Community Access to Rectal Artesunate for Malaria]],
    [#block(breakable: false)[CHISU]], [#block(breakable: false)[Country Health Information Systems and Data Use]],
    [#block(breakable: false)[CODESA]], [#block(breakable: false)[Comité de développement de l'aire de santé]],
    [#block(breakable: false)[CPN]], [#block(breakable: false)[Consultation prénatale]],
    [#block(breakable: false)[CPNr]], [#block(breakable: false)[Consultation prénatale recentrée \/ de routine]],
    [#block(breakable: false)[CPoN]], [#block(breakable: false)[Consultation postnatale]],
    [#block(breakable: false)[CS]], [#block(breakable: false)[Centre de santé]],
    [#block(breakable: false)[CSR]], [#block(breakable: false)[Centre de santé de référence]],
    [#block(breakable: false)[CSU]], [#block(breakable: false)[Couverture sanitaire universelle]],
    [#block(breakable: false)[DHIS2]], [#block(breakable: false)[District Health Information Software, version 2]],
    [#block(breakable: false)[DOS]], [#block(breakable: false)[Department of State (Département d’État des États-Unis)]],
    [#block(breakable: false)[DPS]], [#block(breakable: false)[Division provinciale de la santé]],
    [#block(breakable: false)[DQR/DQE]], [#block(breakable: false)[Data Quality Review \/ Data Quality Evaluation (Revue \/ Évaluation de la qualité des données).]],
    [#block(breakable: false)[ECZ]], [#block(breakable: false)[Équipe cadre de la zone de santé]],
    [#block(breakable: false)[EDS]], [#block(breakable: false)[Enquête démographique et de santé]],
    [#block(breakable: false)[EpiC]], [#block(breakable: false)[Meeting Targets and Maintaining Epidemic Control (projet EpiC)]],
    [#block(breakable: false)[EPSS]], [#block(breakable: false)[Évaluation des prestations des services de soins de santé]],
    [#block(breakable: false)[ESP \/ ESPK]], [#block(breakable: false)[École de santé publique de Kinshasa]],
    [#block(breakable: false)[ESS]], [#block(breakable: false)[Établissement de soins de santé]],
    [#block(breakable: false)[F75 \/ F100]], [#block(breakable: false)[Laits thérapeutiques de la prise en charge de la malnutrition aiguë sévère]],
    [#block(breakable: false)[FHI 360]], [#block(breakable: false)[Family Health International 360]],
    [#block(breakable: false)[FSS]], [#block(breakable: false)[Fonds de solidarité de santé]],
    [#block(breakable: false)[HGR]], [#block(breakable: false)[Hôpital général de référence]],
    [#block(breakable: false)[HHFA]], [#block(breakable: false)[Harmonized Health Facility Assessment (évaluation harmonisée des établissements de soins de santé)]],
    [#block(breakable: false)[HPP]], [#block(breakable: false)[Hémorragie du post-partum]],
    [#block(breakable: false)[ICHESS]], [#block(breakable: false)[International Center for Health Systems Strengthening]],
    [#block(breakable: false)[IHP]], [#block(breakable: false)[Integrated Health Program (programme de santé intégré de l'USAID)]],
    [#block(breakable: false)[INS]], [#block(breakable: false)[Institut national de la statistique]],
    [#block(breakable: false)[IT \/ ITA]], [#block(breakable: false)[Infirmier titulaire \/ infirmier titulaire adjoint]],
    [#block(breakable: false)[MA]], [#block(breakable: false)[Malnutrition aiguë]],
    [#block(breakable: false)[MAPI]], [#block(breakable: false)[Manifestations adverses post-immunisation]],
    [#block(breakable: false)[MSPHPS]], [#block(breakable: false)[Ministère de la Santé publique, Hygiène et Prévoyance sociale]],
    [#block(breakable: false)[MUAC]], [#block(breakable: false)[Mid-Upper Arm Circumference (périmètre brachial)]],
    [#block(breakable: false)[OMS]], [#block(breakable: false)[Organisation mondiale de la santé]],
    [#block(breakable: false)[PCIMA]], [#block(breakable: false)[Prise en charge intégrée de la malnutrition aiguë]],
    [#block(breakable: false)[PCIMNE]], [#block(breakable: false)[Prise en charge intégrée des maladies du nouveau-né et de l'enfant]],
    [#block(breakable: false)[PEV]], [#block(breakable: false)[Programme élargi de vaccination]],
    [#block(breakable: false)[PIB]], [#block(breakable: false)[Produit intérieur brut]],
    [#block(breakable: false)[PMI]], [#block(breakable: false)[President's Malaria Initiative (Initiative présidentielle américaine contre le paludisme)]],
    [#block(breakable: false)[PNDS-PS]], [#block(breakable: false)[Plan national de développement sanitaire et de prévoyance sociale]],
    [#block(breakable: false)[PNLP]], [#block(breakable: false)[Programme national de lutte contre le paludisme]],
    [#block(breakable: false)[PNLS]], [#block(breakable: false)[Programme national de lutte contre le VIH/sida et les IST]],
    [#block(breakable: false)[PNSR]], [#block(breakable: false)[Programme national de santé de la reproduction]],
    [#block(breakable: false)[PRONANUT]], [#block(breakable: false)[Programme national de nutrition]],
    [#block(breakable: false)[PSN SACO]], [#block(breakable: false)[Plan stratégique national de santé communautaire]],
    [#block(breakable: false)[PTF]], [#block(breakable: false)[Partenaires techniques et financiers]],
    [#block(breakable: false)[PTME]], [#block(breakable: false)[Prévention de la transmission mère-enfant (du VIH)]],
    [#block(breakable: false)[RDC]], [#block(breakable: false)[République démocratique du Congo]],
    [#block(breakable: false)[RECO]], [#block(breakable: false)[Relais communautaire]],
    [#block(breakable: false)[RH]], [#block(breakable: false)[Ressources humaines]],
    [#block(breakable: false)[SARA]], [#block(breakable: false)[Service Availability and Readiness Assessment]],
    [#block(breakable: false)[SMNEA]], [#block(breakable: false)[Santé de la mère, du nouveau-né, de l'enfant et de l'adolescent]],
    [#block(breakable: false)[SMS]], [#block(breakable: false)[Short Message Service (message texte)]],
    [#block(breakable: false)[SNIS]], [#block(breakable: false)[Système national d'information sanitaire]],
    [#block(breakable: false)[SONU]], [#block(breakable: false)[Soins obstétricaux et néonatals d'urgence]],
    [#block(breakable: false)[SPA]], [#block(breakable: false)[Service Provision Assessment]],
    [#block(breakable: false)[UNICEF]], [#block(breakable: false)[Fonds des Nations unies pour l'enfance]],
    [#block(breakable: false)[USAID]], [#block(breakable: false)[Agence des États-Unis pour le développement international]],
    [#block(breakable: false)[VIH]], [#block(breakable: false)[Virus de l'immunodéficience humaine]],
    [#block(breakable: false)[WASH]], [#block(breakable: false)[Water, Sanitation and Hygiene (eau, hygiène et assainissement)]],
    [#block(breakable: false)[WASH-FIT]], [#block(breakable: false)[Water and Sanitation for Health Facility Improvement Tool]],
    [#block(breakable: false)[ZS]], [#block(breakable: false)[Zone de santé]],
)
#v(4pt)


#pagebreak()
#set page(fill: rgb("#131d44"), header: none, footer: none)
#block(width: 100%, height: 100%)[
  #align(center + horizon)[
    #block(above: 0pt, below: 8pt)[#text(size: 8.2pt, tracking: 4pt, fill: rgb("#ced6f8"))[#upper[SECTION]]]
    #context part-size.update(34pt)
    #heading(level: 1)[RÉSUMÉ EXÉCUTIF]
    #v(9pt)
    #text(font: script, size: 22pt, fill: rgb("#ced6f8"))[L'essentiel du diagnostic]
  ]
]
#context head-state.update("RÉSUMÉ EXÉCUTIF")
#pagebreak()
#set page(fill: rgb("#c2cfea"), header: hdr(), footer: ftr())

#heading(level: 2)[Contexte et objectif]

#para[En RDC, la grossesse, l’accouchement et les premières années de vie restent exposés à des risques parmi les plus élevés au monde : 746 décès maternels pour 100 000 naissances vivantes et 93 décès d’enfants de moins de cinq ans pour 1 000 naissances vivantes, selon l’EDS-RDC III. Une part importante de ces décès survient lorsque l’établissement ne dispose pas, au moment critique, du personnel, des médicaments ou des équipements nécessaires. Pour mieux orienter ses appuis, le programme EpiC RDC, mis en œuvre par FHI 360, a fait réaliser un diagnostic rapide de la préparation opérationnelle de 160 établissements de soins de santé (101 centres de santé, 22 centres de santé de référence et 37 hôpitaux généraux de référence), répartis dans 40 zones de santé de huit provinces : Haut-Katanga, Haut-Lomami, Lualaba, Kasaï-Central, Kasaï-Oriental, Lomami, Sankuru et Tanganyika.]

#para[Jusqu’à 28 services essentiels de santé maternelle, néonatale et infantile, de paludisme, de nutrition et de vaccination, appelés fonctions traceuses, ont été vérifiés sur place. Chaque fonction, et non l’établissement, a été classée en vert (assurée), jaune (assurée mais fragile) ou rouge (non assurée dans des conditions adéquates). L’absence d’un seul élément indispensable suffit à classer une fonction en rouge, ce qui signale un maillon critique manquant plutôt qu’un service inexistant. Les causes ont ensuite été analysées avec les équipes cadres des zones et les divisions provinciales de la santé.]

#heading(level: 2)[Les défaillances opérationnelles les plus prioritaires]

#para[Le constat central est que l’offre de soins existe souvent sans être prête au moment où une vie en dépend. Sur l’ensemble des évaluations, 68,4 % des fonctions sont rouges et 1,4 % seulement sont pleinement assurées. Les urgences sont les plus touchées, avec 81 % de fonctions rouges, et 159 établissements sur 160 ont au moins une fonction vitale rouge. Six fonctions vitales sont rouges dans plus de huit établissements sur dix, dans les huit provinces : les grossesses à risque (91,9 %), la prise en charge de la malnutrition aiguë compliquée (90,6 %), les manifestations adverses post-immunisation (90,2 %), la réanimation néonatale (87,5 %), la pré-éclampsie (82,5 %) et le paludisme grave (81,9 %). Les urgences obstétricales restent elles aussi très exposées : la césarienne d’urgence est rouge dans 76,3 % des cas, l’hémorragie du post-partum dans 70,6 % et le sepsis obstétrical dans 69,4 %.]

#para[Le niveau de référence n’offre pas la sécurité attendue. Pour les fonctions communes aux trois niveaux de soins, la part de rouge passe d’environ 70 % au centre de santé à 50 % à l’hôpital général de référence (HGR) : à l’hôpital, une fonction sur deux reste rouge. À l’HGR, l’accouchement normal est rouge dans 92 % des cas, la césarienne d’urgence dans 81,1 % et la réanimation néonatale dans 64,9 %. La référence est elle-même défaillante dans 70,6 % des établissements. Sur place, le transport d’urgence est absent ou non fonctionnel dans 65,6 % d’entre eux, et 77,2 % des centres de santé interrogés citent le manque de ressources financières des ménages parmi les obstacles. À l’arrivée, 89,8 % des structures d’accueil interrogées (53 sur 59) signalent des arrivées tardives, et la césarienne reste rouge dans 81,7 % des destinations identifiées : référer plus vite ne garantit donc pas la prise en charge.]

#para[Deux autres écarts appellent une attention particulière. En nutrition, le système dépiste des enfants qu’il ne peut pas traiter : là où le dépistage fonctionne, la prise en charge reste impossible sur place dans 78 à 94 % des cas, faute de personnel dédié (aucun nutritionniste déclaré dans 94,1 % des centres de santé) et d’aliment thérapeutique prêt à l’emploi (absent dans 86,1 % d’entre eux). Par ailleurs, l’offre déclarée surestime la capacité réelle : 97 des 98 centres de santé qui déclarent pratiquer la réanimation néonatale n’en réunissent pas les conditions. La notification des maladies à potentiel épidémique reste en revanche un point fort, avec 90 % des alertes transmises en moins de 24 heures.]

#heading(level: 2)[Les défaillances de préparation présentant le plus grand risque]

#para[Le risque le plus immédiat tient à quelques éléments dont l’absence suffit à compromettre une prise en charge vitale. Dans 115 établissements, au moins l’un des quatre éléments suivants manque : le sulfate de magnésium (98 établissements), le ballon et masque de réanimation néonatale (56), l’ocytocine (23) ou l’artésunate injectable (14). S’y ajoutent l’absence du kit d’accouchement (127 établissements) et, pour la réanimation du nouveau-né, de la source de chaleur (110) et de l’appareil d’aspiration (77 centres de santé sur 101). Ce risque s’aggrave lorsque le circuit de référence est lui aussi rouge, ce qui concerne 112 des 159 établissements exposés à au moins une menace vitale : référer vers une structure qui n’est pas prête déplace alors le risque sans le réduire.]

#heading(level: 2)[Les principaux goulots d’étranglement transversaux]

#para[Les défaillances tiennent moins à un service particulier qu’à quelques goulots communs à toute la chaîne de soins. Les intrants et les équipements bloquent chacun un peu plus de la moitié des fonctions rouges (52,6 % et 53,1 %), devant la référence (40,2 %) et l’organisation des services (22,6 %). Près de deux fonctions rouges sur trois cumulent au moins deux de ces goulots. Les ressources humaines et l’eau, l’hygiène et l’assainissement bloquent peu ou pas, mais chacun fragilise environ 44 % des fonctions jaunes et les empêche d’atteindre le vert : 53,5 % des centres de santé n’ont aucune sage-femme et les points d’eau ne fonctionnent pas dans les services de 57 % des établissements.]

#para[Les échanges avec les zones et les provinces éclairent les causes de fond : des commandes peu fondées sur la consommation réelle, une maintenance sans budget, un transport d’urgence à la charge des familles et une nutrition sans responsable désigné au centre de santé. Ces fragilités sont anciennes, les enquêtes nationales antérieures relevant déjà les mêmes maillons faibles ; la réduction des financements extérieurs en 2025 a pu les accentuer.]

#para[Cette accumulation a une conséquence directe pour l’investissement. Selon la simulation, aucun levier corrigé isolément ne ferait sortir du rouge plus de 13,1 % des fonctions (valeur atteinte par les intrants), et même le rétablissement de tous les intrants et équipements manquants laisserait rouges plus de la moitié des fonctions concernées (54,4 %). Une action conjointe sur les intrants, les équipements et la référence en lèverait en revanche 62,0 % ; l’eau, l’hygiène et l’assainissement n’ajoutent alors aucune sortie du rouge, mais conditionnent le passage au vert des fonctions libérées. Ces valeurs sont des ordres de grandeur pour prioriser, et non une prévision d’impact.]

#heading(level: 2)[Où investir en priorité]

#para[Les déficits touchent les huit provinces, avec des profils qui appellent des réponses différenciées. Le Sankuru (86,6 % de fonctions rouges et 99 % pour les urgences) et le Haut-Lomami (79,2 %, avec une rupture de médicaments déclarée dans tous les établissements) cumulent des blocages diffus, que seuls des paquets complets peuvent lever. Au Tanganyika, la référence constitue le premier levier. Enfin, 15 zones de santé offrent des possibilités de gains rapides : la correction d’un seul levier, le plus souvent les intrants, y lèverait 17 à 40 % des fonctions rouges.]

#heading(level: 2)[Les cinq priorités d’investissement immédiates (0–3 mois)]

#para[Elles peuvent être engagées avec les circuits et les acteurs existants. La première consiste à doter des quatre éléments vitaux les 115 établissements concernés, et du kit d’accouchement les 127 qui n’en disposent pas, avec un stock de sécurité de trois mois (EpiC RDC et partenaires, avec les DPS). La deuxième consiste à compléter les kits de réanimation néonatale, avec la source de chaleur, l’appareil d’aspiration et le ballon et masque (EpiC RDC, ECZ). La troisième vise à organiser dans chaque zone un circuit de référence et de contre-référence avec répertoire des transports, appel préalable, fiche unique et retour d’information (ECZ et établissements). La quatrième vise à garantir que tout enfant malnutri dépisté soit traité sur place ou référé, avec un agent désigné, une balance et de l’aliment thérapeutique (établissements et ECZ, avec les partenaires de la nutrition). La cinquième consiste à fonder les commandes sur la consommation réelle et à vérifier chaque trimestre, sur place, la capacité à assurer les fonctions vitales, en commençant par les HGR (DPS et ECZ).]

#heading(level: 2)[Les cinq priorités de renforcement du système à moyen terme (3–12 mois)]

#para[À moyen terme, l’enjeu est de restaurer des fonctions de soins complètes plutôt que de combler des manques isolés. La première priorité est de financer des paquets intégrés (intrants, équipements, référence et eau) dans des réseaux formés d’un HGR et des centres de santé qui lui réfèrent leurs patients, en commençant par le Sankuru et le Haut-Lomami. La deuxième est de cofinancer, dans les zones enclavées, un transport d’urgence préfinancé par des conventions forfaitaires avec des transporteurs, à condition que la structure d’accueil soit prête. La troisième est de rétablir l’eau dans les services de soins et de sécuriser l’énergie de secours, notamment pour la chaîne du froid, avec des contrats de maintenance. La quatrième est d’ancrer la nutrition dans le système, par un point focal au centre de santé et l’intégration de l’ATPE, du F75 et du F100 dans le circuit national d’approvisionnement. La cinquième est d’étendre la gratuité de la maternité au transport d’urgence et au kit d’accouchement. Les trois dernières relèvent du niveau central et peuvent demander jusqu’à 24 mois ; le projet peut les accompagner par l’appui technique et le plaidoyer.]

#heading(level: 2)[Recommandations stratégiques pour le dialogue avec le Département d’État des États-Unis (DOS)]

#para[Cinq messages peuvent structurer ce dialogue. Le premier est de financer des fonctions de soins complètes, organisées en réseau hôpital–centres de santé, plutôt que des intrants ou des activités séparés. Le deuxième est de concentrer d’abord les ressources là où elles lèvent le plus de blocages, en arbitrant explicitement, avec les DPS et les ECZ, entre concentration des moyens et équité territoriale. Le troisième est de mesurer les résultats par la capacité réelle vérifiée sur place, et non par l’offre déclarée ou les quantités distribuées ; la part de fonctions d’urgence rouges dans les établissements appuyés, aujourd’hui de 81 %, peut servir de valeur de départ. Le quatrième est de préparer la pérennité dès le départ, en plaidant pour que la maintenance, l’énergie, l’eau, la nutrition et le transport d’urgence entrent dans les budgets publics récurrents et dans la gratuité. Le cinquième est de coordonner les partenaires autour d’un plan unique par zone de santé, précisant qui finance et qui agit.]

#para[Ces constats portent sur la préparation opérationnelle des établissements évalués ; ils ne mesurent ni la qualité des soins reçus, ni l’utilisation des services, ni les résultats sanitaires. Les études complémentaires proposées, sur la couverture effective et sur le niveau communautaire, permettront de vérifier si les capacités restaurées se traduisent par de meilleurs soins pour les familles.]


#pagebreak()
#set page(fill: rgb("#131d44"), header: none, footer: none)
#block(width: 100%, height: 100%)[
  #align(center + horizon)[
    #block(above: 0pt, below: 8pt)[#text(size: 8.2pt, tracking: 4pt, fill: rgb("#ced6f8"))[#upper[PARTIE I]]]
    #context part-size.update(34pt)
    #heading(level: 1)[INTRODUCTION]
    #v(9pt)
    #text(font: script, size: 22pt, fill: rgb("#ced6f8"))[Contexte et objectifs]
  ]
]
#context head-state.update("INTRODUCTION")
#pagebreak()
#set page(fill: rgb("#c2cfea"), header: hdr(), footer: ftr())

#heading(level: 2)[1.1. Contexte et justification]

#para[La République démocratique du Congo (RDC) demeure l’un des pays d’Afrique subsaharienne où la maternité et la survie de l’enfant comportent des risques particulièrement élevés. Selon l’EDS-RDC III, le ratio de mortalité maternelle atteint 746 décès pour 100 000 naissances vivantes, tandis que les mortalités néonatale, infantile et infanto-juvénile s’établissent respectivement à 24, 56 et 93 pour 1 000 naissances vivantes \[1\]. Au-delà de ces indicateurs, cette mortalité traduit des insuffisances persistantes du système de santé, notamment dans la disponibilité, au moment critique, d’un personnel qualifié, d’intrants essentiels et d’un plateau technique fonctionnel. Cette vulnérabilité s’inscrit dans un contexte de forte fécondité, avec 5,5 enfants par femme et près d’une adolescente sur cinq déjà engagée dans la maternité entre 15 et 19 ans. La situation nutritionnelle reste également préoccupante : près d’un enfant de moins de cinq ans sur deux présente un retard de croissance, 7 % souffrent de malnutrition aiguë et près d’une femme enceinte sur deux est anémiée. Par ailleurs, moins d’un ménage sur cinq dispose d’un dispositif de lavage des mains avec eau et savon, et environ un tiers seulement d’installations sanitaires adéquates \[1\]. Ces déficits en eau, hygiène et assainissement accroissent la morbidité et, par conséquent, la pression sur des services de santé déjà fragiles.]

#para[Les ressources disponibles restent insuffisantes au regard de ces besoins. La part du budget national consacrée à la santé est passée de 6,7 % en 2016 à 14,1 % en 2024, se rapprochant de l’engagement d’Abuja de 15 %. Toutefois, les dépenses publiques de santé restent autour de 4 % du PIB, pour une dépense publique d’environ 22–23 USD par habitant et par an, très inférieure aux 86 USD estimés nécessaires pour assurer un paquet de services essentiels \[2\]. Ce sous-financement structurel reporte une part importante du coût des soins sur les ménages et limite la capacité du système à garantir durablement des services essentiels de qualité.]

#para[À ces contraintes structurelles s’ajoute une forte pression épidémique. Depuis mai 2026, le pays fait face à une importante épidémie d’Ebola, avec 8 224 cas confirmés et 3 982 décès au 29 septembre 2026, touchant plusieurs provinces de l’Est et du Nord-Est \[3\]. Elle survient dans un contexte déjà marqué par plus de 83 000 cas suspects de choléra et près de 2 400 décès, plus de 11 500 cas suspects de Mpox et plus de 44 000 cas suspects de rougeole, alors que plusieurs millions de personnes demeurent déplacées dans l’Est du pays \[4\]. Ces urgences se superposent aux besoins courants de santé maternelle, néonatale et infantile, de nutrition et de lutte contre le paludisme, mobilisant les mêmes ressources humaines, infrastructures et intrants et fragilisant davantage la continuité des services essentiels.]

#para[La RDC dispose certes de données importantes pour orienter son système de santé. Toutefois, les grandes enquêtes nationales, notamment l’EDS et les évaluations harmonisées des établissements de santé \[5\], fournissent des informations essentielles mais périodiques, principalement conçues pour le suivi sectoriel. Elles permettent plus difficilement d’identifier, établissement par établissement et en temps utile, les contraintes opérationnelles nécessitant une action immédiate. Le présent diagnostic vise précisément à combler cet écart entre l’information stratégique nationale et la décision opérationnelle locale.]

#para[C’est dans cette perspective que le programme EpiC RDC, mis en œuvre par FHI 360, appuie le renforcement intégré des services de santé maternelle, néonatale et infantile, de lutte contre le paludisme et de nutrition. Pour mieux cibler ses interventions, le programme a besoin d’une appréciation rapide et fiable de la préparation opérationnelle des établissements de santé dans ses huit provinces d’intervention : Haut-Katanga, Haut-Lomami, Lualaba, Kasaï-Central, Kasaï-Oriental, Lomami, Sankuru et Tanganyika.]

#para[Coordonné techniquement par ICHESS, ce diagnostic complète les dispositifs nationaux existants en apportant une lecture actualisée et directement exploitable des capacités des établissements appuyés. Il vise à identifier les contraintes les plus critiques, hiérarchiser les besoins et traduire les constats en décisions programmatiques concrètes. En permettant à EpiC RDC de concentrer ses ressources là où les déficits compromettent le plus la continuité et la qualité des services, il constitue un outil d’aide à la décision pour optimiser la mise en œuvre du projet, renforcer la résilience des services essentiels et contribuer aux progrès vers la couverture sanitaire universelle (CSU).]

#heading(level: 2)[1.2. Objectifs et résultats attendus]

#heading(level: 3)[1.2.1. Objectif général]

#para[Établir une évaluation hiérarchisée et directement exploitable de l'état de préparation opérationnelle des établissements de soins de santé pour la prestation des services essentiels de santé maternelle, néonatale et infantile, de paludisme, de nutrition et de vaccination, afin d'identifier les goulots d'étranglement prioritaires et d'orienter les interventions d'EpiC RDC ainsi que celles des autorités sanitaires.]

#heading(level: 3)[1.2.2. Objectifs spécifiques]

- Évaluer la préparation fonctionnelle des établissements enquêtés au regard des ressources humaines, des intrants, des équipements, des infrastructures et des mécanismes de référence et de contre-référence ;

- Apprécier l'intégration opérationnelle des services, notamment le dépistage, la référence des patients, la continuité des soins et l'application effective des protocoles et normes de prise en charge ;

- Évaluer l’utilisation des données de routine pour le pilotage des services, l'amélioration de la qualité des soins et la préparation aux situations d'urgence ;

- Identifier les facteurs structurels, organisationnels, institutionnels et contextuels qui expliquent les principales contraintes observées ;

- Hiérarchiser les besoins et les priorités d'investissement en fonction de la criticité des goulots d’étranglement identifiés et de l’effet potentiel des leviers d’intervention ;

#heading(level: 3)[1.2.3. Périmètre du diagnostic]

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 9.6pt, weight: "bold", fill: rgb("#131d44"))[Tableau 1 : Périmètre du diagnostic]]
#set par(justify: false, leading: 0.62em)
#set text(size: 9.0pt)
#table(
  columns: (0.3400fr, 0.2601fr, 0.3999fr),
  inset: (x: 4.4pt, y: 3.2pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Le diagnostic est]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Il n'est pas]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Conséquence pour la lecture]]]),
    [#block(breakable: false)[Une mesure des conditions opérationnelles minimales de 28 fonctions traceuses]], [#block(breakable: false)[Un audit de la qualité des soins]], [#block(breakable: false)[Rouge signifie « conditions non réunies », non « soins de mauvaise qualité »]],
    [#block(breakable: false)[Une lecture par fonction, dimension par dimension, avec un motif explicite]], [#block(breakable: false)[Une évaluation de la performance du personnel]], [#block(breakable: false)[Les ressources humaines sont une dimension parmi douze ; aucune personne n'est évaluée]],
    [#block(breakable: false)[Un outil de hiérarchisation par province et par contrainte]], [#block(breakable: false)[Un classement des établissements]], [#block(breakable: false)[Aucun score d'établissement ; codes anonymes dans le rapport principal]],
    [#block(breakable: false)[Une base pour l'analyse participative avec les équipes cadres]], [#block(breakable: false)[Une liste de contrôle d'accréditation]], [#block(breakable: false)[Les seuils (jours de rupture, jours de présence) sont des règles de lecture, non des normes]],
    [#block(breakable: false)[Une description des 160 établissements ciblés]], [#block(breakable: false)[Une estimation de population]], [#block(breakable: false)[Aucune extrapolation ; aucun intervalle de confiance]],
)
#v(4pt)

#heading(level: 3)[1.2.4. Résultats attendus]

- Le niveau de préparation fonctionnelle des établissements enquêtés est documenté, notamment pour les ressources humaines, les intrants, les équipements, les infrastructures et les mécanismes de référence et de contre-référence ;

- Le degré d'intégration opérationnelle des services est établi, à travers le dépistage, la référence des patients, la continuité des soins et l'application des protocoles ;

- Le niveau d'utilisation des données de routine est documenté, pour le pilotage des services, l'amélioration de la qualité et la préparation aux urgences ;

- Les principaux déterminants des contraintes observées (structurels, organisationnels, institutionnels ou contextuels) sont identifiés et hiérarchisés par fonction traceuse, domaine, type d'établissement et niveau du système de santé ;

- Les priorités d'investissement sont établies à partir des leviers simulés ; des recommandations opérationnelles, priorisées et réalistes sont formulées, reliées aux mécanismes de redevabilité et à la planification, pour orienter les interventions d'EpiC RDC à court et moyen terme ;

- Des produits d'appui accompagnent le rapport : fiches synthétiques par zone de santé (ZS) et bases de données anonymisées et documentées, transmises au commanditaire.

#heading(level: 2)[1.3. Bénéficiaires et utilisations des résultats]

#heading(level: 3)[1.3.1. Bénéficiaires]

#para[Les résultats de ce diagnostic s'adressent en premier lieu à EpiC RDC et à ses partenaires d'exécution, pour orienter le ciblage et le contenu de leurs appuis aux établissements des huit provinces couvertes. Ils intéressent également les équipes cadres des zones de santé (ECZ) et les divisions provinciales de la santé (DPS), qui disposeront d'une lecture actualisée des contraintes propres à leur ressort, ainsi que le ministère de la Santé publique, Hygiène et Prévoyance sociale (MSPHPS) dans la mesure où le diagnostic vient documenter, au niveau opérationnel, la mise en œuvre du Plan national de développement sanitaire et de prévoyance sociale (PNDS-PS) 2024-2033.]

#heading(level: 3)[1.3.2. Utilisation des résultats]

#para[Les résultats sont destinés à un usage programmatique immédiat : prioriser les appuis d'EpiC RDC entre établissements et ZS, alimenter le dialogue avec les DPS et les ECZ sur les contraintes qui relèvent de leur responsabilité, et nourrir les mécanismes existants de redevabilité et de planification stratégique. Ils ne se substituent pas aux enquêtes nationales de référence et ne permettent ni classement de performance des établissements, ni extrapolation à l'ensemble du pays.]


#pagebreak()
#set page(fill: rgb("#131d44"), header: none, footer: none)
#block(width: 100%, height: 100%)[
  #align(center + horizon)[
    #block(above: 0pt, below: 8pt)[#text(size: 8.2pt, tracking: 4pt, fill: rgb("#ced6f8"))[#upper[PARTIE II]]]
    #context part-size.update(26pt)
    #heading(level: 1)[APPROCHE MÉTHODOLOGIQUE]
    #v(9pt)
    #text(font: script, size: 17pt, fill: rgb("#ced6f8"))[Méthode et données]
  ]
]
#context head-state.update("APPROCHE MÉTHODOLOGIQUE")
#pagebreak()
#set page(fill: rgb("#c2cfea"), header: hdr(), footer: ftr())

#heading(level: 2)[2.1. Conception générale de l'étude]

#para[Le diagnostic repose sur une conception transversale, descriptive et diagnostique, qui combine deux composantes séquencées : une enquête quantitative par questionnaire électronique dans 160 établissements, puis des entretiens semi-structurés aux niveaux de l'établissement, de la zone de santé et de la province. Les deux composantes ont des rôles distincts : le questionnaire administré dans les établissements identifie les contraintes opérationnelles qui empêchent chaque fonction d’être assurée, tandis que les entretiens avec les responsables des établissements, les équipes cadres des zones de santé et les divisions provinciales de la santé en expliquent les causes systémiques et les niveaux de responsabilité. Chaque entretien part ainsi des goulots déjà identifiés dans la structure ou la zone : mesurer d’abord ce qui ne fonctionne pas, puis comprendre pourquoi.]

#para[L'objet mesuré n'est ni la performance, ni la qualité clinique des soins, ni l'utilisation effective des services, mais la préparation opérationnelle : la capacité effective d'un établissement à délivrer une fonction essentielle dans les conditions constatées au moment de l'enquête.]

#heading(level: 2)[2.2. Population, échantillonnage et unités d'analyse]

#heading(level: 3)[2.2.1. Base de sondage et plan d'échantillonnage]

#para[L'échantillon a été constitué en trois étapes à partir d'une base consolidée d'établissements issue du DHIS2/SNIS : application de critères d'éligibilité au niveau des établissements et des ZS, puis sélection stratifiée combinée à un tirage à probabilité proportionnelle à la taille. Le tableau suivant résume la base de sondage et l'échantillon réalisé.]

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 9.6pt, weight: "bold", fill: rgb("#131d44"))[Tableau 2 : Base de sondage et échantillon réalisé, par niveau géographique]]
#set par(justify: false, leading: 0.62em)
#set text(size: 9.0pt)
#table(
  columns: (0.5155fr, 0.2427fr, 0.2418fr),
  inset: (x: 4.4pt, y: 3.2pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Niveau]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Cadre éligible]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Échantillon enquêté]]]),
    [#block(breakable: false)[Provinces]], [#block(breakable: false)[8]], [#block(breakable: false)[8]],
    [#block(breakable: false)[Zones de santé]], [#block(breakable: false)[73]], [#block(breakable: false)[40]],
    [#block(breakable: false)[Établissements]], [#block(breakable: false)[1 015]], [#block(breakable: false)[160]],
    [#block(breakable: false)[dont centres de santé (CS)]], [#block(breakable: false)[–]], [#block(breakable: false)[101]],
    [#block(breakable: false)[dont centres de santé de référence (CSR)]], [#block(breakable: false)[–]], [#block(breakable: false)[22]],
    [#block(breakable: false)[dont hôpitaux généraux de référence (HGR)]], [#block(breakable: false)[–]], [#block(breakable: false)[37]],
)
#v(4pt)

#para[Trois profils, mutuellement exclusifs, ont guidé la sélection des établissements : les structures de référence, les établissements à fort volume d'activité identifiés par un score composite, et les établissements signalés sur critère de mortalité. Ces profils décrivent la manière dont l'échantillon a été constitué. Les catégories CS, CSR et HGR du tableau correspondent, quant à elles, au questionnaire administré et servent de base à l'analyse. Ce choix raisonné, adapté à un diagnostic rapide, fixe la portée des résultats : ils décrivent les 160 établissements enquêtés, sont analysés sans pondération et ne constituent pas des estimations représentatives de l'ensemble des établissements des zones ou des provinces concernées.]

#heading(level: 3)[2.2.2. Unités d'analyse]

#para[L'unité principale d'analyse est le couple fonction traceuse–établissement : le diagnostic classe des fonctions, jamais des établissements. Le fichier analytique est organisé en format long, chaque enregistrement correspondant à une fonction évaluée dans un établissement donné. Les autres niveaux de lecture (domaine, établissement, zone de santé, province) sont obtenus par agrégation, chacun avec un dénominateur explicite : fonctions évaluables, fonctions évaluées ou établissements concernés, ces dénominateurs n'étant pas interchangeables.]

#para[Aucun score composite ni classement d'établissement n'est produit : les résultats sont restitués sous forme de profils Vert/Jaune/Rouge.]

#heading(level: 2)[2.3. Instruments de collecte]

#heading(level: 3)[2.3.1. Composante quantitative]

#para[La collecte quantitative repose sur trois questionnaires électroniques harmonisés, adaptés respectivement aux centres de santé (CS), aux centres de santé de référence (CSR) et aux HGR. Les modules communs utilisent les mêmes sections, variables et modalités de réponse, permettant ainsi de fusionner les trois bases de données à partir d’une table de correspondance prédéfinie.]

#para[Les questionnaires couvrent neuf blocs communs, notamment l’identification et la couverture, la capacité d'accueil, les ressources humaines, l’eau, l’hygiène et l’assainissement (WASH), l’électricité et la communication, le SNIS et la surveillance, la référence et contre-référence, ainsi que l’intégration et la coordination des services. Des modules spécifiques sont ajoutés selon le niveau de soins : CPN/PTME et vaccination au niveau des CS ; césarienne, transfusion et unité nutritionnelle thérapeutique intensive aux niveaux HGR/CSR.]

#para[Le répondant principal est l'infirmier titulaire (IT), son adjoint ou le médecin directeur, appuyé par les responsables des services concernés. Les données sont recueillies en face-à-face sur tablette à l’aide de Survey Solutions, avec saisie hors ligne et synchronisation sécurisée avec le serveur central au début et à la fin de chaque journée de collecte.]

#heading(level: 3)[2.3.2. Composante qualitative]

#para[La collecte qualitative repose sur trois guides d'entretien individuel semi-structuré, correspondant aux trois niveaux du système de santé étudiés : les IT/ITA de centres de santé, appuyés par leurs équipes, les équipes-cadres des zones de santé (ECZ), et les cadres des divisions provinciales de la santé (DPS). Les trois guides suivent une architecture harmonisée comprenant les objectifs à l’usage de l’enquêteur, l’identification du répondant et des modules thématiques structurés en quatre étapes : (i) une question principale, ouverte et standardisée, posée à l’identique par tous les enquêteurs afin d’assurer la comparabilité des réponses ; (ii) des questions de relance pour approfondir les dimensions non spontanément abordées ; (iii) l’identification du niveau de responsabilité associé à chaque contrainte (établissement, zone de santé, province ou niveau central) ; et (iv) l’exploration des solutions proposées par le répondant, sans suggestion de l’enquêteur.]

#para[Cette architecture permet de relier systématiquement chaque goulot d’étranglement à ses causes, au niveau auquel il peut être résolu et aux solutions envisageables, fournissant ainsi une base directement exploitable pour la formulation de recommandations opérationnelles.]

#para[*Participants.* La composante qualitative couvre les trois niveaux étudiés : un entretien dans chacun des établissements enquêtés, un entretien avec chacune des 40 ECZ et un entretien avec chacune des huit DPS. Cette couverture permet de trianguler les constats des établissements avec les analyses zonales et provinciales des goulots d’étranglement, de leurs déterminants, des réponses déjà engagées et des actions prioritaires relevant de chaque niveau du système.]

#heading(level: 2)[2.4. Organisation de la collecte]

#heading(level: 3)[2.4.1. Phasage du déploiement]

#para[Le déploiement, confié par FHI 360 à ICHESS, s’est déroulé en trois phases. Le pré-déploiement (huit semaines) a couvert la mise en place de la gouvernance, le paramétrage des questionnaires dans Survey Solutions (contrôles de cohérence, sauts logiques et règles de validation), leur pré-test dans la zone de santé urbano-rurale de Mont-Ngafula 2 à Kinshasa, ainsi que la formation des superviseurs.]

#para[Le déploiement (deux semaines) a compris la formation des enquêteurs, suivie de la collecte séquentielle des données quantitatives puis qualitatives, conduite simultanément dans les huit provinces sous supervision quotidienne. Le post-déploiement (une semaine) a porté sur la validation des données, leur restitution préliminaire aux ECZ et DPS, sans communication des résultats définitifs, puis la clôture du processus.]

#para[La conduite simultanée de la collecte dans les huit provinces a permis de réduire les biais liés aux variations temporelles du contexte et de renforcer la comparabilité des observations.]

#heading(level: 3)[2.4.2. Dispositif humain et circuit d’assurance qualité]

#para[Le dispositif a mobilisé huit superviseurs, un par province, et quarante enquêteurs, un par zone de santé (ZS), sous la coordination centrale d’ICHESS. Chaque soumission suivait un circuit standardisé d’assurance qualité en cinq étapes : collecte, contrôle, correction, validation et synchronisation. Le superviseur examinait chaque soumission en temps réel, la validait ou la rejetait avec un commentaire ciblé ; toute soumission rejetée était automatiquement retournée à l’enquêteur pour correction avant nouvelle validation et synchronisation avec le serveur central.]

#heading(level: 2)[2.5. Assurance qualité des données]

#para[L’assurance qualité était organisée à trois niveaux complémentaires. À la saisie, des contrôles automatisés limitent les durées à 0–92 jours, vérifient la cohérence entre réponses liées, bloquent les erreurs critiques et permettent un suivi quotidien de la complétude des données par section et par équipe. Sur le terrain, une grille standardisée de supervision vérifie le consentement, la neutralité de l’enquêteur, l’application correcte des filtres et, surtout, la vérification physique des éléments observables, plutôt que leur seule déclaration par les répondants.]

#para[Au niveau analytique, le dispositif de contrôle qualité prévoyait une contre-visite indépendante dans 8 à 10 % des établissements, ciblant les sections nécessitant une forte vérification factuelle, ainsi que la mesure de la concordance entre évaluateurs par le coefficient kappa pondéré, globalement et par domaine ; un kappa inférieur à 0,60 dans un domaine devait déclencher une revue ciblée des divergences et le recyclage des équipes concernées.]

#heading(level: 2)[2.6. Cadre analytique : fonctions traceuses et classification tricolore]

#heading(level: 3)[2.6.1. Fonctions traceuses]

#para[L'analyse repose sur 28 fonctions traceuses, directement dérivées des questionnaires et regroupées en quatre domaines techniques et un domaine transversal : santé de la mère, du nouveau-né, de l'enfant et de l'adolescent (15 fonctions), paludisme (3), nutrition (3), vaccination (3) et fonctions transversales (4 : surveillance épidémiologique, référence urgente, intégration des services, données sanitaires). Les fonctions attendues varient selon le niveau de soins : 24 au CS, 26 au CSR et 21 à l’HGR, soit 71 combinaisons fonction × niveau. Parmi elles, 17 fonctions sont communes aux trois niveaux et constituent la base des comparaisons entre niveaux. Chaque fonction est évaluée sous six angles standardisés (offre effective du service, disponibilité de personnel qualifié, intrants traceurs, équipements critiques, continuité du service et prérequis transversaux), qui mobilisent les douze dimensions définies ci-après. La classification tricolore porte sur les fonctions et non sur les établissements : un même établissement peut avoir des fonctions vertes, jaunes et rouges.]

#para[Deux fenêtres temporelles complémentaires mais non interchangeables structurent l'évaluation. Le jour de l'enquête mesure la préparation opérationnelle immédiate : toute indisponibilité critique constatée ce jour entraîne un classement Rouge, indépendamment de la situation antérieure. Les trois mois révolus (92 jours) permettent d’apprécier la stabilité de cette capacité à travers la durée des ruptures, la continuité de fonctionnement et la présence effective du personnel qualifié. La survenue de cas au cours de cette période est recueillie uniquement à des fins contextuelles et n'entre pas dans la classification.]

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 8.799999999999999pt, weight: "bold", fill: rgb("#131d44"))[Tableau 3 : Les 28 fonctions traceuses (71 spécifications selon le niveau)]]
#set par(justify: false, leading: 0.62em)
#set text(size: 8.2pt)
#table(
  columns: (0.1997fr, 0.4817fr, 0.1027fr, 0.0935fr, 0.1224fr),
  inset: (x: 4.4pt, y: 2.3pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Fonction]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Libellé complet]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Domaine]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Criticité]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Niveaux attendus]]]),
    [#block(breakable: false)[CPN de routine]], [#block(breakable: false)[Consultation prénatale de routine (CPNr)]], [#block(breakable: false)[SMNEA]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[CS · CSR]],
    [#block(breakable: false)[CPN \+ PTME]], [#block(breakable: false)[CPN intégrée à la PTME]], [#block(breakable: false)[SMNEA]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[CS · CSR]],
    [#block(breakable: false)[Grossesse à risque]], [#block(breakable: false)[Détection, stabilisation initiale et référence des grossesses à risque]], [#block(breakable: false)[SMNEA]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[CS · CSR]],
    [#block(breakable: false)[Accouchement normal]], [#block(breakable: false)[Assistance qualifiée à l'accouchement normal et surveillance du travail]], [#block(breakable: false)[SMNEA]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[CS · CSR · HGR]],
    [#block(breakable: false)[Hémorragie post-partum]], [#block(breakable: false)[Prévention et prise en charge initiale de l'hémorragie du post-partum (HPP)]], [#block(breakable: false)[SMNEA]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[CS · CSR · HGR]],
    [#block(breakable: false)[Pré-éclampsie]], [#block(breakable: false)[Prise en charge initiale de la pré-éclampsie/éclampsie]], [#block(breakable: false)[SMNEA]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[CS · CSR · HGR]],
    [#block(breakable: false)[Sepsis obstétrical]], [#block(breakable: false)[Traitement initial d'une infection obstétricale]], [#block(breakable: false)[SMNEA]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[CS · CSR · HGR]],
    [#block(breakable: false)[Accouchement assisté]], [#block(breakable: false)[Accouchement vaginal assisté]], [#block(breakable: false)[SMNEA]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[CSR · HGR]],
    [#block(breakable: false)[Césarienne d'urgence]], [#block(breakable: false)[Césarienne d'urgence]], [#block(breakable: false)[SMNEA]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[CSR · HGR]],
    [#block(breakable: false)[Transfusion]], [#block(breakable: false)[Transfusion sanguine d'urgence]], [#block(breakable: false)[SMNEA]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[CSR · HGR]],
    [#block(breakable: false)[Réanimation néonatale]], [#block(breakable: false)[Réanimation néonatale immédiate]], [#block(breakable: false)[SMNEA]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[CS · CSR · HGR]],
    [#block(breakable: false)[Soins du nouveau-né]], [#block(breakable: false)[Soins essentiels immédiats du nouveau-né]], [#block(breakable: false)[SMNEA]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[CS · CSR · HGR]],
    [#block(breakable: false)[CPoN mère]], [#block(breakable: false)[Consultation postnatale de la mère]], [#block(breakable: false)[SMNEA]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[CS · CSR · HGR]],
    [#block(breakable: false)[CPoN nouveau-né]], [#block(breakable: false)[Consultation postnatale du nouveau-né]], [#block(breakable: false)[SMNEA]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[CS · CSR · HGR]],
    [#block(breakable: false)[Réception urgences]], [#block(breakable: false)[Réception, triage et stabilisation des urgences référées]], [#block(breakable: false)[SMNEA]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[HGR]],
    [#block(breakable: false)[Diagnostic paludisme]], [#block(breakable: false)[Diagnostic du paludisme]], [#block(breakable: false)[Paludisme]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[CS · CSR · HGR]],
    [#block(breakable: false)[Paludisme simple]], [#block(breakable: false)[Traitement du paludisme simple]], [#block(breakable: false)[Paludisme]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[CS · CSR · HGR]],
    [#block(breakable: false)[Paludisme grave]], [#block(breakable: false)[Stabilisation et traitement du paludisme grave]], [#block(breakable: false)[Paludisme]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[CS · CSR · HGR]],
    [#block(breakable: false)[Dépistage nutrition]], [#block(breakable: false)[Dépistage nutritionnel]], [#block(breakable: false)[Nutrition]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[CS · CSR · HGR]],
    [#block(breakable: false)[MA non compliquée]], [#block(breakable: false)[Prise en charge de la malnutrition aiguë non compliquée]], [#block(breakable: false)[Nutrition]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[CS]],
    [#block(breakable: false)[MA compliquée]], [#block(breakable: false)[Identification, stabilisation initiale, référence et suivi des cas]], [#block(breakable: false)[Nutrition]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[CS · CSR · HGR]],
    [#block(breakable: false)[Vaccination de routine]], [#block(breakable: false)[Vaccination de routine]], [#block(breakable: false)[Vaccination]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[CS · CSR]],
    [#block(breakable: false)[Chaîne du froid]], [#block(breakable: false)[Maintien et surveillance de la chaîne du froid]], [#block(breakable: false)[Vaccination]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[CS · CSR]],
    [#block(breakable: false)[MAPI]], [#block(breakable: false)[Prise en charge initiale et notification des MAPI]], [#block(breakable: false)[Vaccination]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[CS · CSR]],
    [#block(breakable: false)[Surveillance épidémiologique]], [#block(breakable: false)[Détection et notification des maladies à potentiel épidémique]], [#block(breakable: false)[Transversal]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[CS · CSR · HGR]],
    [#block(breakable: false)[Référence urgente]], [#block(breakable: false)[Référence et contre-référence urgente]], [#block(breakable: false)[Transversal]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[CS · CSR · HGR]],
    [#block(breakable: false)[Intégration services]], [#block(breakable: false)[Intégration des services au point de contact]], [#block(breakable: false)[Transversal]], [#block(breakable: false)[Systémique]], [#block(breakable: false)[CS · CSR · HGR]],
    [#block(breakable: false)[Données sanitaires]], [#block(breakable: false)[Enregistrement, transmission et utilisation des données sanitaires]], [#block(breakable: false)[Transversal]], [#block(breakable: false)[Systémique]], [#block(breakable: false)[CS · CSR · HGR]],
)
#v(4pt)

#para[Les 28 fonctions traceuses sont également classées selon leur niveau de criticité : 15 fonctions vitales, dont la défaillance peut compromettre immédiatement la survie du patient ; 11 fonctions essentielles, nécessaires à la continuité et à la qualité des services ; et 2 fonctions systémiques, qui soutiennent le fonctionnement, la coordination et le pilotage global de l’offre de soins.]

#heading(level: 3)[Définitions et conventions de lecture]

#para[*Fonction traceuse. *Soin ou service essentiel dont la réalisation requiert la disponibilité simultanée de plusieurs conditions. Elle sert de traceur de la capacité opérationnelle de l’établissement à délivrer un paquet de soins. Lorsqu’une fonction est attendue à plusieurs niveaux de soins, elle fait l’objet d’une spécification propre à chaque niveau, définissant les exigences correspondantes.]

#para[*Domaine.* Regroupement des fonctions traceuses en cinq champs : santé de la mère, du nouveau-né, de l’enfant et de l’adolescent (SMNEA), paludisme, nutrition, vaccination et fonctions transversales du système.]

#para[*Criticité.* Une fonction est vitale lorsque sa défaillance peut mettre immédiatement une vie en danger, comme la réanimation néonatale ou la prise en charge de la pré-éclampsie ; essentielle lorsqu’elle conditionne la continuité et la qualité du service ; et systémique lorsqu’elle soutient le fonctionnement global de l’établissement. Les 13 fonctions d’urgence constituent un sous-ensemble des fonctions vitales, hors surveillance épidémiologique et chaîne du froid.]

#para[*Dimension*. Registre dans lequel une contrainte susceptible d’affecter une fonction est recherchée. Douze dimensions sont considérées : organisation du service, capacité d’accueil, ressources humaines, intrants et produits, équipements, eau-hygiène-assainissement (WASH), électricité, communication, référence, données sanitaires, surveillance épidémiologique et intégration des services. Selon la fonction, une dimension peut être bloquante (sa défaillance entraîne un classement Rouge), restrictive (elle plafonne la fonction au Jaune) ou contextuelle (documentée sans incidence sur la classification).]

#para[*Classification.* Une fonction est classée Verte lorsqu’elle est pleinement opérationnelle, Jaune lorsqu’elle peut être assurée mais demeure fragile ou instable, et Rouge lorsqu’au moins une contrainte bloquante empêche sa réalisation dans les conditions requises. La couleur qualifie la fonction évaluée et non l’établissement dans son ensemble.]

#para[*Dénominateurs.* Les proportions de fonctions Vertes, Jaunes et Rouges sont calculées sur K, nombre d’évaluations de la fonction considérée, et totalisent 100 %. Par prudence, une dimension qui n’a pas pu être documentée le jour de la visite est lue dans sa modalité la plus défavorable, comme un élément non disponible. Cette règle concerne 29 des 3 773 évaluations (0,8 %) et permet de classer l’ensemble des évaluations, qui constituent la base des résultats.]

#para[*Levier.* Simulation consistant à rejouer l’algorithme en supposant corrigée une dimension donnée, toutes choses égales par ailleurs, afin d’estimer le nombre de fonctions Rouges qui passeraient au Jaune ou au Vert. Le résultat indique un potentiel théorique d’amélioration, et non l’effet attendu d’une intervention réelle. Les gains associés à différents leviers ne sont pas additifs ; seules les combinaisons ou paquets explicitement simulés permettent d’estimer un gain conjoint. *Portée.* L’échantillonnage étant raisonné, les résultats décrivent exclusivement les 160 établissements évalués. Ils ne permettent ni extrapolation statistique aux huit provinces, ni calcul d’intervalles de confiance, ni classement des établissements ou des provinces. Les résultats du Kasaï-Oriental et du Tanganyika, fondés sur huit établissements chacun, doivent être interprétés comme des repères descriptifs.]

#heading(level: 3)[2.6.2. Algorithme de classification Vert \/ Jaune \/ Rouge]

#para[La classification de chaque fonction repose sur un algorithme unique, déterministe et standardisé, appliqué de manière identique à l’ensemble des instruments. Elle ne relève donc d’aucune appréciation subjective de l’enquêteur, du superviseur ou de l’analyste.]

#para[L’algorithme utilise quatre variables canoniques : (i) conditions présentes, qui indique si toutes les conditions minimales requises pour assurer la fonction sont réunies ; (ii) contrainte bloquante, qui signale la présence d’au moins une défaillance rendant la fonction non réalisable. Par exemple, l’absence de sulfate de magnésium pour la prise en charge de la pré-éclampsie ou d’un ballon auto-gonflable fonctionnel pour la réanimation néonatale ; (iii) statut intrants, correspondant au statut le plus défavorable parmi les intrants traceurs requis ; et (iv) contournement, qui identifie le recours à un mécanisme informel ou instable pour maintenir le service, tel que l’emprunt de produits, un transport improvisé ou l’utilisation d’un téléphone personnel comme seul moyen de communication du service.]

#para[À partir de ces quatre variables, huit règles de décision hiérarchisées, appliquées dans un ordre fixe, déterminent automatiquement la classification finale de chaque fonction :]

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 9.6pt, weight: "bold", fill: rgb("#131d44"))[Tableau 4 : Les huit règles de décision de l'algorithme de classification Vert \/ Jaune \/ Rouge]]
#set par(justify: false, leading: 0.62em)
#set text(size: 9.0pt)
#table(
  columns: (0.0574fr, 0.5096fr, 0.4330fr),
  inset: (x: 4.4pt, y: 3.2pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[N°]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Condition]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Résultat]]]),
    [#block(breakable: false)[1]], [#block(breakable: false)[Contrainte bloquante présente]], [#block(breakable: false)[Rouge]],
    [#block(breakable: false)[2]], [#block(breakable: false)[Statut des intrants = Rouge (rupture \> 7 jours ou indisponibilité le jour de l'enquête)]], [#block(breakable: false)[Rouge]],
    [#block(breakable: false)[3]], [#block(breakable: false)[Statut des intrants = Jaune et aucune contrainte bloquante]], [#block(breakable: false)[Jaune]],
    [#block(breakable: false)[4]], [#block(breakable: false)[Conditions minimales réunies, aucune contrainte bloquante, intrants Vert ou non applicables]], [#block(breakable: false)[Vert]],
    [#block(breakable: false)[5]], [#block(breakable: false)[Conditions minimales non réunies, aucune contrainte bloquante]], [#block(breakable: false)[Jaune]],
    [#block(breakable: false)[6]], [#block(breakable: false)[Statut des intrants = non applicable]], [#block(breakable: false)[Sans effet : les autres règles déterminent la classification]],
    [#block(breakable: false)[7]], [#block(breakable: false)[Recours à un contournement alors que la classification provisoire est Vert]], [#block(breakable: false)[Jaune (plafonnement)]],
    [#block(breakable: false)[8]], [#block(breakable: false)[Absence de cas au cours des trois derniers mois]], [#block(breakable: false)[Sans effet : la classification repose exclusivement sur les conditions actuelles]],
)
#v(4pt)

#para[Pour chaque fonction classée Jaune ou Rouge, un goulot d’étranglement principal unique est attribué selon un ordre de priorité fixe entre les dimensions : l’organisation du service est examinée en premier, les intrants avant les équipements, et la catégorie résiduelle « Autres » n’est retenue qu’en dernier recours. Cette règle standardisée garantit la reproductibilité de l’attribution : deux analystes appliquant l’algorithme au même enregistrement aboutissent au même goulot principal.]

#para[Chaque goulot est ensuite qualifié selon son niveau d’imputation présumé : établissement ou système. Cette distinction permet d’identifier les contraintes pouvant être corrigées directement par l’établissement et celles nécessitant une intervention à un niveau supérieur, notamment sur la chaîne d’approvisionnement, les ressources humaines, les infrastructures ou les politiques et mécanismes de gestion du système de santé.]

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 8.799999999999999pt, weight: "bold", fill: rgb("#131d44"))[Tableau 5 : Rôle des douze dimensions dans les 71 spécifications]]
#set par(justify: false, leading: 0.62em)
#set text(size: 8.2pt)
#table(
  columns: (0.2935fr, 0.2922fr, 0.1299fr, 0.1310fr, 0.1534fr),
  inset: (x: 4.4pt, y: 3.2pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Dimension]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Catégorie de goulot]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Bloquante]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Restrictive]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Contextuelle]]]),
    [#block(breakable: false)[Organisation du service]], [#block(breakable: false)[Systèmes \/ Organisation]], [#block(breakable: false)[68]], [#block(breakable: false)[3]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Capacité d'accueil]], [#block(breakable: false)[Équipement \/ Infrastructure]], [#block(breakable: false)[8]], [#block(breakable: false)[34]], [#block(breakable: false)[21]],
    [#block(breakable: false)[Ressources humaines]], [#block(breakable: false)[Ressources humaines]], [#block(breakable: false)[57]], [#block(breakable: false)[14]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[Produit]], [#block(breakable: false)[47]], [#block(breakable: false)[15]], [#block(breakable: false)[3]],
    [#block(breakable: false)[Équipements]], [#block(breakable: false)[Équipement \/ Infrastructure]], [#block(breakable: false)[56]], [#block(breakable: false)[15]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Eau, hygiène et assainissement]], [#block(breakable: false)[Équipement \/ Infrastructure]], [#block(breakable: false)[0]], [#block(breakable: false)[54]], [#block(breakable: false)[9]],
    [#block(breakable: false)[Électricité]], [#block(breakable: false)[Équipement \/ Infrastructure]], [#block(breakable: false)[8]], [#block(breakable: false)[40]], [#block(breakable: false)[23]],
    [#block(breakable: false)[Communication]], [#block(breakable: false)[Systèmes \/ Référence]], [#block(breakable: false)[18]], [#block(breakable: false)[7]], [#block(breakable: false)[46]],
    [#block(breakable: false)[Référence]], [#block(breakable: false)[Systèmes \/ Référence]], [#block(breakable: false)[20]], [#block(breakable: false)[33]], [#block(breakable: false)[13]],
    [#block(breakable: false)[Données sanitaires]], [#block(breakable: false)[Systèmes \/ Organisation]], [#block(breakable: false)[3]], [#block(breakable: false)[16]], [#block(breakable: false)[52]],
    [#block(breakable: false)[Surveillance épidémiologique]], [#block(breakable: false)[Systèmes \/ Organisation]], [#block(breakable: false)[5]], [#block(breakable: false)[5]], [#block(breakable: false)[61]],
    [#block(breakable: false)[Intégration des services]], [#block(breakable: false)[Systèmes \/ Organisation]], [#block(breakable: false)[5]], [#block(breakable: false)[18]], [#block(breakable: false)[46]],
)
#v(4pt)

#para[L’organisation du service est la dimension la plus fréquemment bloquante (68 spécifications sur 71), suivie des ressources humaines (57) et des équipements (56). À l’inverse, l’électricité (8) et la capacité d’accueil (8) sont rarement bloquantes, mais agissent souvent comme facteurs restrictifs, plafonnant la fonction au Jaune dans respectivement 40 et 34 spécifications. L’eau, l’hygiène et l’assainissement ne sont bloquants pour aucune spécification : restrictifs dans 54 d’entre elles, ils empêchent une fonction d’être verte sans la rendre rouge. La surveillance épidémiologique (61), les données sanitaires (52) et l’intégration des services (46) ont principalement un rôle contextuel : elles éclairent l’interprétation des résultats mais influencent peu directement la classification. Ces rôles étant définis a priori dans l’algorithme, ils déterminent en partie la contribution relative de chaque dimension à la proportion de fonctions classées Rouge. Les totaux par ligne sont inférieurs à 71 lorsque la dimension est sans objet pour certaines spécifications.]

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 9.6pt, weight: "bold", fill: rgb("#131d44"))[Tableau 6 : Modalités d’application des règles de classification]]
#set par(justify: false, leading: 0.62em)
#set text(size: 9.0pt)
#table(
  columns: (0.2198fr, 0.7802fr),
  inset: (x: 4.4pt, y: 3.2pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Règle]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Mise en œuvre]]]),
    [#block(breakable: false)[Aucun cas]], [#block(breakable: false)[Une fonction sans cas dans les trois mois est évaluée sur les conditions actuelles (personnel, intrants, équipements), jamais mise au rouge pour absence de cas.]],
    [#block(breakable: false)[Stabilité des produits]], [#block(breakable: false)[Intrant critique disponible le jour de la visite et rupture cumulée ≤ 2 jours sur trois mois : vert ; 3 à 7 jours : jaune ; \> 7 jours ou indisponible : rouge. Un groupe de substitution est satisfait par un membre vert ; un élément de soutien plafonne au jaune sans bloquer.]],
    [#block(breakable: false)[Contournement]], [#block(breakable: false)[Un contournement documenté (référence, communication) est pris en compte par la dimension concernée ; il rend une fonction jaune, pas verte, et n'efface pas un blocage d'intrant ou d'équipement.]],
    [#block(breakable: false)[Contrainte bloquante]], [#block(breakable: false)[Rôles fixés par le référentiel pour chaque fonction et chaque niveau (voir le tableau des fonctions traceuses).]],
    [#block(breakable: false)[Disponibilité du renvoi]], [#block(breakable: false)[Destination identifiée, contact préalable habituel, transport disponible et fonctionnel ; bloquante pour les urgences obstétricales, la malnutrition compliquée, le paludisme grave, les MAPI et la référence urgente.]],
    [#block(breakable: false)[Durées]], [#block(breakable: false)[Présence et jours de service valides de 0 à 92 jours ; 90 jours et plus valent couverture complète. Absence de toute source d'électricité ou de tout dispositif de lavage des mains : composante classée rouge par construction, l’eau, l’hygiène et l’assainissement restant restrictifs pour la fonction.]],
)
#v(4pt)

#para[Ces règles sont appliquées sans marge d’appréciation. Deux influencent particulièrement l’interprétation des résultats : le recours à un contournement plafonne la fonction au Jaune, sans toutefois neutraliser une défaillance bloquante d’intrant ou d’équipement ; et la défaillance du circuit de référence est bloquante pour toute fonction à enjeu vital immédiat, ce qui explique son poids important dans la classification finale.]

#heading(level: 2)[2.7. Analyse qualitative]

#para[Les entretiens font l’objet d’une analyse thématique structurée, fondée sur un cadre de codage initial dérivé de la taxonomie des goulots d’étranglement identifiés par l’analyse quantitative, puis enrichi par les thèmes émergents des données qualitatives.]

#para[L’analyse suit un processus explicite de triangulation : les constats objectivés dans les établissements sont d’abord regroupés en tendances ; les entretiens avec les ECZ et les cadres des DPS permettent ensuite d’en préciser les causes, les déterminants systémiques et les niveaux de responsabilité ; les contraintes sont enfin hiérarchisées selon leur caractère bloquant et reliées à des recommandations opérationnelles et actionnables.]

#para[Cette approche assure la traçabilité des recommandations, chacune étant fondée sur un constat quantitatif objectivé, éclairé par son explication qualitative, plutôt que formulée a priori.]

#heading(level: 2)[2.8. Chaîne de traitement des données et reproductibilité]

#para[Le traitement suit six étapes scriptées (import, nettoyage, empilement des trois bases, dérivation des variables, classification, tabulation), chacune produisant un fichier daté et un journal d'exécution, sans intervention manuelle. Les scripts sont versionnés et paramétrés par un fichier de configuration unique, ce qui permet de reproduire chaque tableau à l'identique.]

#heading(level: 2)[2.9. Considérations éthiques]

#para[L’évaluation n’a recueilli aucune donnée individuelle sur les patients. Les registres ont été consultés uniquement pour vérifier l’existence et la continuité des activités, sans extraction d’informations nominatives. Un consentement éclairé a été systématiquement obtenu avant chaque entretien, oralement ou électroniquement selon le volet, avec rappel du droit de refuser de participer ou de se retirer à tout moment.]

#para[Les noms et coordonnées des répondants sont exclus de la base analytique et conservés séparément sous accès restreint. Les établissements sont identifiés par des codes anonymisés dans l’ensemble des analyses et produits diffusés. Les résultats sont exclusivement destinés à l’amélioration des services et ne peuvent être utilisés pour évaluer ou sanctionner individuellement les agents, ni pour établir un classement des établissements ou du personnel.]

#heading(level: 2)[2.10. Limites méthodologiques]

#para[Trois limites principales ont guidé l’interprétation des résultats. Premièrement, l’échantillonnage raisonné ne permet aucune extrapolation statistique au-delà des 160 établissements évalués : les résultats décrivent l’échantillon étudié et ne sont représentatifs ni de l’ensemble des établissements des huit provinces ni de la RDC.]

#para[Deuxièmement, l’évaluation mesure la préparation opérationnelle, et non la qualité clinique des soins ou l’utilisation effective des services. Ces dimensions ont été délibérément exclues afin de maintenir un diagnostic ciblé, réalisable dans un délai court et directement orienté vers l’identification des contraintes opérationnelles.]

#para[Troisièmement, la classification tricolore, bien que fondée sur un algorithme déterministe, standardisé et documenté, dépend de la qualité et de la rigueur des vérifications effectuées sur le terrain. Ce risque est atténué par les contrôles intégrés aux outils, la supervision quotidienne, les contre-visites (back-checks) et la mesure de la concordance inter-évaluateurs, qui constituent des composantes centrales du dispositif d’assurance qualité.]


#pagebreak()
#set page(fill: rgb("#131d44"), header: none, footer: none)
#block(width: 100%, height: 100%)[
  #align(center + horizon)[
    #block(above: 0pt, below: 8pt)[#text(size: 8.2pt, tracking: 4pt, fill: rgb("#ced6f8"))[#upper[PARTIE III]]]
    #context part-size.update(34pt)
    #heading(level: 1)[RÉSULTATS]
    #v(9pt)
    #text(font: script, size: 22pt, fill: rgb("#ced6f8"))[Constats du diagnostic]
  ]
]
#context head-state.update("RÉSULTATS")
#pagebreak()
#set page(fill: rgb("#c2cfea"), header: hdr(), footer: ftr())

#para[Cette section présente les résultats du diagnostic rapide opérationnel organisés selon les objectifs spécifiques de l’étude. Pour en faciliter la lecture, ils sont organisés selon les thèmes suivants : description de l’échantillon, niveau de préparation fonctionnelle des établissements, intégration opérationnelle des services, utilisation des données de routine, facteurs associés aux contraintes observées et priorités d’investissement. Les recommandations font l’objet d’une section distincte à la fin du rapport.]

#heading(level: 2)[3.1. Description de l’échantillon et couverture]

#para[L’étude a porté sur 160 établissements répartis dans 40 zones de santé et huit provinces : 101 centres de santé, 22 centres de santé de référence et 37 hôpitaux généraux de référence. Le Haut-Katanga regroupe le plus grand nombre d’établissements (52), soit près d’un tiers de l’échantillon. Viennent ensuite le Kasaï-Central et le Lualaba, avec 24 établissements chacun, puis la Lomami et le Sankuru, avec 16 chacun. Le Haut-Lomami en compte 12, tandis que le Kasaï-Oriental et le Tanganyika en comptent chacun huit. Les centres de santé constituent la catégorie la plus représentée dans toutes les provinces. L’échantillon ayant été constitué de manière raisonnée, les proportions présentées décrivent les établissements visités et ne constituent pas des taux provinciaux. La convergence des constats avec les enquêtes nationales suggère toutefois que les goulots identifiés dépassent largement l’échantillon.]


#block(width: 100%, above: 11pt, below: 3pt, breakable: false,
  block(width: 100%, fill: rgb("#fffbf7"), radius: 12pt, stroke: 1.1pt + rgb("#0f1015"), inset: 7pt,
    align(center, image("/home/user/Rp/assets/img/image4.png", width: 15.9cm))))
#fig-cap[Figure 1 : Établissements évalués par province et par niveau de soins]

#fig-note[HK : Haut-Katanga ; HL : Haut-Lomami ; KC : Kasaï-Central ; KO : Kasaï-Oriental ; LL : Lualaba ; LM : Lomami ; SK : Sankuru ; TG : Tanganyika. Ces abréviations sont utilisées dans les figures provinciales du rapport.]

#heading(level: 2)[3.2. Niveau de préparation fonctionnelle des établissements]


#block(width: 100%, above: 11pt, below: 9pt, breakable: false,
  block(width: 100%, fill: rgb("#fffbf7"), radius: 12pt, stroke: 1.4pt + black, inset: (x: 13pt, y: 11pt))[
    #text(font: "DejaVu Sans", size: 14pt, fill: rgb("#131d44"))[★]
    #v(-4pt)
    #text(size: 7.2pt, tracking: 2.4pt, fill: rgb("#5166b7"))[#upper[À retenir]]
    #v(1pt)
    #block(above: 3pt, below: 9pt)[#text(size: 11.2pt, weight: "bold", fill: rgb("#131d44"))[La préparation opérationnelle reste très insuffisante : 68,4 % des évaluations sont classées rouges, 30,2 % jaunes et 1,4 % vertes. Parmi les fonctions vitales, 13 sur 15 dépassent 70 % de rouge.]]
    #text(size: 9.2pt, fill: rgb("#0f1015"))[Les écarts entre niveaux de soins restent insuffisants : parmi les 17 fonctions communes, la part moyenne de rouge est d’environ 70 % au CS, 55 % au CSR et 50 % à l’HGR. Même à l’hôpital, l’accouchement normal reste rouge dans 92 % des cas. La nutrition est particulièrement touchée, quel que soit le niveau : la malnutrition aiguë compliquée est classée rouge dans 84 à 93 % des cas. La déclaration d’un service ne garantit pas qu’il puisse être assuré : parmi les 98 CS qui déclarent offrir la réanimation néonatale, 97 ne disposent pas des conditions nécessaires. Des goulots d’étranglement multiples et interdépendants : les intrants et les équipements bloquent chacun plus de la moitié des fonctions rouges, suivis de la référence et de l’organisation des services ; les ressources humaines et l’eau, l’hygiène et l’assainissement fragilisent surtout les fonctions jaunes. Près de deux fonctions rouges sur trois cumulent au moins deux contraintes, ce qui appelle des interventions intégrées.]
  ])


#block(width: 100%, above: 9pt, below: 9pt, breakable: false,
  block(width: 100%, fill: rgb("#fffbf7"), radius: 12pt, stroke: 1.1pt + black, inset: (x: 12pt, y: 10pt))[
    #grid(columns: (1fr, 1fr, 1fr, 1fr, 1fr), column-gutter: 9pt,
    [#text(font: display, size: 19pt, fill: rgb("#131d44"))[160]\
     #text(size: 7.3pt, fill: rgb("#5166b7"))[Établissements · 40 zones · 8 provinces]],
    [#text(font: display, size: 19pt, fill: rgb("#131d44"))[3 773]\
     #text(size: 7.3pt, fill: rgb("#5166b7"))[Évaluations fonction × établissement]],
    [#text(font: display, size: 19pt, fill: rgb("#131d44"))[68,4 %]\
     #text(size: 7.3pt, fill: rgb("#5166b7"))[Fonctions rouges]],
    [#text(font: display, size: 19pt, fill: rgb("#131d44"))[30,2 %]\
     #text(size: 7.3pt, fill: rgb("#5166b7"))[Fonctions jaunes]],
    [#text(font: display, size: 19pt, fill: rgb("#131d44"))[1,4 %]\
     #text(size: 7.3pt, fill: rgb("#5166b7"))[Fonctions vertes]],
    )])

#para[Le diagnostic rapide opérationnel a donné lieu à 3 773 évaluations fonction-établissement. Celles-ci révèlent une préparation opérationnelle globalement insuffisante : 68,4 % des fonctions sont classées rouges, indiquant qu’elles ne peuvent être assurées dans des conditions adéquates, tandis que 30,2 % sont jaunes, donc assurées de manière fragile. Seules 1,4 % sont vertes, témoignant d’une capacité pleinement opérationnelle. Ainsi, moins de deux fonctions évaluées sur cent répondent pleinement aux exigences de préparation.]

#heading(level: 3)[3.2.1. Vue d'ensemble des 28 fonctions]

#para[Parmi les évaluations calculables, les fonctions traceuses présentent des niveaux de préparation très contrastés, avec une prédominance des classifications rouges pour la plupart des prestations. Les insuffisances sont particulièrement marquées pour la nutrition et les soins maternels et néonatals : 98 % des évaluations de la prise en charge de la malnutrition aiguë non compliquée et 92 % de celles de l’accouchement normal sont classées rouges. Les grossesses à risque (92 %), la malnutrition aiguë compliquée (91 %), les MAPI (90 %) et la réanimation néonatale (88 %) affichent également des niveaux élevés de non-préparation, et la pré-éclampsie comme le paludisme grave dépassent 80 % d’évaluations rouges. Les urgences obstétricales restent très exposées : 76 % pour la césarienne d’urgence, 71 % pour l’hémorragie du post-partum et 69 % pour le sepsis obstétrical. À l’inverse, les proportions rouges sont plus faibles pour le diagnostic du paludisme (12 %), la surveillance épidémiologique (27 %), l’intégration des services (28 %), le paludisme simple et la gestion des données sanitaires (33 % chacun). Toutefois, ces fonctions sont principalement classées jaunes, ce qui traduit une capacité jugée réalisable mais encore instable ; les évaluations vertes restent peu fréquentes dans l’ensemble. Le nombre d’évaluations calculables variant selon la fonction, les résultats doivent être interprétés en tenant compte des effectifs indiqués dans le graphique.]


#block(width: 100%, above: 11pt, below: 3pt, breakable: false,
  block(width: 100%, fill: rgb("#fffbf7"), radius: 12pt, stroke: 1.1pt + rgb("#0f1015"), inset: 7pt,
    align(center, image("/home/user/Rp/assets/img/image5.png", width: 12.8cm))))
#fig-cap[Figure 2 : Classification des 28 fonctions traceuses, ensemble des établissements]

#heading(level: 3)[3.2.2. Résultats selon le niveau de criticité]

#para[Parmi les fonctions essentielles, les proportions rouges s’étendent de 12,5 % pour le diagnostic du paludisme à 98,0 % pour la prise en charge de la malnutrition aiguë non compliquée. Les classements rouges sont également très fréquents pour l’accouchement normal (92,5 %), les soins postnatals à la mère (83,1 %), les consultations prénatales de routine (82,9 %), la vaccination de routine (81,3 %) et les soins du nouveau-né (76,9 %). À l’inverse, les classements jaunes prédominent pour le diagnostic du paludisme (83,8 %) et le paludisme simple (63,8 %). Les fonctions systémiques présentent elles aussi une majorité de classements jaunes : 59,4 % pour les données sanitaires et 68,8 % pour l’intégration des services, contre respectivement 33,1 % et 28,1 % de classements rouges.]

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 7.199999999999999pt, weight: "bold", fill: rgb("#131d44"))[Tableau 7 : Classification des 28 fonctions traceuses, par ordre de criticité]]
#set par(justify: false, leading: 0.62em)
#set text(size: 6.6pt)
#table(
  columns: (0.0472fr, 0.2017fr, 0.1216fr, 0.0575fr, 0.0655fr, 0.0680fr, 0.0688fr, 0.2035fr, 0.0773fr, 0.0890fr),
  inset: (x: 4.4pt, y: 2.3pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[N°]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Fonction]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Criticité]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[K]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[% Vert]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[% Jaune]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[% Rouge]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Premier blocage dominant]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Part des rouges]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Provinces où rouge]]]),
    [#block(breakable: false)[1]], [#block(breakable: false)[Grossesse à risque]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[123]], [#block(breakable: false)[0,0]], [#block(breakable: false)[8,1]], [#block(breakable: false)[91,9]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[88,5]], [#block(breakable: false)[8]],
    [#block(breakable: false)[2]], [#block(breakable: false)[MA compliquée]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[160]], [#block(breakable: false)[0,6]], [#block(breakable: false)[8,8]], [#block(breakable: false)[90,6]], [#block(breakable: false)[Ressources humaines]], [#block(breakable: false)[53,1]], [#block(breakable: false)[8]],
    [#block(breakable: false)[3]], [#block(breakable: false)[MAPI]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[123]], [#block(breakable: false)[0,0]], [#block(breakable: false)[9,8]], [#block(breakable: false)[90,2]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[89,2]], [#block(breakable: false)[8]],
    [#block(breakable: false)[4]], [#block(breakable: false)[Réanimation néonat.]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[160]], [#block(breakable: false)[0,6]], [#block(breakable: false)[11,9]], [#block(breakable: false)[87,5]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[95,7]], [#block(breakable: false)[8]],
    [#block(breakable: false)[5]], [#block(breakable: false)[Pré-éclampsie]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[160]], [#block(breakable: false)[0,6]], [#block(breakable: false)[16,9]], [#block(breakable: false)[82,5]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[83,3]], [#block(breakable: false)[8]],
    [#block(breakable: false)[6]], [#block(breakable: false)[Paludisme grave]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[160]], [#block(breakable: false)[0,0]], [#block(breakable: false)[18,1]], [#block(breakable: false)[81,9]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[68,7]], [#block(breakable: false)[8]],
    [#block(breakable: false)[7]], [#block(breakable: false)[Chaîne du froid]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[123]], [#block(breakable: false)[0,0]], [#block(breakable: false)[22,0]], [#block(breakable: false)[78,0]], [#block(breakable: false)[Électricité]], [#block(breakable: false)[77,1]], [#block(breakable: false)[8]],
    [#block(breakable: false)[8]], [#block(breakable: false)[Césarienne d'urgence]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[59]], [#block(breakable: false)[0,0]], [#block(breakable: false)[23,7]], [#block(breakable: false)[76,3]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[71,1]], [#block(breakable: false)[7]],
    [#block(breakable: false)[9]], [#block(breakable: false)[Transfusion]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[59]], [#block(breakable: false)[3,4]], [#block(breakable: false)[20,3]], [#block(breakable: false)[76,3]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[80,0]], [#block(breakable: false)[8]],
    [#block(breakable: false)[10]], [#block(breakable: false)[Référence urgente]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[160]], [#block(breakable: false)[0,0]], [#block(breakable: false)[25,0]], [#block(breakable: false)[75,0]], [#block(breakable: false)[Organisation du service]], [#block(breakable: false)[94,2]], [#block(breakable: false)[8]],
    [#block(breakable: false)[11]], [#block(breakable: false)[Réception urgences]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[37]], [#block(breakable: false)[0,0]], [#block(breakable: false)[27,0]], [#block(breakable: false)[73,0]], [#block(breakable: false)[Organisation du service]], [#block(breakable: false)[88,9]], [#block(breakable: false)[8]],
    [#block(breakable: false)[12]], [#block(breakable: false)[Accouchement assisté]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[59]], [#block(breakable: false)[0,0]], [#block(breakable: false)[27,1]], [#block(breakable: false)[72,9]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[95,3]], [#block(breakable: false)[7]],
    [#block(breakable: false)[13]], [#block(breakable: false)[Hémorragie post-partum]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[160]], [#block(breakable: false)[0,0]], [#block(breakable: false)[29,4]], [#block(breakable: false)[70,6]], [#block(breakable: false)[Référence]], [#block(breakable: false)[67,3]], [#block(breakable: false)[8]],
    [#block(breakable: false)[14]], [#block(breakable: false)[Sepsis obstétrical]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[160]], [#block(breakable: false)[1,9]], [#block(breakable: false)[28,8]], [#block(breakable: false)[69,4]], [#block(breakable: false)[Référence]], [#block(breakable: false)[68,5]], [#block(breakable: false)[8]],
    [#block(breakable: false)[15]], [#block(breakable: false)[Surveillance épidémio]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[160]], [#block(breakable: false)[5,0]], [#block(breakable: false)[68,1]], [#block(breakable: false)[26,9]], [#block(breakable: false)[Communication]], [#block(breakable: false)[67,4]], [#block(breakable: false)[7]],
    [#block(breakable: false)[16]], [#block(breakable: false)[MA non compliquée]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[101]], [#block(breakable: false)[0,0]], [#block(breakable: false)[2,0]], [#block(breakable: false)[98,0]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[90,9]], [#block(breakable: false)[8]],
    [#block(breakable: false)[17]], [#block(breakable: false)[Accouchement normal]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[160]], [#block(breakable: false)[0,6]], [#block(breakable: false)[6,9]], [#block(breakable: false)[92,5]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[93,2]], [#block(breakable: false)[8]],
    [#block(breakable: false)[18]], [#block(breakable: false)[CPoN mère]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[160]], [#block(breakable: false)[0,0]], [#block(breakable: false)[16,9]], [#block(breakable: false)[83,1]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[78,9]], [#block(breakable: false)[8]],
    [#block(breakable: false)[19]], [#block(breakable: false)[CPN de routine]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[123]], [#block(breakable: false)[0,8]], [#block(breakable: false)[16,3]], [#block(breakable: false)[82,9]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[91,2]], [#block(breakable: false)[8]],
    [#block(breakable: false)[20]], [#block(breakable: false)[Vaccination de routine]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[123]], [#block(breakable: false)[0,0]], [#block(breakable: false)[18,7]], [#block(breakable: false)[81,3]], [#block(breakable: false)[Électricité]], [#block(breakable: false)[74,0]], [#block(breakable: false)[8]],
    [#block(breakable: false)[21]], [#block(breakable: false)[Soins du nouveau-né]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[160]], [#block(breakable: false)[0,6]], [#block(breakable: false)[22,5]], [#block(breakable: false)[76,9]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[92,7]], [#block(breakable: false)[8]],
    [#block(breakable: false)[22]], [#block(breakable: false)[CPN \+ PTME]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[123]], [#block(breakable: false)[0,8]], [#block(breakable: false)[30,1]], [#block(breakable: false)[69,1]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[97,6]], [#block(breakable: false)[8]],
    [#block(breakable: false)[23]], [#block(breakable: false)[CPoN nouveau-né]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[160]], [#block(breakable: false)[0,0]], [#block(breakable: false)[31,2]], [#block(breakable: false)[68,8]], [#block(breakable: false)[Référence]], [#block(breakable: false)[80,9]], [#block(breakable: false)[8]],
    [#block(breakable: false)[24]], [#block(breakable: false)[Dépistage nutrition]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[160]], [#block(breakable: false)[3,8]], [#block(breakable: false)[38,1]], [#block(breakable: false)[58,1]], [#block(breakable: false)[Ressources humaines]], [#block(breakable: false)[82,8]], [#block(breakable: false)[8]],
    [#block(breakable: false)[25]], [#block(breakable: false)[Paludisme simple]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[160]], [#block(breakable: false)[3,1]], [#block(breakable: false)[63,8]], [#block(breakable: false)[33,1]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[94,3]], [#block(breakable: false)[7]],
    [#block(breakable: false)[26]], [#block(breakable: false)[Diagnostic paludisme]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[160]], [#block(breakable: false)[3,8]], [#block(breakable: false)[83,8]], [#block(breakable: false)[12,5]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[90,0]], [#block(breakable: false)[6]],
    [#block(breakable: false)[27]], [#block(breakable: false)[Données sanitaires]], [#block(breakable: false)[Systémique]], [#block(breakable: false)[160]], [#block(breakable: false)[7,5]], [#block(breakable: false)[59,4]], [#block(breakable: false)[33,1]], [#block(breakable: false)[Organisation du service]], [#block(breakable: false)[100,0]], [#block(breakable: false)[6]],
    [#block(breakable: false)[28]], [#block(breakable: false)[Intégration services]], [#block(breakable: false)[Systémique]], [#block(breakable: false)[160]], [#block(breakable: false)[3,1]], [#block(breakable: false)[68,8]], [#block(breakable: false)[28,1]], [#block(breakable: false)[Intégration des services]], [#block(breakable: false)[100,0]], [#block(breakable: false)[5]],
)
#v(4pt)

#note-block[*Lecture du tableau. *La colonne « % Rouge » donne la part des évaluations de la fonction classées rouges. La colonne « Part des rouges » se lit uniquement parmi ces évaluations rouges : elle indique la proportion de celles qui sont concernées par le premier blocage dominant indiqué.]

#para[Les blocages dominants diffèrent selon les fonctions. Le manque d’intrants et de produits ressort notamment pour la prise en charge des grossesses à risque, des MAPI et de la pré-éclampsie, la césarienne d’urgence, les consultations prénatales, l’accouchement normal et le paludisme simple. Les équipements constituent le principal obstacle à la réanimation néonatale, à la prise en charge du paludisme grave, à l’accouchement assisté et à la transfusion ; la référence domine pour l’hémorragie du post-partum, le sepsis obstétrical et les soins postnatals du nouveau-né. L’organisation du service est le blocage dominant pour la référence urgente et la réception des urgences, représentant respectivement 94,2 % et 88,9 % des classements rouges correspondants ; dans les deux cas, c’est l’absence d’un moyen de transport fonctionnel qui est en cause. Enfin, les classements rouges sont observés dans les huit provinces pour la plupart des fonctions. Ils sont présents dans sept provinces pour la surveillance épidémiologique, le paludisme simple, la césarienne d’urgence et l’accouchement assisté, six pour le diagnostic du paludisme et les données sanitaires, et cinq pour l’intégration des services. Les effectifs évalués variant selon la fonction, les résultats doivent être interprétés en tenant compte des dénominateurs indiqués dans le tableau.]

#para[Pour rendre ces blocages directement actionnables, le tableau suivant précise, pour chaque fonction, l’élément le plus souvent en déficit à l’intérieur du premier blocage dominant, parmi les fonctions rouges. Quelques éléments expliquent à eux seuls une grande part des classements rouges : le moyen de transport pour la référence urgente (105 des 120 fonctions rouges), l’hémorragie du post-partum (71 sur 113) et le sepsis obstétrical (71 sur 111) ; le kit anti-choc pour les MAPI (99 sur 111) ; le kit d’accouchement pour l’accouchement normal (127 sur 148) ; la source de chaleur pour la réanimation néonatale (110 sur 140) ; le sulfate de magnésium pour la pré-éclampsie (98 sur 132) et les bandelettes urinaires pour la grossesse à risque (89 sur 113).]

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 8.0pt, weight: "bold", fill: rgb("#131d44"))[Tableau 8 : Élément critique le plus souvent en déficit, par fonction]]
#set par(justify: false, leading: 0.62em)
#set text(size: 7.4pt)
#table(
  columns: (0.0466fr, 0.1919fr, 0.0934fr, 0.1714fr, 0.1505fr, 0.2323fr, 0.1139fr),
  inset: (x: 4.4pt, y: 2.3pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[N°]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Fonction]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Fonctions rouges]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Premier blocage dominant]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Rouges bloquées par cette dimension : n (%)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Élément le plus souvent en déficit]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Fonctions rouges où l’élément est en déficit : n (%)]]]),
    [#block(breakable: false)[1]], [#block(breakable: false)[Grossesse à risque]], [#block(breakable: false)[113]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[100 (88,5 %)]], [#block(breakable: false)[Bandelettes urinaires (protéinurie)]], [#block(breakable: false)[89 (78,8 %)]],
    [#block(breakable: false)[2]], [#block(breakable: false)[MA compliquée]], [#block(breakable: false)[145]], [#block(breakable: false)[Ressources humaines]], [#block(breakable: false)[77 (53,1 %)]], [#block(breakable: false)[Prestataire formé présent pour la fonction]], [#block(breakable: false)[77 (53,1 %)]],
    [#block(breakable: false)[3]], [#block(breakable: false)[MAPI]], [#block(breakable: false)[111]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[99 (89,2 %)]], [#block(breakable: false)[Kit anti-choc ou chariot d’urgence (adrénaline)]], [#block(breakable: false)[99 (89,2 %)]],
    [#block(breakable: false)[4]], [#block(breakable: false)[Réanimation néonat.]], [#block(breakable: false)[140]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[134 (95,7 %)]], [#block(breakable: false)[Source de chaleur (salle et nouveau-né)]], [#block(breakable: false)[110 (78,6 %)]],
    [#block(breakable: false)[5]], [#block(breakable: false)[Pré-éclampsie]], [#block(breakable: false)[132]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[110 (83,3 %)]], [#block(breakable: false)[Sulfate de magnésium]], [#block(breakable: false)[98 (74,2 %)]],
    [#block(breakable: false)[6]], [#block(breakable: false)[Paludisme grave]], [#block(breakable: false)[131]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[90 (68,7 %)]], [#block(breakable: false)[Glucomètre \+ bandelettes]], [#block(breakable: false)[63 (48,1 %)]],
    [#block(breakable: false)[7]], [#block(breakable: false)[Chaîne du froid]], [#block(breakable: false)[96]], [#block(breakable: false)[Électricité]], [#block(breakable: false)[74 (77,1 %)]], [#block(breakable: false)[Source de secours fonctionnelle]], [#block(breakable: false)[68 (70,8 %)]],
    [#block(breakable: false)[8]], [#block(breakable: false)[Césarienne d'urgence]], [#block(breakable: false)[45]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[32 (71,1 %)]], [#block(breakable: false)[Antiseptique (iodophore ou chlorhexidine)]], [#block(breakable: false)[22 (48,9 %)]],
    [#block(breakable: false)[9]], [#block(breakable: false)[Transfusion]], [#block(breakable: false)[45]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[36 (80,0 %)]], [#block(breakable: false)[Réfrigérateur à sang ou banque de sang]], [#block(breakable: false)[36 (80,0 %)]],
    [#block(breakable: false)[10]], [#block(breakable: false)[Référence urgente]], [#block(breakable: false)[120]], [#block(breakable: false)[Organisation du service]], [#block(breakable: false)[113 (94,2 %)]], [#block(breakable: false)[Moyen de transport disponible et fonctionnel]], [#block(breakable: false)[105 (87,5 %)]],
    [#block(breakable: false)[11]], [#block(breakable: false)[Réception urgences]], [#block(breakable: false)[27]], [#block(breakable: false)[Organisation du service]], [#block(breakable: false)[24 (88,9 %)]], [#block(breakable: false)[Moyen de transport disponible et fonctionnel]], [#block(breakable: false)[21 (77,8 %)]],
    [#block(breakable: false)[12]], [#block(breakable: false)[Accouchement assisté]], [#block(breakable: false)[43]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[41 (95,3 %)]], [#block(breakable: false)[Ventouse ou forceps obstétricaux (aucun des deux fonctionnel)]], [#block(breakable: false)[30 (69,8 %)]],
    [#block(breakable: false)[13]], [#block(breakable: false)[Hémorragie post-partum]], [#block(breakable: false)[113]], [#block(breakable: false)[Référence]], [#block(breakable: false)[76 (67,3 %)]], [#block(breakable: false)[Moyen de transport disponible et fonctionnel]], [#block(breakable: false)[71 (62,8 %)]],
    [#block(breakable: false)[14]], [#block(breakable: false)[Sepsis obstétrical]], [#block(breakable: false)[111]], [#block(breakable: false)[Référence]], [#block(breakable: false)[76 (68,5 %)]], [#block(breakable: false)[Moyen de transport disponible et fonctionnel]], [#block(breakable: false)[71 (64,0 %)]],
    [#block(breakable: false)[15]], [#block(breakable: false)[Surveillance épidémiologique]], [#block(breakable: false)[43]], [#block(breakable: false)[Communication]], [#block(breakable: false)[29 (67,4 %)]], [#block(breakable: false)[Continuité de la communication sur trois mois]], [#block(breakable: false)[23 (53,5 %)]],
    [#block(breakable: false)[16]], [#block(breakable: false)[MA non compliquée]], [#block(breakable: false)[99]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[90 (90,9 %)]], [#block(breakable: false)[ATPE]], [#block(breakable: false)[87 (87,9 %)]],
    [#block(breakable: false)[17]], [#block(breakable: false)[Accouchement normal]], [#block(breakable: false)[148]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[138 (93,2 %)]], [#block(breakable: false)[Kit d’accouchement à usage unique]], [#block(breakable: false)[127 (85,8 %)]],
    [#block(breakable: false)[18]], [#block(breakable: false)[CPoN mère]], [#block(breakable: false)[133]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[105 (78,9 %)]], [#block(breakable: false)[Bandelettes urinaires (protéinurie/glycosurie)]], [#block(breakable: false)[75 (56,4 %)]],
    [#block(breakable: false)[19]], [#block(breakable: false)[CPN de routine]], [#block(breakable: false)[102]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[93 (91,2 %)]], [#block(breakable: false)[Bandelettes urinaires (protéinurie)]], [#block(breakable: false)[89 (87,3 %)]],
    [#block(breakable: false)[20]], [#block(breakable: false)[Vaccination de routine]], [#block(breakable: false)[100]], [#block(breakable: false)[Électricité]], [#block(breakable: false)[74 (74,0 %)]], [#block(breakable: false)[Source de secours fonctionnelle]], [#block(breakable: false)[68 (68,0 %)]],
    [#block(breakable: false)[21]], [#block(breakable: false)[Soins du nouveau-né]], [#block(breakable: false)[123]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[114 (92,7 %)]], [#block(breakable: false)[Source de chaleur (salle et nouveau-né)]], [#block(breakable: false)[110 (89,4 %)]],
    [#block(breakable: false)[22]], [#block(breakable: false)[CPN \+ PTME]], [#block(breakable: false)[85]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[83 (97,6 %)]], [#block(breakable: false)[Tests rapides VIH]], [#block(breakable: false)[62 (72,9 %)]],
    [#block(breakable: false)[23]], [#block(breakable: false)[CPoN nouveau-né]], [#block(breakable: false)[110]], [#block(breakable: false)[Référence]], [#block(breakable: false)[89 (80,9 %)]], [#block(breakable: false)[Moyen de transport disponible et fonctionnel]], [#block(breakable: false)[84 (76,4 %)]],
    [#block(breakable: false)[24]], [#block(breakable: false)[Dépistage nutrition]], [#block(breakable: false)[93]], [#block(breakable: false)[Ressources humaines]], [#block(breakable: false)[77 (82,8 %)]], [#block(breakable: false)[Prestataire formé présent pour la fonction]], [#block(breakable: false)[77 (82,8 %)]],
    [#block(breakable: false)[25]], [#block(breakable: false)[Paludisme simple]], [#block(breakable: false)[53]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[50 (94,3 %)]], [#block(breakable: false)[CTA (AS-AQ ou AL)]], [#block(breakable: false)[50 (94,3 %)]],
    [#block(breakable: false)[26]], [#block(breakable: false)[Diagnostic paludisme]], [#block(breakable: false)[20]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[18 (90,0 %)]], [#block(breakable: false)[Test de diagnostic rapide (TDR) du paludisme]], [#block(breakable: false)[13 (65,0 %)]],
    [#block(breakable: false)[27]], [#block(breakable: false)[Données sanitaires]], [#block(breakable: false)[53]], [#block(breakable: false)[Organisation du service]], [#block(breakable: false)[53 (100,0 %)]], [#block(breakable: false)[Accès fonctionnel au SNIS (DHIS2)]], [#block(breakable: false)[37 (69,8 %)]],
    [#block(breakable: false)[28]], [#block(breakable: false)[Intégration services]], [#block(breakable: false)[45]], [#block(breakable: false)[Intégration des services]], [#block(breakable: false)[45 (100,0 %)]], [#block(breakable: false)[Services intégrés offerts actuellement]], [#block(breakable: false)[45 (100,0 %)]],
)
#v(4pt)

#para[_Base : fonctions rouges de chaque fonction, tous niveaux où elle est attendue. L’élément est recherché parmi les fonctions rouges bloquées par le premier blocage dominant ; pour les dimensions sans élément matériel (référence, communication, électricité, organisation du service, ressources humaines), la composante la plus souvent défaillante est indiquée. Un groupe d’éléments substituables compte pour un seul élément, en déficit lorsque tous ses membres manquent._]

#heading(level: 3)[3.2.3. Préparation opérationnelle par niveau]

#para[L’analyse des 17 fonctions évaluées aux trois niveaux de soins montre une diminution progressive de la proportion moyenne de classements rouges : environ 70 % au niveau 1, 55 % au niveau 1+ et 50 % au niveau 2. Ce gradient reste toutefois insuffisant : à l’HGR, une fonction sur deux demeure classée rouge. Il n’est pas non plus uniforme d’une fonction à l’autre. Le niveau 1+ et le niveau 2 présentent chacun la proportion rouge la plus faible pour huit des dix-sept fonctions ; seul le diagnostic du paludisme est moins souvent rouge au niveau 1.]


#block(width: 100%, above: 11pt, below: 3pt, breakable: false,
  block(width: 100%, fill: rgb("#fffbf7"), radius: 12pt, stroke: 1.1pt + rgb("#0f1015"), inset: 7pt,
    align(center, image("/home/user/Rp/assets/img/image6.png", width: 15.9cm))))
#fig-cap[Figure 3 : Préparation opérationnelle des 17 fonctions communes aux trois niveaux de soins]

#para[Certaines fonctions suivent la progression attendue avec l’élévation du niveau de soins. C’est notamment le cas des soins postnatals du nouveau-né, dont la proportion de classements rouges passe de 82 % au niveau 1 à 35 % au niveau 2, et de la prise en charge du paludisme grave, qui passe de 95 % à 46 %. À l’inverse, l’accouchement normal reste classé rouge dans 93 % des évaluations au niveau 1 et 92 % au niveau 2, contre 91 % au niveau 1+.]

#para[La prise en charge de la malnutrition aiguë compliquée reste élevée à tous les niveaux (de 84 % à 93 % de classements rouges). Les fonctions propres aux niveaux supérieurs présentent également des difficultés : la césarienne d’urgence est classée rouge dans 81 % des cas à l’HGR, tandis que la transfusion semble davantage contrainte au niveau 1+ qu’au niveau 2 (86 % contre 70 % de classements rouges).]

#para[Pour les fonctions les moins contraintes, telles que le diagnostic du paludisme, la surveillance épidémiologique, l’intégration des services et les données sanitaires, les classements jaunes prédominent aux trois niveaux. La situation traduit donc surtout des capacités jugées réalisables, mais encore instables, et souligne la nécessité de renforcer leur fonctionnement à l’ensemble des niveaux de soins.]

#heading(level: 3)[3.2.4. Préparation opérationnelle par province]

#para[La lecture par province met en évidence des contraintes largement répandues, sans pour autant permettre d’établir un classement entre les provinces, dont les effectifs enquêtés varient. Au Sankuru et au Haut-Lomami, les proportions de fonctions cliniques classées rouges sont très élevées dans la plupart des domaines ; certaines fonctions systémiques sont également fortement touchées, notamment la réception des urgences au Sankuru. Le Kasaï-Oriental et le Tanganyika affichent souvent des proportions plus faibles, mais leurs résultats doivent être interprétés avec prudence, car huit établissements seulement ont été enquêtés dans chacune de ces provinces. La lecture par fonction souligne l’ampleur de certaines difficultés dans l’ensemble des provinces. Pour l’accouchement normal, la proportion de classements rouges atteint 100 % dans trois provinces (le Haut-Katanga, le Haut-Lomami et le Sankuru) et au moins 75 % dans les autres, à l’exception du Tanganyika (50 %). Pour la prise en charge de la malnutrition aiguë non compliquée, elle atteint 100 % dans cinq provinces disposant de données suffisantes ; la valeur indiquée entre parenthèses au Kasaï-Oriental est également de 100 %, mais repose sur moins de cinq établissements. Elle s’élève à 92 % au Lualaba et à 80 % au Tanganyika. Ces résultats témoignent de contraintes étendues pour ces deux fonctions.]

#para[À l’inverse, les proportions rouges sont généralement plus faibles pour le diagnostic du paludisme, la surveillance épidémiologique et l’intégration des services, le plus souvent inférieures à 40 %. Les données sanitaires présentent également des niveaux rouges relativement bas dans plusieurs provinces, bien que des valeurs plus élevées soient observées au Haut-Lomami et dans la Lomami. Enfin, les valeurs entre parenthèses, fondées sur moins de cinq établissements, doivent être interprétées avec une prudence particulière.]


#block(width: 100%, above: 11pt, below: 3pt, breakable: false,
  block(width: 100%, fill: rgb("#fffbf7"), radius: 12pt, stroke: 1.1pt + rgb("#0f1015"), inset: 7pt,
    align(center, image("/home/user/Rp/assets/img/image7.png", width: 11.9cm))))
#fig-cap[Figure 4 : Part de fonctions rouges par fonction et par province]

#heading(level: 3)[3.2.5. Préparation opérationnelle par domaine et niveau de soins]

#para[À l’échelle de l’ensemble des établissements, les classements rouges prédominent en vaccination (83 %), en nutrition (80 %) et en SMNEA (79 %). Le profil est différent pour le paludisme et le domaine transversal : les classements jaunes y sont majoritaires (55 % chacun), tandis que les classements rouges concernent 42 % des évaluations en paludisme et 41 % dans le domaine transversal. Ces résultats suggèrent que, dans ces deux domaines, les fonctions sont plus souvent réalisables, mais restent instables.]

#para[Les tendances varient également selon le niveau de soins. La proportion de classements rouges diminue en nutrition, passant de 86 % au niveau 1 à 75 % au niveau 1+ puis à 59 % au niveau 2. Elle baisse aussi en vaccination, de 87 % au niveau 1 à 65 % au niveau 1+ ; le graphique ne présente pas de valeur pour ce domaine au niveau 2. Dans le domaine transversal, les classements rouges passent de 44 % au niveau 1 à 30 % au niveau 1+, avant de remonter à 38 % au niveau 2. En SMNEA, ils diminuent de 88 % au niveau 1 à 67 % au niveau 1+ et 64 % au niveau 2. Le paludisme reste majoritairement jaune aux trois niveaux, avec des proportions rouges de 46 %, 44 % et 33 %, respectivement.]


#block(width: 100%, above: 11pt, below: 3pt, breakable: false,
  block(width: 100%, fill: rgb("#fffbf7"), radius: 12pt, stroke: 1.1pt + rgb("#0f1015"), inset: 7pt,
    align(center, image("/home/user/Rp/assets/img/image8.png", width: 15.9cm))))
#fig-cap[Figure 5 : Préparation opérationnelle par domaine technique et par niveau de soins]

#para[La part de fonctions rouges par établissement se concentre dans le haut de l'échelle : la médiane se situe à 75,0 % (79,2 % au CS, 67,3 % au CSR et 57,1 % à l’HGR) et 56 établissements sur 160 (35,0 %) atteignent 80 % ou plus.]

#heading(level: 3)[3.2.6. Service déclaré et capacité opérationnelle observée pendant la visite]

#para[Parmi les établissements déclarant offrir les services évalués, les constats effectués lors de la visite révèlent une forte proportion de fonctions classées rouges. La réanimation néonatale immédiate au niveau 1 en est un exemple marquant : 97 des 98 centres de santé ayant déclaré offrir ce service sont classés rouges (99 %). À ce niveau, les principaux blocages de cette fonction concernent les équipements (94 des 99 fonctions rouges), surtout la source de chaleur et l’appareil d’aspiration, ainsi que la référence (76).]

#para[Pour plusieurs fonctions, les résultats sont moins défavorables aux niveaux 1+ et 2, mais les classements rouges restent importants et les classements verts demeurent peu fréquents. La déclaration de l’offre indique que le service est proposé, sans garantir que les conditions nécessaires à sa réalisation soient réunies. Cet écart ne traduit pas nécessairement une déclaration inexacte : il souligne la différence entre l’offre déclarée et la capacité opérationnelle constatée.]

#para[La prise en charge de la malnutrition aiguë constitue un cas distinct. Parmi les 99 centres de santé concernés, 55 déclarent ne pas offrir ce service ; ils sont classés rouges en raison de son absence, et non de l’insuffisance des conditions de prise en charge. Cette distinction souligne l’importance de vérifier sur place à la fois l’existence du service et les moyens permettant de l’assurer.]


#block(width: 100%, above: 11pt, below: 3pt, breakable: false,
  block(width: 100%, fill: rgb("#fffbf7"), radius: 12pt, stroke: 1.1pt + rgb("#0f1015"), inset: 7pt,
    align(center, image("/home/user/Rp/assets/img/image9.png", width: 15.3cm))))
#fig-cap[Figure 6 : État opérationnel des fonctions vitales dont le service est déclaré offert, par niveau de soins]

#heading(level: 2)[3.3. Préparation aux urgences]


#block(width: 100%, above: 11pt, below: 9pt, breakable: false,
  block(width: 100%, fill: rgb("#fffbf7"), radius: 12pt, stroke: 1.4pt + black, inset: (x: 13pt, y: 11pt))[
    #text(font: "DejaVu Sans", size: 14pt, fill: rgb("#131d44"))[★]
    #v(-4pt)
    #text(size: 7.2pt, tracking: 2.4pt, fill: rgb("#5166b7"))[#upper[À retenir]]
    #v(1pt)
    #block(above: 3pt, below: 9pt)[#text(size: 11.2pt, weight: "bold", fill: rgb("#131d44"))[Les fonctions d’urgence sont très largement classées rouges : 81 % dans l’ensemble, avec des proportions de 90 % au CS, 72 % au CSR et 65 % à l’HGR.]]
    #text(size: 9.2pt, fill: rgb("#0f1015"))[Dans 115 établissements, l’absence d’au moins un élément critique compromet la prise en charge d’une urgence vitale : sulfate de magnésium (98 établissements), ballon et masque néonatals (56), ocytocine (23) ou artésunate injectable (14). La référence ne suffit souvent pas à compenser ces défaillances : parmi les 159 établissements exposés à au moins une menace immédiate, 112 présentent aussi une condition de référence classée rouge. L’exposition est généralisée au Sankuru (16 établissements sur 16) et presque aussi élevée dans la Lomami (15 sur 16).]
  ])

#heading(level: 3)[3.3.1. Préparation aux urgences par niveau et par province]

#para[Les fonctions d’urgence sont plus souvent classées rouges que l’ensemble des fonctions traceuses : 81 % contre 68 %. De plus, 115 établissements sur 160 (72 %) présentent au moins une fonction d’urgence classée rouge en raison de l’absence d’un élément critique, notamment le sulfate de magnésium, un utérotonique, l’artésunate injectable ou le matériel de ventilation néonatale (ballon et masque).]

#para[La préparation reste particulièrement faible au niveau 1, où 90 % des fonctions d’urgence sont rouges et 84 des 101 centres de santé (83 %) comptent au moins une fonction rouge liée à l’absence d’un élément critique. Les proportions sont également préoccupantes au niveau 1+ : 72 % de fonctions rouges et 13 établissements sur 22 (59 %) exposés. Au niveau 2, malgré des proportions plus faibles, 65 % des fonctions demeurent rouges et 18 hôpitaux sur 37 (49 %) présentent au moins une fonction d’urgence rouge pour cette raison. Les HGR restent donc eux aussi confrontés à des lacunes importantes dans la préparation aux urgences vitales.]

#para[Les résultats varient également selon la province. La proportion de fonctions d’urgence classées rouges va de 58 % au Kasaï-Oriental à 99 % au Sankuru. Dans cette dernière province, les 16 établissements évalués sont tous concernés par au moins une fonction rouge liée à l’absence d’un élément critique ; au Lomami, 15 établissements sur 16 (94 %) le sont également. Au Kasaï-Oriental, 5 établissements sur 8 (62 %) sont concernés, contre 4 sur 8 (50 %) au Tanganyika. Ces résultats provinciaux décrivent les établissements évalués et doivent être interprétés avec prudence, en particulier pour les provinces où l’effectif est limité.]


#block(width: 100%, above: 11pt, below: 3pt, breakable: false,
  block(width: 100%, fill: rgb("#fffbf7"), radius: 12pt, stroke: 1.1pt + rgb("#0f1015"), inset: 7pt,
    align(center, image("/home/user/Rp/assets/img/image10.png", width: 15.9cm))))
#fig-cap[Figure 7 : Préparation aux urgences : ensemble, par niveau de soins et par province]

#heading(level: 3)[3.3.2. Blocages des fonctions d’urgence par niveau]

#para[Les résultats montrent que la nature du blocage dominant varie selon la fonction et le niveau de soins, sans que cette variation entraîne nécessairement une baisse importante des classements rouges. Certains obstacles persistent à plusieurs niveaux : les équipements dominent pour la réanimation néonatale (98,0 % de rouge au niveau 1, 77,3 % au niveau 1+ et 64,9 % au niveau 2), en premier lieu la source de chaleur, tandis que les intrants, d’abord le sulfate de magnésium, restent le principal blocage pour la pré-éclampsie (93,1 %, 68,2 % et 62,2 %). Pour la référence urgente, le blocage dominant est l’organisation du service aux trois niveaux, et il tient presque toujours à l’absence d’un moyen de transport fonctionnel. La part de rouge est de 79,2 % au niveau 1, 63,6 % au niveau 1+ et 70,3 % au niveau 2, ce qui souligne le caractère transversal de cette contrainte.]

#para[Pour d’autres fonctions, le blocage dominant change avec le niveau de soins. Pour l’hémorragie du post-partum et le sepsis obstétrical, il s’agit de la référence au niveau 1, le transport faisant défaut dans la plupart des cas, puis des intrants aux niveaux 1+ et 2, notamment les seringues et aiguilles pour l’hémorragie et l’ampicilline pour le sepsis ; la part de rouge y est nettement plus faible qu’au centre de santé (de 41 % à 46 %, contre 84 % à 85 %). La prise en charge de la malnutrition aiguë compliquée passe également d’un blocage lié à la référence au niveau 1 à un blocage lié aux intrants (F100 et F75) aux niveaux supérieurs, alors que la proportion de rouge demeure élevée à tous les niveaux (83,8 % à 93,1 %). Pour le paludisme grave, la référence domine aux niveaux 1 et 1+, puis les équipements à l’HGR, où la part de rouge tombe à 45,9 %. Enfin, pour la césarienne d’urgence, le blocage passe des équipements au niveau 1+ aux intrants au niveau 2, tandis que la proportion de rouge augmente de 68,2 % à 81,1 %.]

#para[Ces profils indiquent que les contraintes opérationnelles ne sont ni identiques ni uniformément réparties entre les niveaux de soins. La persistance de blocages liés aux équipements ou à l’organisation, ainsi que les changements observés pour la référence et les intrants, appellent des réponses adaptées à chaque fonction et à chaque niveau. La dernière colonne du tableau indique, pour chaque ligne, l’élément le plus souvent en cause ; le détail des éléments par fonction et par niveau figure en annexe.]

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 8.0pt, weight: "bold", fill: rgb("#131d44"))[Tableau 9 : Blocages dominants des fonctions d’urgence, par niveau de soins]]
#set par(justify: false, leading: 0.62em)
#set text(size: 7.4pt)
#table(
  columns: (0.1970fr, 0.1298fr, 0.0581fr, 0.0665fr, 0.0663fr, 0.0663fr, 0.1826fr, 0.2335fr),
  inset: (x: 4.4pt, y: 2.3pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Fonction d'urgence]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Niveau]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[K]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[% Vert]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[% Jaune]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[% Rouge]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Premier blocage dominant]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Élément le plus souvent en cause (fonctions rouges concernées)]]]),
    [#block(breakable: false)[Grossesse à risque]], [#block(breakable: false)[Niveau 1 (CS)]], [#block(breakable: false)[101]], [#block(breakable: false)[0,0]], [#block(breakable: false)[5,0]], [#block(breakable: false)[95,0]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[Bandelettes urinaires (77/96)]],
    [#block(breakable: false)[Grossesse à risque]], [#block(breakable: false)[Niveau 1+ (CSR)]], [#block(breakable: false)[22]], [#block(breakable: false)[0,0]], [#block(breakable: false)[22,7]], [#block(breakable: false)[77,3]], [#block(breakable: false)[Référence]], [#block(breakable: false)[Moyen de transport (13/17)]],
    [#block(breakable: false)[Hémorragie post-partum]], [#block(breakable: false)[Niveau 1 (CS)]], [#block(breakable: false)[101]], [#block(breakable: false)[0,0]], [#block(breakable: false)[14,9]], [#block(breakable: false)[85,1]], [#block(breakable: false)[Référence]], [#block(breakable: false)[Moyen de transport (71/86)]],
    [#block(breakable: false)[Hémorragie post-partum]], [#block(breakable: false)[Niveau 1+ (CSR)]], [#block(breakable: false)[22]], [#block(breakable: false)[0,0]], [#block(breakable: false)[54,5]], [#block(breakable: false)[45,5]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[Seringues et aiguilles (4/10)]],
    [#block(breakable: false)[Hémorragie post-partum]], [#block(breakable: false)[Niveau 2 (HGR)]], [#block(breakable: false)[37]], [#block(breakable: false)[0,0]], [#block(breakable: false)[54,1]], [#block(breakable: false)[45,9]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[Seringues et aiguilles (11/17)]],
    [#block(breakable: false)[Pré-éclampsie]], [#block(breakable: false)[Niveau 1 (CS)]], [#block(breakable: false)[101]], [#block(breakable: false)[1,0]], [#block(breakable: false)[5,9]], [#block(breakable: false)[93,1]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[Sulfate de magnésium (77/94)]],
    [#block(breakable: false)[Pré-éclampsie]], [#block(breakable: false)[Niveau 1+ (CSR)]], [#block(breakable: false)[22]], [#block(breakable: false)[0,0]], [#block(breakable: false)[31,8]], [#block(breakable: false)[68,2]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[Sulfate de magnésium (11/15)]],
    [#block(breakable: false)[Pré-éclampsie]], [#block(breakable: false)[Niveau 2 (HGR)]], [#block(breakable: false)[37]], [#block(breakable: false)[0,0]], [#block(breakable: false)[37,8]], [#block(breakable: false)[62,2]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[Seringues et aiguilles (11/23)]],
    [#block(breakable: false)[Sepsis obstétrical]], [#block(breakable: false)[Niveau 1 (CS)]], [#block(breakable: false)[101]], [#block(breakable: false)[2,0]], [#block(breakable: false)[13,9]], [#block(breakable: false)[84,2]], [#block(breakable: false)[Référence]], [#block(breakable: false)[Moyen de transport (71/85)]],
    [#block(breakable: false)[Sepsis obstétrical]], [#block(breakable: false)[Niveau 1+ (CSR)]], [#block(breakable: false)[22]], [#block(breakable: false)[0,0]], [#block(breakable: false)[59,1]], [#block(breakable: false)[40,9]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[Ampicilline (5/9)]],
    [#block(breakable: false)[Sepsis obstétrical]], [#block(breakable: false)[Niveau 2 (HGR)]], [#block(breakable: false)[37]], [#block(breakable: false)[2,7]], [#block(breakable: false)[51,4]], [#block(breakable: false)[45,9]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[Ampicilline (11/17)]],
    [#block(breakable: false)[Accouchement assisté]], [#block(breakable: false)[Niveau 1+ (CSR)]], [#block(breakable: false)[22]], [#block(breakable: false)[0,0]], [#block(breakable: false)[18,2]], [#block(breakable: false)[81,8]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[Ventouse ou forceps (13/18)]],
    [#block(breakable: false)[Accouchement assisté]], [#block(breakable: false)[Niveau 2 (HGR)]], [#block(breakable: false)[37]], [#block(breakable: false)[0,0]], [#block(breakable: false)[32,4]], [#block(breakable: false)[67,6]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[Ventouse ou forceps (17/25)]],
    [#block(breakable: false)[Césarienne d'urgence]], [#block(breakable: false)[Niveau 1+ (CSR)]], [#block(breakable: false)[22]], [#block(breakable: false)[0,0]], [#block(breakable: false)[31,8]], [#block(breakable: false)[68,2]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[Matériel d'anesthésie (8/15)]],
    [#block(breakable: false)[Césarienne d'urgence]], [#block(breakable: false)[Niveau 2 (HGR)]], [#block(breakable: false)[37]], [#block(breakable: false)[0,0]], [#block(breakable: false)[18,9]], [#block(breakable: false)[81,1]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[Antiseptique (17/30)]],
    [#block(breakable: false)[Transfusion]], [#block(breakable: false)[Niveau 1+ (CSR)]], [#block(breakable: false)[22]], [#block(breakable: false)[0,0]], [#block(breakable: false)[13,6]], [#block(breakable: false)[86,4]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[Réfrigérateur à sang (17/19)]],
    [#block(breakable: false)[Transfusion]], [#block(breakable: false)[Niveau 2 (HGR)]], [#block(breakable: false)[37]], [#block(breakable: false)[5,4]], [#block(breakable: false)[24,3]], [#block(breakable: false)[70,3]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[Réfrigérateur à sang (19/26)]],
    [#block(breakable: false)[Réanimation néonat.]], [#block(breakable: false)[Niveau 1 (CS)]], [#block(breakable: false)[101]], [#block(breakable: false)[0,0]], [#block(breakable: false)[2,0]], [#block(breakable: false)[98,0]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[Source de chaleur (77/99)]],
    [#block(breakable: false)[Réanimation néonat.]], [#block(breakable: false)[Niveau 1+ (CSR)]], [#block(breakable: false)[22]], [#block(breakable: false)[0,0]], [#block(breakable: false)[22,7]], [#block(breakable: false)[77,3]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[Source de chaleur (14/17)]],
    [#block(breakable: false)[Réanimation néonat.]], [#block(breakable: false)[Niveau 2 (HGR)]], [#block(breakable: false)[37]], [#block(breakable: false)[2,7]], [#block(breakable: false)[32,4]], [#block(breakable: false)[64,9]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[Source de chaleur (19/24)]],
    [#block(breakable: false)[Réception urgences]], [#block(breakable: false)[Niveau 2 (HGR)]], [#block(breakable: false)[37]], [#block(breakable: false)[0,0]], [#block(breakable: false)[27,0]], [#block(breakable: false)[73,0]], [#block(breakable: false)[Organisation du service]], [#block(breakable: false)[Moyen de transport (21/27)]],
    [#block(breakable: false)[Paludisme grave]], [#block(breakable: false)[Niveau 1 (CS)]], [#block(breakable: false)[101]], [#block(breakable: false)[0,0]], [#block(breakable: false)[5,0]], [#block(breakable: false)[95,0]], [#block(breakable: false)[Référence]], [#block(breakable: false)[Moyen de transport (71/96)]],
    [#block(breakable: false)[Paludisme grave]], [#block(breakable: false)[Niveau 1+ (CSR)]], [#block(breakable: false)[22]], [#block(breakable: false)[0,0]], [#block(breakable: false)[18,2]], [#block(breakable: false)[81,8]], [#block(breakable: false)[Référence]], [#block(breakable: false)[Moyen de transport (13/18)]],
    [#block(breakable: false)[Paludisme grave]], [#block(breakable: false)[Niveau 2 (HGR)]], [#block(breakable: false)[37]], [#block(breakable: false)[0,0]], [#block(breakable: false)[54,1]], [#block(breakable: false)[45,9]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[Échelle de coma (10/17)]],
    [#block(breakable: false)[MA compliquée]], [#block(breakable: false)[Niveau 1 (CS)]], [#block(breakable: false)[101]], [#block(breakable: false)[0,0]], [#block(breakable: false)[6,9]], [#block(breakable: false)[93,1]], [#block(breakable: false)[Référence]], [#block(breakable: false)[Moyen de transport (71/94)]],
    [#block(breakable: false)[MA compliquée]], [#block(breakable: false)[Niveau 1+ (CSR)]], [#block(breakable: false)[22]], [#block(breakable: false)[0,0]], [#block(breakable: false)[9,1]], [#block(breakable: false)[90,9]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[F100 (20/20)]],
    [#block(breakable: false)[MA compliquée]], [#block(breakable: false)[Niveau 2 (HGR)]], [#block(breakable: false)[37]], [#block(breakable: false)[2,7]], [#block(breakable: false)[13,5]], [#block(breakable: false)[83,8]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[F75 (29/31)]],
    [#block(breakable: false)[MAPI]], [#block(breakable: false)[Niveau 1 (CS)]], [#block(breakable: false)[101]], [#block(breakable: false)[0,0]], [#block(breakable: false)[7,9]], [#block(breakable: false)[92,1]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[Kit anti-choc (adrénaline) (85/93)]],
    [#block(breakable: false)[MAPI]], [#block(breakable: false)[Niveau 1+ (CSR)]], [#block(breakable: false)[22]], [#block(breakable: false)[0,0]], [#block(breakable: false)[18,2]], [#block(breakable: false)[81,8]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[Kit anti-choc (adrénaline) (14/18)]],
    [#block(breakable: false)[Référence urgente]], [#block(breakable: false)[Niveau 1 (CS)]], [#block(breakable: false)[101]], [#block(breakable: false)[0,0]], [#block(breakable: false)[20,8]], [#block(breakable: false)[79,2]], [#block(breakable: false)[Organisation du service]], [#block(breakable: false)[Moyen de transport (71/80)]],
    [#block(breakable: false)[Référence urgente]], [#block(breakable: false)[Niveau 1+ (CSR)]], [#block(breakable: false)[22]], [#block(breakable: false)[0,0]], [#block(breakable: false)[36,4]], [#block(breakable: false)[63,6]], [#block(breakable: false)[Organisation du service]], [#block(breakable: false)[Moyen de transport (13/14)]],
    [#block(breakable: false)[Référence urgente]], [#block(breakable: false)[Niveau 2 (HGR)]], [#block(breakable: false)[37]], [#block(breakable: false)[0,0]], [#block(breakable: false)[29,7]], [#block(breakable: false)[70,3]], [#block(breakable: false)[Organisation du service]], [#block(breakable: false)[Moyen de transport (21/26)]],
)
#v(4pt)

#para[_Élément le plus souvent en cause : élément ou composante le plus souvent défaillant parmi les fonctions rouges bloquées par le premier blocage dominant ; entre parenthèses, nombre de fonctions rouges concernées sur le total des fonctions rouges de la ligne._]

#heading(level: 3)[3.3.3. Absence d’éléments critiques et préparation aux urgences]

#para[Dans le paquet d’urgence, 80,8 % des évaluations de fonctions sont classées rouges. Par ailleurs, 115 établissements sur 160 (71,9 %) présentent au moins une fonction d’urgence classée rouge en raison de l’absence ou de la rupture d’un élément critique.]

#para[Le sulfate de magnésium est l’élément le plus fréquemment manquant : son absence est relevée dans 98 établissements répartis dans les huit provinces. Viennent ensuite le ballon auto-gonflable avec masque néonatal, absent dans 56 établissements des huit provinces, l’ocytocine, dans 23 établissements de cinq provinces, et l’artésunate injectable, dans 14 établissements de sept provinces. Ces manques compromettent respectivement la prise en charge de la pré-éclampsie, la réanimation néonatale, la prévention ou le traitement de l’hémorragie du post-partum et la prise en charge du paludisme grave.]

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 8.799999999999999pt, weight: "bold", fill: rgb("#131d44"))[Tableau 10 : Principaux éléments critiques d’urgence manquants ou en rupture]]
#set par(justify: false, leading: 0.62em)
#set text(size: 8.2pt)
#table(
  columns: (0.3356fr, 0.1307fr, 0.1494fr, 0.1028fr, 0.2813fr),
  inset: (x: 4.4pt, y: 3.2pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Élément critique d'urgence absent ou en rupture]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Occurrences]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Établissements]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Provinces]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Fonctions vitales concernées]]]),
    [#block(breakable: false)[Sulfate de magnésium]], [#block(breakable: false)[98]], [#block(breakable: false)[98]], [#block(breakable: false)[8]], [#block(breakable: false)[Pré-éclampsie]],
    [#block(breakable: false)[Ballon auto-gonflable \+ masque taille néonatale (Ambu)]], [#block(breakable: false)[56]], [#block(breakable: false)[56]], [#block(breakable: false)[8]], [#block(breakable: false)[Réanimation néonat.]],
    [#block(breakable: false)[Ocytocine]], [#block(breakable: false)[23]], [#block(breakable: false)[23]], [#block(breakable: false)[5]], [#block(breakable: false)[Hémorragie post-partum]],
    [#block(breakable: false)[Artésunate, injectable]], [#block(breakable: false)[14]], [#block(breakable: false)[14]], [#block(breakable: false)[7]], [#block(breakable: false)[Paludisme grave]],
)
#v(4pt)

#para[Les données désignent ainsi deux types de besoins : la disponibilité continue de médicaments essentiels et l’accès au matériel de réanimation néonatale. Les nombres d’établissements associés à chaque élément ne doivent pas être additionnés, car un même établissement peut être concerné par plusieurs ruptures. Ces résultats plaident pour des dotations ciblées selon les besoins provinciaux et un suivi régulier des stocks et des équipements.]

#heading(level: 3)[3.3.4. Menace vitale et limites du système de référence]

#para[En considérant toute fonction vitale classée rouge comme une menace immédiate, 159 des 160 établissements évalués (99,4 %) sont concernés. Cette situation touche les 101 centres de santé et les 22 centres de santé de référence ; elle concerne également 36 des 37 hôpitaux généraux de référence (97,3 %). La menace est souvent associée à une référence défaillante : parmi les établissements concernés, 112 (70,4 %) ont aussi un circuit de référence classé rouge, et la fonction « référence urgente » est elle-même rouge dans 119 d’entre eux. Cette double contrainte est observée à chaque niveau : le circuit de référence est rouge dans 76 CS, 13 CSR et 23 HGR exposés.]

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 8.0pt, weight: "bold", fill: rgb("#131d44"))[Tableau 11 : Menaces immédiates et contraintes déclarées d'accès à la référence]]
#set par(justify: false, leading: 0.62em)
#set text(size: 7.4pt)
#table(
  columns: (0.1542fr, 0.1291fr, 0.1754fr, 0.1293fr, 0.1293fr, 0.1418fr, 0.1411fr),
  inset: (x: 4.4pt, y: 3.2pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Niveau]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Établissements]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Avec au moins une menace immédiate : n (%)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Destination à plus de 30 km]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Délai décision– départ \> 1 h]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Circuit de référence rouge (condition transversale)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Fonction « référence urgente » rouge]]]),
    [#block(breakable: false)[Niveau 1 (CS)]], [#block(breakable: false)[101]], [#block(breakable: false)[101 (100,0 %)]], [#block(breakable: false)[29]], [#block(breakable: false)[18]], [#block(breakable: false)[76]], [#block(breakable: false)[80]],
    [#block(breakable: false)[Niveau 1+ (CSR)]], [#block(breakable: false)[22]], [#block(breakable: false)[22 (100,0 %)]], [#block(breakable: false)[8]], [#block(breakable: false)[6]], [#block(breakable: false)[13]], [#block(breakable: false)[14]],
    [#block(breakable: false)[Niveau 2 (HGR)]], [#block(breakable: false)[37]], [#block(breakable: false)[36 (97,3 %)]], [#block(breakable: false)[25]], [#block(breakable: false)[16]], [#block(breakable: false)[23]], [#block(breakable: false)[25]],
    [#block(breakable: false)[Ensemble]], [#block(breakable: false)[160]], [#block(breakable: false)[159 (99,4 %)]], [#block(breakable: false)[62]], [#block(breakable: false)[40]], [#block(breakable: false)[112]], [#block(breakable: false)[119]],
)
#v(4pt)

#para[_Menace immédiate : au moins une fonction vitale classée rouge. Le circuit de référence est une condition transversale évaluée au niveau de l’établissement ; la fonction « référence urgente » est une fonction traceuse évaluée selon ses propres conditions._]

#para[La référence risque en outre d’être retardée ou difficile à organiser : pour 62 établissements, la structure de destination se trouve à plus de 30 km ; dans 40 établissements, le délai entre la décision et le départ dépasse une heure. Ainsi, face à une menace vitale, la référence ne constitue pas toujours une solution rapidement mobilisable, en particulier lorsque la fonction de référence est elle-même classée rouge.]

#heading(level: 3)[3.3.5. Correspondance entre les fonctions traceuses et les fonctions signal SONU]

#para[Au regard du référentiel classique de l’OMS, qui compte sept fonctions signal pour les soins obstétricaux et néonatals d’urgence (SONU) de base et neuf pour les SONU complets, le diagnostic couvre directement cinq des sept fonctions signal de base : l’administration d’antibiotiques parentéraux, d’ocytociques et d’anticonvulsivants, la réanimation néonatale ainsi que l’accouchement vaginal assisté. Cette dernière fonction est évaluée aux niveaux 1+ et 2, mais n’est pas attendue au niveau 1. Pour ces fonctions, l’évaluation porte sur la disponibilité des intrants, des équipements et des autres conditions nécessaires à leur réalisation.]

#para[Ce référentiel est en cours de révision. Le processus Re-Visioning EmONC, coordonné par AMDD avec l’OMS, l’UNICEF, l’UNFPA et la LSHTM, propose désormais 25 fonctions signal (11 obstétricales, 13 néonatales et une fonction de référence), réparties en trois niveaux de soins : de base, complets et intensifs \[57\]. Le diagnostic ayant été conçu sur les neuf fonctions classiques, qui restent celles des enquêtes HHFA et EPSS et permettent la comparaison avec elles, la correspondance ci-dessous porte sur ce référentiel. Plusieurs fonctions du nouveau cadre sont néanmoins documentées, au moins en partie : médicaments de l’hémorragie du post-partum, antibiotiques parentéraux maternels, sulfate de magnésium, accouchement vaginal assisté, césarienne, transfusion, réanimation néonatale au ballon et au masque, apport de chaleur au nouveau-né et organisation de la référence. Les fonctions néonatales avancées et celles du niveau intensif, comme l’oxygénothérapie avec oxymétrie, la CPAP ou la photothérapie, n’ont pas été mesurées.]

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 8.799999999999999pt, weight: "bold", fill: rgb("#131d44"))[Tableau 12 : Correspondance documentaire avec les fonctions signal SONU (référentiel classique)]]
#set par(justify: false, leading: 0.62em)
#set text(size: 8.2pt)
#table(
  columns: (0.1798fr, 0.1101fr, 0.2200fr, 0.3703fr, 0.1198fr),
  inset: (x: 4.4pt, y: 3.2pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Fonction signal SONU]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Catégorie]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Fonction traceuse correspondante]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Couverture par le diagnostic]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Réserve]]]),
    [#block(breakable: false)[Antibiotiques parentéraux]], [#block(breakable: false)[SONU de base]], [#block(breakable: false)[Prise en charge du sepsis maternel ou puerpéral]], [#block(breakable: false)[Couverte : fonction traceuse dédiée (antibiotique injectable parmi les éléments critiques)]], [#block(breakable: false)[]],
    [#block(breakable: false)[Ocytociques parentéraux]], [#block(breakable: false)[SONU de base]], [#block(breakable: false)[Prévention et prise en charge de l'hémorragie du post-partum]], [#block(breakable: false)[Couverte : ocytocine \/ ergométrine parmi les éléments critiques de la fonction HPP]], [#block(breakable: false)[]],
    [#block(breakable: false)[Anticonvulsivants parentéraux]], [#block(breakable: false)[SONU de base]], [#block(breakable: false)[Prise en charge de la pré-éclampsie/éclampsie]], [#block(breakable: false)[Couverte : sulfate de magnésium parmi les éléments critiques]], [#block(breakable: false)[]],
    [#block(breakable: false)[Extraction manuelle du placenta]], [#block(breakable: false)[SONU de base]], [#block(breakable: false)[Prévention et prise en charge de l'hémorragie du post-partum]], [#block(breakable: false)[Partiellement couverte : geste non documenté individuellement ; conditions (gants longs, personnel) dans HPP]], [#block(breakable: false)[Acte réalisé non mesuré]],
    [#block(breakable: false)[Évacuation des produits de conception]], [#block(breakable: false)[SONU de base]], [#block(breakable: false)[\-]], [#block(breakable: false)[Non couverte : aucune fonction traceuse ni élément dédié (AMIU, misoprostol post-abortum)]], [#block(breakable: false)[Non mesuré]],
    [#block(breakable: false)[Accouchement vaginal assisté]], [#block(breakable: false)[SONU de base]], [#block(breakable: false)[Accouchement vaginal assisté]], [#block(breakable: false)[Couverte au niveau 1+ et 2 (ventouse \/ forceps parmi les éléments critiques) ; non attendue au CS]], [#block(breakable: false)[Niveau 1 non couvert]],
    [#block(breakable: false)[Réanimation néonatale]], [#block(breakable: false)[SONU de base]], [#block(breakable: false)[Réanimation néonatale immédiate]], [#block(breakable: false)[Couverte : fonction traceuse dédiée (ballon et masque, aspiration, source de chaleur)]], [#block(breakable: false)[]],
    [#block(breakable: false)[Césarienne]], [#block(breakable: false)[SONU complet]], [#block(breakable: false)[Césarienne d'urgence]], [#block(breakable: false)[Couverte aux niveaux 1+ et 2]], [#block(breakable: false)[]],
    [#block(breakable: false)[Transfusion sanguine]], [#block(breakable: false)[SONU complet]], [#block(breakable: false)[Transfusion sanguine d'urgence]], [#block(breakable: false)[Couverte aux niveaux 1+ et 2]], [#block(breakable: false)[]],
)
#v(4pt)

#para[L’extraction manuelle du placenta est partiellement couverte : le diagnostic documente certaines conditions matérielles et la disponibilité du personnel dans le cadre de la fonction relative à l’hémorragie du post-partum, mais ne mesure pas la réalisation de ce geste. L’évacuation des produits de conception n’est, quant à elle, couverte par aucune fonction traceuse ni par aucun élément dédié, tel que l’aspiration manuelle intra-utérine ou le misoprostol post-abortum ; le diagnostic ne permet donc pas d’en apprécier la préparation.]

#para[Les deux fonctions signal des SONU complets la césarienne et la transfusion sanguine sont couvertes aux niveaux 1+ et 2. Dans l’ensemble, cette correspondance permet d’évaluer la préparation opérationnelle de plusieurs fonctions SONU, mais ne renseigne pas directement sur la réalisation effective des actes ni sur leur qualité clinique.]

#heading(level: 2)[3.4. Intégration opérationnelle des services]


#block(width: 100%, above: 11pt, below: 9pt, breakable: false,
  block(width: 100%, fill: rgb("#fffbf7"), radius: 12pt, stroke: 1.4pt + black, inset: (x: 13pt, y: 11pt))[
    #text(font: "DejaVu Sans", size: 14pt, fill: rgb("#131d44"))[★]
    #v(-4pt)
    #text(size: 7.2pt, tracking: 2.4pt, fill: rgb("#5166b7"))[#upper[À retenir]]
    #v(1pt)
    #block(above: 3pt, below: 9pt)[#text(size: 11.2pt, weight: "bold", fill: rgb("#131d44"))[L’intégration des contacts maternels s’améliore avec le niveau de soins : ils sont pleinement documentés dans 46 % des centres de santé (CS), 73 % des centres de santé de référence (CSR) et 84 % des hôpitaux généraux de référence (HGR).]]
    #text(size: 9.2pt, fill: rgb("#0f1015"))[La continuité des services nutritionnels est particulièrement fragile : dans 56 % des CS, la présence continue d’un prestataire formé n’a pas été assurée au cours des trois mois précédant la visite. Les ruptures de référence tiennent surtout au transport et à l’absence de contact préalable, plutôt qu’à l’absence d’une structure de destination. Par ailleurs, 89,8 % des structures d’accueil déclarent recevoir des patients arrivés trop tard. La référence vers l’hôpital ne garantit pas une prise en charge adéquate : la disponibilité opérationnelle de la césarienne est classée rouge dans 81,7 % des hôpitaux appariés. Le dépistage nutritionnel est rarement suivi d’une prise en charge opérationnelle : les fonctions d’aval restent classées rouges dans 78 à 94 % des cas. L’évaluation porte sur les conditions d’application des protocoles, mais les actes de soins eux-mêmes n’ont pas été observés.]
  ])

#heading(level: 3)[3.4.1. Intégration des prestations au point de soins et entre niveaux]

#para[La documentation des contacts maternels s’améliore avec le niveau de soins : l’ensemble des couples de prestations est documenté dans 46 % des centres de santé (CS), 73 % des centres de santé de référence (CSR) et 84 % des hôpitaux généraux de référence (HGR). Cette progression est moins nette pour les consultations de l’enfant. Au niveau 1, 48 % des CS présentent une intégration partielle, correspondant à une occasion manquée, ou aucune intégration, contre 27 % des CSR et 30 % des HGR. L’absence totale d’intégration reste toutefois peu fréquente : elle concerne six établissements, soit 3,8 % de l’échantillon.]

#para[L’intégration de la référence, évaluée uniquement dans les CSR et les HGR, demeure limitée et ne s’améliore pas avec le niveau de soins. Tous les couples attendus sont documentés dans 59 % des CSR et 57 % des HGR ; l’intégration est partielle dans respectivement 23 % et 30 % des établissements, et absente dans 18 % et 14 %. Ces résultats suggèrent que la coordination entre structures constitue un enjeu distinct de la disponibilité du plateau technique.]

#para[Ces constats doivent être distingués des résultats portant sur la préparation opérationnelle des fonctions traceuses. La consultation prénatale intégrée à la prévention de la transmission mère-enfant (CPN-PTME) est classée rouge dans 69,7 % des évaluations, principalement en raison du manque d’intrants, qui concerne 97,6 % des classements rouges. Pour la fonction systémique d’intégration des services, les classements jaunes prédominent (68,8 %), contre 28,1 % de classements rouges. Enfin, la condition transversale associée à l’intégration est classée verte dans 71,2 % des établissements. Ces indicateurs mesurent des aspects complémentaires : la documentation des prestations combinées, la préparation d’une fonction traceuse et la présence de conditions systémiques favorables à l’intégration.]


#block(width: 100%, above: 11pt, below: 3pt, breakable: false,
  block(width: 100%, fill: rgb("#fffbf7"), radius: 12pt, stroke: 1.1pt + rgb("#0f1015"), inset: 7pt,
    align(center, image("/home/user/Rp/assets/img/image11.png", width: 15.9cm))))
#fig-cap[Figure 8 : Couples de prestations documentés, par niveau de soins]

#heading(level: 3)[3.4.2. Continuité des services et présence des prestataires]

#para[Mesurée sur les trois mois précédant l’enquête, la continuité de présence varie fortement selon le service et le niveau de soins. La proportion d’établissements déclarant une présence pendant presque toute la période (90 à 92 jours) s’étend de 18 % à 76 %. Le paludisme présente le profil le plus régulier : la médiane atteint 90 jours aux trois niveaux, et la présence pendant presque toute la période est déclarée par 64 % des CS, 55 % des CSR et 76 % des HGR.]

#para[La continuité est particulièrement fragile pour la nutrition dans les CS et les CSR : 56 % des CS et 55 % des CSR déclarent zéro jour de présence d’un prestataire formé, ce qui correspond à une médiane nulle. La situation est meilleure dans les HGR, où 57 % déclarent une présence pendant 90 à 92 jours, même si 27 % signalent toujours zéro jour. En maternité, la distribution au niveau 1 est contrastée : 49 % des CS déclarent seulement 1 à 7 jours de présence, tandis que 41 % déclarent une présence pendant presque toute la période. Les HGR présentent la continuité la plus élevée pour la maternité (68 %) et le paludisme (76 %).]

#para[Ces durées sont déclarées rétrospectivement par les établissements. Elles décrivent la présence rapportée des prestataires, mais ne constituent pas une mesure quotidienne vérifiée de la disponibilité effective des services ni de la qualité des soins.]


#block(width: 100%, above: 11pt, below: 3pt, breakable: false,
  block(width: 100%, fill: rgb("#fffbf7"), radius: 12pt, stroke: 1.1pt + rgb("#0f1015"), inset: 7pt,
    align(center, image("/home/user/Rp/assets/img/image12.png", width: 15.9cm))))
#fig-cap[Figure 9 : Jours de présence des prestataires déclarés sur trois mois, par service et par niveau]

#heading(level: 3)[3.4.3. Motifs et volumes des références déclarées]

#para[Sur les trois mois considérés, le paludisme grave représente le plus grand volume de références, avec 2 486 cas déclarés dans 85 établissements. Les urgences médicales de l’adulte sont toutefois le motif le plus largement rapporté : 102 établissements en ont déclaré, pour un total de 1 926 cas. Les urgences pédiatriques arrivent ensuite, avec 1 788 cas dans 73 établissements. Les urgences obstétricales et les cas chirurgicaux totalisent respectivement 781 et 774 références. Les volumes déclarés varient fortement d’un établissement à l’autre. Pour les urgences médicales de l’adulte, la médiane est de 3 références par établissement, alors que le maximum atteint 277 ;]

#para[pour le paludisme grave, la médiane est de 2, contre un maximum de 189. Ces écarts indiquent que les volumes totaux sont concentrés dans certains établissements.]

#para[À l’inverse, la médiane est nulle pour plusieurs motifs, notamment les urgences pédiatriques, les traumatismes et accidents, la malnutrition aiguë sévère compliquée, les complications néonatales et les suspicions de maladies à potentiel épidémique. Pourtant, entre 48 et 75 établissements ont déclaré au moins une référence pour chacun de ces motifs. Une médiane nulle signifie donc qu’au moins la moitié des établissements n’a déclaré aucune référence pour le motif concerné, même si un volume notable a été enregistré ailleurs.]

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 8.799999999999999pt, weight: "bold", fill: rgb("#131d44"))[Tableau 13 : Références au cours des trois derniers mois, par motif]]
#set par(justify: false, leading: 0.62em)
#set text(size: 8.2pt)
#table(
  columns: (0.3400fr, 0.2000fr, 0.1600fr, 0.1601fr, 0.1399fr),
  inset: (x: 4.4pt, y: 3.2pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Motif de référence]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Établissements avec au moins une référence (sur 160)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Total déclaré sur trois mois]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Médiane par établissement]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Maximum]]]),
    [#block(breakable: false)[Paludisme grave]], [#block(breakable: false)[85]], [#block(breakable: false)[2 486]], [#block(breakable: false)[2,0]], [#block(breakable: false)[189]],
    [#block(breakable: false)[Urgences médicales de l’adulte]], [#block(breakable: false)[102]], [#block(breakable: false)[1 926]], [#block(breakable: false)[3,0]], [#block(breakable: false)[277]],
    [#block(breakable: false)[Urgences pédiatriques]], [#block(breakable: false)[73]], [#block(breakable: false)[1 788]], [#block(breakable: false)[0,0]], [#block(breakable: false)[182]],
    [#block(breakable: false)[Urgences obstétricales]], [#block(breakable: false)[88]], [#block(breakable: false)[781]], [#block(breakable: false)[2,0]], [#block(breakable: false)[44]],
    [#block(breakable: false)[Cas chirurgicaux]], [#block(breakable: false)[88]], [#block(breakable: false)[774]], [#block(breakable: false)[1,0]], [#block(breakable: false)[95]],
    [#block(breakable: false)[Autres]], [#block(breakable: false)[56]], [#block(breakable: false)[530]], [#block(breakable: false)[0,0]], [#block(breakable: false)[125]],
    [#block(breakable: false)[Malnutrition aiguë sévère compliquée]], [#block(breakable: false)[57]], [#block(breakable: false)[520]], [#block(breakable: false)[0,0]], [#block(breakable: false)[71]],
    [#block(breakable: false)[Traumatismes et accidents]], [#block(breakable: false)[75]], [#block(breakable: false)[432]], [#block(breakable: false)[0,0]], [#block(breakable: false)[48]],
    [#block(breakable: false)[Suspicion de maladie à potentiel épidémique]], [#block(breakable: false)[48]], [#block(breakable: false)[284]], [#block(breakable: false)[0,0]], [#block(breakable: false)[35]],
    [#block(breakable: false)[Complications néonatales]], [#block(breakable: false)[52]], [#block(breakable: false)[240]], [#block(breakable: false)[0,0]], [#block(breakable: false)[54]],
)
#v(4pt)

#heading(level: 3)[3.4.4. Contraintes déclarées au départ des centres de santé]

#para[Parmi les 101 centres de santé interrogés, les contraintes les plus souvent rapportées lors de la référence concernent les ménages et le transport. Le manque de ressources financières du ménage arrive en tête (78 CS, soit 77,2 %), suivi de l’absence de moyen de transport (71 ; 70,3 %) et du refus du patient ou de sa famille (70 ; 69,3 %). Le coût du transport est également fréquemment cité (66 ; 65,3 %).]

#para[Les difficultés d’accès géographique et logistique sont elles aussi importantes : la distance jusqu’à la structure de référence est mentionnée par 50,5 % des CS, le mauvais état des routes par 44,6 %, les difficultés de communication par 32,7 % et les pannes de transport par 28,7 %. L’insécurité ou les contraintes géographiques sont rapportées par 19,8 % des centres. En revanche, le retard dans la prise de décision clinique (9,9 %) et la saturation de l’hôpital de référence (8,9 %) sont les contraintes les moins souvent citées.]

#para[Dans l’ensemble, les réponses mettent en évidence des obstacles financiers, sociaux et logistiques qui peuvent se cumuler au cours de la référence. Les pourcentages ne doivent donc pas être additionnés : un même centre pouvait signaler plusieurs contraintes.]

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 9.6pt, weight: "bold", fill: rgb("#131d44"))[Tableau 14 : Contraintes déclarées au départ lorsque la référence est décidée (centres de santé)]]
#set par(justify: false, leading: 0.62em)
#set text(size: 9.0pt)
#table(
  columns: (0.7002fr, 0.2998fr),
  inset: (x: 4.4pt, y: 3.2pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Contrainte déclarée au départ (centres de santé, n = 101)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[n (%)]]]),
    [#block(breakable: false)[Manque de ressources financières du ménage]], [#block(breakable: false)[78 (77,2 %)]],
    [#block(breakable: false)[Absence de moyen de transport]], [#block(breakable: false)[71 (70,3 %)]],
    [#block(breakable: false)[Refus du patient ou de sa famille]], [#block(breakable: false)[70 (69,3 %)]],
    [#block(breakable: false)[Coût du transport]], [#block(breakable: false)[66 (65,3 %)]],
    [#block(breakable: false)[Distance importante vers la structure de référence]], [#block(breakable: false)[51 (50,5 %)]],
    [#block(breakable: false)[Mauvais état des routes]], [#block(breakable: false)[45 (44,6 %)]],
    [#block(breakable: false)[Difficultés de communication]], [#block(breakable: false)[33 (32,7 %)]],
    [#block(breakable: false)[Panne du moyen de transport]], [#block(breakable: false)[29 (28,7 %)]],
    [#block(breakable: false)[Insécurité ou contraintes géographiques]], [#block(breakable: false)[20 (19,8 %)]],
    [#block(breakable: false)[Retard dans la prise de décision clinique]], [#block(breakable: false)[10 (9,9 %)]],
    [#block(breakable: false)[Saturation de l’hôpital de référence]], [#block(breakable: false)[9 (8,9 %)]],
)
#v(4pt)

#heading(level: 3)[3.4.5. Difficultés à la réception et dans la continuité de la référence]

#para[Parmi les 59 centres de santé de référence et hôpitaux généraux de référence interrogés, les difficultés les plus fréquemment signalées concernent le délai et la coordination de la référence. L’arrivée tardive du patient est citée par 53 établissements (89,8 %), l’absence de communication préalable par 50 (84,7 %) et l’aggravation de l’état clinique à l’arrivée par 48 (81,4 %). Ces constats témoignent de ruptures possibles dans la coordination entre la structure référente et la structure d’accueil.]

#para[La transmission des informations et l’accompagnement du patient posent également problème. Les informations cliniques sont jugées insuffisantes dans 79,7 % des établissements ; la fiche de référence est incomplète ou mal renseignée dans 76,3 % des cas, et absente dans 74,6 %. Dans la même proportion, les patients sont référés sans accompagnement approprié alors qu’il est nécessaire. La continuité après la prise en charge reste aussi fragile : 62,7 % des structures signalent des difficultés financières pour le patient et une absence ou un retard de contre-référence.]

#para[Enfin, même si elles sont moins souvent citées, l’indisponibilité des examens complémentaires et celle des médicaments ou intrants essentiels concernent chacune 26 structures (44,1 %). Les difficultés rapportées ne se limitent donc pas à la coordination et à la documentation ; elles incluent aussi des contraintes financières et de disponibilité des ressources. Plusieurs problèmes pouvant être signalés par une même structure, les pourcentages ne doivent pas être additionnés.]

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 9.6pt, weight: "bold", fill: rgb("#131d44"))[Tableau 15 : Difficultés déclarées à la réception des patients référés (CSR et HGR)]]
#set par(justify: false, leading: 0.62em)
#set text(size: 9.0pt)
#table(
  columns: (0.7002fr, 0.2998fr),
  inset: (x: 4.4pt, y: 3.2pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Difficulté déclarée à la réception (CSR et HGR, n = 59)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[n (%)]]]),
    [#block(breakable: false)[Arrivée tardive du patient après la décision de référence]], [#block(breakable: false)[53 (89,8 %)]],
    [#block(breakable: false)[Absence de communication préalable entre la structure référente et votre établissement]], [#block(breakable: false)[50 (84,7 %)]],
    [#block(breakable: false)[État clinique du patient aggravé à son arrivée]], [#block(breakable: false)[48 (81,4 %)]],
    [#block(breakable: false)[Informations cliniques insuffisantes sur le patient référé]], [#block(breakable: false)[47 (79,7 %)]],
    [#block(breakable: false)[Fiche de référence incomplète ou mal renseignée]], [#block(breakable: false)[45 (76,3 %)]],
    [#block(breakable: false)[Patient référé sans accompagnement approprié (personnel de santé ou autre) lorsque nécessaire]], [#block(breakable: false)[45 (76,3 %)]],
    [#block(breakable: false)[Référence sans fiche de référence]], [#block(breakable: false)[44 (74,6 %)]],
    [#block(breakable: false)[Difficultés financières du patient limitant sa prise en charge]], [#block(breakable: false)[37 (62,7 %)]],
    [#block(breakable: false)[Absence ou retard de contre référence après la prise en charge]], [#block(breakable: false)[37 (62,7 %)]],
    [#block(breakable: false)[Indisponibilité des examens complémentaires nécessaires]], [#block(breakable: false)[26 (44,1 %)]],
    [#block(breakable: false)[Indisponibilité des médicaments ou intrants essentiels]], [#block(breakable: false)[26 (44,1 %)]],
)
#v(4pt)

#heading(level: 3)[3.4.6. Préparation opérationnelle des structures de destination]

#para[Sur les 160 établissements sources, une destination a été identifiée pour 82 liaisons : 68 au départ d’un centre de santé (CS), 12 d’un centre de santé de référence (CSR) et deux d’un hôpital général de référence (HGR). Toutefois, seules 20 liaisons sont confirmées par le nom de la destination ; les 62 autres ne sont pas confirmées nominativement.]

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 8.799999999999999pt, weight: "bold", fill: rgb("#131d44"))[Tableau 16 : État des fonctions vitales d'aval à la destination de référence enquêtée]]
#set par(justify: false, leading: 0.62em)
#set text(size: 8.2pt)
#table(
  columns: (0.1597fr, 0.1201fr, 0.1801fr, 0.1800fr, 0.1801fr, 0.1799fr),
  inset: (x: 4.4pt, y: 3.2pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Niveau source]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Destination nommée]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Liaisons appariées (confirmées par le nom \/ non confirmées nominativement)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Césarienne rouge à la destination : n (%)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Transfusion rouge : n (%)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Réanimation néonatale rouge : n (%)]]]),
    [#block(breakable: false)[Niveau 1 (CS)]], [#block(breakable: false)[101]], [#block(breakable: false)[68 (15 \/ 53)]], [#block(breakable: false)[54 (79,4 %)]], [#block(breakable: false)[50 (73,5 %)]], [#block(breakable: false)[45 (66,2 %)]],
    [#block(breakable: false)[Niveau 1+ (CSR)]], [#block(breakable: false)[22]], [#block(breakable: false)[12 (3 \/ 9)]], [#block(breakable: false)[11 (91,7 %)]], [#block(breakable: false)[10 (83,3 %)]], [#block(breakable: false)[9 (75,0 %)]],
    [#block(breakable: false)[Niveau 2 (HGR)]], [#block(breakable: false)[37]], [#block(breakable: false)[2 (2 \/ 0)]], [#block(breakable: false)[2 (100,0 %)]], [#block(breakable: false)[1 (50,0 %)]], [#block(breakable: false)[1 (50,0 %)]],
    [#block(breakable: false)[Ensemble]], [#block(breakable: false)[160]], [#block(breakable: false)[82 (20 \/ 62)]], [#block(breakable: false)[67 (81,7 %)]], [#block(breakable: false)[61 (74,4 %)]], [#block(breakable: false)[55 (67,1 %)]],
)
#v(4pt)

#para[Parmi ces 82 liaisons, les fonctions nécessaires à la prise en charge à destination sont fréquemment classées rouges : 67 destinations (81,7 %) pour la césarienne, 61 (74,4 %) pour la transfusion et 55 (67,1 %) pour la réanimation néonatale. Les proportions sont particulièrement élevées pour les liaisons issues des CSR : 11 des 12 destinations sont classées rouges pour la césarienne, 10 pour la transfusion et 9 pour la réanimation néonatale. Les résultats concernant les HGR sources reposent sur seulement deux liaisons et doivent être interprétés avec prudence. Ainsi, la référence vers une structure d’accueil ne garantit pas à elle seule que la fonction requise y soit opérationnelle. Ces résultats décrivent toutefois les liaisons analysées dans l’échantillon : la majorité des destinations n’étant pas confirmée nominativement, ils ne permettent pas d’établir avec certitude l’état opérationnel de chaque destination effectivement sollicitée. Les destinations situées hors de l’échantillon ne sont pas évaluées.]

#heading(level: 3)[3.4.7. Continuité opérationnelle entre les fonctions de soins]

#para[Parmi les établissements où la fonction d’amont est classée verte ou jaune, la fonction d’aval demeure souvent rouge, ce qui révèle des ruptures possibles dans la continuité opérationnelle au sein d’un même établissement. Les écarts les plus marqués concernent le dépistage nutritionnel : l’aval est classé rouge dans 78 % des cas pour la prise en charge de la malnutrition aiguë compliquée et dans 94 % pour la malnutrition aiguë non compliquée au centre de santé. Le passage du traitement du paludisme simple à la stabilisation pré-référence du paludisme grave présente également une forte proportion de rouge (environ 75 %), tout comme le passage de la vaccination de routine à la prise en charge des manifestations adverses post-immunisation (MAPI, 70 %).]

#para[D’autres enchaînements sont moins souvent classés rouges : 9 % pour la vaccination de routine suivie de la chaîne du froid, 24 % pour la consultation prénatale suivie de la CPN intégrée à la PTME, 25 % pour l’accouchement normal suivi de la prise en charge de l’hémorragie du post-partum et 26 % pour le diagnostic du paludisme suivi de son traitement. Toutefois, certains parcours restent fragiles : la proportion rouge atteint 57 % entre la consultation prénatale et la détection-référence des grossesses à risque, 58 % entre l’accouchement normal et la réanimation néonatale ou les soins essentiels du nouveau-né, 66 % entre l’hémorragie du post-partum et la transfusion, 50 % entre l’accouchement assisté et la césarienne d’urgence, et 40 % entre l’hémorragie du post-partum et la référence urgente.]


#block(width: 100%, above: 11pt, below: 3pt, breakable: false,
  block(width: 100%, fill: rgb("#fffbf7"), radius: 12pt, stroke: 1.1pt + rgb("#0f1015"), inset: 7pt,
    align(center, image("/home/user/Rp/assets/img/image13.png", width: 15.9cm))))
#fig-cap[Figure 10 : État de la fonction d’aval lorsque la fonction d’amont est classée verte ou jaune]

#para[Ces résultats suggèrent que la continuité est particulièrement vulnérable lorsque la fonction d’aval exige des intrants, des équipements ou des compétences spécifiques. Ils doivent toutefois être interprétés comme des parcours analytiques au sein des établissements, et non comme l’observation du cheminement réel des patients. Les effectifs diffèrent selon les parcours (de 12 à 140 établissements) ; les valeurs fondées sur de petits effectifs sont donc à considérer avec prudence.]

#heading(level: 2)[3.5. Utilisation des données de routine et de surveillance]


#block(width: 100%, above: 11pt, below: 9pt, breakable: false,
  block(width: 100%, fill: rgb("#fffbf7"), radius: 12pt, stroke: 1.4pt + black, inset: (x: 13pt, y: 11pt))[
    #text(font: "DejaVu Sans", size: 14pt, fill: rgb("#131d44"))[★]
    #v(-4pt)
    #text(size: 7.2pt, tracking: 2.4pt, fill: rgb("#5166b7"))[#upper[À retenir]]
    #v(1pt)
    #block(above: 3pt, below: 9pt)[#text(size: 11.2pt, weight: "bold", fill: rgb("#131d44"))[La détection et la notification semblent bien assurées selon les déclarations : 78 % des établissements sont classés verts pour la reconnaissance du signal, et 90 % déclarent notifier les alertes en moins de 24 heures.]]
    #text(size: 9.2pt, fill: rgb("#0f1015"))[Les outils et la transmission constituent le principal point de fragilité : 31 % des établissements sont classés rouges pour cette composante, une proportion qui atteint 66,7 % au Haut-Lomami. L’analyse des données est plus favorable, mais le système reste instable : 67,5 % des établissements sont classés verts pour l’analyse et la prise de décision, tandis que la fonction « données sanitaires » est jaune dans 58,6 % des cas. L’utilisation des données pour l’action reste incomplète : là où les outils existent, les équipes analysent leurs données, mais seuls 7,6 % des établissements ont une fonction « données sanitaires » pleinement opérationnelle. La discontinuité des outils et de la transmission freine l’action correctrice, et les données de routine ne montrent pas l’écart entre services déclarés et capacité réelle : 97 des 98 centres de santé qui déclarent la réanimation néonatale n’en réunissent pas les conditions. Ces résultats reposent sur les déclarations des établissements et n’ont pas été vérifiés par confrontation aux registres.]
  ])

#heading(level: 3)[3.5.1. Fonctionnement du circuit de surveillance et d’utilisation des données]

#para[Le circuit de surveillance présente des résultats contrastés selon ses étapes. La reconnaissance du signal est classée verte dans 78 % des établissements, et la rapidité de notification dans 90 %. Cette dernière proportion varie de 86,1 % dans les CS à 97,3 % dans les HGR ; toutefois, trois CS déclarent ne disposer d’aucun système de notification. Ces deux premiers maillons apparaissent donc globalement fonctionnels.]

#para[La principale rupture concerne les outils et la transmission des données : seuls 30 % des établissements sont classés verts, tandis que 39 % sont jaunes et 31 % rouges. Cette étape constitue le principal point de rupture du circuit (31 %) et regroupe plusieurs exigences, relevé hebdomadaire, canevas SNIS et accès au SNIS ; contrairement aux maillons de reconnaissance et de notification, évalués chacun à partir d’un seul élément.]


#block(width: 100%, above: 11pt, below: 3pt, breakable: false,
  block(width: 100%, fill: rgb("#fffbf7"), radius: 12pt, stroke: 1.1pt + rgb("#0f1015"), inset: 7pt,
    align(center, image("/home/user/Rp/assets/img/image14.png", width: 15.9cm))))
#fig-cap[Figure 11 : Chaîne surveillance-réponse et chaîne des données : composantes et points de rupture]

#para[En aval, l’analyse et la prise de décision sont classées vertes dans 68 % des établissements, jaunes dans 19 % et rouges dans 14 %. Cette capacité semble donc se maintenir malgré les faiblesses constatées dans la production et la transmission des données. Toutefois, la fonction globale « données sanitaires » reste surtout classée jaune (58,6 %), et seulement 7,6 % des établissements sont classés verts. Enfin, la rapidité de notification repose sur les déclarations des établissements : les délais n’ont pas été mesurés directement.]

#heading(level: 3)[3.5.2. Points de rupture du circuit de surveillance selon le niveau et la province]

#para[Les outils et la transmission constituent le principal point de rupture du circuit de surveillance, quel que soit le niveau de soins. Cette difficulté concerne davantage les centres de santé (38,6 % de classements rouges) que les hôpitaux généraux de référence (21,6 %) et les centres de santé de référence (13,6 %).]

#para[Les écarts entre provinces sont marqués : la proportion rouge pour cette composante atteint 66,7 % au Haut-Lomami et 43,8 % dans la Lomami. Elle est de 37,5 % au Lualaba et au Sankuru, de 29,2 % au Kasaï-Central, et de 12,5 % au Kasaï-Oriental comme au Tanganyika. Ces deux dernières valeurs doivent être interprétées avec prudence, les échantillons provinciaux ne comptant que huit établissements chacun.]

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 7.199999999999999pt, weight: "bold", fill: rgb("#131d44"))[Tableau 17 : Points de rupture du circuit de surveillance, par niveau et par province]]
#set par(justify: false, leading: 0.62em)
#set text(size: 6.6pt)
#table(
  columns: (0.2594fr, 0.0601fr, 0.0722fr, 0.0722fr, 0.0670fr, 0.0670fr, 0.0671fr, 0.0670fr, 0.0670fr, 0.0672fr, 0.0670fr, 0.0668fr),
  inset: (x: 4.4pt, y: 3.2pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Composante : % rouge]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[CS]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[CSR]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[HGR]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[HK]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[HL]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[KC]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[KO]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[LM]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[LL]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[SK]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[TG]]]),
    [#block(breakable: false)[Reconnaissance du signal]], [#block(breakable: false)[11,9]], [#block(breakable: false)[9,1]], [#block(breakable: false)[5,4]], [#block(breakable: false)[19,2]], [#block(breakable: false)[0,0]], [#block(breakable: false)[4,2]], [#block(breakable: false)[0,0]], [#block(breakable: false)[0,0]], [#block(breakable: false)[8,3]], [#block(breakable: false)[18,8]], [#block(breakable: false)[0,0]],
    [#block(breakable: false)[Rapidité de la notification]], [#block(breakable: false)[6,9]], [#block(breakable: false)[4,5]], [#block(breakable: false)[0,0]], [#block(breakable: false)[3,8]], [#block(breakable: false)[0,0]], [#block(breakable: false)[8,3]], [#block(breakable: false)[0,0]], [#block(breakable: false)[6,2]], [#block(breakable: false)[0,0]], [#block(breakable: false)[18,8]], [#block(breakable: false)[0,0]],
    [#block(breakable: false)[Outils et transmission]], [#block(breakable: false)[38,6]], [#block(breakable: false)[13,6]], [#block(breakable: false)[21,6]], [#block(breakable: false)[21,2]], [#block(breakable: false)[66,7]], [#block(breakable: false)[29,2]], [#block(breakable: false)[12,5]], [#block(breakable: false)[43,8]], [#block(breakable: false)[37,5]], [#block(breakable: false)[37,5]], [#block(breakable: false)[12,5]],
    [#block(breakable: false)[Analyse et décision]], [#block(breakable: false)[13,9]], [#block(breakable: false)[9,1]], [#block(breakable: false)[16,2]], [#block(breakable: false)[30,8]], [#block(breakable: false)[0,0]], [#block(breakable: false)[0,0]], [#block(breakable: false)[0,0]], [#block(breakable: false)[18,8]], [#block(breakable: false)[0,0]], [#block(breakable: false)[18,8]], [#block(breakable: false)[0,0]],
)
#v(4pt)

#para[Les autres maillons présentent généralement moins de classements rouges. La reconnaissance du signal demeure toutefois plus fragile au Haut-Katanga (19,2 %) et au Sankuru (18,8 %), tandis que les retards ou absences de notification sont les plus fréquents au Sankuru (18,8 %). Pour l’analyse et la prise de décision, le Haut-Katanga est la seule province où la proportion rouge dépasse 30 % (30,8 %) ; aucun classement rouge n’est observé dans cinq provinces. Ces résultats décrivent des variations au sein des établissements évalués et ne constituent pas un classement des provinces.]

#heading(level: 2)[3.6. Facteurs associés aux contraintes observées]


#block(width: 100%, above: 11pt, below: 9pt, breakable: false,
  block(width: 100%, fill: rgb("#fffbf7"), radius: 12pt, stroke: 1.4pt + black, inset: (x: 13pt, y: 11pt))[
    #text(font: "DejaVu Sans", size: 14pt, fill: rgb("#131d44"))[★]
    #v(-4pt)
    #text(size: 7.2pt, tracking: 2.4pt, fill: rgb("#5166b7"))[#upper[À retenir]]
    #v(1pt)
    #block(above: 3pt, below: 9pt)[#text(size: 11.2pt, weight: "bold", fill: rgb("#131d44"))[Les intrants et les équipements sont les principaux goulots d’étranglement : chacun bloque plus de la moitié des fonctions classées rouges, et près de deux fonctions rouges sur trois cumulent au moins deux dimensions de contrainte.]]
    #text(size: 9.2pt, fill: rgb("#0f1015"))[Pour les équipements, l’absence est plus fréquente que la panne : 73,1 % sont manquants, contre 4,3 % qui sont présents mais non fonctionnels. La présence de personnel ne garantit pas la disponibilité des compétences requises : 94,1 % des centres de santé n’ont pas de nutritionniste et 53,5 % n’ont pas de sage-femme. Le rétablissement des intrants et des équipements ne suffirait pas à lui seul : même si tous les éléments manquants étaient rétablis, 54,4 % des fonctions concernées resteraient classées rouges.]
  ])

#heading(level: 3)[3.6.1. Principaux blocages et fragilités des fonctions évaluées]

#para[Parmi les 2 579 évaluations classées rouges, les équipements et les intrants et produits constituent les dimensions bloquantes les plus fréquemment relevées : chacune concerne 53 % des cas. La référence arrive ensuite, avec 40 %, suivie de l’organisation du service (23 %) et des ressources humaines (14 %). Les autres dimensions (communication, électricité, intégration des services, données sanitaires et surveillance épidémiologique) sont moins souvent en cause. Conformément à la grille de classification, l’eau, l’hygiène et l’assainissement ne sont pas une dimension bloquante : ils plafonnent la fonction au jaune et figurent donc parmi les fragilités.]


#block(width: 100%, above: 11pt, below: 3pt, breakable: false,
  block(width: 100%, fill: rgb("#fffbf7"), radius: 12pt, stroke: 1.1pt + rgb("#0f1015"), inset: 7pt,
    align(center, image("/home/user/Rp/assets/img/image15.png", width: 15.9cm))))
#fig-cap[Figure 12 : Dimensions bloquantes des fonctions rouges et fragilités des fonctions jaunes]

#para[Parmi les 1 140 évaluations jaunes, qui signalent des fonctions présentes mais fragiles, les difficultés concernent d’abord la référence (51 %), puis l’eau, l’hygiène et l’assainissement et les ressources humaines (44 % chacun). Viennent ensuite l’électricité (33 %), les intrants et produits (30 %), l’organisation du service (27 %) et les données sanitaires (25 %). Ainsi, les contraintes les plus fréquentes diffèrent selon le statut de la fonction : les évaluations rouges sont surtout associées aux équipements et aux intrants, tandis que les évaluations jaunes révèlent particulièrement des fragilités de référence, d’eau, d’hygiène et d’assainissement et de ressources humaines. Ces pourcentages décrivent la fréquence de chaque dimension dans les évaluations concernées ; ils ne sont pas nécessairement exclusifs.]

#heading(level: 3)[3.6.2. Des blocages aux leviers de déblocage]

#para[Parmi les 2 579 fonctions classées rouges, les équipements et les intrants et produits sont les dimensions bloquantes les plus fréquentes : ils concernent respectivement 1 370 fonctions (53,1 %) et 1 357 (52,6 %). La référence est également souvent en cause (1 038 fonctions, 40,2 %), devant l’organisation du service (22,6 %) et les ressources humaines (14,3 %). Une même fonction pouvant cumuler plusieurs blocages, ces proportions ne s’additionnent pas.]

#para[Le premier blocage identifié ne reflète pas exactement cette fréquence : les intrants arrivent en tête (1 101 fonctions, 42,7 %), devant l’organisation du service (583, 22,6 %) et les équipements (451, 17,5 %). Ce classement dépend en partie de l’ordre conventionnel appliqué par l’algorithme : les intrants sont examinés avant les équipements et l’organisation du service occupe le premier rang de la hiérarchie. Ainsi, pour les 583 fonctions où l’organisation est relevée comme dimension bloquante, elle est aussi désignée comme premier blocage. Ces rangs indiquent la contrainte retenue selon la règle de classement ; ils ne mesurent pas directement le poids relatif des contraintes.]

#para[Pour les 1 140 fonctions classées jaunes, la hiérarchie est différente : la référence fragilise 51,3 % des cas, l’eau, l’hygiène et l’assainissement 44,1 % et les ressources humaines 43,6 %. Les priorités pour stabiliser une fonction déjà partiellement opérationnelle ne sont donc pas nécessairement celles qui permettent de sortir une fonction du rouge.]

#para[Enfin, la fréquence d’un blocage ne correspond pas au nombre de fonctions qui passeraient au jaune ou au vert si ce blocage était résolu isolément. Dans cette simulation, la résolution seule des problèmes d’intrants ferait sortir du rouge 338 fonctions (13,1 %), celle des équipements 262 (10,2 %), celle de la référence 152 (5,9 %) et celle de l’organisation du service 7 (0,3 %). Ces résultats soulignent les limites d’interventions isolées face à des contraintes souvent cumulées.]

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 8.799999999999999pt, weight: "bold", fill: rgb("#131d44"))[Tableau 18 : Les dimensions de blocage : ce qu'elles bloquent, ce qu'elles fragilisent et ce que leur résolution libère]]
#set par(justify: false, leading: 0.62em)
#set text(size: 8.2pt)
#table(
  columns: (0.2799fr, 0.1801fr, 0.1800fr, 0.1801fr, 0.1799fr),
  inset: (x: 4.4pt, y: 3.2pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Dimension]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Bloque : n (% des rouges)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Premier blocage : n (%)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Fragilise : n (% des jaunes)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Libère si résolue seule : n (% des rouges)]]]),
    [#block(breakable: false)[Équipements]], [#block(breakable: false)[1 370 (53,1 %)]], [#block(breakable: false)[451 (17,5 %)]], [#block(breakable: false)[265 (23,2 %)]], [#block(breakable: false)[262 (10,2 %)]],
    [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[1 357 (52,6 %)]], [#block(breakable: false)[1 101 (42,7 %)]], [#block(breakable: false)[345 (30,3 %)]], [#block(breakable: false)[338 (13,1 %)]],
    [#block(breakable: false)[Référence]], [#block(breakable: false)[1 038 (40,2 %)]], [#block(breakable: false)[153 (5,9 %)]], [#block(breakable: false)[585 (51,3 %)]], [#block(breakable: false)[152 (5,9 %)]],
    [#block(breakable: false)[Organisation du service]], [#block(breakable: false)[583 (22,6 %)]], [#block(breakable: false)[583 (22,6 %)]], [#block(breakable: false)[303 (26,6 %)]], [#block(breakable: false)[7 (0,3 %)]],
    [#block(breakable: false)[Ressources humaines]], [#block(breakable: false)[369 (14,3 %)]], [#block(breakable: false)[122 (4,7 %)]], [#block(breakable: false)[497 (43,6 %)]], [#block(breakable: false)[31 (1,2 %)]],
    [#block(breakable: false)[Communication]], [#block(breakable: false)[219 (8,5 %)]], [#block(breakable: false)[68 (2,6 %)]], [#block(breakable: false)[118 (10,4 %)]], [#block(breakable: false)[50 (1,9 %)]],
    [#block(breakable: false)[Électricité]], [#block(breakable: false)[188 (7,3 %)]], [#block(breakable: false)[53 (2,1 %)]], [#block(breakable: false)[380 (33,3 %)]], [#block(breakable: false)[53 (2,1 %)]],
    [#block(breakable: false)[Eau, hygiène et assainissement]], [#block(breakable: false)[0 (0,0 %)]], [#block(breakable: false)[0 (0,0 %)]], [#block(breakable: false)[503 (44,1 %)]], [#block(breakable: false)[0 (0,0 %)]],
)
#v(4pt)

#para[_Base : 2 579 fonctions rouges et 1 140 fonctions jaunes ; une fonction peut être bloquée ou fragilisée par plusieurs dimensions. Quatre autres dimensions bloquent chacune 3 % ou moins des fonctions rouges : intégration des services (81), données sanitaires (53), surveillance épidémiologique (38) et capacité d'accueil (2). Les données sanitaires fragilisent toutefois environ un quart des fonctions jaunes (25 %) et la capacité d'accueil près d'une sur cinq (18 %)._]

#heading(level: 3)[3.6.3. Cumul des blocages selon le niveau de soins]

#para[Parmi les 2 579 fonctions classées rouges, 36 % présentent une seule dimension bloquante, 33 % en cumulent deux, 22 % en cumulent trois et 9 % en comptent quatre ou plus : 1 640 fonctions rouges (63,6 %) cumulent donc au moins deux dimensions. La répartition varie selon le niveau de soins : une seule dimension est en cause pour 29 % des fonctions rouges au CS, 48 % au CSR et 60 % à l’HGR. À l’inverse, trois dimensions ou plus se cumulent dans 35 % des cas au CS, contre 22 % au CSR et 15 % à l’HGR. Le profil du CSR se situe entre les deux autres niveaux ; les effectifs par niveau sont détaillés en annexe.]


#block(width: 100%, above: 11pt, below: 3pt, breakable: false,
  block(width: 100%, fill: rgb("#fffbf7"), radius: 12pt, stroke: 1.1pt + rgb("#0f1015"), inset: 7pt,
    align(center, image("/home/user/Rp/assets/img/image16.png", width: 15.9cm))))
#fig-cap[Figure 13 : Nombre de dimensions bloquantes par fonction rouge, selon le niveau de soins]

#para[Ces résultats suggèrent que les fonctions rouges des HGR relèvent plus souvent d’un blocage concentré sur une dimension, tandis qu’au CS les contraintes sont plus fréquemment cumulées. Les réponses au niveau primaire devront donc plus souvent combiner plusieurs leviers. Le nombre de dimensions indique toutefois l’étendue des contraintes, sans suffire à déterminer à lui seul l’effort nécessaire pour rétablir une fonction.]

#heading(level: 3)[3.6.4. Combinaisons de blocages les plus fréquentes]

#para[Parmi les 2 579 fonctions classées rouges, la configuration exacte la plus fréquente est le blocage par les intrants seuls : 338 fonctions (13,1 %). Viennent ensuite les équipements seuls (262 ; 10,2 %), l’association intrants et équipements (261 ; 10,1 %), puis intrants, équipements et référence (219 ; 8,5 %). Les sept configurations les plus fréquentes, toutes composées de ces trois dimensions, représentent 62,0 % des fonctions rouges.]

#para[Considérées ensemble, les dimensions « intrants », « équipements » et « référence » sont aussi celles qui coïncident le plus souvent : intrants et équipements dans 26,4 % des fonctions rouges, équipements et référence dans 23,3 %, et intrants et référence dans 20,5 %. Ces proportions décrivent des cooccurrences et ne s’ajoutent pas aux pourcentages des configurations exactes.]


#block(width: 100%, above: 11pt, below: 3pt, breakable: false,
  block(width: 100%, fill: rgb("#fffbf7"), radius: 12pt, stroke: 1.1pt + rgb("#0f1015"), inset: 7pt,
    align(center, image("/home/user/Rp/assets/img/image17.png", width: 15.9cm))))
#fig-cap[Figure 14 : Les douze configurations de blocage les plus fréquentes parmi les fonctions rouges]

#para[Le blocage par une seule dimension reste fréquent : sept des douze configurations présentées sont de ce type, en premier lieu les intrants seuls (13,1 %), les équipements seuls (10,2 %) et la référence seule (6,5 %) ; les données sanitaires, l’électricité, la communication et l’intégration des services en constituent chacune environ 2 %.]

#heading(level: 3)[3.6.5. Fonctions jaunes proches du vert et fragilités dominantes]

#para[Parmi les 1 140 fonctions classées jaunes, 172 (15,1 %) ne présentent qu’une seule fragilité. Selon la règle de classement, la levée de cette fragilité suffirait à faire passer la fonction au vert. En nombre total de fonctions jaunes, le diagnostic du paludisme arrive en tête (134), devant l’intégration des services (110) et la surveillance épidémiologique (109). Ces totaux ne correspondent pas uniquement aux cas présentant une fragilité unique, qui se concentrent dans le dépistage nutritionnel (23), la surveillance épidémiologique (22), l’intégration des services (20) et les données sanitaires (19).]

#para[La fragilité dominante, calculée sur l’ensemble des fonctions jaunes de chaque ligne, varie selon la fonction. La référence est notamment en cause pour le diagnostic du paludisme, le paludisme simple, le dépistage nutritionnel et l’intégration des services. L’organisation du service domine pour la chaîne du froid, la vaccination de routine, la CPN intégrée à la PTME et la CPoN de la mère ; l’eau, l’hygiène et l’assainissement pour le sepsis obstétrical, la pré-éclampsie, l’accouchement assisté et la CPoN du nouveau-né ; les ressources humaines pour la césarienne d’urgence. Pour la surveillance épidémiologique, ce sont les données sanitaires qui prédominent.]


#block(width: 100%, above: 11pt, below: 3pt, breakable: false,
  block(width: 100%, fill: rgb("#fffbf7"), radius: 12pt, stroke: 1.1pt + rgb("#0f1015"), inset: 7pt,
    align(center, image("/home/user/Rp/assets/img/image18.png", width: 15.0cm))))
#fig-cap[Figure 15 : Fonctions jaunes à une seule fragilité du vert]

#para[Ces profils appellent des mesures adaptées à chaque contrainte. Les 172 fonctions à fragilité unique constituent des cibles possibles d’amélioration ciblée, mais le graphique ne permet pas d’affirmer que leur stabilisation ne nécessiterait aucune dotation matérielle nouvelle. À l’inverse, cinq fonctions n’en comptent aucune (grossesse à risque, accouchement normal, CPN de routine, CPN intégrée à la PTME et CPoN de la mère) : toutes leurs fonctions jaunes cumulent au moins deux fragilités, souvent les mêmes, comme la référence pour l’accouchement normal ou l’organisation du service pour la CPN de routine.]

#heading(level: 3)[3.6.6. Disponibilité des intrants critiques : des déficits fréquents, mais souvent ponctuels]

#para[Parmi les intrants les plus souvent associés à une fonction classée rouge, le kit d’accouchement à usage unique arrive en tête : il est indisponible dans 127 établissements sur 160 (79,4 %). Le kit anti-choc ou chariot d’urgence est concerné dans 99 établissements sur 123 (80,5 %), et le sulfate de magnésium dans 98 sur 160 (61,2 %). Au total, sept des quatorze intrants du tableau conditionnent directement une fonction vitale ; les gants, requis pour plusieurs prestations maternelles et néonatales, sont rouges dans 91 établissements sur 160 (56,9 %).]

#para[Pour la plupart des intrants, l’indisponibilité constatée le jour de la visite explique l’essentiel du classement rouge. C’est particulièrement le cas de l’ATPE (86,1 % d’indisponibilité le jour de la visite, sans rupture de plus de sept jours déclarée), du kit d’accouchement (78,1 %) et du kit anti-choc (78,1 %). Les ruptures prolongées sont plus marquées pour l’artésunate-amodiaquine (33,1 %), l’artésunate en suppositoire (14,9 %), les tests rapides VIH (13,0 %) et l’artéméther-luméfantrine (11,9 %).]

#para[Le Haut-Lomami est la province indiquée comme la plus concernée pour six des quatorze intrants, notamment les kits anti-choc, les gants, les bandelettes urinaires, la méthyldopa, l’artésunate-amodiaquine et les tests rapides VIH. L’ATPE se distingue par un déficit concentré au niveau 1 : il est rouge dans 87 des 101 CS (86,1 %). Les données fournies ici ne détaillent pas les résultats par niveau pour le F100, le F75 ou les utérotoniques ; ces éléments ne sont donc pas repris dans cette comparaison.]

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 8.0pt, weight: "bold", fill: rgb("#131d44"))[Tableau 19 : Disponibilité des intrants critiques, tous niveaux]]
#set par(justify: false, leading: 0.62em)
#set text(size: 7.4pt)
#table(
  columns: (0.2322fr, 0.2317fr, 0.0561fr, 0.0692fr, 0.1000fr, 0.1331fr, 0.0846fr, 0.0932fr),
  inset: (x: 4.4pt, y: 3.2pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Intrant critique]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Fonctions dépendantes]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Vit.]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Établ.]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Rouge : n (%)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[% indisponible le jour de la visite]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[% rupture \> 7 j]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Province]]]),
    [#block(breakable: false)[Kit d'accouchement à usage unique]], [#block(breakable: false)[Accouchement normal]], [#block(breakable: false)[]], [#block(breakable: false)[160]], [#block(breakable: false)[127 (79,4 %)]], [#block(breakable: false)[78,1]], [#block(breakable: false)[1,3]], [#block(breakable: false)[HK]],
    [#block(breakable: false)[Kit antichoc \/ chariot d'urgence]], [#block(breakable: false)[MAPI]], [#block(breakable: false)[Oui]], [#block(breakable: false)[123]], [#block(breakable: false)[99 (80,5 %)]], [#block(breakable: false)[78,1]], [#block(breakable: false)[2,5]], [#block(breakable: false)[HL]],
    [#block(breakable: false)[Sulfate de magnésium]], [#block(breakable: false)[Pré-éclampsie]], [#block(breakable: false)[Oui]], [#block(breakable: false)[160]], [#block(breakable: false)[98 (61,2 %)]], [#block(breakable: false)[56,3]], [#block(breakable: false)[5,0]], [#block(breakable: false)[LM]],
    [#block(breakable: false)[Gants]], [#block(breakable: false)[Accouchement assisté, Accouchement normal, CPoN mère, CPoN n]], [#block(breakable: false)[Oui]], [#block(breakable: false)[160]], [#block(breakable: false)[91 (56,9 %)]], [#block(breakable: false)[53,1]], [#block(breakable: false)[3,8]], [#block(breakable: false)[HL]],
    [#block(breakable: false)[Bandelettes urinaires]], [#block(breakable: false)[CPN de routine, CPoN mère, Grossesse à risque]], [#block(breakable: false)[Oui]], [#block(breakable: false)[123]], [#block(breakable: false)[90 (73,1 %)]], [#block(breakable: false)[71,5]], [#block(breakable: false)[1,6]], [#block(breakable: false)[HL]],
    [#block(breakable: false)[Méthyldopa]], [#block(breakable: false)[Grossesse à risque]], [#block(breakable: false)[Oui]], [#block(breakable: false)[123]], [#block(breakable: false)[89 (72,3 %)]], [#block(breakable: false)[68,3]], [#block(breakable: false)[4,1]], [#block(breakable: false)[HL]],
    [#block(breakable: false)[ATPE]], [#block(breakable: false)[MA non compliquée]], [#block(breakable: false)[]], [#block(breakable: false)[101]], [#block(breakable: false)[87 (86,1 %)]], [#block(breakable: false)[86,1]], [#block(breakable: false)[0,0]], [#block(breakable: false)[HK]],
    [#block(breakable: false)[Artéméther \+ Luméfantrine]], [#block(breakable: false)[Paludisme simple]], [#block(breakable: false)[]], [#block(breakable: false)[160]], [#block(breakable: false)[81 (50,6 %)]], [#block(breakable: false)[38,7]], [#block(breakable: false)[11,9]], [#block(breakable: false)[KC]],
    [#block(breakable: false)[Artésunate \+ Amodiaquine]], [#block(breakable: false)[Paludisme simple]], [#block(breakable: false)[]], [#block(breakable: false)[160]], [#block(breakable: false)[71 (44,3 %)]], [#block(breakable: false)[11,2]], [#block(breakable: false)[33,1]], [#block(breakable: false)[HL]],
    [#block(breakable: false)[Vitamine K1]], [#block(breakable: false)[Soins du nouveau-né]], [#block(breakable: false)[]], [#block(breakable: false)[160]], [#block(breakable: false)[65 (40,6 %)]], [#block(breakable: false)[34,4]], [#block(breakable: false)[6,2]], [#block(breakable: false)[LM]],
    [#block(breakable: false)[Ampicilline]], [#block(breakable: false)[Sepsis obstétrical]], [#block(breakable: false)[Oui]], [#block(breakable: false)[160]], [#block(breakable: false)[64 (40,0 %)]], [#block(breakable: false)[38,1]], [#block(breakable: false)[1,9]], [#block(breakable: false)[SK]],
    [#block(breakable: false)[Artésunate, suppositoire]], [#block(breakable: false)[Paludisme grave]], [#block(breakable: false)[Oui]], [#block(breakable: false)[101]], [#block(breakable: false)[62 (61,4 %)]], [#block(breakable: false)[46,5]], [#block(breakable: false)[14,9]], [#block(breakable: false)[HK]],
    [#block(breakable: false)[Tests rapides VIH]], [#block(breakable: false)[CPN \+ PTME]], [#block(breakable: false)[]], [#block(breakable: false)[123]], [#block(breakable: false)[62 (50,4 %)]], [#block(breakable: false)[37,4]], [#block(breakable: false)[13,0]], [#block(breakable: false)[HL]],
    [#block(breakable: false)[ARV pour PTME]], [#block(breakable: false)[CPN \+ PTME]], [#block(breakable: false)[]], [#block(breakable: false)[123]], [#block(breakable: false)[60 (48,7 %)]], [#block(breakable: false)[46,4]], [#block(breakable: false)[2,5]], [#block(breakable: false)[LL]],
)
#v(4pt)

#heading(level: 3)[3.6.7. Équipements critiques : des absences fréquentes et des besoins transversaux]

#para[Pour les équipements, l’absence est beaucoup plus fréquente que la panne. La balance est classée rouge dans 124 établissements sur 160 (77,5 %), l’appareil d’aspiration dans 77 CS sur 101 (76,2 %) et la source de chaleur dans 110 établissements sur 160 (68,7 %). Dans ces cas, l’équipement est principalement absent plutôt que présent mais non fonctionnel. Cette dernière situation dépasse 5 % pour la source de chaleur (6,9 %), le glucomètre (5,9 %) et le pèse-bébé (5,6 %), ce qui invite à examiner les besoins de maintenance et de consommables.]

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 8.0pt, weight: "bold", fill: rgb("#131d44"))[Tableau 20 : Disponibilité des équipements critiques, tous niveaux]]
#set par(justify: false, leading: 0.62em)
#set text(size: 7.4pt)
#table(
  columns: (0.2384fr, 0.2384fr, 0.0568fr, 0.0847fr, 0.1113fr, 0.0768fr, 0.1079fr, 0.0857fr),
  inset: (x: 4.4pt, y: 3.2pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Équipement critique]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Fonctions dépendantes]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Vit.]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Établ.]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Rouge : n (%)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[% absent]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[% non fonctionnel]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Province]]]),
    [#block(breakable: false)[Balance]], [#block(breakable: false)[Dépistage nutrition, MA compliquée, MA non compliquée]], [#block(breakable: false)[Oui]], [#block(breakable: false)[160]], [#block(breakable: false)[124 (77,5 %)]], [#block(breakable: false)[73,1]], [#block(breakable: false)[4,3]], [#block(breakable: false)[HK]],
    [#block(breakable: false)[Source de chaleur]], [#block(breakable: false)[Réanimation néonat., Soins du nouveau-né]], [#block(breakable: false)[Oui]], [#block(breakable: false)[160]], [#block(breakable: false)[110 (68,7 %)]], [#block(breakable: false)[61,9]], [#block(breakable: false)[6,9]], [#block(breakable: false)[HL]],
    [#block(breakable: false)[Appareil d'aspiration des mucosités \+ sondes d'aspiration]], [#block(breakable: false)[Réanimation néonat.]], [#block(breakable: false)[Oui]], [#block(breakable: false)[101]], [#block(breakable: false)[77 (76,2 %)]], [#block(breakable: false)[73,3]], [#block(breakable: false)[3,0]], [#block(breakable: false)[SK]],
    [#block(breakable: false)[Lit ou table d'examen avec linge propre]], [#block(breakable: false)[CPN \+ PTME, CPN de routine, CPoN mère]], [#block(breakable: false)[]], [#block(breakable: false)[123]], [#block(breakable: false)[75 (61,0 %)]], [#block(breakable: false)[60,1]], [#block(breakable: false)[0,8]], [#block(breakable: false)[HL]],
    [#block(breakable: false)[Surface/espace dédié à la réanimation du nouveau]], [#block(breakable: false)[Réanimation néonat.]], [#block(breakable: false)[Oui]], [#block(breakable: false)[160]], [#block(breakable: false)[68 (42,5 %)]], [#block(breakable: false)[40,6]], [#block(breakable: false)[1,9]], [#block(breakable: false)[SK]],
    [#block(breakable: false)[Glucomètre \+ bandelettes]], [#block(breakable: false)[Paludisme grave]], [#block(breakable: false)[Oui]], [#block(breakable: false)[101]], [#block(breakable: false)[63 (62,4 %)]], [#block(breakable: false)[56,4]], [#block(breakable: false)[5,9]], [#block(breakable: false)[LM]],
    [#block(breakable: false)[Matériel de goutte épaisse \/ frottis mince]], [#block(breakable: false)[Diagnostic paludisme]], [#block(breakable: false)[]], [#block(breakable: false)[101]], [#block(breakable: false)[62 (61,4 %)]], [#block(breakable: false)[57,4]], [#block(breakable: false)[4,0]], [#block(breakable: false)[SK]],
    [#block(breakable: false)[Enregistreur de température \/ Freeze-Tag ou Stop]], [#block(breakable: false)[Chaîne du froid]], [#block(breakable: false)[Oui]], [#block(breakable: false)[123]], [#block(breakable: false)[61 (49,6 %)]], [#block(breakable: false)[45,5]], [#block(breakable: false)[4,1]], [#block(breakable: false)[LM]],
    [#block(breakable: false)[Lit d'accouchement]], [#block(breakable: false)[Accouchement assisté, Accouchement normal]], [#block(breakable: false)[Oui]], [#block(breakable: false)[160]], [#block(breakable: false)[60 (37,5 %)]], [#block(breakable: false)[35,0]], [#block(breakable: false)[2,5]], [#block(breakable: false)[HL]],
    [#block(breakable: false)[Source de lumière adéquate]], [#block(breakable: false)[Accouchement assisté, Accouchement normal]], [#block(breakable: false)[Oui]], [#block(breakable: false)[160]], [#block(breakable: false)[58 (36,3 %)]], [#block(breakable: false)[35,0]], [#block(breakable: false)[1,3]], [#block(breakable: false)[KC]],
    [#block(breakable: false)[Ballon auto-gonflable \+ masque taille néonatale]], [#block(breakable: false)[Réanimation néonat.]], [#block(breakable: false)[Oui]], [#block(breakable: false)[160]], [#block(breakable: false)[56 (35,0 %)]], [#block(breakable: false)[33,1]], [#block(breakable: false)[1,9]], [#block(breakable: false)[SK]],
    [#block(breakable: false)[Tensiomètre \+ stéthoscope]], [#block(breakable: false)[CPN de routine, CPoN mère, Grossesse à risque, Hémorragie po]], [#block(breakable: false)[Oui]], [#block(breakable: false)[160]], [#block(breakable: false)[53 (33,1 %)]], [#block(breakable: false)[31,2]], [#block(breakable: false)[1,9]], [#block(breakable: false)[HL]],
    [#block(breakable: false)[Thermomètre]], [#block(breakable: false)[CPoN nouveau-né, MA compliquée, Paludisme grave, Réception u]], [#block(breakable: false)[Oui]], [#block(breakable: false)[160]], [#block(breakable: false)[52 (32,5 %)]], [#block(breakable: false)[31,3]], [#block(breakable: false)[1,3]], [#block(breakable: false)[HL]],
    [#block(breakable: false)[Pèse-bébé]], [#block(breakable: false)[CPoN nouveau-né, Soins du nouveau-né]], [#block(breakable: false)[]], [#block(breakable: false)[160]], [#block(breakable: false)[50 (31,2 %)]], [#block(breakable: false)[25,6]], [#block(breakable: false)[5,6]], [#block(breakable: false)[HL]],
)
#v(4pt)

#para[Onze des quatorze équipements du tableau sont liés à une fonction vitale. Le Haut-Lomami est la province indiquée comme la plus concernée pour six équipements, dont la source de chaleur, le lit d’accouchement, le tensiomètre avec stéthoscope et le thermomètre. Ces deux derniers équipements sont classés rouges dans respectivement 33,1 % et 32,5 % des établissements. Bien que moins souvent rouges que certains autres matériels, chacun intervient dans quatre fonctions et a donc une portée transversale.]

#para[Pour la réanimation néonatale, le ballon auto-gonflable et le masque de taille néonatale sont classés rouges dans 56 établissements sur 160 (35,0 %) : ils sont absents dans 53 établissements et présents mais non fonctionnels dans trois. Le déficit compromet ainsi une fonction vitale dans plus d’un tiers des établissements évalués.]

#heading(level: 3)[3.6.8. Effet simulé de la levée des contraintes matérielles]

#para[La simulation montre que rétablir un seul intrant ou équipement suffit rarement à faire sortir une fonction du rouge. Au niveau 1, par exemple, rétablir le sulfate de magnésium ne libérerait que 8 des 77 fonctions rouges où il manque, et les bandelettes urinaires 15 sur 154 ; la source de chaleur, avec 30 fonctions libérées sur 154, a l’effet le plus large. Ces éléments constituent donc souvent une contrainte parmi plusieurs. Les antipaludiques font exception : pour le paludisme simple, le rétablissement de l’artésunate-amodiaquine ou de l’artéméther-luméfantrine libérerait 33 fonctions sur 34 au niveau 1 et 11 sur 11 au niveau 2 dans la cascade simulée. L’effet serait plus limité pour le réfrigérateur à sang au niveau 1+ (7 sur 17) et les seringues et aiguilles au niveau 2 (15 sur 44, soit 34,1 %).]


#block(width: 100%, above: 11pt, below: 3pt, breakable: false,
  block(width: 100%, fill: rgb("#fffbf7"), radius: 12pt, stroke: 1.1pt + rgb("#0f1015"), inset: 7pt,
    align(center, image("/home/user/Rp/assets/img/image19.png", width: 15.9cm))))
#fig-cap[Figure 16 : Fonctions rouges libérées par le rétablissement d’un seul élément critique]

#para[Le scénario combiné confirme les limites d’une réponse centrée uniquement sur les intrants et les équipements. Parmi les 1 819 fonctions rouges bloquées par au moins un élément critique en déficit, 989 (54,4 %) resteraient rouges même après le rétablissement de tous ces éléments et groupes substituables ; aucune ne serait alors encore bloquée par ces deux dimensions. Les contraintes résiduelles concerneraient surtout la référence (625 fonctions), l’organisation du service (283), les ressources humaines (267) et l’électricité (132). L’effet varie toutefois fortement selon le niveau : 65,7 % des fonctions concernées resteraient rouges au CS, où la référence pèse le plus, contre 40,7 % au CSR et 19,4 % à l’HGR, où une dotation matérielle complète ferait sortir du rouge quatre fonctions bloquées sur cinq. Une telle dotation contribuerait donc à améliorer la situation, surtout à l’hôpital, mais devrait s’accompagner d’actions sur ces autres dimensions, en particulier au premier niveau. Le détail par niveau et par élément figure en annexe.]

#heading(level: 3)[3.6.9. Ressources humaines : une forte présence infirmière, mais des compétences clés manquantes]

#para[Les infirmiers constituent la catégorie de personnel la plus largement représentée : seuls 1,0 % des CS ne déclarent aucun infirmier, contre aucun CSR ni HGR, et le total déclaré atteint 1 840 agents. La répartition des médecins est toutefois très inégale selon le niveau : 70,3 % des CS ne déclarent aucun médecin généraliste, contre 9,1 % des CSR et aucun HGR. Les médecins spécialistes sont encore plus rares : ils sont absents dans 92,1 % des CS, 81,8 % des CSR et 67,6 % des HGR ; la médiane est nulle aux trois niveaux.]

#para[Les déficits concernent également des compétences essentielles à certaines prestations. Aucun nutritionniste n’est déclaré dans 94,1 % des CS et 81,8 % des CSR ; cette proportion reste de 45,9 % dans les HGR. Les sages-femmes sont absentes dans 53,5 % des CS et 37,8 % des HGR. Les techniciens de laboratoire sont, eux aussi, peu présents dans les CS : 56,4 % n’en déclarent aucun, contre 9,1 % des CSR et 13,5 % des HGR.]

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 8.0pt, weight: "bold", fill: rgb("#131d44"))[Tableau 21 : Effectifs déclarés par catégorie et par niveau (roster du personnel)]]
#set par(justify: false, leading: 0.62em)
#set text(size: 7.4pt)
#table(
  columns: (0.3451fr, 0.0796fr, 0.1017fr, 0.0849fr, 0.1017fr, 0.0907fr, 0.1027fr, 0.0936fr),
  inset: (x: 4.4pt, y: 3.2pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Catégorie de personnel]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[CS : % sans aucun agent]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[CS : médiane]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[CSR : % sans aucun agent]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[CSR : médiane]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[HGR : % sans aucun agent]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[HGR : médiane]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Total déclaré (160)]]]),
    [#block(breakable: false)[Médecin généraliste]], [#block(breakable: false)[70,3]], [#block(breakable: false)[0,0]], [#block(breakable: false)[9,1]], [#block(breakable: false)[3,0]], [#block(breakable: false)[0,0]], [#block(breakable: false)[7,0]], [#block(breakable: false)[1 185]],
    [#block(breakable: false)[Médecin spécialiste]], [#block(breakable: false)[92,1]], [#block(breakable: false)[0,0]], [#block(breakable: false)[81,8]], [#block(breakable: false)[0,0]], [#block(breakable: false)[67,6]], [#block(breakable: false)[0,0]], [#block(breakable: false)[165]],
    [#block(breakable: false)[Sage-femme]], [#block(breakable: false)[53,5]], [#block(breakable: false)[0,0]], [#block(breakable: false)[45,5]], [#block(breakable: false)[1,0]], [#block(breakable: false)[37,8]], [#block(breakable: false)[1,0]], [#block(breakable: false)[221]],
    [#block(breakable: false)[Infirmier(ère)]], [#block(breakable: false)[1,0]], [#block(breakable: false)[4,0]], [#block(breakable: false)[0,0]], [#block(breakable: false)[8,0]], [#block(breakable: false)[0,0]], [#block(breakable: false)[18,0]], [#block(breakable: false)[1 840]],
    [#block(breakable: false)[Technicien(ne) de laboratoire (laborantin)]], [#block(breakable: false)[56,4]], [#block(breakable: false)[0,0]], [#block(breakable: false)[9,1]], [#block(breakable: false)[1,0]], [#block(breakable: false)[13,5]], [#block(breakable: false)[2,0]], [#block(breakable: false)[243]],
    [#block(breakable: false)[Nutritionniste]], [#block(breakable: false)[94,1]], [#block(breakable: false)[0,0]], [#block(breakable: false)[81,8]], [#block(breakable: false)[0,0]], [#block(breakable: false)[45,9]], [#block(breakable: false)[1,0]], [#block(breakable: false)[45]],
    [#block(breakable: false)[Pharmacien(ne) \/ Gestionnaire de pharmacie]], [#block(breakable: false)[49,5]], [#block(breakable: false)[1,0]], [#block(breakable: false)[18,2]], [#block(breakable: false)[1,0]], [#block(breakable: false)[27,0]], [#block(breakable: false)[1,0]], [#block(breakable: false)[158]],
    [#block(breakable: false)[Technicien(ne) d’assainissement \/ hygiène]], [#block(breakable: false)[47,5]], [#block(breakable: false)[1,0]], [#block(breakable: false)[36,4]], [#block(breakable: false)[1,5]], [#block(breakable: false)[40,5]], [#block(breakable: false)[1,0]], [#block(breakable: false)[413]],
    [#block(breakable: false)[Administrateur Gestionnaire]], [#block(breakable: false)[74,3]], [#block(breakable: false)[0,0]], [#block(breakable: false)[18,2]], [#block(breakable: false)[1,0]], [#block(breakable: false)[10,8]], [#block(breakable: false)[1,0]], [#block(breakable: false)[131]],
)
#v(4pt)

#para[Cette pénurie de personnel formé en nutrition concorde avec la classification opérationnelle : dans le bloc nutrition, les ressources humaines constituent une contrainte rouge dans environ 55 % des cas aux niveaux 1 et 1+, tandis qu’ailleurs elles sont plus souvent une fragilité qu’un blocage. Les effectifs présentés sont ceux déclarés au moment de la visite et n’ont pas été vérifiés. Onze valeurs atypiques n’ont pas été corrigées, mais elles n’affectent pas les médianes.]

#heading(level: 3)[3.6.10. Formation continue : une couverture inégale selon les thèmes et les niveaux]

#para[La formation continue déclarée au cours des deux dernières années concerne davantage les niveaux de référence pour certains thèmes. L’écart est particulièrement marqué pour l’accouchement assisté : au moins un prestataire formé est déclaré dans 39,6 % des CS, contre 77,3 % des CSR et 83,8 % des HGR. À l’échelle de l’ensemble des établissements, cette formation est rapportée dans 55,0 % des cas.]

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 8.799999999999999pt, weight: "bold", fill: rgb("#131d44"))[Tableau 22 : Formations déclarées au cours des deux dernières années, par thème et par niveau]]
#set par(justify: false, leading: 0.62em)
#set text(size: 8.2pt)
#table(
  columns: (0.5038fr, 0.1183fr, 0.0592fr, 0.0653fr, 0.1213fr, 0.1320fr),
  inset: (x: 4.4pt, y: 2.3pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Formation (deux dernières années)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[CS : ESS avec au moins 1 formé (%)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[CSR (%)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[HGR (%)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Ensemble : n (%)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Prestataires formés (total)]]]),
    [#block(breakable: false)[Assurance qualité des soins \/ amélioration de la qualité des services (DQR/DQE)]], [#block(breakable: false)[16,8]], [#block(breakable: false)[22,7]], [#block(breakable: false)[32,4]], [#block(breakable: false)[34 (21,2%)]], [#block(breakable: false)[111]],
    [#block(breakable: false)[Prévention de la transmission mère-enfant du VIH (PTME)]], [#block(breakable: false)[23,8]], [#block(breakable: false)[\-]], [#block(breakable: false)[\-]], [#block(breakable: false)[24 (23,8%)]], [#block(breakable: false)[38]],
    [#block(breakable: false)[Référence et contre-référence des cas graves]], [#block(breakable: false)[26,7]], [#block(breakable: false)[18,2]], [#block(breakable: false)[29,7]], [#block(breakable: false)[42 (26,2%)]], [#block(breakable: false)[90]],
    [#block(breakable: false)[Consultation prénatale recentrée (CPNr)]], [#block(breakable: false)[32,7]], [#block(breakable: false)[\-]], [#block(breakable: false)[\-]], [#block(breakable: false)[33 (32,7%)]], [#block(breakable: false)[53]],
    [#block(breakable: false)[Gestion logistique des médicaments et produits de santé]], [#block(breakable: false)[27,7]], [#block(breakable: false)[45,5]], [#block(breakable: false)[40,5]], [#block(breakable: false)[53 (33,1%)]], [#block(breakable: false)[91]],
    [#block(breakable: false)[Gestion des données sanitaires (DHIS2)]], [#block(breakable: false)[29,7]], [#block(breakable: false)[45,5]], [#block(breakable: false)[37,8]], [#block(breakable: false)[54 (33,8%)]], [#block(breakable: false)[86]],
    [#block(breakable: false)[Prévention et contrôle des infections (PCI)]], [#block(breakable: false)[26,7]], [#block(breakable: false)[36,4]], [#block(breakable: false)[56,8]], [#block(breakable: false)[56 (35,0%)]], [#block(breakable: false)[210]],
    [#block(breakable: false)[PCIMNE (Ordinogrammes des soins)]], [#block(breakable: false)[35,6]], [#block(breakable: false)[40,9]], [#block(breakable: false)[40,5]], [#block(breakable: false)[60 (37,5%)]], [#block(breakable: false)[183]],
    [#block(breakable: false)[Prise en charge intégrée de la malnutrition aiguë (PCIMA)]], [#block(breakable: false)[30,7]], [#block(breakable: false)[50,0]], [#block(breakable: false)[56,8]], [#block(breakable: false)[63 (39,4%)]], [#block(breakable: false)[178]],
    [#block(breakable: false)[Prise en charge du VIH]], [#block(breakable: false)[25,7]], [#block(breakable: false)[68,2]], [#block(breakable: false)[73,0]], [#block(breakable: false)[68 (42,5%)]], [#block(breakable: false)[232]],
    [#block(breakable: false)[Méthode soins mère kangourou]], [#block(breakable: false)[32,7]], [#block(breakable: false)[63,6]], [#block(breakable: false)[64,9]], [#block(breakable: false)[71 (44,4%)]], [#block(breakable: false)[249]],
    [#block(breakable: false)[Réanimation néonatale]], [#block(breakable: false)[34,7]], [#block(breakable: false)[68,2]], [#block(breakable: false)[67,6]], [#block(breakable: false)[75 (46,9%)]], [#block(breakable: false)[245]],
    [#block(breakable: false)[Vaccination (Programme élargi de vaccination)]], [#block(breakable: false)[49,5]], [#block(breakable: false)[50,0]], [#block(breakable: false)[45,9]], [#block(breakable: false)[78 (48,8%)]], [#block(breakable: false)[149]],
    [#block(breakable: false)[Soins postnatals]], [#block(breakable: false)[37,6]], [#block(breakable: false)[63,6]], [#block(breakable: false)[73,0]], [#block(breakable: false)[79 (49,4%)]], [#block(breakable: false)[255]],
    [#block(breakable: false)[Soins obstétricaux et néonatals d’urgence de base]], [#block(breakable: false)[37,6]], [#block(breakable: false)[68,2]], [#block(breakable: false)[73,0]], [#block(breakable: false)[80 (50,0%)]], [#block(breakable: false)[230]],
    [#block(breakable: false)[Soins essentiels du nouveau-né]], [#block(breakable: false)[41,6]], [#block(breakable: false)[59,1]], [#block(breakable: false)[73,0]], [#block(breakable: false)[82 (51,2%)]], [#block(breakable: false)[287]],
    [#block(breakable: false)[Prise en charge du paludisme simple et grave]], [#block(breakable: false)[39,6]], [#block(breakable: false)[86,4]], [#block(breakable: false)[67,6]], [#block(breakable: false)[84 (52,5%)]], [#block(breakable: false)[303]],
    [#block(breakable: false)[Accouchement assisté \/ soins obstétricaux de base]], [#block(breakable: false)[39,6]], [#block(breakable: false)[77,3]], [#block(breakable: false)[83,8]], [#block(breakable: false)[88 (55,0%)]], [#block(breakable: false)[299]],
    [#block(breakable: false)[Surveillance et notification des maladies à potentiel épidémique]], [#block(breakable: false)[57,4]], [#block(breakable: false)[50,0]], [#block(breakable: false)[59,5]], [#block(breakable: false)[91 (56,9%)]], [#block(breakable: false)[161]],
)
#v(4pt)

#para[Plusieurs thèmes restent moins couverts. L’assurance qualité des soins est déclarée dans 21,2 % des établissements, la formation à la référence et à la contre-référence dans 26,2 %, et la PTME dans 23,8 % des CS. À l’inverse, la surveillance et la notification des maladies à potentiel épidémique est le thème le plus souvent rapporté (56,9 %), devant l’accouchement assisté (55,0 %) et la prise en charge du paludisme (52,5 %). La couverture reste inférieure à 50 % pour la réanimation néonatale (46,9 %), la prise en charge de la malnutrition aiguë (39,4 %) et la prévention et le contrôle des infections (35,0 %).]

#para[Ces données décrivent les formations déclarées ; elles ne sont pas intégrées à la classification opérationnelle des fonctions et ne permettent pas, à elles seules, d’établir un lien entre formation et capacité à offrir les services.]

#heading(level: 3)[3.6.11. Personnel déclaré et fonctions vitales rouges dans les CS]

#para[Dans les centres de santé, la part des fonctions vitales classées rouges est un peu plus faible lorsque certaines catégories de personnel sont présentes. Elle atteint 81 % en présence d’au moins un médecin généraliste, contre 86 % en son absence ; 81 % avec au moins une sage-femme, contre 87 % sans sage-femme ; et 79 % avec au moins un technicien de laboratoire, contre 88 % sans technicien. Malgré ces écarts, la proportion de fonctions rouges reste élevée dans tous les groupes.]


#block(width: 100%, above: 11pt, below: 3pt, breakable: false,
  block(width: 100%, fill: rgb("#fffbf7"), radius: 12pt, stroke: 1.1pt + rgb("#0f1015"), inset: 7pt,
    align(center, image("/home/user/Rp/assets/img/image20.png", width: 15.9cm))))
#fig-cap[Figure 17 : Part de fonctions vitales rouges dans les CS selon la présence déclarée d’une catégorie de personnel]

#para[Pour les infirmiers, la comparaison est peu informative : 100 CS sur 101 déclarent en compter au moins un ; le seul CS n’en déclarant aucun affiche 91 % de fonctions vitales rouges, contre 84 % dans les autres centres.]

#para[Ces écarts sont descriptifs. Les groupes peuvent différer par d’autres caractéristiques et l’analyse ne contrôle pas les facteurs associés. La présence d’un agent ne suffit donc pas, à elle seule, à expliquer le niveau de préparation, qui dépend également des intrants, des équipements et de la référence.]

#heading(level: 3)[3.6.12. Conditions transversales : la référence et l’eau, l’hygiène et l’assainissement au premier plan]

#para[Le circuit de référence et l’eau, l’hygiène et l’assainissement sont les conditions les plus souvent classées rouges : respectivement 113 établissements (70,6 %) et 106 (66,2 %). Leur portée diffère toutefois. Le circuit de référence bloque 1 038 fonctions rouges, soit en moyenne un peu plus de neuf par établissement où cette condition est rouge. À l’inverse, bien qu’ils soient fréquemment classés rouges, l’eau, l’hygiène et l’assainissement ne suffisent à bloquer aucune fonction : leur rôle dans la grille est restrictif, ils fragilisent 503 fonctions jaunes et les empêchent d’atteindre le vert.]

#para[L’électricité touche 87 établissements (54,4 %) et bloque 188 fonctions rouges. La communication, moins souvent classée rouge (29 établissements ; 18,1 %), est néanmoins associée à 219 fonctions rouges, soit plus de sept par établissement concerné. La fréquence d’une condition rouge ne reflète donc pas à elle seule l’étendue des fonctions touchées.]

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 8.0pt, weight: "bold", fill: rgb("#131d44"))[Tableau 23 : Conditions transversales au niveau des établissements]]
#set par(justify: false, leading: 0.62em)
#set text(size: 7.4pt)
#table(
  columns: (0.1748fr, 0.1615fr, 0.0950fr, 0.0977fr, 0.0989fr, 0.1106fr, 0.2615fr),
  inset: (x: 4.4pt, y: 3.2pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Condition]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Établissements]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Vert : n (%)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Jaune : n (%)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Rouge : n (%)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Fonctions rouges bloquées]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Fonctions où la condition est bloquante]]]),
    [#block(breakable: false)[Eau, hygiène et assainissement]], [#block(breakable: false)[160]], [#block(breakable: false)[28 (17,5 %)]], [#block(breakable: false)[26 (16,2 %)]], [#block(breakable: false)[106 (66,2 %)]], [#block(breakable: false)[0]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[Électricité]], [#block(breakable: false)[160]], [#block(breakable: false)[51 (31,9 %)]], [#block(breakable: false)[22 (13,8 %)]], [#block(breakable: false)[87 (54,4 %)]], [#block(breakable: false)[188]], [#block(breakable: false)[Chaîne du froid, Césarienne d'urgence, Transfusion, Vaccination de routine]],
    [#block(breakable: false)[Communication]], [#block(breakable: false)[160]], [#block(breakable: false)[92 (57,5 %)]], [#block(breakable: false)[39 (24,4 %)]], [#block(breakable: false)[29 (18,1 %)]], [#block(breakable: false)[219]], [#block(breakable: false)[Grossesse à risque, MA compliquée, MAPI, Réanimation néonat., Pré-éclampsie, Paludisme grave, Référence urgente, Réception urgences, Hémorragie post-partum, Sepsis obstétrical, Surveillance épidémiologique]],
    [#block(breakable: false)[Circuit de référence]], [#block(breakable: false)[160]], [#block(breakable: false)[26 (16,2 %)]], [#block(breakable: false)[21 (13,1 %)]], [#block(breakable: false)[113 (70,6 %)]], [#block(breakable: false)[1 038]], [#block(breakable: false)[Grossesse à risque, MA compliquée, MAPI, Réanimation néonat., Pré-éclampsie, Paludisme grave, Référence urgente, Réception urgences, Hémorragie post-partum, Sepsis obstétrical, MA non compliquée, CPoN mère, CPoN nouveau-né]],
    [#block(breakable: false)[Données sanitaires (SNIS)]], [#block(breakable: false)[160]], [#block(breakable: false)[45 (28,1 %)]], [#block(breakable: false)[62 (38,8 %)]], [#block(breakable: false)[53 (33,1 %)]], [#block(breakable: false)[53]], [#block(breakable: false)[Données sanitaires]],
    [#block(breakable: false)[Surveillance épidémiologique]], [#block(breakable: false)[160]], [#block(breakable: false)[118 (73,8 %)]], [#block(breakable: false)[22 (13,8 %)]], [#block(breakable: false)[20 (12,5 %)]], [#block(breakable: false)[38]], [#block(breakable: false)[MAPI, Surveillance épidémiologique]],
    [#block(breakable: false)[Intégration des services]], [#block(breakable: false)[160]], [#block(breakable: false)[114 (71,2 %)]], [#block(breakable: false)[1 (0,6 %)]], [#block(breakable: false)[45 (28,1 %)]], [#block(breakable: false)[81]], [#block(breakable: false)[CPN \+ PTME, Intégration services]],
)
#v(4pt)

#para[Les blocages liés aux données et à la surveillance sont plus circonscrits : la condition « données sanitaires » concerne la fonction correspondante (53 évaluations rouges), tandis que la surveillance épidémiologique touche deux fonctions : les MAPI et la surveillance épidémiologique (38). L’intégration des services concerne elle aussi deux fonctions, l’intégration des services et la CPN associée à la PTME (81). Par ailleurs, 73,8 % des établissements sont classés verts pour la surveillance épidémiologique et 71,2 % pour l’intégration des services.]

#para[Les écarts entre niveaux confirment le caractère transversal de certaines contraintes. La référence demeure souvent rouge au CS, au CSR et à l’HGR (75 %, 59 % et 65 %). L’électricité est rouge dans 66 % des CS, 32 % des CSR et 35 % des HGR ; selon les données par niveau, le niveau 1 présente le profil le plus contraint sur les sept conditions, tandis que le niveau 1+ affiche le profil le moins défavorable pour cinq d’entre elles]

#heading(level: 3)[3.6.13. Causes opérationnelles des blocages liés au transfert et aux infrastructures]

#para[Les blocages du circuit de référence tiennent principalement aux conditions de transport et de coordination. La destination est identifiée dans tous les établissements, mais le moyen de transport est indisponible ou non fonctionnel dans 66 % d’entre eux. Le contact préalable avant la référence constitue un autre maillon fragile : il est rouge dans 20 % des établissements et instable dans 35 %. Le problème observé se situe donc surtout dans la mise en œuvre de la référence et la communication entre structures, plutôt que dans l’identification de la destination.]


#block(width: 100%, above: 11pt, below: 3pt, breakable: false,
  block(width: 100%, fill: rgb("#fffbf7"), radius: 12pt, stroke: 1.1pt + rgb("#0f1015"), inset: 7pt,
    align(center, image("/home/user/Rp/assets/img/image21.png", width: 15.9cm))))
#fig-cap[Figure 18 : Composantes de la référence, de l’eau et de l’hygiène, de l’électricité et de la communication]

#para[Pour la fonction « référence urgente » elle-même, le constat est encore plus net. Parmi ses 120 évaluations rouges, le moyen de transport fait défaut dans 105 cas (87,5 %), contre 32 (26,7 %) pour le contact préalable et 14 (11,7 %) pour l’absence de tout moyen de communication fonctionnel ; la structure de destination est identifiée dans tous les cas. C’est donc le transport qui explique l’essentiel du classement de cette fonction sous la dimension « organisation du service », à tous les niveaux de soins.]

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 8.0pt, weight: "bold", fill: rgb("#131d44"))[Tableau 24 : Composantes du mécanisme de référence en cause dans les fonctions rouges de la référence urgente, par niveau]]
#set par(justify: false, leading: 0.62em)
#set text(size: 7.4pt)
#table(
  columns: (0.1555fr, 0.0623fr, 0.0934fr, 0.0830fr, 0.1556fr, 0.1507fr, 0.1505fr, 0.1490fr),
  inset: (x: 4.4pt, y: 3.2pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Niveau]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[K]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Fonctions rouges]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[% Rouge]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Transport indisponible ou non fonctionnel : n (% des rouges)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Pas de contact préalable : n (% des rouges)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Destination non identifiée : n (% des rouges)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Aucun moyen de communication fonctionnel : n (% des rouges)]]]),
    [#block(breakable: false)[Niveau 1 (CS)]], [#block(breakable: false)[101]], [#block(breakable: false)[80]], [#block(breakable: false)[79,2]], [#block(breakable: false)[71 (88,8 %)]], [#block(breakable: false)[19 (23,8 %)]], [#block(breakable: false)[0 (0,0 %)]], [#block(breakable: false)[10 (12,5 %)]],
    [#block(breakable: false)[Niveau 1+ (CSR)]], [#block(breakable: false)[22]], [#block(breakable: false)[14]], [#block(breakable: false)[63,6]], [#block(breakable: false)[13 (92,9 %)]], [#block(breakable: false)[5 (35,7 %)]], [#block(breakable: false)[0 (0,0 %)]], [#block(breakable: false)[2 (14,3 %)]],
    [#block(breakable: false)[Niveau 2 (HGR)]], [#block(breakable: false)[37]], [#block(breakable: false)[26]], [#block(breakable: false)[70,3]], [#block(breakable: false)[21 (80,8 %)]], [#block(breakable: false)[8 (30,8 %)]], [#block(breakable: false)[0 (0,0 %)]], [#block(breakable: false)[2 (7,7 %)]],
    [#block(breakable: false)[Ensemble]], [#block(breakable: false)[160]], [#block(breakable: false)[120]], [#block(breakable: false)[75,0]], [#block(breakable: false)[105 (87,5 %)]], [#block(breakable: false)[32 (26,7 %)]], [#block(breakable: false)[0 (0,0 %)]], [#block(breakable: false)[14 (11,7 %)]],
)
#v(4pt)

#para[_Base : fonctions « référence urgente » rouges du niveau ; une fonction rouge peut cumuler plusieurs composantes défaillantes. La destination est considérée comme identifiée lorsque le nom d’une structure de destination est renseigné ; la confirmation de ce nom dans l’échantillon, évoquée pour les liaisons appariées, ne remet pas en cause cette identification._]

#para[Pour l’eau et l’électricité, les difficultés concernent surtout le fonctionnement des moyens nécessaires au service. Les points d’eau fonctionnels dans les services sont classés rouges dans 57 % des établissements. Pour l’électricité, une source existe dans la plupart des structures, mais la source de secours est rouge dans 49 % ; l’alimentation stable et sa continuité sur trois mois sont chacune rouges dans 29 % des cas. La présence d’une source principale ne suffit donc pas à garantir une alimentation fiable.]

#para[La communication présente un contraste similaire : 98 % des établissements déclarent disposer d’au moins un moyen, mais les moyens essentiels ne sont opérationnels le jour de la visite que dans 64 % des cas ; ils sont instables dans 29 % et rouges dans 7 %. Les données situent ainsi les blocages dans la fonctionnalité, la continuité et l’organisation des moyens disponibles. Le transport, lui, reste fortement contraint aux trois niveaux de soins, 70,3 % des CS, 59,1 % des CSR et 56,8 % des HGR, ce qui indique une difficulté commune au circuit de référence.]

#heading(level: 3)[3.6.14. Événements récents déclarés : les ruptures d’approvisionnement au premier plan]

#para[Au cours des trois mois précédant l’enquête, 87 établissements sur 160 (54,4 %) ont déclaré une rupture de médicaments essentiels. Les ruptures d’approvisionnement en eau (50 ; 31,4 %) et les pannes prolongées d’électricité (38 ; 23,9 %) suivent. Les autres événements sont moins fréquemment rapportés : épidémies ou flambées de maladie dans 15,6 % des établissements, absence prolongée de personnel clé et incidents sécuritaires dans 12,7 % et 12,5 % des cas respectivement. Les tempêtes ou événements climatiques majeurs sont les moins cités (1,9 %).]

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 7.199999999999999pt, weight: "bold", fill: rgb("#131d44"))[Tableau 25 : Perturbations déclarées au cours des trois derniers mois, par province (% d’établissements)]]
#set par(justify: false, leading: 0.62em)
#set text(size: 6.6pt)
#table(
  columns: (0.2993fr, 0.1398fr, 0.0701fr, 0.0705fr, 0.0703fr, 0.0700fr, 0.0700fr, 0.0700fr, 0.0703fr, 0.0697fr),
  inset: (x: 4.4pt, y: 3.2pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Événement des trois derniers mois]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Ensemble : n (%)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[HK]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[HL]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[KC]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[KO]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[LM]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[LL]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[SK]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[TG]]]),
    [#block(breakable: false)[Épidémie ou flambée de maladie]], [#block(breakable: false)[25 (15,6 %)]], [#block(breakable: false)[7,7]], [#block(breakable: false)[16,7]], [#block(breakable: false)[12,5]], [#block(breakable: false)[12,5]], [#block(breakable: false)[31,2]], [#block(breakable: false)[8,3]], [#block(breakable: false)[37,5]], [#block(breakable: false)[25,0]],
    [#block(breakable: false)[Inondation]], [#block(breakable: false)[10 (6,3 %)]], [#block(breakable: false)[7,7]], [#block(breakable: false)[9,1]], [#block(breakable: false)[4,2]], [#block(breakable: false)[0,0]], [#block(breakable: false)[0,0]], [#block(breakable: false)[8,3]], [#block(breakable: false)[6,2]], [#block(breakable: false)[12,5]],
    [#block(breakable: false)[Tempête ou événement climatique majeur]], [#block(breakable: false)[3 (1,9 %)]], [#block(breakable: false)[1,9]], [#block(breakable: false)[8,3]], [#block(breakable: false)[4,2]], [#block(breakable: false)[0,0]], [#block(breakable: false)[0,0]], [#block(breakable: false)[0,0]], [#block(breakable: false)[0,0]], [#block(breakable: false)[0,0]],
    [#block(breakable: false)[Incident sécuritaire]], [#block(breakable: false)[20 (12,5 %)]], [#block(breakable: false)[11,5]], [#block(breakable: false)[33,3]], [#block(breakable: false)[8,3]], [#block(breakable: false)[25,0]], [#block(breakable: false)[18,8]], [#block(breakable: false)[12,5]], [#block(breakable: false)[0,0]], [#block(breakable: false)[0,0]],
    [#block(breakable: false)[Mouvement de population important]], [#block(breakable: false)[16 (10,1 %)]], [#block(breakable: false)[5,8]], [#block(breakable: false)[25,0]], [#block(breakable: false)[4,3]], [#block(breakable: false)[0,0]], [#block(breakable: false)[12,5]], [#block(breakable: false)[25,0]], [#block(breakable: false)[0,0]], [#block(breakable: false)[14,3]],
    [#block(breakable: false)[Panne prolongée d'électricité]], [#block(breakable: false)[38 (23,9 %)]], [#block(breakable: false)[26,9]], [#block(breakable: false)[33,3]], [#block(breakable: false)[30,4]], [#block(breakable: false)[25,0]], [#block(breakable: false)[25,0]], [#block(breakable: false)[16,7]], [#block(breakable: false)[6,2]], [#block(breakable: false)[25,0]],
    [#block(breakable: false)[Rupture d'approvisionnement en eau]], [#block(breakable: false)[50 (31,4 %)]], [#block(breakable: false)[21,2]], [#block(breakable: false)[58,3]], [#block(breakable: false)[50,0]], [#block(breakable: false)[37,5]], [#block(breakable: false)[37,5]], [#block(breakable: false)[20,8]], [#block(breakable: false)[33,3]], [#block(breakable: false)[12,5]],
    [#block(breakable: false)[Rupture de médicaments essentiels]], [#block(breakable: false)[87 (54,4 %)]], [#block(breakable: false)[42,3]], [#block(breakable: false)[100,0]], [#block(breakable: false)[45,8]], [#block(breakable: false)[87,5]], [#block(breakable: false)[62,5]], [#block(breakable: false)[41,7]], [#block(breakable: false)[81,2]], [#block(breakable: false)[25,0]],
    [#block(breakable: false)[Rupture de vaccins]], [#block(breakable: false)[21 (13,2 %)]], [#block(breakable: false)[17,6]], [#block(breakable: false)[8,3]], [#block(breakable: false)[16,7]], [#block(breakable: false)[0,0]], [#block(breakable: false)[6,2]], [#block(breakable: false)[16,7]], [#block(breakable: false)[12,5]], [#block(breakable: false)[0,0]],
    [#block(breakable: false)[Absence prolongée de personnel clé]], [#block(breakable: false)[20 (12,7 %)]], [#block(breakable: false)[15,4]], [#block(breakable: false)[33,3]], [#block(breakable: false)[8,3]], [#block(breakable: false)[25,0]], [#block(breakable: false)[20,0]], [#block(breakable: false)[4,3]], [#block(breakable: false)[0,0]], [#block(breakable: false)[0,0]],
)
#v(4pt)

#para[Les profils provinciaux varient. Au Haut-Lomami, la rupture de médicaments est déclarée dans tous les établissements évalués (100 %) ; cette province affiche la proportion la plus élevée, seule ou à égalité, pour sept des dix événements. Le Sankuru rapporte le taux d’épidémies ou de flambées le plus élevé (37,5 %) et une forte proportion de ruptures de médicaments (81,2 %), sans incident sécuritaire ni mouvement important de population déclaré. Ce profil peut évoquer des difficultés d’approvisionnement moins directement liées à des chocs sécuritaires récents, sans toutefois permettre d’en établir la cause.]

#para[Ces données reposent sur les événements déclarés et doivent être interprétées avec prudence, notamment au Haut-Lomami, où l’échantillon compte 12 établissements. Elles ne permettent pas, à elles seules, d’expliquer les blocages observés lors de la visite : l’absence de signalement d’une rupture récente ne signifie pas qu’un médicament ou un vaccin était disponible au moment de l’évaluation.]

#heading(level: 3)[3.6.15. Perturbations récentes et contraintes observées le jour de la visite]

#para[La comparaison entre les perturbations déclarées pour les trois mois précédant l’enquête et les contraintes opérationnelles constatées lors de la visite montre une correspondance particulièrement forte pour les intrants. Parmi les établissements ayant signalé une rupture de médicaments ou de vaccins, 100 % présentaient au moins une fonction rouge bloquée par les intrants et produits. Toutefois, cette contrainte était également observée dans presque tous les établissements n’ayant déclaré aucune rupture : 71 sur 73 (97,3 %) pour les médicaments et 137 sur 139 (98,6 %) pour les vaccins.]

#para[Une association apparaît aussi pour l’électricité et les ressources humaines, mais elle est moins marquée. Un blocage dans la dimension correspondante était constaté dans 65,8 % des établissements ayant déclaré une panne prolongée d’électricité, contre 50,8 % des autres ; pour les ressources humaines, les proportions étaient de 65,0 % contre 54,3 %. L’eau, l’hygiène et l’assainissement n’étant pas bloquants, la comparaison porte pour cette dimension sur les fonctions jaunes qu’ils fragilisent : 90,0 % des établissements ayant déclaré une rupture d’approvisionnement en eau en comptent au moins une, contre 72,7 % des autres.]

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 8.799999999999999pt, weight: "bold", fill: rgb("#131d44"))[Tableau 26 : Conjoncturel ou structurel : perturbation déclarée et blocage observé]]
#set par(justify: false, leading: 0.62em)
#set text(size: 8.2pt)
#table(
  columns: (0.2259fr, 0.1505fr, 0.0869fr, 0.1359fr, 0.1926fr, 0.2082fr),
  inset: (x: 4.4pt, y: 3.2pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Perturbation déclarée]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Dimension]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Déclarée]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Établissements]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Établissements avec ≥ 1 fonction rouge bloquée par la dimension : n (%)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Lecture]]]),
    [#block(breakable: false)[Rupture de médicaments essentiels]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[Oui]], [#block(breakable: false)[87]], [#block(breakable: false)[87 (100,0 %)]], [#block(breakable: false)[Facteur conjoncturel possible]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Non]], [#block(breakable: false)[73]], [#block(breakable: false)[71 (97,3 %)]], [#block(breakable: false)[Contrainte structurelle probable]],
    [#block(breakable: false)[Rupture de vaccins]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[Oui]], [#block(breakable: false)[21]], [#block(breakable: false)[21 (100,0 %)]], [#block(breakable: false)[Facteur conjoncturel possible]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Non]], [#block(breakable: false)[139]], [#block(breakable: false)[137 (98,6 %)]], [#block(breakable: false)[Contrainte structurelle probable]],
    [#block(breakable: false)[Absence prolongée de personnel]], [#block(breakable: false)[Ressources humaines]], [#block(breakable: false)[Oui]], [#block(breakable: false)[20]], [#block(breakable: false)[13 (65,0 %)]], [#block(breakable: false)[Facteur conjoncturel possible]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Non]], [#block(breakable: false)[140]], [#block(breakable: false)[76 (54,3 %)]], [#block(breakable: false)[Contrainte structurelle probable]],
    [#block(breakable: false)[Panne prolongée d'électricité]], [#block(breakable: false)[Électricité]], [#block(breakable: false)[Oui]], [#block(breakable: false)[38]], [#block(breakable: false)[25 (65,8 %)]], [#block(breakable: false)[Facteur conjoncturel possible]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Non]], [#block(breakable: false)[122]], [#block(breakable: false)[62 (50,8 %)]], [#block(breakable: false)[Contrainte structurelle probable]],
    [#block(breakable: false)[Rupture d'approvisionnement en eau]], [#block(breakable: false)[Eau, hygiène et assainissement (au moins une fonction]], [#block(breakable: false)[Oui]], [#block(breakable: false)[50]], [#block(breakable: false)[45 (90,0 %)]], [#block(breakable: false)[Facteur conjoncturel possible]],
    [#block(breakable: false)[eau]], [#block(breakable: false)[moins une fonction jaune fragilisée)]], [#block(breakable: false)[Non]], [#block(breakable: false)[110]], [#block(breakable: false)[80 (72,7 %)]], [#block(breakable: false)[Contrainte structurelle probable]],
)
#v(4pt)

#para[_Dénominateur : les 160 établissements pour chaque perturbation. Pour l’eau, l’hygiène et l’assainissement, la dernière colonne compte les établissements ayant au moins une fonction jaune fragilisée par cette dimension._]

#para[Ainsi, une perturbation déclarée au cours des trois derniers mois s’accompagne souvent d’une contrainte opérationnelle observable le jour de la visite. Mais l’absence de perturbation déclarée ne signifie pas que la capacité est pleinement opérationnelle : les blocages restent fréquents dans ces établissements. Les deux mesures se rapportent à des périodes différentes et décrivent des aspects complémentaires ; cette comparaison ne permet pas, à elle seule, d’établir un lien de causalité.]

#heading(level: 3)[3.6.16. Interruptions déclarées et contraintes opérationnelles associées]

#para[Les motifs rapportés pour expliquer les interruptions de la CPN, de la CPoN et de la vaccination ne correspondent que partiellement aux blocages observés. Les catégories les plus fréquentes sont le service non offert ou non intégré (14 mentions), les horaires ou jours non ouvrés (13) et l’absence de cause déclarée (13). Les contraintes liées au personnel recueillent 10 mentions et les ruptures d’intrants, de vaccins ou d’approvisionnement, 9.]

#para[Les fonctions associées aux horaires ou aux jours non ouvrés sont toutes classées rouges (13 sur 13). Dans ces cas, le blocage par les intrants est relevé 12 fois ; l’organisation du service, une fois ; et l’électricité, deux fois. Ces dimensions pouvant se cumuler, leurs occurrences ne s’additionnent pas nécessairement au nombre de réponses. De même, parmi les 14 réponses évoquant un service non offert ou non intégré, 13 sont associées à une fonction rouge ; les intrants sont relevés dans 12 cas, les ressources humaines dans 7 et l’organisation du service dans 5. À titre de comparaison, parmi les 9 réponses mentionnant explicitement une rupture d’intrants ou de vaccins, 8 sont associées à un blocage par les intrants.]

#para[Ces résultats font apparaître un décalage entre les motifs formulés par les répondants et les dimensions opérationnelles relevées, mais aussi des recoupements entre ces dimensions. Ils décrivent des associations et ne permettent pas d’établir la cause effective des interruptions. Les réponses libres ayant fait l’objet d’un codage automatique et provisoire, elles doivent être interprétées comme l’expression des perceptions des répondants.]

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 8.0pt, weight: "bold", fill: rgb("#131d44"))[Tableau 27 : Causes déclarées des interruptions et blocages observés de la fonction correspondante]]
#set par(justify: false, leading: 0.62em)
#set text(size: 7.4pt)
#table(
  columns: (0.2408fr, 0.1097fr, 0.1057fr, 0.0720fr, 0.0685fr, 0.0936fr, 0.1408fr, 0.0566fr, 0.1125fr),
  inset: (x: 4.4pt, y: 3.2pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Cause codée]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Réponses]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Fonction observée rouge]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[jaune]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[verte]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Intrants]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Organisation du service]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[RH]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Electricité]]]),
    [#block(breakable: false)[Aucune cause déclarée (RAS, rien, aucune)]], [#block(breakable: false)[13]], [#block(breakable: false)[10]], [#block(breakable: false)[3]], [#block(breakable: false)[0]], [#block(breakable: false)[7]], [#block(breakable: false)[0]], [#block(breakable: false)[1]], [#block(breakable: false)[3]],
    [#block(breakable: false)[Service non offert ou non intégré (PTME, CPoN)]], [#block(breakable: false)[14]], [#block(breakable: false)[13]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[12]], [#block(breakable: false)[5]], [#block(breakable: false)[7]], [#block(breakable: false)[2]],
    [#block(breakable: false)[Horaires, jours non ouvrés, chevauchement d'activités]], [#block(breakable: false)[13]], [#block(breakable: false)[13]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[12]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[2]],
    [#block(breakable: false)[Rupture d'intrants, vaccins ou approvisionnement]], [#block(breakable: false)[9]], [#block(breakable: false)[9]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[8]], [#block(breakable: false)[1]], [#block(breakable: false)[2]], [#block(breakable: false)[2]],
    [#block(breakable: false)[Personnel : absence, insuffisance, mobilité, formation]], [#block(breakable: false)[10]], [#block(breakable: false)[8]], [#block(breakable: false)[2]], [#block(breakable: false)[0]], [#block(breakable: false)[7]], [#block(breakable: false)[1]], [#block(breakable: false)[1]], [#block(breakable: false)[1]],
    [#block(breakable: false)[Financement, primes, salaires, coût]], [#block(breakable: false)[1]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Équipement, matériel, maintenance]], [#block(breakable: false)[1]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[1]], [#block(breakable: false)[1]], [#block(breakable: false)[1]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Accès, transport, sécurité, climat]], [#block(breakable: false)[8]], [#block(breakable: false)[7]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[7]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[3]],
    [#block(breakable: false)[Demande, comportement des usagers, communauté]], [#block(breakable: false)[4]], [#block(breakable: false)[3]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[2]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Organisation, supervision, planification]], [#block(breakable: false)[7]], [#block(breakable: false)[7]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[7]], [#block(breakable: false)[2]], [#block(breakable: false)[3]], [#block(breakable: false)[3]],
)
#v(4pt)

#heading(level: 3)[3.6.17. Variations provinciales et zonales des blocages]

#para[La répartition des dimensions associées aux fonctions rouges diffère selon les provinces. Au Sankuru, les blocages concernent surtout les équipements (72 %) et les intrants et produits (67 %) ; la référence (47 %) et l’organisation du service (31 %) y sont également présentes. Au Kasaï-]

#para[Oriental, les ressources humaines représentent une part relativement élevée des blocages (23 %), tandis que l’organisation du service n’en concerne que 4 %.]

#para[La référence se distingue au Tanganyika : elle concerne 56 % des fonctions rouges, dépassant les équipements (48 %) et les intrants (42 %). Pour la communication, la proportion atteint 16 % au Sankuru et 15 % au Kasaï-Central ; elle est donc notable dans ces deux provinces. Les dimensions systémiques restent moins souvent associées aux fonctions rouges : l’intégration des services atteint au plus 6 %, les données sanitaires 4 % et la surveillance épidémiologique 3 %.]

#para[Ces pourcentages décrivent la part des fonctions rouges associée à chaque dimension dans les provinces évaluées ; plusieurs dimensions pouvant concerner une même fonction, ils ne s’additionnent pas. Les effectifs provinciaux étant parfois faibles, notamment au Kasaï-Oriental et au Tanganyika, ces écarts servent de repères descriptifs et ne constituent pas un classement des provinces.]


#block(width: 100%, above: 11pt, below: 3pt, breakable: false,
  block(width: 100%, fill: rgb("#fffbf7"), radius: 12pt, stroke: 1.1pt + rgb("#0f1015"), inset: 7pt,
    align(center, image("/home/user/Rp/assets/img/image22.png", width: 15.9cm))))
#fig-cap[Figure 19 : Profil des dimensions bloquantes par province]

#heading(level: 3)[3.6.18. Concentration des blocages à l’échelle des zones de santé]

#para[Dans 16 des 40 zones de santé, au moins trois établissements sur quatre partagent la même dimension bloquante dominante. Ce regroupement concerne des zones réparties dans sept des huit provinces et peut signaler des contraintes communes à l’échelle locale, sans en établir l’origine. Les intrants et produits constituent la dimension dominante la plus fréquente dans cinq provinces : Haut-Katanga, Kasaï-Central, Kasaï-Oriental, Lomami et Lualaba. Les équipements dominent au Haut-Lomami et au Sankuru ; la référence, au Tanganyika.]

#para[La concentration est particulièrement marquée au Haut-Lomami, où deux des trois zones répondent au seuil retenu et où la part moyenne indiquée est de 83,3 %. À l’inverse, aucune des deux zones du Tanganyika ne l’atteint, bien que la référence soit la dimension dominante la plus fréquente dans cette province. Ce contraste montre qu’un profil provincial peut masquer des différences entre zones. Les effectifs étant limités dans plusieurs provinces, ces résultats constituent des repères descriptifs plutôt qu’un classement.]

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 8.799999999999999pt, weight: "bold", fill: rgb("#131d44"))[Tableau 28 : Constance intra-zone de la dimension bloquante dominante]]
#set par(justify: false, leading: 0.62em)
#set text(size: 8.2pt)
#table(
  columns: (0.1798fr, 0.0800fr, 0.3201fr, 0.1401fr, 0.2801fr),
  inset: (x: 4.4pt, y: 3.2pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Province]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Zones]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Zones où ≥ 3 établissements sur 4 partagent la dimension dominante]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Part moyenne (%)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Dimension dominante la plus fréquente]]]),
    [#block(breakable: false)[Haut-Katanga]], [#block(breakable: false)[13]], [#block(breakable: false)[4]], [#block(breakable: false)[57,7]], [#block(breakable: false)[Intrants et produits]],
    [#block(breakable: false)[Haut-Lomami]], [#block(breakable: false)[3]], [#block(breakable: false)[2]], [#block(breakable: false)[83,3]], [#block(breakable: false)[Équipements]],
    [#block(breakable: false)[Kasaï-Central]], [#block(breakable: false)[6]], [#block(breakable: false)[1]], [#block(breakable: false)[54,2]], [#block(breakable: false)[Intrants et produits]],
    [#block(breakable: false)[Kasaï-Oriental]], [#block(breakable: false)[2]], [#block(breakable: false)[1]], [#block(breakable: false)[62,5]], [#block(breakable: false)[Intrants et produits]],
    [#block(breakable: false)[Lomami]], [#block(breakable: false)[4]], [#block(breakable: false)[3]], [#block(breakable: false)[75,0]], [#block(breakable: false)[Intrants et produits]],
    [#block(breakable: false)[Lualaba]], [#block(breakable: false)[6]], [#block(breakable: false)[3]], [#block(breakable: false)[62,5]], [#block(breakable: false)[Intrants et produits]],
    [#block(breakable: false)[Sankuru]], [#block(breakable: false)[4]], [#block(breakable: false)[2]], [#block(breakable: false)[68,8]], [#block(breakable: false)[Équipements]],
    [#block(breakable: false)[Tanganyika]], [#block(breakable: false)[2]], [#block(breakable: false)[0]], [#block(breakable: false)[50,0]], [#block(breakable: false)[Référence]],
)
#v(4pt)

#para[_Dimension dominante d’un établissement : dimension bloquante la plus fréquente parmi ses fonctions rouges. La part moyenne est la moyenne, sur les zones de la province, de la part des établissements partageant la dimension dominante de la zone. La dimension la plus fréquente est comptée en zones ; elle peut différer de la dimension qui bloque le plus de fonctions rouges dans la province, comme au Haut-Katanga._]

#heading(level: 3)[3.6.19. Analyse causale des goulots d'étranglement]

#para[La matrice présentée dans cette section synthétise les contraintes prioritaires du diagnostic, leur ampleur, leurs causes profondes, les stratégies de mitigation envisagées et les acteurs appelés à intervenir. L’ampleur des contraintes repose sur les données recueillies auprès des 160 établissements. Les causes profondes et les pistes de réponse ont été discutées avec les 40 ECZ, puis les actions proposées et la répartition des responsabilités entre les partenaires techniques et financiers, le niveau central, les DPS, les ECZ et les établissements ont été examinées avec les huit DPS, en tenant compte du contexte réglementaire et budgétaire de chaque province.]

#para[Les échanges ont mis en évidence des causes principalement systémiques : maintenance insuffisamment budgétisée, quantification des besoins peu liée à la consommation réelle, transport d’urgence reposant sur les familles et absence de personnel dédié à la nutrition. La matrice constitue ainsi un support de dialogue entre les acteurs concernés et EpiC RDC pour adapter les réponses aux réalités locales ; elle ne propose pas une liste uniforme de recommandations à appliquer dans toutes les provinces.]

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 9.6pt, weight: "bold", fill: rgb("#131d44"))[Tableau 29 : Synthèse des goulots opérationnels, de leurs conséquences et des risques sanitaires associés]]
#set par(justify: false, leading: 0.62em)
#set text(size: 9.0pt)
#table(
  columns: (0.1527fr, 0.3264fr, 0.2529fr, 0.2681fr),
  inset: (x: 4.4pt, y: 3.2pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Goulot]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Facteurs bloquants observés]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Conséquence opérationnelle]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Impact potentiel sur la santé (non mesuré)]]]),
    [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[La quantification des besoins est peu fondée sur la consommation réelle et le suivi des stocks reste parfois documentaire. Le kit d’accouchement est classé rouge dans 127 établissements sur 160 (79,4 %), le sulfate de magnésium dans 98 sur 160 (61,2 %), et l’ATPE est indisponible dans 87 CS sur 101 (86,1 %).]], [#block(breakable: false)[Certaines fonctions de prévention et de prise en charge, notamment l’accouchement, la prise en charge de la pré-éclampsie et les soins nutritionnels ; ne peuvent être assurées sur place ou reposent sur des achats à la charge des ménages.]], [#block(breakable: false)[Retards ou impossibilité de traiter certaines complications obstétricales et certains cas de malnutrition ; risque accru de complications ou décès maternels et infantiles.]],
    [#block(breakable: false)[Équipements]], [#block(breakable: false)[L’absence est plus fréquente que la panne et la maintenance est insuffisamment budgétisée. Les classements rouges concernent notamment la balance (77,5 %), l’appareil d’aspiration (76,2 %) et la source de chaleur (68,7 %). La réanimation néonatale est rouge dans 87,5 % des établissements.]], [#block(breakable: false)[La réanimation du nouveau-né, le dépistage nutritionnel et le suivi de la croissance sont compromis ; certaines fonctions ne peuvent être assurées dans des conditions opérationnelles adéquates.]], [#block(breakable: false)[Risque accru de complications ou décès néonataux, notamment liés à l’asphyxie ou à l’hypothermie, et de détection tardive des problèmes nutritionnels.]],
    [#block(breakable: false)[Circuit de référence]], [#block(breakable: false)[Le transport est absent ou non fonctionnel dans 65,6 % des établissements ; son coût est cité par 77,2 % des CS. L’absence de communication préalable est signalée par 84,7 % des structures d’accueil. Parmi les destinations appariées, la fonction césarienne est rouge dans 67 cas sur 82 (81,7 %).]], [#block(breakable: false)[Les références peuvent être retardées ou ne pas aboutir ; les patients arrivent tardivement et la prise en charge à destination demeure incertaine. La référence ne garantit pas que la structure d’accueil pourra assurer le soin requis.]], [#block(breakable: false)[Retards supplémentaires dans l’accès aux soins et risque accru de complications ou de décès lors d’urgences obstétricales, néonatales et médicales.]],
    [#block(breakable: false)[Eau, hygiène et électricité]], [#block(breakable: false)[Les points d’eau fonctionnels dans les services sont classés rouges dans 57,3 % des établissements ; la source électrique de secours, dans 49,0 %. Les responsabilités de maintenance sont insuffisamment définies. La chaîne du froid est rouge dans 78,0 % des cas.]], [#block(breakable: false)[Les conditions d’hygiène et de prévention des infections sont limitées ; les activités obstétricales, chirurgicales ou néonatales peuvent être perturbées et la conservation des vaccins fragilisée.]], [#block(breakable: false)[Risque accru d’infections maternelles et néonatales et de perte de qualité des vaccins, susceptible de réduire la protection conférée par la vaccination.]],
    [#block(breakable: false)[Ressources humaines et organisation]], [#block(breakable: false)[Aucun nutritionniste n’est déclaré dans 94,1 % des CS et aucune sage-femme dans 53,5 %. La supervision est insuffisamment financée et certaines formations concernent davantage les niveaux de référence que les CS.]], [#block(breakable: false)[La malnutrition aiguë compliquée est rouge dans 90,6 % des cas; le dépistage ne débouche pas toujours sur une prise en charge et les fonctions fragiles restent difficiles à stabiliser.]], [#block(breakable: false)[Des enfants dépistés peuvent ne pas recevoir les soins nécessaires. Cette rupture de prise en charge peut compromettre la continuité et la qualité des soins et accroître le risque de décès liés à la malnutrition aiguë sévère.]],
    [#block(breakable: false)[Données et surveillance]], [#block(breakable: false)[Les outils et la transmission des données constituent un point de rupture, avec environ 31 % de classements rouges. La connexion dépend parfois des partenaires. L’offre déclarée peut différer de la capacité observée : 97 des 98 CS déclarant offrir la réanimation néonatale ne réunissent pas les conditions nécessaires.]], [#block(breakable: false)[Les données de routine peuvent être incomplètes ou difficiles à transmettre ; la capacité opérationnelle risque d’être surestimée, ce qui complique le ciblage des mesures correctrices.]], [#block(breakable: false)[Risque de détecter tardivement les ruptures, les flambées épidémiques et les besoins prioritaires, puis de prendre des décisions fondées sur des informations incomplètes, au détriment de l’efficacité et de l’utilisation efficiente des ressources.]],
)
#v(4pt)

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 8.799999999999999pt, weight: "bold", fill: rgb("#131d44"))[Tableau 30 : Matrice consolidée d'analyse et de correction des goulots d'étranglement, par contrainte transversale]]
#set par(justify: false, leading: 0.62em)
#set text(size: 8.2pt)
#table(
  columns: (0.1520fr, 0.1275fr, 0.1557fr, 0.2512fr, 0.2269fr, 0.0866fr),
  inset: (x: 4.4pt, y: 3.2pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Domaines des goulots]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Fonctions concernées]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Cause profonde plausible]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Stratégies de mitigation]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Action correctrice prioritaire et suivi]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Acteurs principaux]]]),
    [#block(breakable: false)[Équipements]], [#block(breakable: false)[Réanimation néonatale; soins du nouveau-né; référence urgente; MAPI; CPoN mère; dépistage nutritionnel.]], [#block(breakable: false)[Les acquisitions sont insuffisamment reliées à l’analyse des besoins par fonction, à la vérification de l’installation et à un budget couvrant entretien, réparation et renouvellement. L’absence d’équipement domine les pannes, ce qui suggère aussi un déficit de dotation.]], [#block(breakable: false)[Priorisation des kits fonctionnels complets selon le paquet de soins de chaque niveau. Association de chaque acquisition à un plan de maintenance préventive et à des ressources de réparation. Organisation de l’appui biomédical de proximité et former des relais à l’entretien de premier niveau.]], [#block(breakable: false)[Réaliser un inventaire fonctionnel par établissement et prioriser la dotation des kits complets de réanimation néonatale dans les établissements résentant des défaillances critiques immédiates Réparer les appareils récupérables et compléter les kits manquants Mise en place d'un contrat de maintenance biomédicale itinérant à l'échelle provinciale Suivi : proportion d’équipements prioritaires fonctionnels et interventions de maintenance consignées.]], [#block(breakable: false)[PTF; DPS; ECZ; ESS; MSPHPS.]],
    [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[Accouchement normal; pré-éclampsie; CPoN mère; grossesse à risque; MAPI; prise en charge de la malnutrition aiguë.]], [#block(breakable: false)[La quantification est insuffisamment fondée sur la consommation et les niveaux de stock. Les alertes de rupture, la visibilité des stocks jusqu’à l’établissement et la redistribution entre structures ne sont pas assez régulières pour anticiper les besoins.]], [#block(breakable: false)[Quantification à partir de la consommation, des stocks disponibles et des besoins saisonniers. Dotation ciblée et prioritaire sur les quatre éléments critiques d'urgence. Renforcement du suivi des stocks et la détection précoce des risques de rupture en combinant des outils numériques avec des supports simples utilisables hors ligne dans les établissements isolés. Organisation de la redistribution et du stock tampon adapté pour les produits vitaux et nutritionnels.]], [#block(breakable: false)[Actualiser les besoins des établissements prioritaires Dotation d'urgence des quatre éléments critiques dans les établissements à menace immédiate, complétée d'un stock tampon de trois mois Mettre en place une remontée mensuelle des stocks avec seuils d’alerte et mécanisme de redistribution. Suivi : ruptures rapportées, jours de disponibilité et respect des délais de réapprovisionnement.]], [#block(breakable: false)[MSPHPS; DPS; ECZ; ESS; PTF.]],
    [#block(breakable: false)[Circuit de référence]], [#block(breakable: false)[Référence urgente; grossesse à risque; CPoN mère et nouveau-né; paludisme grave; césarienne d’urgence; transfusion.]], [#block(breakable: false)[Le transport d’urgence repose largement sur les ménages, sans mécanisme stable de financement ni organisation locale. Le contact préalable et la coordination entre structures sont irréguliers ; la préparation de la destination n’est pas systématiquement confirmée avant la référence.]], [#block(breakable: false)[Formalisation du circuit de référence et de contre-référence en précisant les rôles, les responsabilités et les coordonnées des structures concernées. Conclusion des conventions avec des transporteurs locaux, y compris des motos-ambulances, selon des modalités de rémunération forfaitaires. Mise en place d’un mécanisme communautaire de prise en charge financière du transport des patients. Systématisation du contact préalable entre la structure référente et la structure d’accueil afin de préparer la réception du patient. Plaidoyer pour l’intégration du transport d’urgence au paquet de prestations remboursables du FSS.]], [#block(breakable: false)[Établir et actualiser un répertoire des transports et des destinations par zone; Formaliser des accords avec les transporteurs; Définir un mécanisme d’aide au transport pour les urgences. Utiliser une fiche de suivi des appels préalables, références réalisées et retours d’information.]], [#block(breakable: false)[MSPHPS; DPS; ECZ; ESS; PTF.]],
    [#block(breakable: false)[Eau, hygiène et assainissement]], [#block(breakable: false)[Accouchement normal; hémorragie du post-partum; sepsis obstétrical; césarienne d’urgence; réanimation néonatale; soins du nouveau-né.]], [#block(breakable: false)[La responsabilité de l’entretien est partagée ou peu claire entre l’établissement, la zone, la province et les partenaires. Les investissements en infrastructures ne sont pas toujours accompagnés d’un financement récurrent, d’un responsable désigné et d’un dispositif de maintenance.]], [#block(breakable: false)[Diagnostic technique rapide des points d'eau réparables à faible coût. Intégrer de l’entretien WASH dans les plans et budgets de la zone et appliquer une démarche de suivi des risques Désignation d'un référent WASH par établissement Application du cadre WASH-FIT de l’OMS]], [#block(breakable: false)[Cartographier les points d’eau et les pannes, Réparer en priorité les installations des services essentiels, Désigner un responsable Inscrire les coûts d’entretien dans le plan de la zone. Suivi : fonctionnalité des points d’eau dans les services et tenue d’un registre d’entretien.]], [#block(breakable: false)[MSPHPS; DPS; ECZ; ESS; PTF autorités locales selon le contexte.]],
    [#block(breakable: false)[Électricité]], [#block(breakable: false)[Chaîne du froid; vaccination de routine; réanimation néonatale; césarienne d’urgence; transfusion; paludisme grave.]], [#block(breakable: false)[L’énergie de secours et son entretien ne sont pas systématiquement intégrés aux coûts de fonctionnement des établissements. Les solutions financées par projet peuvent manquer de maintenance, de pièces ou de responsable après leur installation.]], [#block(breakable: false)[Dotation de kits solaires légers ciblés sur la chaîne du froid et les fonctions d'urgence. Intégration du contrat de maintenance énergétique couplé aux équipements biomédicaux. Priorisation des établissements de vaccination. .]], [#block(breakable: false)[Évaluer la disponibilité et l’état des sources de secours, Doter de kits solaires légers pour la chaine de froid Etablir un contrat de maintenance énergétique avec les équipements biomédicaux Réparer ou doter en priorité les sites où la chaîne du froid ou les soins vitaux sont compromis. Tenir un registre d’entretien et vérifier les températures de conservation. Suivi : fonctionnalité de la source de secours et conformité des relevés de température.]], [#block(breakable: false)[MSPHPS; DPS; ECZ; ESS; PTF.]],
    [#block(breakable: false)[Ressources humaines]], [#block(breakable: false)[Dépistage et prise en charge nutritionnels; CPN; accouchement assisté; soins postnatals; PTME.]], [#block(breakable: false)[La répartition et les profils du personnel ne correspondent pas toujours aux besoins du paquet de services. La nutrition est peu inscrite dans les postes et plans de dotation des CS ; la formation et le mentorat atteignent moins régulièrement le premier niveau de soins.]], [#block(breakable: false)[Formation courte et certifiante d'un agent polyvalent déjà en poste. Plaidoyer pour un point focal nutrition par centre de santé. Mentorat à distance par les CSR et HGR mieux dotés. Suivi de la présence effective, pas seulement de l'affectation théorique]], [#block(breakable: false)[Cartographier, avec la DPS, les effectifs et les compétences disponibles dans chaque établissement. Dans les CS dépourvus de nutritionniste, désigner un agent polyvalent comme point focal nutrition et lui proposer une formation courte certifiante. À partir de cette cartographie, établir un plan de redéploiement, de recrutement ou de mentorat pour combler les autres lacunes. Suivi : présence effective du personnel et disponibilité des compétences ciblées.]], [#block(breakable: false)[MSPHPS; DPS; ECZ; ESS; PTF.]],
    [#block(breakable: false)[Organisation du service]], [#block(breakable: false)[Référence urgente; dépistage nutritionnel; malnutrition aiguë compliquée et non compliquée; données sanitaires; continuité des services.]], [#block(breakable: false)[La supervision clinique et l’organisation des services ne disposent pas toujours d’un calendrier financé et d’outils de suivi. Les visites peuvent privilégier le contrôle administratif, sans accompagnement régulier sur les protocoles, la continuité ou la résolution des problèmes.]], [#block(breakable: false)[Grille de supervision formative ciblée, distincte du contrôle administratif. Calendrier de supervision trimestriel budgétisé. Mentorat clinique entre pairs au sein de la zone. Traitement systématique en combinaison avec d'autres leviers, cette dimension n'agissant que très rarement seule comme dernière contrainte.]], [#block(breakable: false)[Programmer et budgétiser des supervisions formatives trimestrielles ciblées, avec un plan de suivi des écarts et des responsables désignés. Suivi : visites réalisées, problèmes documentés et actions correctrices clôturées.]], [#block(breakable: false)[ECZ; ESS; DPS; PTF selon les besoins de financement.]],
    [#block(breakable: false)[Communication]], [#block(breakable: false)[Référence urgente; grossesse à risque; paludisme grave; MAPI; surveillance épidémiologique.]], [#block(breakable: false)[Les moyens de communication et les coûts récurrents (crédit, recharge, entretien) ne sont pas toujours prévus dans le fonctionnement courant. Dans certaines zones, l’absence de réseau rend une solution unique inadaptée.]], [#block(breakable: false)[Financement d’un moyen de communication de service et son crédit. Prévision d’une solution de remplacement adaptée (ex. radio communautaire) aux zones sans couverture. Intégration d’un indicateur de suivi de la continuité de communication dans le tableau de bord de la communication]], [#block(breakable: false)[Vérifier les moyens disponibles dans chaque structure et établir une liste de contacts fonctionnelle entre structures référentes et destinations. Fournir téléphone ou crédit selon le besoin et définir un relais hors réseau. Suivi : continuité de la communication au tableau de bord de la zone]], [#block(breakable: false)[ESS; ECZ; DPS; PTF.]],
    [#block(breakable: false)[Intégration des services]], [#block(breakable: false)[CPN \+ PTME; intégration des services; dépistage et référence des femmes et des enfants.]], [#block(breakable: false)[La planification, les indicateurs et les responsabilités restent souvent organisés par programme. Les parcours de soins intégrés ne sont pas toujours traduits en étapes communes, en outils de coordination et en disponibilité simultanée des intrants.]], [#block(breakable: false)[Définition du parcours intégré au point de prestation, avec rôles et étapes simples. Traitement conjoint des besoins d’intrants qui interrompent le parcours Protocole local de couplage systématique CPN-PTME au point de service. Indicateur d'intégration suivi conjointement par les points focaux programmes. .]], [#block(breakable: false)[Adopter et appliquer dans les structures concernées un protocole local opérationnel CPN-PTME précisant dépistage, offre, référence et documentation. Organiser une revue conjointe mensuelle des cas et des ruptures. Suivi : proportion de contacts où les prestations intégrées attendues sont documentées.]], [#block(breakable: false)[ECZ; DPS; niveau central; ESS.]],
    [#block(breakable: false)[Données sanitaires]], [#block(breakable: false)[Données sanitaires; fonctions de routine documentées dans les registres et rapports.]], [#block(breakable: false)[Le système valorise davantage la production et la transmission des rapports que leur validation et leur utilisation locale. Les outils, la connectivité et l’accompagnement à l’analyse ne sont pas systématiquement disponibles ; La déclaration de l’offre n’est pas toujours rapprochée des conditions opérationnelles.]], [#block(breakable: false)[Disponibilité assurée des outils de collecte et d’analyse des données Réunion mensuelle de revue des données animée par le titulaire Usage local des données comme critère explicite de supervision]], [#block(breakable: false)[Instaurer une revue mensuelle des données dans chaque structure, avec vérification de complétude/cohérence et un registre de décisions. Lors des supervisions, vérifier sur place un échantillon de services déclarés et documenter les écarts. Suivi : revues tenues, outils disponibles et actions issues des données.]], [#block(breakable: false)[ESS; ECZ; DPS; PTF pour l’appui technique.]],
    [#block(breakable: false)[Surveillance épidémiologique]], [#block(breakable: false)[Surveillance épidémiologique ; notification des maladies à potentiel épidémique ; MAPI.]], [#block(breakable: false)[La continuité de la notification dépend des outils, de l’accès au réseau et de responsabilités locales clairement attribuées. Les dispositifs de remplacement en cas de panne ou d’absence de connexion ne sont pas uniformément organisés. Le déploiement de la connectivité suit les projets des partenaires]], [#block(breakable: false)[Désignation d’un point focal et d’un suppléant dans chaque structure. Maintenance des canevas papier de secours et formaliser une transmission alternative, par exemple par SMS structuré lorsque possible. Test périodique de la chaîne d’alerte avec la zone.]], [#block(breakable: false)[Mettre à disposition les canevas de notification, afficher les contacts d’alerte et définir la transmission de secours pour les périodes sans réseau. Vérifier lors des supervisions la disponibilité des outils et la traçabilité des alertes. Suivi : délai de notification et proportion de structures disposant d’un mécanisme de secours opérationnel.]], [#block(breakable: false)[ESS; ECZ; DPS; partenaires d’appui selon les besoins.]],
)
#v(4pt)

#heading(level: 2)[3.7. Priorités d'investissement]


#block(width: 100%, above: 11pt, below: 9pt, breakable: false,
  block(width: 100%, fill: rgb("#fffbf7"), radius: 12pt, stroke: 1.4pt + black, inset: (x: 13pt, y: 11pt))[
    #text(font: "DejaVu Sans", size: 14pt, fill: rgb("#131d44"))[★]
    #v(-4pt)
    #text(size: 7.2pt, tracking: 2.4pt, fill: rgb("#5166b7"))[#upper[À retenir]]
    #v(1pt)
    #block(above: 3pt, below: 9pt)[#text(size: 11.2pt, weight: "bold", fill: rgb("#131d44"))[Défaillance généralisée des fonctions vitales : six fonctions vitales sont classées rouges dans plus de 80 % des établissements, et ce dans les huit provinces.]]
    #text(size: 9.2pt, fill: rgb("#0f1015"))[Blocages concentrés : dix éléments critiques six intrants et quatre équipements concentrent l’essentiel des blocages des fonctions vitales. Nécessité d’une réponse combinée : aucun levier pris isolément ne permet de corriger plus d’environ 13 % des fonctions rouges ; l’action combinée sur les intrants, les équipements et la référence permettrait d’en lever 62,0 %. Fort effet de synergie : combinés, les intrants et les équipements permettent de libérer 261 fonctions supplémentaires par rapport à la somme de leurs effets lorsqu’ils sont considérés séparément. Des gains rapides sont possibles localement : dans 15 zones de santé, l’action sur un seul levier permettrait de corriger 17 à 40 % des fonctions rouges. Priorités différenciées selon les provinces : les intrants constituent le premier levier dans sept provinces sur huit, tandis qu’au Tanganyika, la référence représente le levier prioritaire]
  ])

#para[Cette section traduit les résultats du diagnostic en priorités d’investissement, afin d’orienter la décision et l’allocation des ressources vers les interventions susceptibles de produire les gains opérationnels les plus importants. Elle identifie les défaillances à traiter en priorité, les actions à effet rapide, les leviers nécessitant des investissements à moyen terme, ainsi que leur déclinaison par province et par zone de santé. Les effets associés aux différents leviers reposent sur des simulations : ils indiquent le potentiel théorique de réduction des fonctions rouges et doivent être interprétés comme des ordres de grandeur pour guider la priorisation, et non comme des estimations de l’impact réel des interventions.]

#heading(level: 3)[3.7.1. Défaillances opérationnelles prioritaires]

#para[Six fonctions vitales présentent une défaillance critique dans plus de huit établissements sur dix, dans l’ensemble des huit provinces. La prise en charge des grossesses à risque est la plus affectée (91,9 % de fonctions rouges), suivie de la malnutrition aiguë compliquée (90,6 %) et des MAPI (90,2 %) ; pour les trois autres, la réanimation néonatale, la pré-éclampsie et le paludisme grave, la proportion de rouge est comprise entre 81,9 % et 87,5 %.]

#para[La nature du principal blocage varie selon les fonctions : ressources humaines pour la malnutrition aiguë compliquée ; équipements pour la réanimation néonatale et le paludisme grave ; intrants pour les grossesses à risque, les MAPI et la pré-éclampsie. Les urgences obstétricales, encore rouges dans 69 % à 76 % des cas, relèvent d’abord de la référence pour l’hémorragie du post-partum et le sepsis obstétrical, et des intrants pour la césarienne d’urgence. Toutefois, ces défaillances sont le plus souvent cumulatives : la correction d’un seul blocage suffit rarement à rendre la fonction opérationnelle. Les investissements doivent donc privilégier des paquets combinés répondant simultanément aux principaux goulots qui affectent chaque fonction vitale.]

#heading(level: 3)[3.7.2. Priorités immédiates : combler les déficits critiques en intrants et équipements (0–3 mois)]

#para[Les priorités d'investissement sont classées selon leur délai de mise en œuvre et les conditions requises pour leur exécution. Sont considérées comme immédiates (0–3 mois) les actions pouvant être engagées à travers les circuits, ressources et acteurs existants, sans réforme structurelle ni investissement lourd ; elles concernent principalement la mise à disposition d'intrants et d'équipements prioritaires ainsi que certaines mesures d'organisation. Les interventions de moyen terme (3–12 mois) sont celles qui nécessitent des financements nouveaux, des procédures contractuelles, des dispositions réglementaires ou une réorganisation durable des services. L'analyse met en évidence une forte concentration des blocages sur un nombre limité d'intrants et d'équipements. Quatorze éléments prioritaires expliquent une part importante de l'indisponibilité des fonctions vitales et constituent, à ce titre, les premières cibles d'une action rapide. Les déficits les plus étendus concernent le kit d'accouchement à usage unique, absent dans 127 des 160 établissements évalués (79,4 %), la balance, manquante dans 124 établissements (77,5 %), et la source de chaleur pour la réanimation néonatale, indisponible dans 110 établissements (68,7 %). Le kit anti-choc ou chariot d'urgence pour la prise en charge des MAPI fait défaut dans 99 des 123 établissements où il est requis (80,5 %), soit la proportion la plus élevée parmi les quatorze éléments.]

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 8.799999999999999pt, weight: "bold", fill: rgb("#131d44"))[Tableau 31 : Intrants et équipements prioritaires les plus souvent manquants pour les fonctions vitales (tous niveaux)]]
#set par(justify: false, leading: 0.62em)
#set text(size: 8.2pt)
#table(
  columns: (0.3079fr, 0.2430fr, 0.0593fr, 0.1697fr, 0.2201fr),
  inset: (x: 4.4pt, y: 3.2pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Élément prioritaire]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Fonctions ciblées]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[N]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Classé rouge n (%)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Province¹]]]),
    [#block(breakable: false)[Kit d’accouchement à usage unique]], [#block(breakable: false)[Accouchement normal]], [#block(breakable: false)[160]], [#block(breakable: false)[127 (79,4 %)]], [#block(breakable: false)[Haut-Katanga]],
    [#block(breakable: false)[Balance]], [#block(breakable: false)[Malnutrition aiguë compliquée]], [#block(breakable: false)[160]], [#block(breakable: false)[124 (77,5 %)]], [#block(breakable: false)[Haut-Katanga]],
    [#block(breakable: false)[Source de chaleur]], [#block(breakable: false)[Réanimation néonatale]], [#block(breakable: false)[160]], [#block(breakable: false)[110 (68,7 %)]], [#block(breakable: false)[Haut-Lomami]],
    [#block(breakable: false)[Kit anti-choc ou chariot d’urgence]], [#block(breakable: false)[MAPI]], [#block(breakable: false)[123]], [#block(breakable: false)[99 (80,5 %)]], [#block(breakable: false)[Haut-Lomami]],
    [#block(breakable: false)[Sulfate de magnésium]], [#block(breakable: false)[Pré-éclampsie]], [#block(breakable: false)[160]], [#block(breakable: false)[98 (61,2 %)]], [#block(breakable: false)[Lomami]],
    [#block(breakable: false)[Gants]], [#block(breakable: false)[Accouchement assisté et réanimation néonatale]], [#block(breakable: false)[160]], [#block(breakable: false)[91 (56,9 %)]], [#block(breakable: false)[Haut-Lomami]],
    [#block(breakable: false)[Bandelettes urinaires]], [#block(breakable: false)[Grossesse à risque]], [#block(breakable: false)[123]], [#block(breakable: false)[90 (73,1 %)]], [#block(breakable: false)[Haut-Lomami]],
    [#block(breakable: false)[Méthyldopa]], [#block(breakable: false)[Grossesse à risque]], [#block(breakable: false)[123]], [#block(breakable: false)[89 (72,3 %)]], [#block(breakable: false)[Haut-Lomami]],
    [#block(breakable: false)[Appareil d’aspiration des mucosités du nouveau-né et sondes]], [#block(breakable: false)[Réanimation néonatale]], [#block(breakable: false)[101]], [#block(breakable: false)[77 (76,2 %)]], [#block(breakable: false)[Sankuru]],
    [#block(breakable: false)[Espace de réanimation du nouveau-né à proximité du lit]], [#block(breakable: false)[Réanimation néonatale]], [#block(breakable: false)[160]], [#block(breakable: false)[68 (42,5 %)]], [#block(breakable: false)[Sankuru]],
    [#block(breakable: false)[Ampicilline]], [#block(breakable: false)[Sepsis obstétrical]], [#block(breakable: false)[160]], [#block(breakable: false)[64 (40,0 %)]], [#block(breakable: false)[Sankuru]],
    [#block(breakable: false)[Ballon auto-gonflable et masque de taille néonatale]], [#block(breakable: false)[Réanimation néonatale]], [#block(breakable: false)[160]], [#block(breakable: false)[56 (35,0 %)]], [#block(breakable: false)[Sankuru]],
    [#block(breakable: false)[Ocytocine]], [#block(breakable: false)[Hémorragie du post-partum]], [#block(breakable: false)[160]], [#block(breakable: false)[23 (14,4 %)]], [#block(breakable: false)[Sankuru]],
    [#block(breakable: false)[Artésunate injectable]], [#block(breakable: false)[Paludisme grave]], [#block(breakable: false)[59]], [#block(breakable: false)[14 (23,7 %)]], [#block(breakable: false)[Haut-Lomami]],
)
#v(4pt)

#para[Plusieurs médicaments et consommables essentiels présentent également des déficits majeurs. Le sulfate de magnésium, indispensable à la prise en charge de la pré-éclampsie et de l'éclampsie, manque dans 98 établissements sur 160 (61,2 %), tandis que les gants sont indisponibles dans 91 établissements (56,9 %), ce qui compromet notamment l'accouchement assisté et la réanimation néonatale. Parmi les 123 établissements concernés, les bandelettes urinaires manquent dans 90 (73,1 %) et la méthyldopa dans 89 (72,3 %), limitant la détection et la prise en charge des grossesses à risque. L'ampicilline, nécessaire à la prise en charge du sepsis obstétrical, est absente dans 64 établissements sur 160 (40,0 %).]

#para[Deux médicaments présentent des déficits moins étendus, mais touchent des urgences où tout retard de traitement engage le pronostic vital. L'ocytocine, indispensable face à l'hémorragie du post-partum, manque dans 23 établissements sur 160 (14,4 %), et l'artésunate injectable, traitement du paludisme grave, dans 14 des 59 établissements où il est requis (23,7 %). Les déficits en équipements de réanimation néonatale appellent également une attention immédiate. Outre l'absence fréquente de source de chaleur, l'appareil d'aspiration des mucosités et ses sondes manquent dans 77 des 101 établissements où ils sont requis (76,2 %), et 68 établissements sur 160 (42,5 %) ne disposent pas d'un espace de réanimation du nouveau-né à proximité du lit. Le ballon auto-gonflable avec masque de taille néonatale fait défaut dans 56 établissements (35,0 %). Ces déficits cumulés contribuent à expliquer le niveau particulièrement élevé de fonctions rouges observé pour la réanimation néonatale.]

#para[La distribution géographique de ces manques montre par ailleurs que les priorités gagnent à être ciblées par territoire plutôt qu'uniformes. Les déficits maximaux se concentrent dans deux provinces, qui regroupent onze des quatorze éléments : le Haut-Lomami pour la source de chaleur, le kit anti-choc, les gants, les bandelettes urinaires, la méthyldopa et l'artésunate injectable ; le Sankuru pour l'appareil d'aspiration, l'espace de réanimation néonatale, l'ampicilline, le ballon auto-gonflable et l'ocytocine. Le kit d'accouchement et la balance présentent leurs déficits maximaux au Haut-Katanga, le sulfate de magnésium en Lomami. Cette concentration permet d'identifier des territoires où des dotations ciblées pourraient produire rapidement des gains opérationnels importants.]

#para[Ainsi, une part substantielle des défaillances observées ne requiert pas, dans un premier temps, de réforme complexe. La disponibilité rapide et simultanée de ces intrants et équipements constitue une priorité des 0–3 mois, à mettre en œuvre sous forme de paquets adaptés aux fonctions vitales et aux déficits propres à chaque province et zone de santé, plutôt que par des dotations isolées et uniformes.]

#heading(level: 3)[3.7.3. Priorités à moyen terme : investir dans des paquets intégrés pour lever les blocages cumulés (3 à 12 mois)]

#para[Aucun levier isolé ne suffit à restaurer la capacité opérationnelle : sur les 2 579 fonctions rouges, les intrants, pourtant premier levier, n’en libèrent que 338 (13 %). Ce résultat confirme que les défaillances sont largement multifactorielles et cumulatives : corriger une contrainte ne permet pas à une fonction de sortir du rouge lorsqu’un autre goulot critique persiste. Les investissements à moyen terme doivent donc dépasser les dotations ponctuelles et agir simultanément sur plusieurs dimensions du système.]


#block(width: 100%, above: 11pt, below: 3pt, breakable: false,
  block(width: 100%, fill: rgb("#fffbf7"), radius: 12pt, stroke: 1.1pt + rgb("#0f1015"), inset: 7pt,
    align(center, image("/home/user/Rp/assets/img/image23.png", width: 15.9cm))))
#fig-cap[Figure 20 : Paquets cumulatifs de leviers : fonctions rouges libérées à mesure que les dimensions sont résolues]

#para[Les gains s’accélèrent nettement avec la combinaison des leviers. Après les intrants, l’ajout des équipements porte le nombre de fonctions libérées à 861 (33 %), puis celui de la référence à 1 600 (62 %). L’ajout de l’eau, de l’hygiène et de l’assainissement ne fait sortir aucune fonction supplémentaire du rouge, puisqu’ils ne sont pas bloquants, mais fait passer 160 fonctions libérées du jaune au vert. Ce paquet prioritaire constitue ainsi le noyau des investissements à moyen terme : sécuriser les intrants et équipements essentiels tout en renforçant les capacités de référence, puis garantir les conditions minimales d’eau, d’hygiène et d’assainissement pour stabiliser les fonctions rétablies.]

#para[L’élargissement du paquet à l’électricité, aux ressources humaines et à l’organisation des services porterait progressivement le potentiel à 2 310 fonctions libérées, soit 90 % des fonctions initialement rouges, dont 1 363 atteindraient le vert. Ces résultats plaident pour des investissements intégrés, séquencés et adaptés aux goulots propres à chaque territoire, plutôt que pour des interventions uniformes ou isolées. Ils doivent toutefois être interprétés comme un potentiel théorique issu de la simulation, destiné à guider la priorisation des investissements, et non comme une estimation de leur impact réel.]

#para[L’analyse des paires confirme que les interventions combinées produisent des gains supérieurs aux actions isolées. La combinaison intrants et produits \+ équipements est la plus performante : elle permettrait de libérer 861 fonctions rouges (33,4 %), dont 36 passeraient directement au vert. Elle présente également la complémentarité la plus forte (Δ = 261), ce qui signifie que leur effet conjoint dépasse de 261 fonctions la somme de leurs effets lorsqu’ils sont corrigés séparément. Elle constitue ainsi la combinaison prioritaire pour obtenir rapidement le plus grand gain opérationnel.]

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 8.799999999999999pt, weight: "bold", fill: rgb("#131d44"))[Tableau 32 : Gains simulés des paires de leviers et complémentarité]]
#set par(justify: false, leading: 0.62em)
#set text(size: 8.2pt)
#table(
  columns: (0.0597fr, 0.4722fr, 0.1283fr, 0.1400fr, 0.1998fr),
  inset: (x: 4.4pt, y: 3.2pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[N°]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Paire de leviers]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Gain : n (% des rouges)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[dont rouge → vert]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Complémentarité Δ]]]),
    [#block(breakable: false)[1]], [#block(breakable: false)[Intrants et produits \+ Équipements]], [#block(breakable: false)[861 (33,4 %)]], [#block(breakable: false)[36]], [#block(breakable: false)[261]],
    [#block(breakable: false)[2]], [#block(breakable: false)[Intrants et produits \+ Référence]], [#block(breakable: false)[644 (25,0 %)]], [#block(breakable: false)[23]], [#block(breakable: false)[154]],
    [#block(breakable: false)[3]], [#block(breakable: false)[Équipements \+ Référence]], [#block(breakable: false)[519 (20,1 %)]], [#block(breakable: false)[8]], [#block(breakable: false)[105]],
    [#block(breakable: false)[4]], [#block(breakable: false)[Intrants et produits \+ Électricité]], [#block(breakable: false)[419 (16,2 %)]], [#block(breakable: false)[19]], [#block(breakable: false)[28]],
    [#block(breakable: false)[5]], [#block(breakable: false)[Intrants et produits \+ Intégration des services]], [#block(breakable: false)[399 (15,5 %)]], [#block(breakable: false)[19]], [#block(breakable: false)[15]],
    [#block(breakable: false)[6]], [#block(breakable: false)[Intrants et produits \+ Communication]], [#block(breakable: false)[394 (15,3 %)]], [#block(breakable: false)[20]], [#block(breakable: false)[6]],
    [#block(breakable: false)[7]], [#block(breakable: false)[Ressources humaines \+ Intrants et produits]], [#block(breakable: false)[386 (15,0 %)]], [#block(breakable: false)[26]], [#block(breakable: false)[17]],
    [#block(breakable: false)[8]], [#block(breakable: false)[Équipements \+ Électricité]], [#block(breakable: false)[376 (14,6 %)]], [#block(breakable: false)[9]], [#block(breakable: false)[61]],
)
#v(4pt)

#para[Les autres combinaisons associant la référence aux intrants ou aux équipements restent également performantes. Intrants \+ référence libéreraient 644 fonctions (25,0 % ; Δ = 154), et équipements \+ référence 519 (20,1 % ; Δ = 105). La combinaison équipements \+ électricité présente également une complémentarité notable (Δ = 61), malgré un gain plus limité de 376 fonctions (14,6 %). Ces résultats montrent que les intrants constituent un levier transversal, mais que leur efficacité augmente lorsqu’ils sont associés aux équipements, à la référence et aux conditions essentielles de fonctionnement des services.]

#para[La paire ressources humaines \+ intrants produit un gain plus modeste, avec 386 fonctions libérées (15,0 %), mais 26 atteindraient directement le vert, soit 6,7 % des fonctions libérées, la proportion la plus élevée parmi les paires analysées. À titre de comparaison, cette proportion est de 4,2 % pour intrants \+ équipements. Ainsi, certaines combinaisons maximisent le volume de fonctions sorties du rouge, tandis que d’autres favorisent davantage leur passage à une pleine capacité opérationnelle. Ces résultats plaident pour des paquets d’investissement différenciés selon l’objectif recherché et les goulots propres à chaque territoire.]

#heading(level: 3)[3.7.4. Lecture programmatique : ce que peut financer le projet et ce qui relève de l’action publique]

#para[Les priorités ne relèvent pas toutes du même acteur ni du même type de financement. Le tableau suivant les répartit entre ce qui peut être financé directement par le projet, ce qui relève de l’action gouvernementale aux niveaux central, provincial et zonal, et ce qui demande l’appui d’autres partenaires ou un plaidoyer. Les actions immédiates reposent surtout sur une dotation du projet relayée par les DPS et les ECZ ; les actions à moyen terme combinent cofinancement et décisions publiques ; les réformes de fond relèvent du niveau central, que le projet peut accompagner par l’appui technique et le plaidoyer. Cette répartition est indicative et sera ajustée au cadre de résultats et au budget d’EpiC RDC.]

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 8.799999999999999pt, weight: "bold", fill: rgb("#131d44"))[Tableau 33 : Lecture programmatique des priorités d’investissement]]
#set par(justify: false, leading: 0.62em)
#set text(size: 8.2pt)
#table(
  columns: (0.2385fr, 0.0934fr, 0.2229fr, 0.2227fr, 0.2225fr),
  inset: (x: 4.4pt, y: 3.2pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Priorité]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Horizon]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Financement direct par le projet]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Action gouvernementale]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Autres partenaires et plaidoyer]]]),
    [#block(breakable: false)[Quatre éléments critiques d’urgence et kit d’accouchement, avec stock de sécurité]], [#block(breakable: false)[0–3 mois]], [#block(breakable: false)[Achat et dotation initiale des établissements concernés]], [#block(breakable: false)[DPS : inscription dans les commandes régulières et suivi des stocks]], [#block(breakable: false)[Relais par les circuits nationaux d’approvisionnement]],
    [#block(breakable: false)[Kits de réanimation néonatale et équipements critiques]], [#block(breakable: false)[0–3 mois]], [#block(breakable: false)[Achat, installation et prise en main]], [#block(breakable: false)[ECZ : inventaire fonctionnel et maintenance de premier niveau]], [#block(breakable: false)[–]],
    [#block(breakable: false)[Circuit de référence et de contre-référence dans chaque zone]], [#block(breakable: false)[0–3 mois]], [#block(breakable: false)[Appui technique, fiches et outils, crédit de communication]], [#block(breakable: false)[ECZ : répertoire des transports, appel préalable, contre-référence]], [#block(breakable: false)[–]],
    [#block(breakable: false)[Prise en charge de chaque enfant malnutri dépisté]], [#block(breakable: false)[0–3 mois]], [#block(breakable: false)[Balances et appoint en intrants nutritionnels]], [#block(breakable: false)[Établissements : agent désigné ; ECZ : supervision]], [#block(breakable: false)[Programme national de nutrition et partenaires nutrition pour les intrants]],
    [#block(breakable: false)[Quantification sur la consommation réelle et vérification trimestrielle de la capacité]], [#block(breakable: false)[0–3 mois, puis en continu]], [#block(breakable: false)[Appui technique et outils de suivi]], [#block(breakable: false)[DPS et ECZ : quantification, revues trimestrielles]], [#block(breakable: false)[–]],
    [#block(breakable: false)[Paquets intégrés en réseau hôpital–centres de santé, d’abord au Sankuru et au Haut-Lomami]], [#block(breakable: false)[3–12 mois]], [#block(breakable: false)[Financement principal]], [#block(breakable: false)[DPS et ECZ : ciblage et coordination]], [#block(breakable: false)[Cofinancement par d’autres partenaires]],
    [#block(breakable: false)[Transport d’urgence préfinancé dans les zones enclavées]], [#block(breakable: false)[3–12 mois]], [#block(breakable: false)[Cofinancement des conventions avec les transporteurs]], [#block(breakable: false)[ECZ : contractualisation et suivi]], [#block(breakable: false)[Plaidoyer pour une prise en charge par le FSS et la gratuité]],
    [#block(breakable: false)[Eau dans les services, énergie de secours et maintenance]], [#block(breakable: false)[3–12 mois]], [#block(breakable: false)[Réhabilitations ciblées et équipements solaires]], [#block(breakable: false)[Niveau central : ligne budgétaire de maintenance]], [#block(breakable: false)[Partenaires eau-hygiène-assainissement et énergie]],
    [#block(breakable: false)[Gratuité étendue au transport et au kit d’accouchement ; stratégie nationale de maintenance ; nutrition dans le cadre organique]], [#block(breakable: false)[12–24 mois]], [#block(breakable: false)[Appui technique et plaidoyer]], [#block(breakable: false)[Niveau central : textes d’application et budget]], [#block(breakable: false)[Plaidoyer conjoint des partenaires]],
)
#v(4pt)

#heading(level: 3)[3.7.5. Profil provincial des blocages et des leviers]

#para[Malgré ces différences, les intrants et produits constituent le premier levier de sortie du rouge dans sept provinces sur huit, avec un potentiel variant de 8,1 % au Sankuru à 35,4 % au Kasaï-Oriental. Au Tanganyika, la référence constitue le premier levier, avec un gain potentiel de 14,6 %. La paire intrants \+ équipements est la plus efficace dans sept provinces, et la paire équipements \+ référence au Tanganyika ; au Sankuru, plus de la moitié des fonctions rouges cumulent trois blocages ou plus (51,6 %), contre 3,7 % au Kasaï-Oriental. Ces résultats plaident pour une priorisation territorialisée des investissements : renforcer les intrants comme socle commun dans la majorité des provinces, tout en les combinant avec les équipements, la référence et les autres dimensions selon le profil spécifique des blocages de chaque territoire.]

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 7.199999999999999pt, weight: "bold", fill: rgb("#131d44"))[Tableau 34 : Profil provincial des blocages et des leviers (ordre alphabétique)]]
#set par(justify: false, leading: 0.62em)
#set text(size: 6.6pt)
#table(
  columns: (0.1174fr, 0.0681fr, 0.0575fr, 0.0685fr, 0.0728fr, 0.1298fr, 0.1318fr, 0.0893fr, 0.0936fr, 0.1714fr),
  inset: (x: 4.4pt, y: 3.2pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Province]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Établ.]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[% Vert]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[% Jaune]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[% Rouge]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Dimension bloquante dominante]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Premier levier (gain, % des rouges)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Rouges à blocage unique (%)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Rouges à 3 blocages ou plus (%)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Paire de leviers optimale (gain, % des rouges)]]]),
    [#block(breakable: false)[Haut-Katanga]], [#block(breakable: false)[52]], [#block(breakable: false)[1,1]], [#block(breakable: false)[24,9]], [#block(breakable: false)[74,0]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[Intrants et produits (11,3 %)]], [#block(breakable: false)[34,6]], [#block(breakable: false)[32,3]], [#block(breakable: false)[Intrants et produits \+ Équipements (32,7 %)]],
    [#block(breakable: false)[Haut-Lomami]], [#block(breakable: false)[12]], [#block(breakable: false)[0,0]], [#block(breakable: false)[20,8]], [#block(breakable: false)[79,2]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[Intrants et produits (14,7 %)]], [#block(breakable: false)[33,9]], [#block(breakable: false)[29,0]], [#block(breakable: false)[Intrants et produits \+ Équipements (42,0 %)]],
    [#block(breakable: false)[Kasaï-Central]], [#block(breakable: false)[24]], [#block(breakable: false)[1,2]], [#block(breakable: false)[35,9]], [#block(breakable: false)[62,8]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[Intrants et produits (17,6 %)]], [#block(breakable: false)[47,9]], [#block(breakable: false)[14,4]], [#block(breakable: false)[Intrants et produits \+ Équipements (38,8 %)]],
    [#block(breakable: false)[Kasaï-Oriental]], [#block(breakable: false)[8]], [#block(breakable: false)[11,1]], [#block(breakable: false)[45,8]], [#block(breakable: false)[43,2]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[Intrants et produits (35,4 %)]], [#block(breakable: false)[74,4]], [#block(breakable: false)[3,7]], [#block(breakable: false)[Intrants et produits \+ Équipements (57,3 %)]],
    [#block(breakable: false)[Lomami]], [#block(breakable: false)[16]], [#block(breakable: false)[0,0]], [#block(breakable: false)[24,6]], [#block(breakable: false)[75,4]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[Intrants et produits (15,4 %)]], [#block(breakable: false)[37,9]], [#block(breakable: false)[28,8]], [#block(breakable: false)[Intrants et produits \+ Équipements (30,9 %)]],
    [#block(breakable: false)[Lualaba]], [#block(breakable: false)[24]], [#block(breakable: false)[2,1]], [#block(breakable: false)[42,0]], [#block(breakable: false)[55,9]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[Intrants et produits (9,9 %)]], [#block(breakable: false)[36,8]], [#block(breakable: false)[32,2]], [#block(breakable: false)[Intrants et produits \+ Équipements (26,0 %)]],
    [#block(breakable: false)[Sankuru]], [#block(breakable: false)[16]], [#block(breakable: false)[0,0]], [#block(breakable: false)[13,4]], [#block(breakable: false)[86,6]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[Intrants et produits (8,1 %)]], [#block(breakable: false)[16,8]], [#block(breakable: false)[51,6]], [#block(breakable: false)[Intrants et produits \+ Équipements (28,0 %)]],
    [#block(breakable: false)[Tanganyika]], [#block(breakable: false)[8]], [#block(breakable: false)[0,5]], [#block(breakable: false)[53,4]], [#block(breakable: false)[46,1]], [#block(breakable: false)[Référence]], [#block(breakable: false)[Référence (14,6 %)]], [#block(breakable: false)[44,9]], [#block(breakable: false)[24,7]], [#block(breakable: false)[Équipements \+ Référence (34,8 %)]],
)
#v(4pt)

#para[_Dimension bloquante dominante : dimension qui bloque le plus de fonctions rouges dans la province. Les parts de fonctions rouges à blocage unique et à trois blocages ou plus se lisent parmi les fonctions rouges de la province._]

#para[Deux lectures complémentaires permettent d’orienter les investissements, sans établir de classement entre les provinces. En volume absolu, le Haut-Katanga concentre 901 des 2 579 fonctions rouges (35 %), devant le Kasaï-Central (353), le Lualaba (323), le Sankuru (322) et la Lomami (285). Ces volumes dépendent toutefois du nombre d’établissements évalués et ne traduisent pas, à eux seuls, l’intensité des défaillances ni le rendement potentiel des interventions.]


#block(width: 100%, above: 11pt, below: 3pt, breakable: false,
  block(width: 100%, fill: rgb("#fffbf7"), radius: 12pt, stroke: 1.1pt + rgb("#0f1015"), inset: 7pt,
    align(center, image("/home/user/Rp/assets/img/image24.png", width: 15.9cm))))
#fig-cap[Figure 21 : Gain simulé de chaque levier, par province (part des fonctions rouges libérées)]

#para[L’analyse relative, exprimée en proportion des fonctions rouges que chaque levier permettrait de libérer, est plus utile pour la priorisation territoriale. Les intrants et produits constituent le premier levier dans sept provinces sur huit, avec des gains particulièrement élevés au Kasaï-Oriental (35 %), au Kasaï-Central (18 %), au Haut-Lomami et en Lomami (15 % chacun). Leur rendement est plus faible au Sankuru (8 %), suggérant des blocages plus fortement cumulés nécessitant des interventions combinées. Les équipements constituent généralement le deuxième levier, avec un potentiel atteignant 18 % au Kasaï-Oriental.]

#para[Le Tanganyika présente un profil distinct : la référence y constitue le premier levier, permettant de libérer 15 % des fonctions rouges, contre 11 % pour les intrants comme pour les équipements et 7 % pour l’électricité. Ces différences confirment que les investissements doivent être territorialisés et adaptés au profil des goulots de chaque province, plutôt que répartis selon un paquet uniforme.]

#heading(level: 3)[3.7.6. Zones de santé à fort effet de levier]

#para[L’analyse identifie 15 zones de santé à fort effet de levier, dans lesquelles la correction d’une seule dimension permettrait de libérer entre 16,7 % et 40,5 % des fonctions rouges. Les intrants et produits constituent le premier levier dans 8 de ces 15 zones, et les équipements dans 6 : Likasi, Mumbunda, Sakania et Kapolowe au Haut-Katanga, Kabongo au Haut-Lomami et Katende au Kasaï-Central ; à Tshikula, au Kasaï-Central, la communication constitue le premier levier. Cilundu se distingue par le rendement le plus élevé d’un levier isolé (40,5 %), suivie de Demba (28,9 %), Ruashi (27,0 %) et Tshikula (26,9 %).]

#para[Les gains augmentent nettement lorsque deux leviers sont combinés. La paire intrants \+ équipements est optimale dans douze des quinze zones et permettrait notamment de libérer 66,7 % des fonctions rouges à Cilundu et à Katende, et environ la moitié à Kinkondja (50,7 %) et Ruashi (48,6 %). D’autres combinaisons répondent à des profils locaux spécifiques : intrants \+ référence à Ndekesha (53,0 %) et Demba (51,1 %), et équipements \+ communication à Tshikula (42,3 %). Ces zones représentent donc des opportunités de gains rapides, et non nécessairement les territoires où les besoins sont les plus sévères. L’absence du Sankuru, du Lualaba et du Tanganyika parmi ces 15 zones traduit des blocages plus diffus : au Sankuru, plus de la moitié des fonctions rouges cumulent trois blocages ou plus ; au Lualaba et au Tanganyika, les blocages se répartissent entre plusieurs dimensions. Un ou deux leviers n’y suffisent pas et des paquets d’investissement plus complets sont nécessaires. Ces résultats doivent enfin être interprétés comme des repères de priorisation : chaque zone ne compte que quatre établissements dans l’échantillon, et les gains simulés des différents leviers ne sont pas directement additionnables.]

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 8.0pt, weight: "bold", fill: rgb("#131d44"))[Tableau 35 : Les quinze zones de santé où un seul levier débloque le plus de fonctions rouges, et la meilleure combinaison de deux leviers]]
#set par(justify: false, leading: 0.62em)
#set text(size: 7.4pt)
#table(
  columns: (0.1798fr, 0.1400fr, 0.1000fr, 0.1602fr, 0.1201fr, 0.1801fr, 0.1198fr),
  inset: (x: 4.4pt, y: 3.2pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Zone de santé]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Province]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Fonctions rouges]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Premier levier]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Gain : n (%)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Paire optimale]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Gain paire : n (%)]]]),
    [#block(breakable: false)[Ruashi Zone de Santé]], [#block(breakable: false)[Haut-Katanga]], [#block(breakable: false)[74]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[20 (27,0 %)]], [#block(breakable: false)[Intrants et produits \+ Équipements]], [#block(breakable: false)[36 (48,6 %)]],
    [#block(breakable: false)[Cilundu Zone de Santé]], [#block(breakable: false)[Kasaï-Oriental]], [#block(breakable: false)[42]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[17 (40,5 %)]], [#block(breakable: false)[Intrants et produits \+ Équipements]], [#block(breakable: false)[28 (66,7 %)]],
    [#block(breakable: false)[Ndekesha Zone de Santé]], [#block(breakable: false)[Kasaï-Central]], [#block(breakable: false)[66]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[16 (24,2 %)]], [#block(breakable: false)[Intrants et produits \+ Référence]], [#block(breakable: false)[35 (53,0 %)]],
    [#block(breakable: false)[Kinkondja Zone de Santé]], [#block(breakable: false)[Haut-Lomami]], [#block(breakable: false)[73]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[16 (21,9 %)]], [#block(breakable: false)[Intrants et produits \+ Équipements]], [#block(breakable: false)[37 (50,7 %)]],
    [#block(breakable: false)[Likasi Zone de Santé]], [#block(breakable: false)[Haut-Katanga]], [#block(breakable: false)[62]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[15 (24,2 %)]], [#block(breakable: false)[Intrants et produits \+ Équipements]], [#block(breakable: false)[28 (45,2 %)]],
    [#block(breakable: false)[Mikalayi Zone de Santé]], [#block(breakable: false)[Kasaï-Central]], [#block(breakable: false)[69]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[15 (21,7 %)]], [#block(breakable: false)[Intrants et produits \+ Équipements]], [#block(breakable: false)[32 (46,4 %)]],
    [#block(breakable: false)[Tshikula Zone de Santé]], [#block(breakable: false)[Kasaï-Central]], [#block(breakable: false)[52]], [#block(breakable: false)[Communication]], [#block(breakable: false)[14 (26,9 %)]], [#block(breakable: false)[Équipements \+ Communication]], [#block(breakable: false)[22 (42,3 %)]],
    [#block(breakable: false)[Mumbunda Zone de Santé]], [#block(breakable: false)[Haut-Katanga]], [#block(breakable: false)[66]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[14 (21,2 %)]], [#block(breakable: false)[Intrants et produits \+ Équipements]], [#block(breakable: false)[26 (39,4 %)]],
    [#block(breakable: false)[Kamiji Zone de Santé]], [#block(breakable: false)[Lomami]], [#block(breakable: false)[72]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[14 (19,4 %)]], [#block(breakable: false)[Intrants et produits \+ Équipements]], [#block(breakable: false)[28 (38,9 %)]],
    [#block(breakable: false)[Kabongo Zone de Santé]], [#block(breakable: false)[Haut-Lomami]], [#block(breakable: false)[75]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[14 (18,7 %)]], [#block(breakable: false)[Intrants et produits \+ Équipements]], [#block(breakable: false)[33 (44,0 %)]],
    [#block(breakable: false)[Demba Zone de Santé]], [#block(breakable: false)[Kasaï-Central]], [#block(breakable: false)[45]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[13 (28,9 %)]], [#block(breakable: false)[Intrants et produits \+ Référence]], [#block(breakable: false)[23 (51,1 %)]],
    [#block(breakable: false)[Katende Zone de Santé]], [#block(breakable: false)[Kasaï-Central]], [#block(breakable: false)[57]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[13 (22,8 %)]], [#block(breakable: false)[Intrants et produits \+ Équipements]], [#block(breakable: false)[38 (66,7 %)]],
    [#block(breakable: false)[Sakania Zone de Santé]], [#block(breakable: false)[Haut-Katanga]], [#block(breakable: false)[71]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[13 (18,3 %)]], [#block(breakable: false)[Intrants et produits \+ Équipements]], [#block(breakable: false)[24 (33,8 %)]],
    [#block(breakable: false)[Mulumba Zone de Santé]], [#block(breakable: false)[Lomami]], [#block(breakable: false)[73]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[13 (17,8 %)]], [#block(breakable: false)[Intrants et produits \+ Équipements]], [#block(breakable: false)[26 (35,6 %)]],
    [#block(breakable: false)[Kapolowe Zone de Santé]], [#block(breakable: false)[Haut-Katanga]], [#block(breakable: false)[78]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[13 (16,7 %)]], [#block(breakable: false)[Intrants et produits \+ Équipements]], [#block(breakable: false)[30 (38,5 %)]],
)
#v(4pt)


#pagebreak()
#set page(fill: rgb("#131d44"), header: none, footer: none)
#block(width: 100%, height: 100%)[
  #align(center + horizon)[
    #block(above: 0pt, below: 8pt)[#text(size: 8.2pt, tracking: 4pt, fill: rgb("#ced6f8"))[#upper[PARTIE IV]]]
    #context part-size.update(34pt)
    #heading(level: 1)[DISCUSSION]
    #v(9pt)
    #text(font: script, size: 22pt, fill: rgb("#ced6f8"))[Lecture et implications]
  ]
]
#context head-state.update("DISCUSSION")
#pagebreak()
#set page(fill: rgb("#c2cfea"), header: hdr(), footer: ftr())


#block(width: 100%, above: 11pt, below: 9pt, breakable: false,
  block(width: 100%, fill: rgb("#fffbf7"), radius: 12pt, stroke: 1.4pt + black, inset: (x: 13pt, y: 11pt))[
    #text(font: "DejaVu Sans", size: 14pt, fill: rgb("#131d44"))[★]
    #v(-4pt)
    #text(size: 7.2pt, tracking: 2.4pt, fill: rgb("#5166b7"))[#upper[À retenir]]
    #v(1pt)
    #block(above: 3pt, below: 9pt)[#text(size: 11.2pt, weight: "bold", fill: rgb("#131d44"))[Une fragilité structurelle et ancienne. Les constats prolongent ceux de l’EPSS 2017–2018, de la HHFA 2022–2023 et des évaluations du programme IHP : les insuffisances observées ne sont pas nouvelles, mais le retrait ou la réduction des financements en 2025 a pu accentuer et rendre plus visibles certaines vulnérabilités.]]
    #text(size: 9.2pt, fill: rgb("#0f1015"))[Une mesure exigeante de la capacité opérationnelle. La forte proportion de fonctions rouges tient aussi à la méthode utilisée : l’absence d’un seul élément indispensable suffit à classer une fonction comme non opérationnelle. Le rouge traduit donc la rupture d’un maillon critique, et non nécessairement l’absence totale du service. La capacité de soins repose sur une chaîne complète. Personnel compétent, intrants, équipements, eau, énergie, organisation et référence doivent fonctionner ensemble. Les interventions isolées ont donc un rendement limité, ce qui justifie de privilégier des paquets intégrés adaptés aux goulots propres à chaque établissement et territoire. La continuité des soins doit être sécurisée de bout en bout. Référer un patient vers un hôpital qui n’est pas en mesure d’assurer la prise en charge ne fait que déplacer le risque. De même, la gratuité de la maternité ne peut produire pleinement ses effets que si les services sont effectivement opérationnels et si le transport d’urgence et la référence sont accessibles et financièrement couverts.]
  ])

#para[Le diagnostic met en évidence une préparation opérationnelle très insuffisante : 68,4 % des 3 773 évaluations sont rouges, et les six fonctions vitales les plus affectées le sont dans plus de huit établissements sur dix, dans les huit provinces. Cette discussion ne reprend pas les résultats ; elle en retient ce qui compte pour la décision : leur cohérence avec les évaluations antérieures, les mécanismes qui les expliquent et les limites à garder à l’esprit.]

#heading(level: 2)[4.1. Ce que mesure le diagnostic et comment interpréter les résultats]

#para[*Une mesure de la préparation opérationnelle, en amont de la couverture effective. *Dans le modèle de Tanahashi, la couverture résulte d’une succession de filtres allant de la disponibilité des ressources à la couverture effective \[6\]. Le diagnostic se situe au premier de ces filtres, avec une exigence plus forte que la simple existence d’un service : une fonction n’est verte que si toutes ses conditions minimales sont réunies en même temps et de façon stable. Cette approche relève des « structures » au sens de Donabedian \[7\] et des fondations d’un système de santé de qualité décrites par la Commission du Lancet \[8\]. Une fonction rouge signale donc qu’un maillon critique manque, et non que le service n’est jamais rendu ou que les soins sont de mauvaise qualité. À l’inverse, une fonction verte est nécessaire mais ne suffit pas à garantir la qualité clinique \[7, 9\]. Trois grilles de lecture éclairent les résultats. Le cadre de l’OMS relie chaque goulot observé dans l’établissement aux composantes du système, comme l’approvisionnement, le financement ou la gouvernance \[10\]. Le modèle des trois retards situe le diagnostic sur le troisième retard, la prise en charge adéquate après l’arrivée, et en partie sur le deuxième, l’accès physique par la référence \[11, 12\]. Enfin, la pensée systémique explique pourquoi les défaillances tiennent rarement à une seule contrainte et pourquoi la levée d’un levier isolé rapporte peu \[13, 14\]. C’est le fondement de la priorité donnée aux paquets intégrés.]

#heading(level: 2)[4.2. Des vulnérabilités déjà documentées et confirmées]

#para[*Une convergence avec les évaluations nationales antérieures. *L’EPSS 2017–2018 relevait déjà que 19 % seulement des établissements disposaient d’un transport d’urgence, 49 % d’une source d’eau améliorée et 20 % du sulfate de magnésium injectable là où l’accouchement est offert \[15\].]

#para[La HHFA 2022–2023 estimait la capacité opérationnelle générale à 32 % ; 5 % des établissements assuraient les sept fonctions des SONU de base et 11 % des hôpitaux les neuf fonctions des SONU complets \[5\]. Les déficits observés aujourd’hui prolongent donc des fragilités anciennes. Les enquêtes diffèrent toutefois par leurs définitions, leurs échantillons et leurs dénominateurs, et ces écarts ne permettent pas de conclure à une tendance. La convergence des maillons faibles est en revanche nette : sulfate de magnésium, médicaments essentiels, transport d’urgence, eau, électricité et réanimation néonatale reviennent dans toutes les sources \[5, 15-17\].]

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 8.799999999999999pt, weight: "bold", fill: rgb("#131d44"))[Tableau 36 : Rapprochement de quelques indicateurs avec les enquêtes antérieures]]
#set par(justify: false, leading: 0.62em)
#set text(size: 8.2pt)
#table(
  columns: (0.2142fr, 0.1888fr, 0.1941fr, 0.1938fr, 0.2091fr),
  inset: (x: 4.4pt, y: 3.2pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Indicateur]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[EPSS 2017-2018 (national)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[HHFA 2022-2023 (national)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Programme IHP (mêmes provinces)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Présent diagnostic (160 établissements)]]]),
    [#block(breakable: false)[Sulfate de magnésium injectable disponible]], [#block(breakable: false)[20 % des structures offrant l'accouchement]], [#block(breakable: false)[21 %]], [#block(breakable: false)[Non mesuré]], [#block(breakable: false)[38,8 % sans déficit (61,2 % en rouge)]],
    [#block(breakable: false)[Transport d'urgence disponible]], [#block(breakable: false)[19 %]], [#block(breakable: false)[3 %]], [#block(breakable: false)[Non mesuré]], [#block(breakable: false)[29,4 % avec un moyen fonctionnel]],
    [#block(breakable: false)[Eau]], [#block(breakable: false)[49 % avec source améliorée]], [#block(breakable: false)[37 % avec source protégée]], [#block(breakable: false)[Non mesuré]], [#block(breakable: false)[22,3 % avec points d'eau fonctionnels dans les services]],
    [#block(breakable: false)[Électricité]], [#block(breakable: false)[65 % avec électricité régulière]], [#block(breakable: false)[Moins de 30 % avec accès]], [#block(breakable: false)[16 % des CS avec électricité fonctionnelle (2021)]], [#block(breakable: false)[55,6 % avec alimentation stable ; 40,1 % avec secours]],
    [#block(breakable: false)[Rupture de médicaments essentiels]], [#block(breakable: false)[Non comparable]], [#block(breakable: false)[34 % de disponibilité moyenne des 22 traceurs]], [#block(breakable: false)[69,7 % en rupture (2019) ; 44,1 % (2024)]], [#block(breakable: false)[54,4 % déclarent une rupture sur trois mois]],
    [#block(breakable: false)[Réanimation néonatale]], [#block(breakable: false)[Non comparable]], [#block(breakable: false)[36 % offrent la fonction ; 20 % avec prestataire formé]], [#block(breakable: false)[Non mesuré]], [#block(breakable: false)[87,5 % en rouge ; 46,9 % avec prestataire formé]],
    [#block(breakable: false)[Sages-femmes au centre de santé]], [#block(breakable: false)[Non mesuré]], [#block(breakable: false)[Ratio national sous la norme OMS]], [#block(breakable: false)[3,8 % des CS avec l'effectif normé (2021)]], [#block(breakable: false)[46,5 % des CS avec au moins une sage-femme]],
)
#v(4pt)

#para[*Une mesure plus exigeante explique en partie la sévérité des résultats. *Un score agrégé, comme celui de la HHFA, additionne les éléments présents et peut rester élevé malgré l’absence d’un élément indispensable. Ici, une seule contrainte bloquante suffit à classer la fonction en rouge. Cette logique du maillon le plus faible convient aux fonctions vitales : une césarienne ou une réanimation néonatale ne peut être partiellement opérationnelle. Le choix de l’indicateur modifie d’ailleurs fortement l’appréciation de la disponibilité des soins obstétricaux d’urgence \[18, 19\]. L’échantillonnage raisonné, qui retient des structures de référence, des établissements à fort volume et d’autres signalés pour leur mortalité, ne décrit pas un établissement « moyen ». Il n’explique cependant pas à lui seul la sévérité observée : parmi les fonctions communes, les établissements de premier niveau à fort volume présentent 70,8 % de rouge, contre 66,9 % pour ceux retenus sur un critère de mortalité.]

#para[*Le contexte récent a pu accentuer ces fragilités. *La collecte intervient après l’arrêt, en février 2025, du programme USAID IHP, présent dans plusieurs des provinces étudiées. Les ruptures de médicaments essentiels dans ses zones étaient passées de 69,7 % en 2019 à 44,1 % en 2024 \[17\] ; dans ce diagnostic, 54,4 % des établissements en déclarent une sur les trois derniers mois, et tous au Haut-Lomami. Cet écart est compatible avec une érosion des acquis, sans permettre de l’établir, faute de mesure avant-après sur les mêmes établissements.]

#para[L’évaluation d’impact du programme IHP, conduite dans les mêmes provinces, montre deux indicateurs évoluant à contre-sens : la prise en charge du paludisme grave et celle de la malnutrition aiguë modérée \[20\]. Ce sont précisément deux domaines parmi les plus contraints du diagnostic, avec une malnutrition aiguë compliquée rouge dans 90,6 % des établissements et un paludisme grave rouge dans 81,9 %. Deux approches indépendantes convergent ainsi vers les mêmes vulnérabilités, ce qui plaide pour des déficits structurels plutôt que ponctuels.]

#heading(level: 2)[4.3. Les goulots dominants à la lumière de la littérature]

#para[*La chaîne d’approvisionnement : une contrainte structurelle. *Les intrants bloquent 52,6 % des fonctions rouges, et 97,3 % des établissements qui ne déclarent aucune rupture ont pourtant au moins une fonction rouge liée aux intrants : le problème dépasse les ruptures déclarées. La littérature l’attribue à la fragmentation des circuits, à la faible visibilité sur la consommation et aux défaillances du dernier kilomètre \[21\], et le PNDS-PS reconnaît ces faiblesses \[22\]. Le sulfate de magnésium en est l’illustration : il manque dans 98 établissements sur 160 et sa disponibilité reste autour de 20 % dans les enquêtes nationales, alors qu’il réduit de 58 % le risque d’éclampsie \[23\]. À l’inverse, le rétablissement des antipaludiques suffirait à libérer presque toutes les fonctions de paludisme simple : les intrants obstétricaux et nutritionnels ont besoin de circuits aussi robustes que ceux des programmes verticaux.]

#para[*Les équipements : davantage un problème d’absence que de panne. *Ils bloquent 53,1 % des fonctions rouges, et l’absence domine nettement la panne (pour la balance, 73,1 % d’absence contre 4,3 % de non-fonctionnement), alors que la littérature met surtout en avant le matériel hors service faute de maintenance \[24\]. Une panne ancienne peut toutefois faire sortir l’équipement de l’inventaire, et la maintenance reste peu organisée : en 2021, 48,4 % seulement des centres de santé respectaient les normes nationales d’équipement \[25\]. La réanimation néonatale en montre les conséquences : malgré 46,9 % d’établissements disposant d’un prestataire formé, elle reste rouge dans 87,5 % des cas, alors qu’elle pourrait réduire d’environ 30 % les décès liés à l’asphyxie \[26\] et qu’en Tanzanie, Helping Babies Breathe associé à un équipement minimal a réduit de 47 % la mortalité néonatale précoce \[27\]. Les compétences ne suffisent pas sans le matériel. *Le circuit de référence : un maillon qui peut annuler les autres efforts. *Rouge dans 113 établissements, il bloque 1 038 fonctions rouges et constitue la première fragilité des fonctions jaunes (51,3 %). La référence des centres de santé vers l’HGR ne dépassait déjà pas 3 à 4 % dans les enquêtes nationales, pour une norme de 10 % \[5, 15\]. Le transport manque dans 65,6 % des établissements et 89,8 % des structures d’accueil signalent des arrivées tardives : le deuxième retard se prolonge dans le troisième \[11\]. En RDC, l’artésunate rectal donné avant la référence a été associé à une mortalité plus élevée là où la référence aboutissait rarement \[28\], alors que, dans un essai randomisé où la référence était assurée, il réduisait de moitié le risque de décès ou d’incapacité permanente chez les patients n’ayant pas atteint une structure de soins dans les six heures \[29\] ; au Burundi, un réseau d’ambulances relié aux soins obstétricaux a été associé à une réduction estimée de 74 % de la mortalité maternelle \[30\]. Le transport ne suffit pourtant pas : la césarienne est rouge dans 81,7 % des destinations appariées. La référence doit relier deux structures opérationnelles.]

#para[*L’eau et l’électricité : des prérequis encore fragiles. *L’eau, l’hygiène et l’assainissement sont rouges dans 66,2 % des établissements, surtout faute de points d’eau fonctionnels dans les services (57,3 %). Dans la grille, ces défaillances ne suffisent pas à classer une fonction en rouge, mais elles en compromettent la sécurité : elles fragilisent 44,1 % des fonctions jaunes, notamment le sepsis obstétrical, la CPoN du nouveau-né et la pré-éclampsie, et les empêchent d’atteindre le vert. Elles pèsent donc moins sur la possibilité de réaliser l’acte que sur sa sécurité et sur la durabilité des fonctions rétablies par d’autres interventions. Le constat dépasse la RDC : environ la moitié des établissements de 78 pays à revenu faible et intermédiaire n’ont pas d’eau courante \[31\]. L’électricité existe dans 78,8 % des établissements, mais elle n’est stable que dans 55,6 % et secourue dans 40,1 %. Elle est le premier blocage de la chaîne du froid, dans un pays où 21 % seulement des enfants sont complètement vaccinés \[1\] et où la disponibilité des antigènes corrigée du fonctionnement de la chaîne du froid a été estimée à 44,4 % dans quatre provinces en 2025 \[32\].]

#para[*Les ressources humaines : un déficit de compétences ciblées plus que d’effectifs. *Elles bloquent 14,3 % des fonctions rouges mais fragilisent 43,6 % des fonctions jaunes. Presque tous les centres ont un infirmier, mais 53,5 % n’ont aucune sage-femme et 94,1 % aucun nutritionniste. La présence d’une sage-femme, d’un médecin ou d’un technicien de laboratoire ne réduit la part de fonctions vitales rouges que de 5 à 9 points, ce qui rejoint les effets modestes des formations ou supervisions isolées rapportés par Rowe et ses collègues \[33\].]

#para[*La nutrition : une fonction encore peu intégrée. *La malnutrition aiguë compliquée est rouge dans 90,6 % des établissements et la forme non compliquée dans 98,0 %, avec une amélioration limitée à l’HGR (84 %). Là où le dépistage fonctionne, la prise en charge de la forme non compliquée reste rouge dans 94 % des cas : le système détecte des enfants qu’il ne peut pas traiter. Dans 21 pays, la couverture moyenne de la prise en charge communautaire de la malnutrition aiguë sévère n’atteignait que 38,3 % \[34\] ; la fonction reste dépendante des financements de projet, en deçà des soins de routine recommandés par l’OMS \[35\].]

#heading(level: 2)[4.4. Le paradoxe du rétablissement matériel isolé]

#para[*Une correction isolée produit peu de gains. *Aucune dimension résolue seule ne libère plus d’environ 13 % des fonctions rouges, et même le rétablissement simultané de tous les intrants et équipements critiques laisserait 54,4 % des fonctions concernées en rouge. Le sulfate de magnésium n’est ainsi la dernière contrainte que pour 8 des 77 fonctions où il manque. À l’inverse, la combinaison des intrants, des équipements et de la référence libère 62,0 % des fonctions rouges, et l’effet conjoint des intrants et des équipements dépasse de 261 fonctions la somme de leurs effets séparés.]

#para[Ce résultat est cohérent avec la théorie du « joint torique » de Kremer : lorsqu’un résultat dépend de plusieurs tâches complémentaires, améliorer une seule composante rapporte peu tant que les autres restent défaillantes \[36\]. Les contraintes au passage à l’échelle se situent de même à plusieurs niveaux du système \[37\], et l’infrastructure seule est faiblement associée à la qualité observée des soins \[9\].]

#para[Ces gains reposent sur une simulation déterministe, toutes choses égales par ailleurs : ce sont des ordres de grandeur pour prioriser, non des prévisions. Ils montrent néanmoins un effet de seuil net. Puisque près de deux fonctions rouges sur trois sont bloquées par au moins deux dimensions, les dotations isolées risquent de rapporter peu, et des paquets intégrés adaptés à chaque établissement sont plus efficaces. Ce choix impose un arbitrage explicite entre concentration des ressources et équité territoriale, que les DPS et les ECZ sont les mieux placées pour conduire.]

#heading(level: 2)[4.5. De l’offre déclarée à la capacité réelle : les limites du suivi de routine]

#para[*Un écart important entre service déclaré et capacité opérationnelle. *Pour plus de la moitié des combinaisons fonction–niveau vitales examinées (16 sur 30), plus de 80 % des établissements qui déclarent offrir le service n’en réunissent pas toutes les conditions ; 97 des 98 centres de santé qui déclarent la réanimation néonatale sont dans ce cas. Le service peut exister administrativement ou être rendu par intermittence sans être prêt au moment où il est nécessaire. Le même décalage apparaît dans les causes d’interruption : les répondants citent l’organisation ou les horaires, alors que l’analyse désigne le plus souvent les intrants, ce qui peut traduire une normalisation des pénuries chroniques.]

#para[*Une surveillance efficace pour notifier, plus fragile pour piloter. *La reconnaissance du signal (78,1 % vert) et la notification (90,0 %) sont solides, mais les outils et la transmission ne sont verts que dans 30,0 % des établissements. En 2023, aucun des 61 sites audités pour le paludisme ne disposait de tous les outils standard et 41 % seulement transmettaient à temps \[38\] ; les DPS évaluées n’avaient aucune ligne budgétaire pour la connexion internet \[39\]. Comme dans d’autres systèmes à ressources limitées, les investissements ont surtout porté sur la remontée des données plutôt que sur leur usage local pour décider \[40, 41\].]

#para[La nuance est importante : 67,5 % des établissements sont verts pour l’analyse et la prise de décision. Là où les outils sont disponibles, les équipes utilisent leurs données ; le goulot se situe surtout en amont, dans la continuité des outils et de la transmission. L’enjeu est donc double : mesurer la capacité réelle plutôt que l’offre déclarée, et faire du système d’information un instrument de pilotage.]

#heading(level: 2)[4.6. Un gradient de capacité insuffisant : l’HGR ne garantit pas toujours la prise en charge des cas référés]

#para[*Une amélioration avec le niveau de soins, trop faible pour sécuriser les fonctions vitales. *Pour les 17 fonctions communes, la part moyenne de rouge passe d’environ 70 % au centre de santé à 55 % au CSR et 50 % à l’HGR. Le passage à l’hôpital améliore la situation sans la sécuriser, et certaines fonctions clés y restent très déficientes : l’accouchement normal est rouge dans 92 % des HGR, la césarienne d’urgence dans 81,1 % et la réanimation néonatale dans 64,9 %. D’autres travaux conduits en RDC, au Nord-Kivu, dans le Kwango et le Kwilu et à Lubumbashi, font le même constat \[42-44\], ce qui suggère que cette fragilité dépasse les établissements évalués.]

#para[Plusieurs facteurs peuvent y contribuer : la forte dépendance des HGR aux paiements directs, puisqu’ils concentrent 58 % des dépenses courantes de santé des ménages \[22\], des dynamiques de gouvernance hospitalière très variables \[45\] et une médicalisation non contrôlée de certains centres de santé qui brouille la répartition des rôles \[22\]. Les obstacles du troisième retard les plus rapportés dans la littérature sont précisément les déficits de compétences, d’approvisionnement, de personnel et d’équipements \[12\]. Renforcer la référence suppose donc aussi de garantir que l’HGR dispose des capacités nécessaires pour prendre en charge les cas qui lui sont référés.]

#heading(level: 2)[4.7. Vulnérabilités provinciales et contraction des appuis extérieurs]

#para[*Des profils provinciaux différents. *La part de fonctions rouges va de 43,2 % au Kasaï-Oriental à 86,6 % au Sankuru. Au Sankuru, la sévérité est cohérente avec d’autres sources : la HHFA y rapportait le score d’équipement le plus faible du pays (16 %) et l’évaluation IHP n’y trouvait aucun centre de santé disposant de tous les médicaments traceurs, ce qui évoque un déficit chronique. Au Haut-Lomami, où tous les établissements déclarent une rupture de médicaments, s’ajoutent des incidents sécuritaires, des mouvements de population et des absences de personnel : des chocs récents s’y superposent à des fragilités anciennes. Les réponses doivent donc être territorialisées, avec une stabilisation rapide là où les chocs dominent et des investissements structurels là où les déficits sont chroniques.]

#heading(level: 3)[La contraction des financements extérieurs, facteur d’aggravation plutôt qu’explication]

#para[*unique. *Une analyse publiée dans The Lancet associe deux décennies de financement de l’USAID à une réduction de 32 % de la mortalité des moins de cinq ans et projette plus de 14 millions de décès supplémentaires d’ici 2030 si les réductions se poursuivent \[46\]. Faute de mesure sur les mêmes établissements avant 2025, et puisque les enquêtes antérieures montraient déjà des déficits importants, l’interprétation la plus prudente est celle de vulnérabilités anciennes, partiellement compensées par l’aide extérieure, que sa réduction a rendues plus visibles. *Les épidémies révèlent la fragilité plus qu’elles ne l’expliquent. *En Sierra Leone, la baisse d’utilisation des services pendant l’épidémie d’Ebola aurait causé au moins 3 593 décès indirects de mères, de nouveau-nés et de mort-nés \[47\], alors qu’au Nord-Kivu, les ressources mobilisées en 2018–2020 ont limité les effets sur les césariennes et la vaccination \[48\]. Ici, 15,6 % seulement des établissements déclarent une épidémie récente, alors que les principaux goulots s’observent partout. Le problème tient moins au choc qu’à la faible marge de sécurité d’un système peu résilient \[49\].]

#heading(level: 2)[4.8. Cohérence avec les orientations nationales vers la CSU]

#para[*La gratuité ne devient couverture effective que si les services sont prêts. *Le PNDS-PS 2024– 2033 place la CSU au cœur de la politique nationale, et la gratuité de la maternité couvre précisément plusieurs fonctions étudiées ici ; son efficacité est évaluée à Kinshasa \[50\] et la préparation des maternités a été analysée à partir de l’EPSS \[51\]. Or l’accouchement normal est rouge dans 92,5 % des établissements et le kit d’accouchement manque dans 79,4 % : sans offre prête, la gratuité risque de reporter sur les familles l’achat des intrants manquants. Le transport d’urgence reste en outre hors de la protection financière, alors que le manque de ressources du ménage est la première contrainte citée au départ du centre de santé (77,2 %). La réduction des dépenses catastrophiques de santé figure parmi les objectifs du PNDS-PS \[22\] et du PSN SACO 2025–2030 \[52\], et plus de 60 % des parents interrogés dans une étude récente citent le manque d’argent parmi les causes du retard aux soins \[53\].]

#para[Le PNDS-PS identifie bien les goulots observés ; l’enjeu est d’y aligner des ressources récurrentes. Avec une dépense publique de santé d’environ 22 à 23 dollars par habitant, contre 86 dollars nécessaires \[2\], la maintenance, l’énergie, l’eau et le transport restent tributaires des projets. Progresser vers la CSU suppose d’articuler la protection financière, l’accès par une référence accessible et la capacité réelle des établissements.]

#heading(level: 2)[4.9. Forces et limites de l'analyse]

#para[*Des choix qui renforcent la robustesse des constats. *Le diagnostic privilégie la vérification physique et applique un algorithme déterministe et explicite aux 160 établissements ; ses principaux résultats résistent au recalcul rattachant chaque observation à une seule dimension, présenté en annexe, et chaque tableau peut être reproduit à l’identique grâce à une chaîne de traitement scriptée et versionnée. Leur convergence avec l’EPSS, la HHFA, les évaluations IHP et les audits CHISU constitue une validation externe.]

#para[*Des limites à garder à l’esprit. *Les proportions décrivent les 160 établissements enquêtés, et les comparaisons provinciales sont indicatives, surtout là où huit établissements seulement ont été visités. Le diagnostic ne mesure ni la qualité clinique, ni l’utilisation des services, ni les résultats sanitaires, et les simulations indiquent un potentiel et non un impact. Certaines informations reposent sur les déclarations des répondants, seules 20 des 82 liaisons de référence ont été confirmées nominativement, et l’absence de mesure avant 2025 interdit d’attribuer les déficits au retrait des financements. Enfin, l’algorithme est volontairement exigeant : le rouge signifie que la fonction ne peut être garantie dans les conditions minimales, non que le service est absent.]

#heading(level: 2)[4.10. Implications pour l'action et pour la recherche]

#para[*Pour les décideurs et les partenaires. *Quatre implications se dégagent : financer des paquets cohérents plutôt que des interventions isolées, avec pour noyau les intrants, les équipements et la référence, complétés par l’eau pour stabiliser les fonctions rétablies ; traiter la référence comme un service à part entière, relié à une structure d’accueil prête ; inscrire la maintenance, l’énergie, l’eau et les outils de données dans des budgets récurrents ; donner à la nutrition un ancrage institutionnel. Ces priorités relèvent de plusieurs acteurs à la fois, ce qui rend décisive la clarté sur qui fait quoi, à quel niveau et avec quelles ressources.]

#para[*Pour le suivi et la recherche. *Un tableau de bord léger, fondé sur les quatre éléments critiques d’urgence et quelques conditions transversales vérifiées sur place, permettrait de suivre la capacité réelle lors des supervisions. La recherche devrait relier la préparation aux résultats sanitaires, suivre les mêmes établissements dans le temps, comparer des modèles de financement du transport d’urgence et estimer le coût par fonction restaurée.]


#pagebreak()
#set page(fill: rgb("#131d44"), header: none, footer: none)
#block(width: 100%, height: 100%)[
  #align(center + horizon)[
    #block(above: 0pt, below: 8pt)[#text(size: 8.2pt, tracking: 4pt, fill: rgb("#ced6f8"))[#upper[PARTIE V]]]
    #context part-size.update(26pt)
    #heading(level: 1)[CONCLUSION ET RECOMMANDATIONS]
    #v(9pt)
    #text(font: script, size: 17pt, fill: rgb("#ced6f8"))[Synthèse et feuille de route]
  ]
]
#context head-state.update("CONCLUSION ET RECOMMANDATIONS")
#pagebreak()
#set page(fill: rgb("#c2cfea"), header: hdr(), footer: ftr())

#heading(level: 2)[5.1. Conclusion]

#para[Ce diagnostic conduit à un constat simple : dans les établissements évalués, l’existence d’un service ne garantit pas la capacité de le délivrer au moment où une vie en dépend. Les urgences maternelles, néonatales et infantiles sont les plus exposées, avec 81 % de fonctions d’urgence rouges et au moins une fonction vitale non assurée dans 159 établissements sur 160. Plusieurs messages en découlent pour la décision.]

#para[La première priorité est de rendre disponibles les intrants et les équipements dont dépendent les fonctions vitales les plus touchées. Le sulfate de magnésium, l’ocytocine, l’artésunate injectable, le ballon et masque de réanimation néonatale et le kit d’accouchement relèvent d’une action immédiate, peu coûteuse au regard de l’enjeu. Cette dotation n’aura toutefois d’effet durable que si les commandes reposent sur la consommation réelle et si la distribution atteint régulièrement chaque établissement.]

#para[Le système de référence et de contre-référence doit être renforcé comme une chaîne complète. Le transport d’urgence, la communication préalable entre établissements, la fiche de référence et le retour d’information en sont aujourd’hui les maillons les plus faibles, alors qu’ils comptent parmi les moins coûteux à organiser. Référer plus vite ne protège cependant la mère ou l’enfant que si la structure qui reçoit peut assurer la prise en charge, ce qui n’est pas le cas pour la césarienne dans 81,7 % des destinations identifiées.]

#para[L’hôpital général de référence doit redevenir le niveau de sécurité de la zone de santé. Son avantage sur le centre de santé reste insuffisant, et l’accouchement normal comme la césarienne d’urgence y sont rarement assurés dans des conditions adéquates. Renforcer ensemble l’HGR et les centres de santé qui lui réfèrent leurs patients est la manière la plus directe de sécuriser le parcours de soins.]

#para[Les blocages étant cumulés, les réponses doivent l’être aussi. Une correction isolée lève peu de fonctions rouges, alors qu’une action combinée sur les intrants, les équipements et la référence en lèverait 62 %, l’eau et l’énergie permettant ensuite de stabiliser les fonctions rétablies. Financer des fonctions de soins complètes plutôt que des intrants ou des activités séparés, et adapter le contenu des paquets au profil de chaque province, en commençant par le Sankuru et le Haut-Lomami, permet de tirer le meilleur parti de ressources limitées.]

#para[La nutrition, la maintenance, l’énergie et l’eau doivent sortir de la logique de projet. Ces fonctions conditionnent plusieurs soins essentiels, mais elles dépendent encore de financements temporaires qui les rendent vulnérables à toute réduction des appuis extérieurs. Les inscrire dans les responsabilités, les budgets récurrents et les circuits nationaux d’approvisionnement, et étendre la gratuité de la maternité au transport d’urgence et au kit d’accouchement, conditionne la durabilité des gains.]

#para[Enfin, le suivi doit porter sur ce que les établissements peuvent réellement délivrer, et pas seulement sur ce qu’ils déclarent offrir. Une vérification régulière et légère des fonctions vitales, conduite par les DPS et les ECZ, permettrait de détecter les ruptures avant qu’elles ne coûtent des vies et de mesurer l’effet réel des investissements. Ce diagnostic ne mesure ni la qualité des soins ni leurs résultats sanitaires, mais il donne une base claire pour décider où agir, avec quels moyens et par quels acteurs. Les fragilités observées sont anciennes ; la plupart sont pourtant identifiables et corrigibles.]

#heading(level: 2)[5.2. Recommandations]

#para[Les recommandations découlent directement des résultats du diagnostic, des simulations des leviers susceptibles de restaurer le plus grand nombre de fonctions de soins et des échanges avec les équipes cadres des zones de santé et les divisions provinciales de la santé. Elles reposent sur trois principes : privilégier des paquets intégrés d’interventions dans les établissements prioritaires plutôt que des dotations isolées et dispersées ; donner la priorité aux fonctions vitales et aux établissements les plus vulnérables ; et attribuer chaque action à l’acteur disposant du mandat et des moyens nécessaires pour la mettre en œuvre.]

#para[Deux horizons structurent leur mise en œuvre. Les actions immédiates (0–3 mois) peuvent être engagées avec les acteurs, ressources et circuits existants, sans réforme majeure ni investissement lourd. Les actions à moyen terme (3–12 mois, et jusqu’à 24 mois pour les réformes structurelles) nécessitent des financements additionnels, des mécanismes contractuels, des mesures réglementaires ou des réorganisations plus durables. Chaque recommandation précise l’acteur principal chargé de sa mise en œuvre et son horizon d’exécution, afin d’en faciliter la planification et le suivi.]

#para[Enfin, ces recommandations s’inscrivent dans une logique d’amélioration et d’appui au système, et non de contrôle individuel. Celles adressées aux établissements visent à restaurer leur capacité opérationnelle et ne doivent en aucun cas être utilisées pour évaluer, comparer ou sanctionner des personnes ou des structures.]

#heading(level: 3)[5.2.1. Pour EpiC RDC et les partenaires techniques et financiers]

#heading(level: 4)[Recommandation 1. Sécuriser immédiatement les intrants et équipements indispensables aux urgences vitales (immédiat).]

#para[Mettre à disposition en priorité le sulfate de magnésium, l’ocytocine, l’artésunate injectable, le ballon et masque de réanimation néonatale ainsi que le kit d’accouchement, dont l’absence compromet directement la prise en charge des urgences maternelles, néonatales et pédiatriques. Cette dotation initiale devrait être accompagnée d’un stock de sécurité couvrant trois mois, d’un suivi régulier de la consommation et d’une vérification trimestrielle des stocks. L’objectif n’est pas seulement de combler les déficits actuels, mais de prévenir leur réapparition et d’éviter une succession de dotations d’urgence.]

#heading(level: 4)[Recommandation 2. Financer des paquets intégrés de restauration des fonctions de soins plutôt que des dotations isolées (moyen terme).]

#para[Concentrer les investissements sur un nombre ciblé d’établissements prioritaires et y corriger simultanément les principaux goulots : intrants, équipements, référence et eau-hygiène. Selon la simulation, les intrants, les équipements et la référence permettraient ensemble de libérer plus de six fonctions rouges sur dix, contre environ un huitième au maximum pour un levier isolé ; l’eau-hygiène conditionne ensuite leur passage au vert. Le Sankuru et le Haut-Lomami, où les vulnérabilités sont particulièrement marquées, devraient être prioritaires. L’appui devrait être organisé autour de réseaux fonctionnels de soins, associant les HGR et les centres de santé qui leur réfèrent les patients, afin de restaurer l’ensemble de la chaîne plutôt qu’un établissement isolé.]

#heading(level: 4)[Recommandation 3. Cofinancer des mécanismes de transport d’urgence intégrés à une chaîne de référence fonctionnelle (moyen terme).]

#para[Dans les zones enclavées ou dépourvues de transport organisé, soutenir des mécanismes locaux préfinancés, notamment des conventions ou forfaits avec des transporteurs, afin que le coût du transport ne repose plus exclusivement sur les familles. Le financement du transport doit cependant être indissociable du renforcement de la structure d’accueil : référer plus rapidement vers un hôpital qui ne peut pas assurer la prise en charge ne résout pas le problème. L’appui doit donc couvrir l’ensemble du parcours (stabilisation initiale, communication, transport et réception effective), avec une attention particulière aux urgences obstétricales et néonatales et au paludisme grave.]

#heading(level: 3)[5.2.2. Pour le niveau central]

#heading(level: 4)[Recommandation 4. Élargir la gratuité de la maternité aux coûts indispensables à l’accès effectif aux soins (moyen terme).]

#para[Intégrer au mécanisme de financement de la gratuité le transport d’urgence de la mère et du nouveau-né ainsi que le kit d’accouchement. La suppression du paiement à l’entrée du service ne garantit pas une protection financière effective lorsque les familles doivent encore financer le transport vers l’hôpital ou acheter elles-mêmes les fournitures manquantes. L’élargissement du paquet permettrait ainsi de mieux aligner la politique de gratuité sur le parcours réel de soins, du départ du ménage jusqu’à la prise en charge effective dans l’établissement de référence.]

#heading(level: 4)[Recommandation 5. Instituer et financer durablement la maintenance, l’énergie et l’eau dans les établissements de santé (moyen terme).]

#para[Adopter une stratégie nationale assortie de lignes budgétaires récurrentes pour la maintenance des bâtiments et équipements biomédicaux, la sécurisation de l’énergie et l’entretien des systèmes d’eau. Le diagnostic confirme que ces fonctions transversales constituent des conditions indispensables à plusieurs soins essentiels, alors qu’elles restent insuffisamment institutionnalisées et souvent dépendantes de projets ponctuels. La priorité devrait être donnée à la maintenance préventive, aux solutions énergétiques fiables, notamment les systèmes de secours et le solaire pour la chaîne du froid, et à l’acheminement effectif de l’eau jusqu’aux espaces de soins. L’objectif est de passer d’une logique de réparation ou de dotation ponctuelle à une gestion préventive et durable des infrastructures et équipements.]

#heading(level: 4)[Recommandation 6. Institutionnaliser la nutrition comme fonction permanente du système de santé (moyen terme).]

#para[Renforcer l’ancrage de la nutrition dans les services de santé en désignant clairement la responsabilité de cette fonction au niveau du centre de santé et en intégrant les intrants nutritionnels essentiels, notamment les ATPE, F75 et F100 dans les mécanismes réguliers de quantification, d’approvisionnement et de distribution. Les déficits simultanés en personnel dédié et en intrants montrent que la nutrition reste particulièrement vulnérable à l’interruption des financements temporaires. Son intégration dans les structures, les responsabilités, les budgets et la chaîne nationale d’approvisionnement permettrait de passer d’une logique de projet à une fonction durable du système, assurant la continuité du dépistage, du traitement et de la référence des enfants malnutris.]

#heading(level: 3)[5.2.3. Pour les Divisions provinciales de la santé]

#heading(level: 4)[Recommandation 7. Planifier les besoins en médicaments à partir de la consommation réelle et sécuriser une distribution trimestrielle jusqu’aux établissements (immédiat).]

#para[Fonder la quantification et les commandes sur les consommations réelles des établissements, ajustées aux besoins et à l’évolution de l’activité, plutôt que sur des estimations historiques insuffisamment actualisées. Les DPS et les zones de santé devraient établir des plans trimestriels d’approvisionnement et de distribution jusqu’aux établissements, en s’appuyant sur les outils de planification déjà utilisés dans les provinces et en suivant systématiquement les produits critiques. Le fait que des fonctions restent bloquées par manque d’intrants même dans des établissements ne déclarant aucune rupture montre que le problème dépasse la gestion ponctuelle des stocks : il concerne l’ensemble du cycle de quantification, d’approvisionnement, de distribution et de suivi de la disponibilité au point de prestation.]

#heading(level: 4)[Recommandation 8. Instituer une vérification trimestrielle de la capacité réelle à assurer les soins vitaux (immédiat, puis en continu).]

#para[Intégrer aux revues provinciales et aux supervisions des zones de santé un tableau de bord léger de préparation opérationnelle, centré sur un nombre limité de conditions critiques vérifiées physiquement dans les établissements plutôt que sur la seule disponibilité déclarée des services.]

#para[La priorité devrait être donnée aux fonctions vitales et aux structures de référence, notamment aux HGR. L’écart important observé entre services déclarés et capacité réelle montre que les indicateurs de routine peuvent donner une image trop favorable de l’offre. Le suivi devrait donc évoluer d’une logique centrée sur « le service est-il déclaré disponible ? » vers une question plus opérationnelle : « le service peut-il effectivement être délivré aujourd’hui dans les conditions minimales requises ? ». Les déficits identifiés devraient être assortis d’un plan correctif, d’un responsable et d’un suivi lors de la revue suivante.]

#heading(level: 3)[5.2.4. Pour les équipes cadres des zones de santé]

#heading(level: 4)[Recommandation 9. Organiser et sécuriser la chaîne de référence à l’échelle de la zone de santé (immédiat).]

#para[Mettre en place, sous la coordination de l’ECZ, un circuit standardisé de référence et contre-référence : tenir à jour la liste des moyens de transport mobilisables, identifier les structures de destination selon le type d’urgence, contacter systématiquement l’établissement d’accueil avant la référence, utiliser une fiche de référence harmonisée et assurer le retour d’information vers l’établissement référent. Les retards à l’arrivée, l’absence fréquente d’appel préalable et de fiche de référence montrent que la continuité des soins est aussi un problème d’organisation. Ces mesures, relativement peu coûteuses, peuvent être engagées rapidement. Elles doivent toutefois s’accompagner d’une vérification régulière de la capacité de la structure de destination à recevoir et prendre en charge l’urgence, afin d’éviter de transférer un patient vers un service lui-même non opérationnel.]

#heading(level: 4)[Recommandation 10. Recentrer la supervision formative sur les fonctions vitales et leurs conditions opérationnelles (immédiat).]

#para[Inscrire dans le plan et le budget de la zone une supervision formative trimestrielle priorisant les fonctions vitales les plus fragiles, notamment la réanimation néonatale, la prise en charge de la pré-éclampsie, de l’hémorragie du post-partum et du paludisme grave. La supervision devrait associer une vérification pratique des conditions nécessaires à chaque fonction (compétences, intrants, équipements et organisation) à un accompagnement clinique court et répété sur le lieu de travail, avec des actions correctrices suivies d’une visite à l’autre. Elle devrait également vérifier la disponibilité et l’utilisation des registres, fiches et canevas officiels, leur absence constituant un goulot important dans la production et la transmission des données. L’objectif est de faire évoluer la supervision d’un exercice principalement administratif vers un outil régulier de détection et de correction des obstacles qui empêchent concrètement de sauver une vie.]

#heading(level: 3)[5.2.5. Pour les établissements de santé]

#heading(level: 4)[Recommandation 11. Instituer une revue mensuelle de la préparation opérationnelle avec le CODESA (immédiat).]

#para[Intégrer aux réunions mensuelles du CODESA une revue simple de la capacité du centre de santé à assurer les fonctions vitales, fondée sur la vérification des intrants, équipements et autres conditions critiques. Les ruptures prévisibles devraient être signalées à l’ECZ avant épuisement des stocks et donner lieu à une action corrective suivie. Cette pratique permettrait de transformer les données de l’établissement en outil concret de gestion locale et d’alerte précoce, tout en renforçant la participation communautaire et la redevabilité sur la disponibilité effective des services essentiels.]

#heading(level: 4)[Recommandation 12. Garantir une prise en charge ou une référence effective de chaque enfant dépisté malnutri (immédiat).]

#para[Désigner, parmi le personnel disponible, un agent responsable de la nutrition et organiser un circuit clair garantissant que tout enfant dépisté malnutri soit pris en charge dans l’établissement lorsque les conditions sont réunies, soit rapidement référé vers une structure capable de le traiter. Le diagnostic montre en effet un décalage majeur entre dépistage et traitement : même lorsque le dépistage fonctionne, la prise en charge de la malnutrition non compliquée reste très souvent impossible. Le dépistage ne doit donc pas constituer une fin en soi, mais le point d’entrée d’un continuum allant de l’identification de l’enfant à son traitement effectif et à son suivi. Le référent nutrition devrait également vérifier régulièrement la disponibilité des intrants nutritionnels et signaler précocement les ruptures à l’ECZ*.*]

#heading(level: 3)[5.2.6. Pour compléter le diagnostic : deux études sur le continuum des soins et la santé communautaire]

#para[Le présent diagnostic renseigne principalement sur la capacité opérationnelle des établissements. Il ne permet cependant pas de déterminer dans quelle mesure les populations accèdent effectivement aux services, reçoivent des soins de qualité et poursuivent leur parcours de soins, ni d’analyser suffisamment ce qui se passe dans la communauté avant l’arrivée à l’établissement. Deux études complémentaires, conduites conjointement par EpiC RDC, le ministère, les DPS concernées et les partenaires, permettraient de compléter cette lecture.]

#heading(level: 4)[Recommandation 13. Évaluer le continuum des soins jusqu’à la couverture effective (moyen terme).]

#para[Conduire une étude suivant le parcours des mères, nouveau-nés et enfants selon le continuum de couverture inspiré de Tanahashi : disponibilité des services, accessibilité géographique et financière, acceptabilité, utilisation initiale, continuité des soins, qualité et couverture effective \[54, 55\]. Une attention particulière devrait être accordée aux barrières financières résiduelles, notamment au transport et aux dépenses restant à la charge des ménages malgré les mécanismes de gratuité.]

#para[Cette étude permettrait de compléter deux limites importantes du présent diagnostic. D’une part, celui-ci mesure essentiellement la préparation de l’offre alors que des pertes peuvent survenir à chaque étape du parcours, depuis la décision de rechercher les soins jusqu’à leur utilisation continue. D’autre part, la disponibilité des ressources ne garantit ni la qualité ni l’efficacité des soins reçus. Dans les pays à revenu faible et intermédiaire, une part importante des décès évitables survient ainsi chez des personnes ayant effectivement accédé au système de santé mais ayant reçu des soins de qualité insuffisante \[56\].]

#para[L’étude pourrait combiner enquête auprès des ménages, observation directe des soins, analyse des parcours et entretiens qualitatifs. Dans la mesure du possible, elle devrait inclure les mêmes établissements afin de suivre l’évolution de leur capacité et d’examiner si les améliorations de préparation se traduisent effectivement par une meilleure couverture et de meilleurs soins.]

#heading(level: 4)[Recommandation 14. Évaluer le continuum communautaire des soins dans les zones appuyées (moyen terme).]

#para[Conduire une étude spécifique sur la capacité du dispositif communautaire à détecter précocement les besoins, faciliter le recours aux soins et assurer le lien entre ménages et établissements. Elle devrait examiner le fonctionnement des relais et agents de santé communautaire, les sites de soins communautaires et les mécanismes de participation, la disponibilité de leurs moyens de travail, la reconnaissance des signes de danger par les familles ainsi que les mécanismes de référence et de suivi entre communauté et établissements. Cette étude est particulièrement importante car une part majeure des décès survient dans la communauté, alors que la couverture des sites de soins communautaires reste insuffisante dans les provinces concernées \[52\]. Les résultats du diagnostic montrent également que les obstacles à la référence commencent souvent avant le départ vers l’établissement, notamment lorsque les ménages ne disposent pas des ressources nécessaires ou refusent la référence. Ces contraintes rejoignent les résultats récents sur les dynamiques de santé communautaire en RDC, qui mettent également en évidence l’insuffisance des moyens dont disposent de nombreux acteurs communautaires \[53\].]

#para[Ensemble, ces deux études permettraient de relier trois niveaux aujourd’hui analysés séparément : la communauté, la capacité opérationnelle des établissements et la qualité des soins effectivement reçus. Elles donneraient ainsi une vision plus complète du parcours qui conduit ou non d’un besoin de santé à une couverture réellement effective.]

#heading(level: 3)[5.2.7. Synthèse et conditions de réussite]

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 8.0pt, weight: "bold", fill: rgb("#131d44"))[Tableau 37 : Plan d'action priorisé : responsables, indicateurs, valeurs de départ et cibles indicatives]]
#set par(justify: false, leading: 0.62em)
#set text(size: 7.4pt)
#table(
  columns: (0.0466fr, 0.2284fr, 0.1247fr, 0.2392fr, 0.0985fr, 0.0987fr, 0.0780fr, 0.0858fr),
  inset: (x: 4.4pt, y: 2.3pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[N°]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Action]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Responsable (appui)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Indicateur : valeur de départ ; cible indicative]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Échéance]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Urgence]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Effort]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Impact]]]),
    table.cell(colspan: 8, fill: rgb("#ced6f8"), align: left, [#text(fill: rgb("#131d44"), weight: "bold")[EpiC RDC et partenaires techniques et financiers]]),
    [#block(breakable: false)[1]], [#block(breakable: false)[Doter les établissements à menace immédiate en sulfate de magnésium, ocytocine, artésunate injectable, ballon et masque néonatals et kit d'accouchement, avec un stock tampon de trois mois]], [#block(breakable: false)[EpiC RDC, PTF (DPS)]], [#block(breakable: false)[Établissements avec menace immédiate : 115 ; ≤ 16. Établissements sans kit d'accouchement : 127 ; ≤ 16]], [#block(breakable: false)[3 mois]], [#block(breakable: false)[Immédiate]], [#block(breakable: false)[Faible]], [#block(breakable: false)[Élevé]],
    [#block(breakable: false)[2]], [#block(breakable: false)[Financer des paquets complets (intrants, équipements, référence, eau) dans un nombre limité d'établissements : chaque HGR et ses CS référents, d'abord au Sankuru et au Haut-Lomami]], [#block(breakable: false)[EpiC RDC, PTF (DPS, ECZ)]], [#block(breakable: false)[Part de fonctions d'urgence rouges dans les établissements appuyés : 81 % ; ≤ 40 %]], [#block(breakable: false)[12 mois]], [#block(breakable: false)[Haute]], [#block(breakable: false)[Élevé]], [#block(breakable: false)[Très élevé]],
    [#block(breakable: false)[3]], [#block(breakable: false)[Cofinancer un transport d'urgence (conventions forfaitaires avec des transporteurs locaux ou motos-ambulances) dans les zones enclavées, conditionné à la préparation de l'HGR d'accueil]], [#block(breakable: false)[EpiC RDC, PTF (ECZ)]], [#block(breakable: false)[Établissements avec un moyen de transport fonctionnel : 29,4 % ; ≥ 60 %]], [#block(breakable: false)[12 mois]], [#block(breakable: false)[Haute]], [#block(breakable: false)[Moyen]], [#block(breakable: false)[Élevé]],
    table.cell(colspan: 8, fill: rgb("#ced6f8"), align: left, [#text(fill: rgb("#131d44"), weight: "bold")[Niveau central (MSPHPS)]]),
    [#block(breakable: false)[4]], [#block(breakable: false)[Inscrire le transport d'urgence de la mère et du nouveau-né et le kit d'accouchement parmi les prestations couvertes par la gratuité]], [#block(breakable: false)[MSPHPS (PTF)]], [#block(breakable: false)[Texte d'application adopté ; prestations remboursées dans les huit provinces]], [#block(breakable: false)[12 mois]], [#block(breakable: false)[Haute]], [#block(breakable: false)[Moyen]], [#block(breakable: false)[Élevé]],
    [#block(breakable: false)[5]], [#block(breakable: false)[Adopter et budgétiser une stratégie nationale de maintenance biomédicale, d'énergie (secours, solaire pour la chaîne du froid) et d'entretien de l'eau]], [#block(breakable: false)[MSPHPS (PTF, DPS)]], [#block(breakable: false)[Stratégie adoptée et ligne budgétaire inscrite. Source de secours fonctionnelle : 40,1 % ; ≥ 60 %. Points d'eau fonctionnels dans les services : 22,3 % ; ≥ 50 %]], [#block(breakable: false)[12 à 24 mois]], [#block(breakable: false)[Moyenne]], [#block(breakable: false)[Élevé]], [#block(breakable: false)[Élevé]],
    [#block(breakable: false)[6]], [#block(breakable: false)[Créer un point focal nutrition dans le cadre organique du CS et intégrer l'ATPE, le F75 et le F100 au circuit national d'approvisionnement]], [#block(breakable: false)[MSPHPS, PRONANUT (PTF)]], [#block(breakable: false)[CS avec ATPE disponible : 13,9 % ; ≥ 60 %]], [#block(breakable: false)[12 mois]], [#block(breakable: false)[Haute]], [#block(breakable: false)[Moyen]], [#block(breakable: false)[Élevé]],
    table.cell(colspan: 8, fill: rgb("#ced6f8"), align: left, [#text(fill: rgb("#131d44"), weight: "bold")[Divisions provinciales de la santé]]),
    [#block(breakable: false)[7]], [#block(breakable: false)[Quantifier les besoins sur la consommation réelle et organiser une distribution trimestrielle jusqu'aux établissements]], [#block(breakable: false)[DPS (ECZ, PTF)]], [#block(breakable: false)[Établissements déclarant une rupture de médicaments sur trois mois : 54,4 % ; ≤ 25 %]], [#block(breakable: false)[3 mois, puis trimestriel]], [#block(breakable: false)[Immédiate]], [#block(breakable: false)[Moyen]], [#block(breakable: false)[Élevé]],
    [#block(breakable: false)[8]], [#block(breakable: false)[Tenir une revue trimestrielle de la préparation réelle des fonctions vitales, sur une dizaine d'éléments vérifiés sur place, en commençant par les HGR]], [#block(breakable: false)[DPS (ECZ)]], [#block(breakable: false)[Revues tenues avec données vérifiées : 0 ; 4 par an. Césarienne rouge à l'HGR : 81,1 % ; ≤ 50 %]], [#block(breakable: false)[3 mois]], [#block(breakable: false)[Immédiate]], [#block(breakable: false)[Faible]], [#block(breakable: false)[Élevé]],
    table.cell(colspan: 8, fill: rgb("#ced6f8"), align: left, [#text(fill: rgb("#131d44"), weight: "bold")[Équipes cadres des zones de santé]]),
    [#block(breakable: false)[9]], [#block(breakable: false)[Organiser le circuit de référence de la zone : répertoire des transports, appel préalable systématique, fiche de référence unique, contre-référence]], [#block(breakable: false)[ECZ (ESS, HGR)]], [#block(breakable: false)[Structures d'accueil signalant l'absence de communication préalable : 84,7 % ; ≤ 30 %. Références sans fiche : 74,6 % ; ≤ 20 %]], [#block(breakable: false)[3 mois]], [#block(breakable: false)[Immédiate]], [#block(breakable: false)[Faible]], [#block(breakable: false)[Élevé]],
    [#block(breakable: false)[10]], [#block(breakable: false)[Budgétiser une supervision formative trimestrielle centrée sur la réanimation néonatale, la pré-éclampsie, l'hémorragie et le paludisme grave, avec vérification des outils SNIS]], [#block(breakable: false)[ECZ (DPS)]], [#block(breakable: false)[Établissements en rupture sur les outils et la transmission : 31,2 % ; ≤ 10 %. Quatre visites par an et par établissement]], [#block(breakable: false)[3 mois, puis trimestriel]], [#block(breakable: false)[Haute]], [#block(breakable: false)[Faible]], [#block(breakable: false)[Moyen]],
    table.cell(colspan: 8, fill: rgb("#ced6f8"), align: left, [#text(fill: rgb("#131d44"), weight: "bold")[Établissements de soins de santé]]),
    [#block(breakable: false)[11]], [#block(breakable: false)[Tenir chaque mois une revue de la préparation avec le CODESA (liste des éléments vitaux, alerte avant rupture)]], [#block(breakable: false)[IT, médecin directeur (ECZ)]], [#block(breakable: false)[Douze revues documentées par an ; ruptures signalées avant épuisement]], [#block(breakable: false)[3 mois]], [#block(breakable: false)[Haute]], [#block(breakable: false)[Faible]], [#block(breakable: false)[Moyen]],
    [#block(breakable: false)[12]], [#block(breakable: false)[Désigner un agent nutrition parmi le personnel en place et garantir à chaque enfant malnutri dépisté un traitement effectif, sur place ou par référence]], [#block(breakable: false)[IT, médecin directeur (ECZ)]], [#block(breakable: false)[Aval rouge du parcours dépistage–malnutrition non compliquée : 94 % ; ≤ 50 %]], [#block(breakable: false)[3 mois]], [#block(breakable: false)[Haute]], [#block(breakable: false)[Faible]], [#block(breakable: false)[Élevé]],
    table.cell(colspan: 8, fill: rgb("#ced6f8"), align: left, [#text(fill: rgb("#131d44"), weight: "bold")[Études complémentaires (EpiC RDC, PTF et MSPHPS)]]),
    [#block(breakable: false)[13]], [#block(breakable: false)[Évaluer la chaîne des soins jusqu'à la couverture effective, y compris l'observation de la qualité clinique et l'audit des données de routine]], [#block(breakable: false)[EpiC RDC, MSPHPS]], [#block(breakable: false)[Devis d'étude validé (3 mois) ; collecte sur les mêmes 160 établissements (12 mois)]], [#block(breakable: false)[12 mois]], [#block(breakable: false)[Moyenne]], [#block(breakable: false)[Élevé]], [#block(breakable: false)[Élevé]],
    [#block(breakable: false)[14]], [#block(breakable: false)[Conduire une étude sur la santé communautaire (relais, agents de santé communautaire, sites de soins, organes de participation, référence communautaire)]], [#block(breakable: false)[EpiC RDC, PTF, programme national chargé de la santé communautair e]], [#block(breakable: false)[Étude réalisée ; situation de référence du PSN SACO dans les huit provinces]], [#block(breakable: false)[12 mois]], [#block(breakable: false)[Moyenne]], [#block(breakable: false)[Moyen]], [#block(breakable: false)[Moyen]],
)
#v(4pt)

#note-block[*Lecture effort-impact. *Les gains rapides, à effort faible et impact élevé, sont les recommandations 1, 8, 9 et 12, à lancer dès le premier trimestre. Les investissements structurants, à effort élevé, sont les recommandations 2 et 5, à planifier et financer sur 12 à 24 mois. Les mesures de politique et d'approvisionnement, à effort moyen (recommandations 3, 4, 6 et 7), relèvent du dialogue entre le MSPHPS et les partenaires. Les recommandations 10, 11, 13 et 14 portent sur le pilotage et la connaissance. Les cibles sont indicatives et doivent être validées lors de l'atelier de restitution. Ces recommandations se renforcent les unes les autres. La dotation d'urgence n'aura d'effet durable que si le calcul des besoins est revu au niveau provincial. Le transport financé ne sauvera des vies que si l'hôpital qui reçoit est prêt. La maintenance et l'énergie conditionnent la durée de vie du matériel fourni. Et les deux études proposées permettront de vérifier si les efforts consentis dans les établissements se traduisent réellement par de meilleurs soins pour les familles. Leur mise en œuvre suppose un cadre commun de coordination entre EpiC RDC, les autres partenaires, les divisions provinciales et les équipes cadres des zones, adossé au plan d'action opérationnel de chaque zone.]


#pagebreak()
#set page(fill: rgb("#131d44"), header: none, footer: none)
#block(width: 100%, height: 100%)[
  #align(center + horizon)[
    #block(above: 0pt, below: 8pt)[#text(size: 8.2pt, tracking: 4pt, fill: rgb("#ced6f8"))[#upper[SECTION]]]
    #context part-size.update(34pt)
    #heading(level: 1)[BIBLIOGRAPHIE]
    #v(9pt)
    #text(font: script, size: 22pt, fill: rgb("#ced6f8"))[Sources et références]
  ]
]
#context head-state.update("BIBLIOGRAPHIE")
#pagebreak()
#set page(fill: rgb("#c2cfea"), header: hdr(), footer: ftr())

#para[\[1\] Institut National de la Statistique (INS), & École de Santé Publique de Kinshasa (ESP). (2025). _Enquête Démographique et de Santé EDS-RDC III 2023–2024 : Rapport final_. ICF. https://dhsprogram.com/pubs/pdf/FR393/FR393.pdf]

#para[\[2\] Options, MSI Reproductive Choices, Ipas, RAES, Sightsavers, & WiLDAF-AO. (2026). _Note de_ _synthèse pour soutenir la prioritisation et l’augmentation des dépenses consacrées à la_ _planification familiale et à la santé reproductive en République Démocratique du Congo_. WISH2 West and Central Africa. https://www.opml.co.uk/sites/default/files/2026-05/wish-french-rdc.pdf]

#para[\[3\] European Centre for Disease Prevention and Control. (2026). _Ebola disease outbreak in the_ _Democratic Republic of the Congo_. European Centre for Disease Prevention and Control. https://www.ecdc.europa.eu/en/ebola-outbreak-democratic-republic-congo-and-uganda]

#para[\[4\] Organisation mondiale de la Santé. (2026). _Bulletin trimestriel du programme des urgences_ _sanitaires : Bureau pays de l’OMS en RDC, janvier–mars 2026_. Bureau pays de l’OMS en République démocratique du Congo. https://www.afro.who.int/sites/default/files/2026-04/Bulletin%20trimestriel\_%20janvier-mars\_2026\_Cluster%20EPR%20DRC.pdf]

#para[\[5\] Ministère de la Santé Publique, Hygiène et Prévoyance Sociale. (2024). _Évaluation harmonisée_ _des établissements de soins de santé (HHFA), République démocratique du Congo 2022–2023_. Ministère de la Santé Publique, Hygiène et Prévoyance Sociale.]

#para[\[6\] Tanahashi, T. (1978). Health service coverage and its evaluation. _Bulletin of the World Health_ _Organization, 56_(2), 295–303. https://pmc.ncbi.nlm.nih.gov/articles/PMC2395571/]

#para[\[7\] Donabedian, A. (1988). The quality of care: How can it be assessed? _JAMA, 260_(12), 1743–1748. https://doi.org/10.1001/jama.1988.03410120089033]

#para[\[8\] Kruk, M. E., Gage, A. D., Arsenault, C., Jordan, K., Leslie, H. H., Roder-DeWan, S., Adeyi, O., Barker, P., Daelmans, B., Doubova, S. V., English, M., García-Elorrio, E., Guanais, F., Gureje, O., Hirschhorn, L. R., Jiang, L., Kelley, E., Lemango, E. T., Liljestrand, J., … Pate, M. (2018). High-quality health systems in the Sustainable Development Goals era: Time for a revolution. _The_ _Lancet Global Health, 6_(11), e1196–e1252. https://doi.org/10.1016/S2214-109X(18)30386-3]

#para[\[9\] Leslie, H. H., Sun, Z., & Kruk, M. E. (2017). Association between infrastructure and observed quality of care in 4 healthcare services: A cross-sectional study of 4,300 facilities in 8 countries. _PLOS Medicine, 14_(12), e1002464. https://doi.org/10.1371/journal.pmed.1002464]

#para[\[10\] Organisation mondiale de la Santé. (2007). _Everybody’s business: Strengthening health systems_ _to improve health outcomes: WHO’s framework for action_. Organisation mondiale de la Santé. https://www.who.int/publications/i/item/everybody-s-business----strengthening-health-systems-to-improve-health-outcomes]

#para[\[11\] Thaddeus, S., & Maine, D. (1994). Too far to walk: Maternal mortality in context. _Social Science &_ _Medicine, 38_(8), 1091–1110. https://doi.org/10.1016/0277-9536(94)90226-7]

#para[\[12\] Knight, H. E., Self, A., & Kennedy, S. H. (2013). Why are women dying when they reach hospital on time? A systematic review of the “third delay”. _PLOS ONE, 8_(5), e63846. https://doi.org/10.1371/journal.pone.0063846]

#para[\[13\] de Savigny, D., & Adam, T. (Éds.). (2009). _Systems thinking for health systems strengthening_. Alliance for Health Policy and Systems Research, Organisation mondiale de la Santé. https://www.who.int/publications/i/item/9789241563895]

#para[\[14\] Paina, L., & Peters, D. H. (2012). Understanding pathways for scaling up health services through the lens of complex adaptive systems. _Health Policy and Planning, 27_(5), 365–373. https://doi.org/10.1093/heapol/czr054]

#para[\[15\] École de Santé Publique de l’Université de Kinshasa (ESPK), & ICF. (2019). _République_ _démocratique du Congo : Évaluation des Prestations des Services de soins de Santé (EPSS RDC)_ _2017–2018 : Rapport final_. ESPK & ICF. https://dhsprogram.com/pubs/pdf/SPA30/SPA30.pdf]

#para[\[16\] Hotchkiss, D. R., Wisniewski, J., Worges, M., Lusamba-Dikassa, P.-S., et al. (2021). _USAID_ _Integrated Health Program midline evaluation: Results from the 2019 and 2021 health facility_ _surveys and qualitative data_ (TR-21-447). Data for Impact.]

#para[https://www.data4impactproject.org/wp-content/uploads/2022/01/DRC\_IHP-Midline-Evaluation-Report\_TR-21-447-D4I\_508c.pdf]

#para[\[17\] Abt Global. (2025). _USAID Integrated Health Program (IHP): Final report_. Abt Global.]

#para[\[18\] Gabrysch, S., Zanger, P., & Campbell, O. M. R. (2012). Emergency obstetric care availability: A critical assessment of the current indicator. _Tropical Medicine & International Health, 17_(1), 2–]

#para[8. https://doi.org/10.1111/j.1365-3156.2011.02851.x]

#para[\[19\] Sheffel, A., Karp, C., & Creanga, A. A. (2018). Use of Service Provision Assessments and Service Availability and Readiness Assessments for monitoring quality of maternal and newborn health services in low-income and middle-income countries. _BMJ Global Health, 3_(6), e001011. https://doi.org/10.1136/bmjgh-2018-001011]

#para[\[20\] Hotchkiss, D. R., Niles, J., Worges, M., Wisniewski, J., & Lusamba-Dikassa, P.-S. (2024). _USAID_ _Integrated Health Program evaluation report: Impact evaluation results_ (TR-24-589). Data for Impact. https://www.data4impactproject.org/wp-content/uploads/2024/12/USAID-IHP-Endline-Impact-Evaluation-Results-TR-24-589-D4I-508c.pdf]

#para[\[21\] Yadav, P. (2015). Health product supply chains in developing countries: Diagnosis of the root causes of underperformance and an agenda for reform. _Health Systems & Reform, 1_(2), 142–154. https://doi.org/10.4161/23288604.2014.968005]

#para[\[22\] Ministère de la Santé Publique, Hygiène et Prévoyance Sociale. (2024). _Plan national de_ _développement sanitaire et de prévoyance sociale (PNDS-PS) 2024–2033_. Ministère de la Santé Publique, Hygiène et Prévoyance Sociale. https://fr.scribd.com/document/811213076/PNDS-PS-2024-2033-Version-Fin-17-Sept-2024-2]

#para[\[23\] The Magpie Trial Collaborative Group. (2002). Do women with pre-eclampsia, and their babies, benefit from magnesium sulphate? The Magpie Trial: A randomised placebo-controlled trial. _The_ _Lancet, 359_(9321), 1877–1890. https://doi.org/10.1016/S0140-6736(02)08778-0]

#para[\[24\] Perry, L., & Malkin, R. (2011). Effectiveness of medical equipment donations to improve health systems: How much medical equipment is broken in the developing world? _Medical & Biological_ _Engineering & Computing, 49_(7), 719–722. https://doi.org/10.1007/s11517-011-0786-3]

#para[\[25\] Niles, J., Bosonkie, M., Lusamba-Dikassa, P.-S., & Wisniewski, J. (2026). Assessment of the medical equipment supply chain in the Democratic Republic of Congo: A qualitative methods study. _BMC Health Services Research, 26_, 340. https://doi.org/10.1186/s12913-026-14131-y]

#para[\[26\] Lee, A. C. C., Cousens, S., Wall, S. N., Niermeyer, S., Darmstadt, G. L., Carlo, W. A., Keenan, W. J., Bhutta, Z. A., Gill, C., & Lawn, J. E. (2011). Neonatal resuscitation and immediate newborn assessment and stimulation for the prevention of neonatal deaths: A systematic review, meta-analysis and Delphi estimation of mortality effect. _BMC Public Health, 11_(Suppl. 3), S12. https://doi.org/10.1186/1471-2458-11-S3-S12]

#para[\[27\] Msemo, G., Massawe, A., Mmbando, D., Rusibamayila, N., Manji, K., Kidanto, H. L., Mwizamuholya, D., Ringia, P., Ersdal, H. L., & Perlman, J. (2013). Newborn mortality and fresh stillbirth rates in Tanzania after Helping Babies Breathe training. _Pediatrics, 131_(2), e353–e360. https://doi.org/10.1542/peds.2012-1795]

#para[\[28\] Hetzel, M. W., Okitawutshu, J., Tshefu, A., Omoluabi, E., Awor, P., Signorell, A., Brunner, N. C., Kalenga, J.-C., Akano, B. K., Ayodeji, K., Okon, C., Yusuf, O., Athieno, P., Kimera, J., Tumukunde, G., Angiro, I., Delvento, G., Lee, T. T., Lambiris, M. J., … Lengeler, C. (2022). Effectiveness of rectal artesunate as pre-referral treatment for severe malaria in children under 5 years of age: A multi-country observational study. _BMC Medicine, 20_, 343. https://doi.org/10.1186/s12916-022-02541-8]

#para[\[29\] Gomes, M. F., Faiz, M. A., Gyapong, J. O., Warsame, M., Agbenyega, T., Babiker, A., Baiden, F., Yunus, E. B., Binka, F., Clerk, C., Folb, P., Hassan, R., Hossain, M. A., Kimbute, O., Kitua, A., Krishna, S., Makasi, C., Mensah, N., Mrango, Z., … White, N. J. (2009). Pre-referral rectal artesunate to prevent death and disability in severe malaria: A placebo-controlled trial. _The_ _Lancet, 373_(9663), 557–566. https://pmc.ncbi.nlm.nih.gov/articles/PMC2646124/]

#para[\[30\] Tayler-Smith, K., Zachariah, R., Manzi, M., Van den Boogaard, W., Nyandwi, G., Reid, T., Van den Bergh, R., De Plecker, E., Lambert, V., Nicolai, M., Goetghebuer, S., Christaens, B., Ndelema, B., Kabangu, A., Manirampa, J., & Harries, A. D. (2013). Achieving the Millennium Development Goal]

#para[of reducing maternal mortality in rural Africa: An experience from Burundi. _Tropical Medicine &_ _International Health, 18_(2), 166–174. https://doi.org/10.1111/tmi.12022]

#para[\[31\] Cronk, R., & Bartram, J. (2018). Environmental conditions in health care facilities in low- and middle-income countries: Coverage and inequalities. _International Journal of Hygiene and_ _Environmental Health, 221_(3), 409–422. https://doi.org/10.1016/j.ijheh.2018.01.004]

#para[\[32\] International Center for Health Systems Strengthening (ICHESS), UNICEF, & Programme Élargi de Vaccination (PEV). (2025). _Application du modèle de Tanahashi à l’analyse de la vaccination_ _en RDC : Étude des quatre provinces ayant le plus grand nombre d’enfants zéro dose : Rapport_ _narratif et analytique_. ICHESS. https://ichess-us.org/tanahashi-model-immunization-analysis-four-drc-provinces/]

#para[\[33\] Rowe, A. K., Rowe, S. Y., Peters, D. H., Holloway, K. A., Chalker, J., & Ross-Degnan, D. (2018). Effectiveness of strategies to improve health-care provider practices in low-income and middle-income countries: A systematic review. _The Lancet Global Health, 6_(11), e1163–e1175. https://pmc.ncbi.nlm.nih.gov/articles/PMC6185992/]

#para[\[34\] Rogers, E., Myatt, M., Woodhead, S., Guerrero, S., & Alvarez, J. L. (2015). Coverage of community-based management of severe acute malnutrition programmes in twenty-one countries, 2012–]

#para[2013. _PLOS ONE, 10_(6), e0128666. https://doi.org/10.1371/journal.pone.0128666]

#para[\[35\] Organisation mondiale de la Santé. (2023). _WHO guideline on the prevention and management_ _of wasting and nutritional oedema (acute malnutrition) in infants and children under 5 years_. Organisation mondiale de la Santé. https://www.who.int/publications/i/item/9789240082830]

#para[\[36\] Kremer, M. (1993). The O-Ring theory of economic development. _The Quarterly Journal of_ _Economics, 108_(3), 551–575. https://doi.org/10.2307/2118400]

#para[\[37\] Hanson, K., Ranson, M. K., Oliveira-Cruz, V., & Mills, A. (2003). Expanding access to priority health interventions: A framework for understanding the constraints to scaling-up. _Journal of_ _International Development, 15_(1), 1–14. https://doi.org/10.1002/jid.963]

#para[\[38\] CHISU RDC. (2023). _Rapport synthèse de l’audit de la qualité des données malaria de 61 sites de_ _cinq Divisions provinciales de la santé : Haut-Katanga, Tanganyika, Sud-Kivu, Kasaï-Central,_ _Kasaï-Oriental_. CHISU RDC.]

#para[\[39\] CHISU RDC. (2023). _Rapport de l’analyse des infrastructures informatiques du Programme_ _national de lutte contre le paludisme (PNLP) et des bureaux provinciaux de l’information_ _sanitaire_. CHISU RDC.]

#para[\[40\] Nutley, T., & Reynolds, H. W. (2013). Improving the use of health data for health system strengthening. _Global Health Action, 6_(1), 20001. https://doi.org/10.3402/gha.v6i0.20001]

#para[\[41\] Wickremasinghe, D., Hashmi, I. E., Schellenberg, J., & Avan, B. I. (2016). District decision-making for health in low-income settings: A systematic literature review. _Health Policy and Planning,_ _31_(Suppl. 2), ii12–ii24. https://doi.org/10.1093/heapol/czv124]

#para[\[42\] Mizerero, S.-A., Wilunda, C., Musumari, P. M., Ono-Kihara, M., Mubungu, G., Kihara, M., & Nakayama, T. (2021). The status of emergency obstetric and newborn care in post-conflict eastern DRC: A facility-level cross-sectional study. _Conflict and Health, 15_, 61. https://doi.org/10.1186/s13031-021-00395-0]

#para[\[43\] Carter, R., Xiong, X., Lusamba-Dikassa, P.-S., Kuburhanwa, E. C., Kimanuka, F., Salumu, F., Clarysse, G., Kalume Tutu, B., Yuma, S., Mboko Iyeti, A., Hernandez, J. H., Shaffer, J. G., Bertrand, J. T., Villeneuve, S., Prual, A., Pyne-Mercier, L., Nigussie, A., & Buekens, P. (2019). Facility conditions, obstetric and neonatal care practices, and availability of emergency obstetric and neonatal care in 72 rural health facilities in the Democratic Republic of the Congo: A cross-sectional study. _Gates Open Research, 3_, 13. https://pubmed.ncbi.nlm.nih.gov/31410393/]

#para[\[44\] Ntambue, A. M., Malonga, F. K., Dramaix-Wilmet, M., Ngatu, R. N., & Donnen, P. (2016). Better than nothing? Maternal, newborn, and child health services and perinatal mortality, Lubumbashi, Democratic Republic of the Congo: A cohort study. _BMC Pregnancy and Childbirth,_ _16_, 89. https://doi.org/10.1186/s12884-016-0879-y]

#para[\[45\] Karemere, H., Ribesse, N., Kahindo, J.-B., & Macq, J. (2015). Referral hospitals in the Democratic Republic of Congo as complex adaptive systems: Similar program, different dynamics. _Pan_ _African Medical Journal, 20_, 281. https://doi.org/10.11604/pamj.2015.20.281.4266]

#para[\[46\] Cavalcanti, D. M., Sales, L. de O. F. de, Silva, A. F. da, Basterra, E. L., Pena, D., Monti, C., Barreix, G., Silva, N. J., Vaz, P., Saute, F., Fanjul, G., Bassat, Q., Naniche, D., Macinko, J., & Rasella, D. (2025). Evaluating the impact of two decades of USAID interventions and projecting the effects of defunding on mortality up to 2030: A retrospective impact evaluation and forecasting analysis. _The Lancet, 406_(10500), 283–294. https://doi.org/10.1016/S0140-6736(25)01186-9]

#para[\[47\] Sochas, L., Channon, A. A., & Nam, S. (2017). Counting indirect crisis-related deaths in the context of a low-resilience health system: The case of maternal and neonatal health during the Ebola epidemic in Sierra Leone. _Health Policy and Planning, 32_(Suppl. 3), iii32–iii39. https://doi.org/10.1093/heapol/czx108]

#para[\[48\] Quattrochi, J. P., Malemo, L., & Niehuus, R. (2023). Impact of the 2018–2020 Democratic Republic of Congo Ebola epidemic on health system utilization and health outcomes. _Journal of_ _Global Health Reports, 7_, e2023068. https://doi.org/10.29392/001c.88108]

#para[\[49\] Kruk, M. E., Myers, M., Varpilah, S. T., & Dahn, B. T. (2015). What is a resilient health system? Lessons from Ebola. _The Lancet, 385_(9980), 1910–1912. https://pubmed.ncbi.nlm.nih.gov/25987159/]

#para[\[50\] Centre de Recherche Patrick Kayembe. (2024). _Évaluation de l’efficacité du programme de_ _gratuité de la maternité en RDC : Étude quasi-expérimentale, Kinshasa, février 2024–janvier 2025_ _: Présentation du protocole_. Centre de Recherche Patrick Kayembe.]

#para[\[51\] Akilimali, P. Z., Kabasubabo, F. K., Angendu, K. B., Sauter, S. R., Amouzou, A., Kante, M., Gouda, R. M., Tran, N. T., & Mwamba, D. K. (2025). _Assessing the availability and readiness of maternity_ _health services for the Free Maternity Care Policy in the Democratic Republic of Congo:_ _Secondary analysis of the Service Provision Assessment across provinces_ \[Preprint\]. SSRN. https://papers.ssrn.com/sol3/papers.cfm?abstract\_id=5698238]

#para[\[52\] Ministère de la Santé Publique, Hygiène et Prévoyance Sociale, International Center for Health Systems Strengthening (ICHESS), & UNICEF. (2025). _Plan stratégique national de santé_ _communautaire (PSN SACO) 2025–2030_. Ministère de la Santé Publique, Hygiène et Prévoyance Sociale. https://fr.scribd.com/document/1073961870/PSN-SACO-RDC-2025-2030-ICHESS-08-02-2025]

#para[\[53\] International Center for Health Systems Strengthening (ICHESS), & UNICEF. (2026). _Étude des_ _dynamiques de santé communautaire dans un contexte d’épidémie en RDC : Cas du Mpox :_ _Rapport final, phase 1_. ICHESS & UNICEF. https://ichess-us.org/study-of-saco-dynamics-in-the-context-of-an-epidemic-in-the-drc-the-mpox-case-ichess-unicef-final-report-phase-1/]

#para[\[54\] Marsh, A. D., Muzigaba, M., Diaz, T., Requejo, J., Jackson, D., Chou, D., Cresswell, J. A., Guthold, R., Moran, A. C., Strong, K. L., Banerjee, A., & Soucat, A. (2020). Effective coverage measurement in maternal, newborn, child, and adolescent health and nutrition: Progress, future prospects, and implications for quality health systems. _The Lancet Global Health, 8_(5), e730–e736. https://doi.org/10.1016/S2214-109X(20)30104-2]

#para[\[55\] Ng, M., Fullman, N., Dieleman, J. L., Flaxman, A. D., Murray, C. J. L., & Lim, S. S. (2014). Effective coverage: A metric for monitoring universal health coverage. _PLOS Medicine, 11_(9), e1001730. https://doi.org/10.1371/journal.pmed.1001730]

#para[\[56\] Kruk, M. E., Gage, A. D., Joseph, N. T., Danaei, G., García-Saisó, S., & Salomon, J. A. (2018). Mortality due to low-quality health systems in the universal health coverage era: A systematic analysis of amenable deaths in 137 countries. _The Lancet, 392_(10160), 2203–2212. https://pmc.ncbi.nlm.nih.gov/articles/PMC6238021/]

#para[\[57\] Moxon, S. G., Wharton-Smith, A., Sharma, S., Aluvaala, J., Campbell, O. M. R., Gupta, G., Lobis, S., Warthin, C., Penn-Kekana, L., & Freedman, L. P. (2025). A Delphi process to build consensus on revised Emergency Obstetric and Newborn Care (EmONC) signal functions and levels of care. PLOS ONE, 20(9), e0331684. https://doi.org/10.1371/journal.pone.0331684]


#pagebreak()
#set page(fill: rgb("#131d44"), header: none, footer: none)
#block(width: 100%, height: 100%)[
  #align(center + horizon)[
    #block(above: 0pt, below: 8pt)[#text(size: 8.2pt, tracking: 4pt, fill: rgb("#ced6f8"))[#upper[SECTION]]]
    #context part-size.update(34pt)
    #heading(level: 1)[ANNEXES]
    #v(9pt)
    #text(font: script, size: 22pt, fill: rgb("#ced6f8"))[Données détaillées]
  ]
]
#context head-state.update("ANNEXES")
#pagebreak()
#set page(fill: rgb("#c2cfea"), header: hdr(), footer: ftr())

#para[Les profils des huit provinces suivent le même plan : chiffres clés, lecture chiffrée, classification des 28 fonctions, dimensions bloquantes par fonction et par dimension, conditions transversales, leviers, lecture par zone de santé et établissements à levier unique. Le Kasaï-Oriental et le Tanganyika, avec huit établissements chacun, se lisent comme des repères. Le détail par établissement (planche de signalisation et destinations de référence) n'est pas repris ici, pour limiter le volume ; il reste disponible dans le document d'annexes détaillé. Dans les tableaux des fonctions traceuses, les fonctions sont présentées dans le même ordre que dans le tableau national des 28 fonctions, afin de faciliter la comparaison entre provinces. La colonne « % Rouge » donne la part des évaluations de la fonction classées rouges ; la colonne « Part des rouges » se lit uniquement parmi ces évaluations rouges et indique la proportion de celles qui sont concernées par le premier blocage dominant.]

#heading(level: 2)[Annexe 1 : Haut-Katanga]


#block(width: 100%, above: 9pt, below: 9pt, breakable: false,
  block(width: 100%, fill: rgb("#fffbf7"), radius: 12pt, stroke: 1.1pt + black, inset: (x: 12pt, y: 10pt))[
    #grid(columns: (1fr, 1fr, 1fr, 1fr, 1fr), column-gutter: 9pt,
    [#text(font: display, size: 19pt, fill: rgb("#131d44"))[52]\
     #text(size: 7.3pt, fill: rgb("#5166b7"))[établissements · 13 zones]],
    [#text(font: display, size: 19pt, fill: rgb("#131d44"))[1 217]\
     #text(size: 7.3pt, fill: rgb("#5166b7"))[évaluations calculables]],
    [#text(font: display, size: 19pt, fill: rgb("#131d44"))[74,0 %]\
     #text(size: 7.3pt, fill: rgb("#5166b7"))[rouge]],
    [#text(font: display, size: 19pt, fill: rgb("#131d44"))[24,9 %]\
     #text(size: 7.3pt, fill: rgb("#5166b7"))[jaune]],
    [#text(font: display, size: 19pt, fill: rgb("#131d44"))[1,1 %]\
     #text(size: 7.3pt, fill: rgb("#5166b7"))[vert]],
    )])


#block(width: 100%, above: 11pt, below: 9pt, breakable: false,
  block(width: 100%, fill: rgb("#fffbf7"), radius: 12pt, stroke: 1.4pt + black, inset: (x: 13pt, y: 11pt))[
    #text(font: "DejaVu Sans", size: 14pt, fill: rgb("#131d44"))[★]
    #v(-4pt)
    #text(size: 7.2pt, tracking: 2.4pt, fill: rgb("#5166b7"))[#upper[LECTURE CHIFFRÉE]]
    #v(1pt)
    #block(above: 3pt, below: 9pt)[#text(size: 11.2pt, weight: "bold", fill: rgb("#131d44"))[Ce que disent les chiffres : Haut-Katanga]]
    #text(size: 9.2pt, fill: rgb("#0f1015"))[Position. 74,0 % de fonctions rouges sur 1 217 évaluations calculables (52 établissements, 13 zones), soit 5,6 points au- dessus de la part d'ensemble (68,4 %). Fonctions vitales rouges dans 483 cas sur 597 (80,9 %). Les plus contraintes : MA compliquée (100,0 %), Accouchement normal (100,0 %), MAPI (100,0 %) ; les moins contraintes : Diagnostic paludisme (9,6 %), Surveillance épidémio (28,8 %). Blocages. D'abord équipements (57,5 % des rouges), puis intrants et produits (50,6 %) et référence (40,4 %). 34,6 % des rouges tiennent à un seul blocage, 32,3 % à trois ou plus. Conditions et urgences. Conditions rouges les plus fréquentes : circuit de référence (75,0 %), eau, hygiène et assainissement (67,3 %), électricité (59,6 %). 85,2 % des fonctions d'urgence sont rouges ; 35 établissements sur 52 (67,3 %) ont au moins une fonction d'urgence rouge pour absence d'un élément critique d'urgence. Leviers. Premiers leviers, à égalité : intrants et produits et équipements, 102 fonctions libérées chacun (11,3 %) ; puis référence (52). Paire optimale : intrants et produits \+ équipements, 295 (32,7 %). Zone où la part de rouge est la plus élevée : Kisanga Zone de Santé (83,9 %) ; la plus basse : Kambove Zone de Santé (54,7 %) ; quatre établissements par zone, repères seulement.]
  ])

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 8.0pt, weight: "bold", fill: rgb("#131d44"))[Tableau A1 : Classification des 28 fonctions traceuses, Haut-Katanga]]
#set par(justify: false, leading: 0.62em)
#set text(size: 7.4pt)
#table(
  columns: (0.2340fr, 0.1216fr, 0.0586fr, 0.0780fr, 0.0788fr, 0.0791fr, 0.2525fr, 0.0975fr),
  inset: (x: 4.4pt, y: 2.3pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Fonction]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Criticité]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[K]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[% Vert]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[% Jaune]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[% Rouge]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Premier blocage dominant]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Part des rouges]]]),
    [#block(breakable: false)[Grossesse à risque]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[39]], [#block(breakable: false)[0,0]], [#block(breakable: false)[2,6]], [#block(breakable: false)[97,4]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[81,6]],
    [#block(breakable: false)[MA compliquée]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[52]], [#block(breakable: false)[0,0]], [#block(breakable: false)[0,0]], [#block(breakable: false)[100,0]], [#block(breakable: false)[Ressources humaines]], [#block(breakable: false)[73,1]],
    [#block(breakable: false)[MAPI]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[39]], [#block(breakable: false)[0,0]], [#block(breakable: false)[0,0]], [#block(breakable: false)[100,0]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[92,3]],
    [#block(breakable: false)[Réanimation néonat.]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[52]], [#block(breakable: false)[1,9]], [#block(breakable: false)[9,6]], [#block(breakable: false)[88,5]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[95,7]],
    [#block(breakable: false)[Pré-éclampsie]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[52]], [#block(breakable: false)[1,9]], [#block(breakable: false)[17,3]], [#block(breakable: false)[80,8]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[76,2]],
    [#block(breakable: false)[Paludisme grave]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[52]], [#block(breakable: false)[0,0]], [#block(breakable: false)[17,3]], [#block(breakable: false)[82,7]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[76,7]],
    [#block(breakable: false)[Chaîne du froid]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[39]], [#block(breakable: false)[0,0]], [#block(breakable: false)[5,1]], [#block(breakable: false)[94,9]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[70,3]],
    [#block(breakable: false)[Césarienne d'urgence]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[17]], [#block(breakable: false)[0,0]], [#block(breakable: false)[11,8]], [#block(breakable: false)[88,2]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[73,3]],
    [#block(breakable: false)[Transfusion]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[17]], [#block(breakable: false)[5,9]], [#block(breakable: false)[17,6]], [#block(breakable: false)[76,5]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[76,9]],
    [#block(breakable: false)[Référence urgente]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[52]], [#block(breakable: false)[0,0]], [#block(breakable: false)[23,1]], [#block(breakable: false)[76,9]], [#block(breakable: false)[Organisation du service]], [#block(breakable: false)[97,5]],
    [#block(breakable: false)[Réception urgences]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[13]], [#block(breakable: false)[0,0]], [#block(breakable: false)[23,1]], [#block(breakable: false)[76,9]], [#block(breakable: false)[Organisation du service]], [#block(breakable: false)[80,0]],
    [#block(breakable: false)[Accouchement assisté]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[17]], [#block(breakable: false)[0,0]], [#block(breakable: false)[11,8]], [#block(breakable: false)[88,2]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[93,3]],
    [#block(breakable: false)[Hémorragie post-partum]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[52]], [#block(breakable: false)[0,0]], [#block(breakable: false)[26,9]], [#block(breakable: false)[73,1]], [#block(breakable: false)[Référence]], [#block(breakable: false)[71,1]],
    [#block(breakable: false)[Sepsis obstétrical]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[52]], [#block(breakable: false)[1,9]], [#block(breakable: false)[21,2]], [#block(breakable: false)[76,9]], [#block(breakable: false)[Référence]], [#block(breakable: false)[67,5]],
    [#block(breakable: false)[Surveillance épidémio]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[52]], [#block(breakable: false)[3,8]], [#block(breakable: false)[67,3]], [#block(breakable: false)[28,8]], [#block(breakable: false)[Organisation du service]], [#block(breakable: false)[80,0]],
    [#block(breakable: false)[MA non compliquée]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[35]], [#block(breakable: false)[0,0]], [#block(breakable: false)[0,0]], [#block(breakable: false)[100,0]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[100,0]],
    [#block(breakable: false)[Accouchement normal]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[52]], [#block(breakable: false)[0,0]], [#block(breakable: false)[0,0]], [#block(breakable: false)[100,0]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[94,2]],
    [#block(breakable: false)[CPoN mère]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[52]], [#block(breakable: false)[0,0]], [#block(breakable: false)[11,5]], [#block(breakable: false)[88,5]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[89,1]],
    [#block(breakable: false)[CPN de routine]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[39]], [#block(breakable: false)[0,0]], [#block(breakable: false)[10,3]], [#block(breakable: false)[89,7]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[91,4]],
    [#block(breakable: false)[Vaccination de routine]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[39]], [#block(breakable: false)[0,0]], [#block(breakable: false)[0,0]], [#block(breakable: false)[100,0]], [#block(breakable: false)[Électricité]], [#block(breakable: false)[66,7]],
    [#block(breakable: false)[Soins du nouveau-né]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[52]], [#block(breakable: false)[1,9]], [#block(breakable: false)[15,4]], [#block(breakable: false)[82,7]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[88,4]],
    [#block(breakable: false)[CPN \+ PTME]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[39]], [#block(breakable: false)[0,0]], [#block(breakable: false)[25,6]], [#block(breakable: false)[74,4]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[100,0]],
    [#block(breakable: false)[CPoN nouveau-né]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[52]], [#block(breakable: false)[0,0]], [#block(breakable: false)[30,8]], [#block(breakable: false)[69,2]], [#block(breakable: false)[Référence]], [#block(breakable: false)[86,1]],
    [#block(breakable: false)[Dépistage nutrition]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[52]], [#block(breakable: false)[0,0]], [#block(breakable: false)[23,1]], [#block(breakable: false)[76,9]], [#block(breakable: false)[Ressources humaines]], [#block(breakable: false)[95,0]],
    [#block(breakable: false)[Paludisme simple]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[52]], [#block(breakable: false)[1,9]], [#block(breakable: false)[61,5]], [#block(breakable: false)[36,5]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[100,0]],
    [#block(breakable: false)[Diagnostic paludisme]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[52]], [#block(breakable: false)[1,9]], [#block(breakable: false)[88,5]], [#block(breakable: false)[9,6]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[100,0]],
    [#block(breakable: false)[Données sanitaires]], [#block(breakable: false)[Systémique]], [#block(breakable: false)[52]], [#block(breakable: false)[7,7]], [#block(breakable: false)[57,7]], [#block(breakable: false)[34,6]], [#block(breakable: false)[Organisation du service]], [#block(breakable: false)[100,0]],
    [#block(breakable: false)[Intégration services]], [#block(breakable: false)[Systémique]], [#block(breakable: false)[52]], [#block(breakable: false)[0,0]], [#block(breakable: false)[59,6]], [#block(breakable: false)[40,4]], [#block(breakable: false)[Intégration des services]], [#block(breakable: false)[100,0]],
)
#v(4pt)

#v(6pt)
#pagebreak(weak: true)
#set page(flipped: true)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 7.199999999999999pt, weight: "bold", fill: rgb("#131d44"))[Tableau A2 : Dimensions bloquantes des fonctions rouges, par fonction (n), Haut-Katanga]]
#set par(justify: false, leading: 0.62em)
#set text(size: 6.6pt)
#table(
  columns: (0.1906fr, 0.0673fr, 0.0673fr, 0.0670fr, 0.0666fr, 0.0670fr, 0.0670fr, 0.0673fr, 0.0670fr, 0.0670fr, 0.0717fr, 0.0673fr, 0.0668fr),
  inset: (x: 4.4pt, y: 2.3pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Fonction]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Rouges]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Intrants]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Équip.]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[RH]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Référ.]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Organ.]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Comm.]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Électr.]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Intégr.]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Données]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Surveil.]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Accueil]]]),
    [#block(breakable: false)[Grossesse à risque]], [#block(breakable: false)[38]], [#block(breakable: false)[31]], [#block(breakable: false)[13]], [#block(breakable: false)[4]], [#block(breakable: false)[31]], [#block(breakable: false)[1]], [#block(breakable: false)[3]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[MA compliquée]], [#block(breakable: false)[52]], [#block(breakable: false)[17]], [#block(breakable: false)[32]], [#block(breakable: false)[38]], [#block(breakable: false)[27]], [#block(breakable: false)[37]], [#block(breakable: false)[3]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[MAPI]], [#block(breakable: false)[39]], [#block(breakable: false)[36]], [#block(breakable: false)[36]], [#block(breakable: false)[0]], [#block(breakable: false)[31]], [#block(breakable: false)[2]], [#block(breakable: false)[3]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[11]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Réanimation néonat.]], [#block(breakable: false)[46]], [#block(breakable: false)[0]], [#block(breakable: false)[44]], [#block(breakable: false)[4]], [#block(breakable: false)[27]], [#block(breakable: false)[5]], [#block(breakable: false)[3]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Pré-éclampsie]], [#block(breakable: false)[42]], [#block(breakable: false)[32]], [#block(breakable: false)[12]], [#block(breakable: false)[4]], [#block(breakable: false)[27]], [#block(breakable: false)[5]], [#block(breakable: false)[3]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Paludisme grave]], [#block(breakable: false)[43]], [#block(breakable: false)[33]], [#block(breakable: false)[26]], [#block(breakable: false)[0]], [#block(breakable: false)[31]], [#block(breakable: false)[0]], [#block(breakable: false)[3]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Chaîne du froid]], [#block(breakable: false)[37]], [#block(breakable: false)[0]], [#block(breakable: false)[26]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[2]], [#block(breakable: false)[0]], [#block(breakable: false)[26]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Césarienne d'urgence]], [#block(breakable: false)[15]], [#block(breakable: false)[11]], [#block(breakable: false)[7]], [#block(breakable: false)[3]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[7]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[1]],
    [#block(breakable: false)[Transfusion]], [#block(breakable: false)[13]], [#block(breakable: false)[3]], [#block(breakable: false)[10]], [#block(breakable: false)[5]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[7]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[1]],
    [#block(breakable: false)[Référence urgente]], [#block(breakable: false)[40]], [#block(breakable: false)[0]], [#block(breakable: false)[39]], [#block(breakable: false)[0]], [#block(breakable: false)[39]], [#block(breakable: false)[39]], [#block(breakable: false)[5]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Réception urgences]], [#block(breakable: false)[10]], [#block(breakable: false)[0]], [#block(breakable: false)[2]], [#block(breakable: false)[0]], [#block(breakable: false)[8]], [#block(breakable: false)[8]], [#block(breakable: false)[2]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Accouchement assisté]], [#block(breakable: false)[15]], [#block(breakable: false)[0]], [#block(breakable: false)[14]], [#block(breakable: false)[2]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Hémorragie post-partum]], [#block(breakable: false)[38]], [#block(breakable: false)[13]], [#block(breakable: false)[12]], [#block(breakable: false)[4]], [#block(breakable: false)[27]], [#block(breakable: false)[5]], [#block(breakable: false)[3]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Sepsis obstétrical]], [#block(breakable: false)[40]], [#block(breakable: false)[23]], [#block(breakable: false)[4]], [#block(breakable: false)[4]], [#block(breakable: false)[27]], [#block(breakable: false)[5]], [#block(breakable: false)[3]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Surveillance épidémio.]], [#block(breakable: false)[15]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[12]], [#block(breakable: false)[5]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[12]], [#block(breakable: false)[0]],
    [#block(breakable: false)[MA non compliquée]], [#block(breakable: false)[35]], [#block(breakable: false)[35]], [#block(breakable: false)[23]], [#block(breakable: false)[29]], [#block(breakable: false)[27]], [#block(breakable: false)[29]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Accouchement normal]], [#block(breakable: false)[52]], [#block(breakable: false)[49]], [#block(breakable: false)[30]], [#block(breakable: false)[4]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[CPoN mère]], [#block(breakable: false)[46]], [#block(breakable: false)[32]], [#block(breakable: false)[41]], [#block(breakable: false)[1]], [#block(breakable: false)[31]], [#block(breakable: false)[2]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[CPN de routine]], [#block(breakable: false)[35]], [#block(breakable: false)[28]], [#block(breakable: false)[32]], [#block(breakable: false)[4]], [#block(breakable: false)[0]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Vaccination de routine]], [#block(breakable: false)[39]], [#block(breakable: false)[23]], [#block(breakable: false)[25]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[2]], [#block(breakable: false)[0]], [#block(breakable: false)[26]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Soins du nouveau-né]], [#block(breakable: false)[43]], [#block(breakable: false)[22]], [#block(breakable: false)[38]], [#block(breakable: false)[4]], [#block(breakable: false)[0]], [#block(breakable: false)[5]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[CPN \+ PTME]], [#block(breakable: false)[29]], [#block(breakable: false)[29]], [#block(breakable: false)[0]], [#block(breakable: false)[4]], [#block(breakable: false)[0]], [#block(breakable: false)[12]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[17]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[CPoN nouveau-né]], [#block(breakable: false)[36]], [#block(breakable: false)[15]], [#block(breakable: false)[20]], [#block(breakable: false)[1]], [#block(breakable: false)[31]], [#block(breakable: false)[2]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Dépistage nutrition]], [#block(breakable: false)[40]], [#block(breakable: false)[0]], [#block(breakable: false)[30]], [#block(breakable: false)[38]], [#block(breakable: false)[0]], [#block(breakable: false)[37]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Paludisme simple]], [#block(breakable: false)[19]], [#block(breakable: false)[19]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Diagnostic paludisme]], [#block(breakable: false)[5]], [#block(breakable: false)[5]], [#block(breakable: false)[2]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Données sanitaires]], [#block(breakable: false)[18]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[18]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[18]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Intégration services]], [#block(breakable: false)[21]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[21]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
)
#pagebreak()
#set page(flipped: false)

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 9.6pt, weight: "bold", fill: rgb("#131d44"))[Tableau A3 : Dimensions bloquantes et fragilités, Haut-Katanga]]
#set par(justify: false, leading: 0.62em)
#set text(size: 9.0pt)
#table(
  columns: (0.3400fr, 0.2200fr, 0.2202fr, 0.2198fr),
  inset: (x: 4.4pt, y: 3.2pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Dimension]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Bloque : n (% des rouges)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Premier blocage : n (%)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Fragilise : n (% des jaunes)]]]),
    [#block(breakable: false)[Équipements]], [#block(breakable: false)[518 (57,5 %)]], [#block(breakable: false)[167 (18,5 %)]], [#block(breakable: false)[80 (26,4 %)]],
    [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[456 (50,6 %)]], [#block(breakable: false)[368 (40,8 %)]], [#block(breakable: false)[105 (34,7 %)]],
    [#block(breakable: false)[Référence]], [#block(breakable: false)[364 (40,4 %)]], [#block(breakable: false)[52 (5,8 %)]], [#block(breakable: false)[141 (46,5 %)]],
    [#block(breakable: false)[Organisation du service]], [#block(breakable: false)[229 (25,4 %)]], [#block(breakable: false)[229 (25,4 %)]], [#block(breakable: false)[68 (22,4 %)]],
    [#block(breakable: false)[Ressources humaines]], [#block(breakable: false)[153 (17,0 %)]], [#block(breakable: false)[36 (4,0 %)]], [#block(breakable: false)[127 (41,9 %)]],
    [#block(breakable: false)[Électricité]], [#block(breakable: false)[66 (7,3 %)]], [#block(breakable: false)[20 (2,2 %)]], [#block(breakable: false)[121 (39,9 %)]],
    [#block(breakable: false)[Intégration des services]], [#block(breakable: false)[38 (4,2 %)]], [#block(breakable: false)[21 (2,3 %)]], [#block(breakable: false)[19 (6,3 %)]],
    [#block(breakable: false)[Communication]], [#block(breakable: false)[36 (4,0 %)]], [#block(breakable: false)[6 (0,7 %)]], [#block(breakable: false)[37 (12,2 %)]],
    [#block(breakable: false)[Surveillance épidémiologique]], [#block(breakable: false)[23 (2,6 %)]], [#block(breakable: false)[0 (0,0 %)]], [#block(breakable: false)[7 (2,3 %)]],
    [#block(breakable: false)[Données sanitaires]], [#block(breakable: false)[18 (2,0 %)]], [#block(breakable: false)[0 (0,0 %)]], [#block(breakable: false)[86 (28,4 %)]],
    [#block(breakable: false)[Capacité d'accueil]], [#block(breakable: false)[2 (0,2 %)]], [#block(breakable: false)[2 (0,2 %)]], [#block(breakable: false)[46 (15,2 %)]],
    [#block(breakable: false)[Eau, hygiène et assainissement]], [#block(breakable: false)[0 (0,0 %)]], [#block(breakable: false)[0 (0,0 %)]], [#block(breakable: false)[129 (42,6 %)]],
)
#v(4pt)

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 9.6pt, weight: "bold", fill: rgb("#131d44"))[Tableau A4 : Conditions transversales et profil d'urgence, Haut-Katanga]]
#set par(justify: false, leading: 0.62em)
#set text(size: 9.0pt)
#table(
  columns: (0.3399fr, 0.2000fr, 0.2003fr, 0.2598fr),
  inset: (x: 4.4pt, y: 3.2pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Condition transversale]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Vert : n (%)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Jaune : n (%)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Rouge : n (%)]]]),
    [#block(breakable: false)[Eau, hygiène et assainissement]], [#block(breakable: false)[9 (17,3 %)]], [#block(breakable: false)[8 (15,4 %)]], [#block(breakable: false)[35 (67,3 %)]],
    [#block(breakable: false)[Électricité]], [#block(breakable: false)[16 (30,8 %)]], [#block(breakable: false)[5 (9,6 %)]], [#block(breakable: false)[31 (59,6 %)]],
    [#block(breakable: false)[Communication]], [#block(breakable: false)[29 (55,8 %)]], [#block(breakable: false)[18 (34,6 %)]], [#block(breakable: false)[5 (9,6 %)]],
    [#block(breakable: false)[Circuit de référence]], [#block(breakable: false)[9 (17,3 %)]], [#block(breakable: false)[4 (7,7 %)]], [#block(breakable: false)[39 (75,0 %)]],
    [#block(breakable: false)[Données sanitaires (SNIS)]], [#block(breakable: false)[15 (28,8 %)]], [#block(breakable: false)[19 (36,5 %)]], [#block(breakable: false)[18 (34,6 %)]],
    [#block(breakable: false)[Surveillance épidémiologique]], [#block(breakable: false)[35 (67,3 %)]], [#block(breakable: false)[5 (9,6 %)]], [#block(breakable: false)[12 (23,1 %)]],
    [#block(breakable: false)[Intégration des services]], [#block(breakable: false)[31 (59,6 %)]], [#block(breakable: false)[0 (0,0 %)]], [#block(breakable: false)[21 (40,4 %)]],
    [#block(breakable: false)[Fonctions d'urgence (K = 506)]], [#block(breakable: false)[0,8 %]], [#block(breakable: false)[14,0 %]], [#block(breakable: false)[85,2 % ; menace immédiate : 35 établissements (67,3 %)]],
)
#v(4pt)

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 9.6pt, weight: "bold", fill: rgb("#131d44"))[Tableau A5 : Leviers simples et paire optimale, Haut-Katanga]]
#set par(justify: false, leading: 0.62em)
#set text(size: 9.0pt)
#table(
  columns: (0.4400fr, 0.1399fr, 0.1401fr, 0.2800fr),
  inset: (x: 4.4pt, y: 3.2pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Levier (base : 901 fonctions rouges)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Rouge → Vert]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Rouge → Jaune]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Gain : n (% des rouges)]]]),
    [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[6]], [#block(breakable: false)[96]], [#block(breakable: false)[102 (11,3 %)]],
    [#block(breakable: false)[Équipements]], [#block(breakable: false)[1]], [#block(breakable: false)[101]], [#block(breakable: false)[102 (11,3 %)]],
    [#block(breakable: false)[Référence]], [#block(breakable: false)[0]], [#block(breakable: false)[52]], [#block(breakable: false)[52 (5,8 %)]],
    [#block(breakable: false)[Intégration des services]], [#block(breakable: false)[0]], [#block(breakable: false)[21]], [#block(breakable: false)[21 (2,3 %)]],
    [#block(breakable: false)[Électricité]], [#block(breakable: false)[0]], [#block(breakable: false)[20]], [#block(breakable: false)[20 (2,2 %)]],
    [#block(breakable: false)[Ressources humaines]], [#block(breakable: false)[0]], [#block(breakable: false)[10]], [#block(breakable: false)[10 (1,1 %)]],
    [#block(breakable: false)[Communication]], [#block(breakable: false)[0]], [#block(breakable: false)[5]], [#block(breakable: false)[5 (0,6 %)]],
    [#block(breakable: false)[Paire optimale : Intrants et produits \+ Équipements]], [#block(breakable: false)[\-]], [#block(breakable: false)[\-]], [#block(breakable: false)[295 (32,7 %)]],
)
#v(4pt)

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 8.0pt, weight: "bold", fill: rgb("#131d44"))[Tableau A6 : Lecture par zone de santé, Haut-Katanga]]
#set par(justify: false, leading: 0.62em)
#set text(size: 7.4pt)
#table(
  columns: (0.1997fr, 0.0607fr, 0.0700fr, 0.0798fr, 0.0800fr, 0.0800fr, 0.1900fr, 0.2397fr),
  inset: (x: 4.4pt, y: 3.2pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Zone de santé]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Établ.]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[K]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[% Vert]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[% Jaune]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[% Rouge]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Dimension dominante]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Premier levier (gain)]]]),
    [#block(breakable: false)[Kambove Zone de Santé]], [#block(breakable: false)[4]], [#block(breakable: false)[95]], [#block(breakable: false)[3,2]], [#block(breakable: false)[42,1]], [#block(breakable: false)[54,7]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[Équipements (9 (17,3 %))]],
    [#block(breakable: false)[Kapolowe Zone de Santé]], [#block(breakable: false)[4]], [#block(breakable: false)[95]], [#block(breakable: false)[2,1]], [#block(breakable: false)[15,8]], [#block(breakable: false)[82,1]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[Équipements (13 (16,7 %))]],
    [#block(breakable: false)[Kashobwe Zone de Santé]], [#block(breakable: false)[4]], [#block(breakable: false)[93]], [#block(breakable: false)[0,0]], [#block(breakable: false)[20,4]], [#block(breakable: false)[79,6]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[Référence (5 (6,8 %))]],
    [#block(breakable: false)[Kipushi Zone de Santé]], [#block(breakable: false)[4]], [#block(breakable: false)[93]], [#block(breakable: false)[0,0]], [#block(breakable: false)[36,6]], [#block(breakable: false)[63,4]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[Intrants et produits (7 (11,9 %))]],
    [#block(breakable: false)[Kisanga Zone de Santé]], [#block(breakable: false)[4]], [#block(breakable: false)[93]], [#block(breakable: false)[0,0]], [#block(breakable: false)[16,1]], [#block(breakable: false)[83,9]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[Équipements (9 (11,5 %))]],
    [#block(breakable: false)[Likasi Zone de Santé]], [#block(breakable: false)[4]], [#block(breakable: false)[95]], [#block(breakable: false)[5,3]], [#block(breakable: false)[29,5]], [#block(breakable: false)[65,3]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[Équipements (15 (24,2 %))]],
    [#block(breakable: false)[Lubumbashi Zone de Santé]], [#block(breakable: false)[4]], [#block(breakable: false)[93]], [#block(breakable: false)[0,0]], [#block(breakable: false)[24,7]], [#block(breakable: false)[75,3]], [#block(breakable: false)[Référence]], [#block(breakable: false)[Référence (12 (17,1 %))]],
    [#block(breakable: false)[Mitwaba Zone de Santé]], [#block(breakable: false)[4]], [#block(breakable: false)[93]], [#block(breakable: false)[0,0]], [#block(breakable: false)[21,5]], [#block(breakable: false)[78,5]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[Référence (7 (9,6 %))]],
    [#block(breakable: false)[Mufunga Sampwe Zone de Santé]], [#block(breakable: false)[4]], [#block(breakable: false)[93]], [#block(breakable: false)[0,0]], [#block(breakable: false)[16,1]], [#block(breakable: false)[83,9]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[Intrants et produits (9 (11,5 %))]],
    [#block(breakable: false)[Mumbunda Zone de Santé]], [#block(breakable: false)[4]], [#block(breakable: false)[93]], [#block(breakable: false)[2,2]], [#block(breakable: false)[26,9]], [#block(breakable: false)[71,0]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[Équipements (14 (21,2 %))]],
    [#block(breakable: false)[Pweto Zone de Santé]], [#block(breakable: false)[4]], [#block(breakable: false)[93]], [#block(breakable: false)[0,0]], [#block(breakable: false)[29,0]], [#block(breakable: false)[71,0]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[Intrants et produits (7 (10,6 %))]],
    [#block(breakable: false)[Ruashi Zone de Santé]], [#block(breakable: false)[4]], [#block(breakable: false)[95]], [#block(breakable: false)[1,1]], [#block(breakable: false)[21,1]], [#block(breakable: false)[77,9]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[Intrants et produits (20 (27,0 %))]],
    [#block(breakable: false)[Sakania Zone de Santé]], [#block(breakable: false)[4]], [#block(breakable: false)[93]], [#block(breakable: false)[0,0]], [#block(breakable: false)[23,7]], [#block(breakable: false)[76,3]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[Équipements (13 (18,3 %))]],
)
#v(4pt)

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 8.799999999999999pt, weight: "bold", fill: rgb("#131d44"))[Tableau A7 : Établissements où un seul levier libère le plus de fonctions rouges, Haut-Katanga]]
#set par(justify: false, leading: 0.62em)
#set text(size: 8.2pt)
#table(
  columns: (0.1599fr, 0.2200fr, 0.1600fr, 0.1202fr, 0.1799fr, 0.1599fr),
  inset: (x: 4.4pt, y: 3.2pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Établissement (code)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Zone]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Niveau]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Fonctions rouges]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Levier unique]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Fonctions libérées : n (%)]]]),
    [#block(breakable: false)[HK-HGR-44]], [#block(breakable: false)[Kapolowe Zone de Santé]], [#block(breakable: false)[Niveau 2 (HGR)]], [#block(breakable: false)[16]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[10 (62,5 %)]],
    [#block(breakable: false)[HK-CS-15]], [#block(breakable: false)[Mumbunda Zone de Santé]], [#block(breakable: false)[Niveau 1 (CS)]], [#block(breakable: false)[18]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[9 (50,0 %)]],
    [#block(breakable: false)[HK-CSR-39]], [#block(breakable: false)[Ruashi Zone de Santé]], [#block(breakable: false)[Niveau 1+ (CSR)]], [#block(breakable: false)[21]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[8 (38,1 %)]],
    [#block(breakable: false)[HK-HGR-48]], [#block(breakable: false)[Lubumbashi Zone de Santé]], [#block(breakable: false)[Niveau 2 (HGR)]], [#block(breakable: false)[10]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[7 (70,0 %)]],
    [#block(breakable: false)[HK-HGR-52]], [#block(breakable: false)[Sakania Zone de Santé]], [#block(breakable: false)[Niveau 2 (HGR)]], [#block(breakable: false)[14]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[7 (50,0 %)]],
    [#block(breakable: false)[HK-CS-01]], [#block(breakable: false)[Lubumbashi Zone de Santé]], [#block(breakable: false)[Niveau 1 (CS)]], [#block(breakable: false)[18]], [#block(breakable: false)[Référence]], [#block(breakable: false)[7 (38,9 %)]],
)
#v(4pt)

#heading(level: 2)[Annexe 2 : Haut-Lomami]


#block(width: 100%, above: 9pt, below: 9pt, breakable: false,
  block(width: 100%, fill: rgb("#fffbf7"), radius: 12pt, stroke: 1.1pt + black, inset: (x: 12pt, y: 10pt))[
    #grid(columns: (1fr, 1fr, 1fr, 1fr, 1fr), column-gutter: 9pt,
    [#text(font: display, size: 19pt, fill: rgb("#131d44"))[12]\
     #text(size: 7.3pt, fill: rgb("#5166b7"))[établissements · 3 zones]],
    [#text(font: display, size: 19pt, fill: rgb("#131d44"))[283]\
     #text(size: 7.3pt, fill: rgb("#5166b7"))[évaluations calculables]],
    [#text(font: display, size: 19pt, fill: rgb("#131d44"))[79,2 %]\
     #text(size: 7.3pt, fill: rgb("#5166b7"))[rouge]],
    [#text(font: display, size: 19pt, fill: rgb("#131d44"))[20,8 %]\
     #text(size: 7.3pt, fill: rgb("#5166b7"))[jaune]],
    [#text(font: display, size: 19pt, fill: rgb("#131d44"))[0,0 %]\
     #text(size: 7.3pt, fill: rgb("#5166b7"))[vert]],
    )])


#block(width: 100%, above: 11pt, below: 9pt, breakable: false,
  block(width: 100%, fill: rgb("#fffbf7"), radius: 12pt, stroke: 1.4pt + black, inset: (x: 13pt, y: 11pt))[
    #text(font: "DejaVu Sans", size: 14pt, fill: rgb("#131d44"))[★]
    #v(-4pt)
    #text(size: 7.2pt, tracking: 2.4pt, fill: rgb("#5166b7"))[#upper[LECTURE CHIFFRÉE]]
    #v(1pt)
    #block(above: 3pt, below: 9pt)[#text(size: 11.2pt, weight: "bold", fill: rgb("#131d44"))[Ce que disent les chiffres : Haut-Lomami]]
    #text(size: 9.2pt, fill: rgb("#0f1015"))[Position. 79,2 % de fonctions rouges sur 283 évaluations calculables (12 établissements, 3 zones), soit 10,8 points au- dessus de la part d'ensemble (68,4 %). Fonctions vitales rouges dans 123 cas sur 141 (87,2 %). Les plus contraintes : MA compliquée (100,0 %), Réanimation néonat. (100,0 %), Pré-éclampsie (100,0 %) ; les moins contraintes : Intégration services (8,3 %), Surveillance épidémio (16,7 %). Blocages. D'abord équipements (61,2 % des rouges), puis intrants et produits (57,6 %) et référence (34,8 %). 33,9 % des rouges tiennent à un seul blocage, 29,0 % à trois ou plus. Conditions et urgences. Conditions rouges les plus fréquentes : circuit de référence (83,3 %), données sanitaires (snis) (66,7 %), électricité (66,7 %). 95,0 % des fonctions d'urgence sont rouges ; 10 établissements sur 12 (83,3 %) ont au moins une fonction d'urgence rouge pour absence d'un élément critique d'urgence. Leviers. Premier levier : intrants et produits, 33 fonctions libérées (14,7 %) ; puis équipements (29). Paire optimale : intrants et produits \+ équipements, 94 (42,0 %). Zone où la part de rouge est la plus élevée : Bukama Zone de Santé (81,7 %) ; la plus basse : Kabongo Zone de Santé (77,3 %) ; quatre établissements par zone, repères seulement.]
  ])

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 8.0pt, weight: "bold", fill: rgb("#131d44"))[Tableau A8 : Classification des 28 fonctions traceuses, Haut-Lomami]]
#set par(justify: false, leading: 0.62em)
#set text(size: 7.4pt)
#table(
  columns: (0.2335fr, 0.1216fr, 0.0586fr, 0.0779fr, 0.0787fr, 0.0792fr, 0.2531fr, 0.0975fr),
  inset: (x: 4.4pt, y: 2.3pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Fonction]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Criticité]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[K]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[% Vert]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[% Jaune]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[% Rouge]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Premier blocage dominant]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Part des rouges]]]),
    [#block(breakable: false)[Grossesse à risque]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[9]], [#block(breakable: false)[0,0]], [#block(breakable: false)[0,0]], [#block(breakable: false)[100,0]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[100,0]],
    [#block(breakable: false)[MA compliquée]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[12]], [#block(breakable: false)[0,0]], [#block(breakable: false)[0,0]], [#block(breakable: false)[100,0]], [#block(breakable: false)[Ressources humaines]], [#block(breakable: false)[75,0]],
    [#block(breakable: false)[MAPI]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[9]], [#block(breakable: false)[0,0]], [#block(breakable: false)[0,0]], [#block(breakable: false)[100,0]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[100,0]],
    [#block(breakable: false)[Réanimation néonat.]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[12]], [#block(breakable: false)[0,0]], [#block(breakable: false)[0,0]], [#block(breakable: false)[100,0]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[100,0]],
    [#block(breakable: false)[Pré-éclampsie]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[12]], [#block(breakable: false)[0,0]], [#block(breakable: false)[0,0]], [#block(breakable: false)[100,0]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[91,7]],
    [#block(breakable: false)[Paludisme grave]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[12]], [#block(breakable: false)[0,0]], [#block(breakable: false)[0,0]], [#block(breakable: false)[100,0]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[75,0]],
    [#block(breakable: false)[Chaîne du froid]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[9]], [#block(breakable: false)[0,0]], [#block(breakable: false)[22,2]], [#block(breakable: false)[77,8]], [#block(breakable: false)[Électricité]], [#block(breakable: false)[85,7]],
    [#block(breakable: false)[Césarienne d'urgence]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[5]], [#block(breakable: false)[0,0]], [#block(breakable: false)[0,0]], [#block(breakable: false)[100,0]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[80,0]],
    [#block(breakable: false)[Transfusion]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[5]], [#block(breakable: false)[0,0]], [#block(breakable: false)[0,0]], [#block(breakable: false)[100,0]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[80,0]],
    [#block(breakable: false)[Référence urgente]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[12]], [#block(breakable: false)[0,0]], [#block(breakable: false)[16,7]], [#block(breakable: false)[83,3]], [#block(breakable: false)[Organisation du service]], [#block(breakable: false)[100,0]],
    [#block(breakable: false)[Réception urgences]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[3]], [#block(breakable: false)[0,0]], [#block(breakable: false)[0,0]], [#block(breakable: false)[100,0]], [#block(breakable: false)[Organisation du service]], [#block(breakable: false)[100,0]],
    [#block(breakable: false)[Accouchement assisté]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[5]], [#block(breakable: false)[0,0]], [#block(breakable: false)[0,0]], [#block(breakable: false)[100,0]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[100,0]],
    [#block(breakable: false)[Hémorragie post-partum]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[12]], [#block(breakable: false)[0,0]], [#block(breakable: false)[8,3]], [#block(breakable: false)[91,7]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[63,6]],
    [#block(breakable: false)[Sepsis obstétrical]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[12]], [#block(breakable: false)[0,0]], [#block(breakable: false)[25,0]], [#block(breakable: false)[75,0]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[88,9]],
    [#block(breakable: false)[Surveillance épidémio]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[12]], [#block(breakable: false)[0,0]], [#block(breakable: false)[83,3]], [#block(breakable: false)[16,7]], [#block(breakable: false)[Communication]], [#block(breakable: false)[100,0]],
    [#block(breakable: false)[MA non compliquée]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[7]], [#block(breakable: false)[0,0]], [#block(breakable: false)[0,0]], [#block(breakable: false)[100,0]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[100,0]],
    [#block(breakable: false)[Accouchement normal]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[12]], [#block(breakable: false)[0,0]], [#block(breakable: false)[0,0]], [#block(breakable: false)[100,0]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[100,0]],
    [#block(breakable: false)[CPoN mère]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[12]], [#block(breakable: false)[0,0]], [#block(breakable: false)[0,0]], [#block(breakable: false)[100,0]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[100,0]],
    [#block(breakable: false)[CPN de routine]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[9]], [#block(breakable: false)[0,0]], [#block(breakable: false)[0,0]], [#block(breakable: false)[100,0]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[100,0]],
    [#block(breakable: false)[Vaccination de routine]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[9]], [#block(breakable: false)[0,0]], [#block(breakable: false)[22,2]], [#block(breakable: false)[77,8]], [#block(breakable: false)[Électricité]], [#block(breakable: false)[85,7]],
    [#block(breakable: false)[Soins du nouveau-né]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[12]], [#block(breakable: false)[0,0]], [#block(breakable: false)[0,0]], [#block(breakable: false)[100,0]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[100,0]],
    [#block(breakable: false)[CPN \+ PTME]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[9]], [#block(breakable: false)[0,0]], [#block(breakable: false)[33,3]], [#block(breakable: false)[66,7]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[100,0]],
    [#block(breakable: false)[CPoN nouveau-né]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[12]], [#block(breakable: false)[0,0]], [#block(breakable: false)[0,0]], [#block(breakable: false)[100,0]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[83,3]],
    [#block(breakable: false)[Dépistage nutrition]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[12]], [#block(breakable: false)[0,0]], [#block(breakable: false)[25,0]], [#block(breakable: false)[75,0]], [#block(breakable: false)[Ressources humaines]], [#block(breakable: false)[100,0]],
    [#block(breakable: false)[Paludisme simple]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[12]], [#block(breakable: false)[0,0]], [#block(breakable: false)[66,7]], [#block(breakable: false)[33,3]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[100,0]],
    [#block(breakable: false)[Diagnostic paludisme]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[12]], [#block(breakable: false)[0,0]], [#block(breakable: false)[83,3]], [#block(breakable: false)[16,7]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[100,0]],
    [#block(breakable: false)[Données sanitaires]], [#block(breakable: false)[Systémique]], [#block(breakable: false)[12]], [#block(breakable: false)[0,0]], [#block(breakable: false)[33,3]], [#block(breakable: false)[66,7]], [#block(breakable: false)[Organisation du service]], [#block(breakable: false)[100,0]],
    [#block(breakable: false)[Intégration services]], [#block(breakable: false)[Systémique]], [#block(breakable: false)[12]], [#block(breakable: false)[0,0]], [#block(breakable: false)[91,7]], [#block(breakable: false)[8,3]], [#block(breakable: false)[Intégration des services]], [#block(breakable: false)[100,0]],
)
#v(4pt)

#v(6pt)
#pagebreak(weak: true)
#set page(flipped: true)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 7.199999999999999pt, weight: "bold", fill: rgb("#131d44"))[Tableau A9 : Dimensions bloquantes des fonctions rouges, par fonction (n), Haut-Lomami]]
#set par(justify: false, leading: 0.62em)
#set text(size: 6.6pt)
#table(
  columns: (0.1905fr, 0.0673fr, 0.0672fr, 0.0670fr, 0.0666fr, 0.0670fr, 0.0670fr, 0.0673fr, 0.0670fr, 0.0670fr, 0.0717fr, 0.0673fr, 0.0668fr),
  inset: (x: 4.4pt, y: 2.3pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Fonction]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Rouges]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Intrants]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Équip.]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[RH]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Référ.]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Organ.]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Comm.]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Électr.]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Intégr.]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Données]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Surveil.]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Accueil]]]),
    [#block(breakable: false)[Grossesse à risque]], [#block(breakable: false)[9]], [#block(breakable: false)[9]], [#block(breakable: false)[5]], [#block(breakable: false)[1]], [#block(breakable: false)[7]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[MA compliquée]], [#block(breakable: false)[12]], [#block(breakable: false)[5]], [#block(breakable: false)[6]], [#block(breakable: false)[9]], [#block(breakable: false)[5]], [#block(breakable: false)[7]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[MAPI]], [#block(breakable: false)[9]], [#block(breakable: false)[9]], [#block(breakable: false)[9]], [#block(breakable: false)[0]], [#block(breakable: false)[7]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Réanimation néonat.]], [#block(breakable: false)[12]], [#block(breakable: false)[0]], [#block(breakable: false)[12]], [#block(breakable: false)[0]], [#block(breakable: false)[5]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Pré-éclampsie]], [#block(breakable: false)[12]], [#block(breakable: false)[11]], [#block(breakable: false)[5]], [#block(breakable: false)[0]], [#block(breakable: false)[5]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Paludisme grave]], [#block(breakable: false)[12]], [#block(breakable: false)[7]], [#block(breakable: false)[9]], [#block(breakable: false)[0]], [#block(breakable: false)[7]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Chaîne du froid]], [#block(breakable: false)[7]], [#block(breakable: false)[0]], [#block(breakable: false)[3]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[6]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Césarienne d'urgence]], [#block(breakable: false)[5]], [#block(breakable: false)[4]], [#block(breakable: false)[4]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[2]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Transfusion]], [#block(breakable: false)[5]], [#block(breakable: false)[1]], [#block(breakable: false)[4]], [#block(breakable: false)[3]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[2]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Référence urgente]], [#block(breakable: false)[10]], [#block(breakable: false)[0]], [#block(breakable: false)[10]], [#block(breakable: false)[0]], [#block(breakable: false)[10]], [#block(breakable: false)[10]], [#block(breakable: false)[2]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Réception urgences]], [#block(breakable: false)[3]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[3]], [#block(breakable: false)[3]], [#block(breakable: false)[2]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Accouchement assisté]], [#block(breakable: false)[5]], [#block(breakable: false)[0]], [#block(breakable: false)[5]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Hémorragie post-partum]], [#block(breakable: false)[11]], [#block(breakable: false)[7]], [#block(breakable: false)[5]], [#block(breakable: false)[0]], [#block(breakable: false)[5]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Sepsis obstétrical]], [#block(breakable: false)[9]], [#block(breakable: false)[8]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[5]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Surveillance épidémio.]], [#block(breakable: false)[2]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[2]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[MA non compliquée]], [#block(breakable: false)[7]], [#block(breakable: false)[7]], [#block(breakable: false)[2]], [#block(breakable: false)[5]], [#block(breakable: false)[5]], [#block(breakable: false)[4]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Accouchement normal]], [#block(breakable: false)[12]], [#block(breakable: false)[12]], [#block(breakable: false)[9]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[CPoN mère]], [#block(breakable: false)[12]], [#block(breakable: false)[11]], [#block(breakable: false)[12]], [#block(breakable: false)[1]], [#block(breakable: false)[7]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[CPN de routine]], [#block(breakable: false)[9]], [#block(breakable: false)[9]], [#block(breakable: false)[7]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Vaccination de routine]], [#block(breakable: false)[7]], [#block(breakable: false)[4]], [#block(breakable: false)[3]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[6]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Soins du nouveau-né]], [#block(breakable: false)[12]], [#block(breakable: false)[3]], [#block(breakable: false)[12]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[CPN \+ PTME]], [#block(breakable: false)[6]], [#block(breakable: false)[6]], [#block(breakable: false)[0]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[CPoN nouveau-né]], [#block(breakable: false)[12]], [#block(breakable: false)[10]], [#block(breakable: false)[9]], [#block(breakable: false)[1]], [#block(breakable: false)[7]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Dépistage nutrition]], [#block(breakable: false)[9]], [#block(breakable: false)[0]], [#block(breakable: false)[5]], [#block(breakable: false)[9]], [#block(breakable: false)[0]], [#block(breakable: false)[7]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Paludisme simple]], [#block(breakable: false)[4]], [#block(breakable: false)[4]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Diagnostic paludisme]], [#block(breakable: false)[2]], [#block(breakable: false)[2]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Données sanitaires]], [#block(breakable: false)[8]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[8]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[8]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Intégration services]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
)
#pagebreak()
#set page(flipped: false)

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 9.6pt, weight: "bold", fill: rgb("#131d44"))[Tableau A10 : Dimensions bloquantes et fragilités, Haut-Lomami]]
#set par(justify: false, leading: 0.62em)
#set text(size: 9.0pt)
#table(
  columns: (0.3400fr, 0.2200fr, 0.2202fr, 0.2198fr),
  inset: (x: 4.4pt, y: 3.2pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Dimension]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Bloque : n (% des rouges)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Premier blocage : n (%)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Fragilise : n (% des jaunes)]]]),
    [#block(breakable: false)[Équipements]], [#block(breakable: false)[137 (61,2 %)]], [#block(breakable: false)[44 (19,6 %)]], [#block(breakable: false)[18 (30,5 %)]],
    [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[129 (57,6 %)]], [#block(breakable: false)[113 (50,4 %)]], [#block(breakable: false)[16 (27,1 %)]],
    [#block(breakable: false)[Référence]], [#block(breakable: false)[78 (34,8 %)]], [#block(breakable: false)[5 (2,2 %)]], [#block(breakable: false)[40 (67,8 %)]],
    [#block(breakable: false)[Organisation du service]], [#block(breakable: false)[40 (17,9 %)]], [#block(breakable: false)[40 (17,9 %)]], [#block(breakable: false)[13 (22,0 %)]],
    [#block(breakable: false)[Ressources humaines]], [#block(breakable: false)[32 (14,3 %)]], [#block(breakable: false)[14 (6,2 %)]], [#block(breakable: false)[31 (52,5 %)]],
    [#block(breakable: false)[Électricité]], [#block(breakable: false)[16 (7,1 %)]], [#block(breakable: false)[5 (2,2 %)]], [#block(breakable: false)[26 (44,1 %)]],
    [#block(breakable: false)[Données sanitaires]], [#block(breakable: false)[8 (3,6 %)]], [#block(breakable: false)[0 (0,0 %)]], [#block(breakable: false)[32 (54,2 %)]],
    [#block(breakable: false)[Communication]], [#block(breakable: false)[6 (2,7 %)]], [#block(breakable: false)[2 (0,9 %)]], [#block(breakable: false)[8 (13,6 %)]],
    [#block(breakable: false)[Intégration des services]], [#block(breakable: false)[2 (0,9 %)]], [#block(breakable: false)[1 (0,4 %)]], [#block(breakable: false)[0 (0,0 %)]],
    [#block(breakable: false)[Capacité d'accueil]], [#block(breakable: false)[0 (0,0 %)]], [#block(breakable: false)[0 (0,0 %)]], [#block(breakable: false)[5 (8,5 %)]],
    [#block(breakable: false)[Eau, hygiène et assainissement]], [#block(breakable: false)[0 (0,0 %)]], [#block(breakable: false)[0 (0,0 %)]], [#block(breakable: false)[25 (42,4 %)]],
    [#block(breakable: false)[Surveillance épidémiologique]], [#block(breakable: false)[0 (0,0 %)]], [#block(breakable: false)[0 (0,0 %)]], [#block(breakable: false)[2 (3,4 %)]],
)
#v(4pt)

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 9.6pt, weight: "bold", fill: rgb("#131d44"))[Tableau A11 : Conditions transversales et profil d'urgence, Haut-Lomami]]
#set par(justify: false, leading: 0.62em)
#set text(size: 9.0pt)
#table(
  columns: (0.3399fr, 0.2000fr, 0.2003fr, 0.2598fr),
  inset: (x: 4.4pt, y: 3.2pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Condition transversale]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Vert : n (%)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Jaune : n (%)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Rouge : n (%)]]]),
    [#block(breakable: false)[Eau, hygiène et assainissement]], [#block(breakable: false)[1 (8,3 %)]], [#block(breakable: false)[4 (33,3 %)]], [#block(breakable: false)[7 (58,3 %)]],
    [#block(breakable: false)[Électricité]], [#block(breakable: false)[2 (16,7 %)]], [#block(breakable: false)[2 (16,7 %)]], [#block(breakable: false)[8 (66,7 %)]],
    [#block(breakable: false)[Communication]], [#block(breakable: false)[6 (50,0 %)]], [#block(breakable: false)[4 (33,3 %)]], [#block(breakable: false)[2 (16,7 %)]],
    [#block(breakable: false)[Circuit de référence]], [#block(breakable: false)[0 (0,0 %)]], [#block(breakable: false)[2 (16,7 %)]], [#block(breakable: false)[10 (83,3 %)]],
    [#block(breakable: false)[Données sanitaires (SNIS)]], [#block(breakable: false)[0 (0,0 %)]], [#block(breakable: false)[4 (33,3 %)]], [#block(breakable: false)[8 (66,7 %)]],
    [#block(breakable: false)[Surveillance épidémiologique]], [#block(breakable: false)[10 (83,3 %)]], [#block(breakable: false)[2 (16,7 %)]], [#block(breakable: false)[0 (0,0 %)]],
    [#block(breakable: false)[Intégration des services]], [#block(breakable: false)[11 (91,7 %)]], [#block(breakable: false)[0 (0,0 %)]], [#block(breakable: false)[1 (8,3 %)]],
    [#block(breakable: false)[Fonctions d'urgence (K = 120)]], [#block(breakable: false)[0,0 %]], [#block(breakable: false)[5,0 %]], [#block(breakable: false)[95,0 % ; menace immédiate : 10 établissements (83,3 %)]],
)
#v(4pt)

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 9.6pt, weight: "bold", fill: rgb("#131d44"))[Tableau A12 : Leviers simples et paire optimale, Haut-Lomami]]
#set par(justify: false, leading: 0.62em)
#set text(size: 9.0pt)
#table(
  columns: (0.4400fr, 0.1399fr, 0.1401fr, 0.2800fr),
  inset: (x: 4.4pt, y: 3.2pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Levier (base : 224 fonctions rouges)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Rouge → Vert]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Rouge → Jaune]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Gain : n (% des rouges)]]]),
    [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[0]], [#block(breakable: false)[33]], [#block(breakable: false)[33 (14,7 %)]],
    [#block(breakable: false)[Équipements]], [#block(breakable: false)[0]], [#block(breakable: false)[29]], [#block(breakable: false)[29 (12,9 %)]],
    [#block(breakable: false)[Électricité]], [#block(breakable: false)[0]], [#block(breakable: false)[5]], [#block(breakable: false)[5 (2,2 %)]],
    [#block(breakable: false)[Référence]], [#block(breakable: false)[0]], [#block(breakable: false)[5]], [#block(breakable: false)[5 (2,2 %)]],
    [#block(breakable: false)[Communication]], [#block(breakable: false)[0]], [#block(breakable: false)[2]], [#block(breakable: false)[2 (0,9 %)]],
    [#block(breakable: false)[Ressources humaines]], [#block(breakable: false)[0]], [#block(breakable: false)[1]], [#block(breakable: false)[1 (0,4 %)]],
    [#block(breakable: false)[Intégration des services]], [#block(breakable: false)[0]], [#block(breakable: false)[1]], [#block(breakable: false)[1 (0,4 %)]],
    [#block(breakable: false)[Paire optimale : Intrants et produits \+ Équipements]], [#block(breakable: false)[\-]], [#block(breakable: false)[\-]], [#block(breakable: false)[94 (42,0 %)]],
)
#v(4pt)

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 8.0pt, weight: "bold", fill: rgb("#131d44"))[Tableau A13 : Lecture par zone de santé, Haut-Lomami]]
#set par(justify: false, leading: 0.62em)
#set text(size: 7.4pt)
#table(
  columns: (0.1998fr, 0.0606fr, 0.0700fr, 0.0798fr, 0.0800fr, 0.0800fr, 0.1900fr, 0.2398fr),
  inset: (x: 4.4pt, y: 3.2pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Zone de santé]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Établ.]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[K]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[% Vert]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[% Jaune]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[% Rouge]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Dimension dominante]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Premier levier (gain)]]]),
    [#block(breakable: false)[Bukama Zone de Santé]], [#block(breakable: false)[4]], [#block(breakable: false)[93]], [#block(breakable: false)[0,0]], [#block(breakable: false)[18,3]], [#block(breakable: false)[81,7]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[Intrants et produits (9 (11,8 %))]],
    [#block(breakable: false)[Kabongo Zone de Santé]], [#block(breakable: false)[4]], [#block(breakable: false)[97]], [#block(breakable: false)[0,0]], [#block(breakable: false)[22,7]], [#block(breakable: false)[77,3]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[Équipements (14 (18,7 %))]],
    [#block(breakable: false)[Kinkondja Zone de Santé]], [#block(breakable: false)[4]], [#block(breakable: false)[93]], [#block(breakable: false)[0,0]], [#block(breakable: false)[21,5]], [#block(breakable: false)[78,5]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[Intrants et produits (16 (21,9 %))]],
)
#v(4pt)

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 8.799999999999999pt, weight: "bold", fill: rgb("#131d44"))[Tableau A14 : Établissements où un seul levier libère le plus de fonctions rouges, Haut-Lomami]]
#set par(justify: false, leading: 0.62em)
#set text(size: 8.2pt)
#table(
  columns: (0.1599fr, 0.2200fr, 0.1600fr, 0.1202fr, 0.1799fr, 0.1599fr),
  inset: (x: 4.4pt, y: 3.2pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Établissement (code)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Zone]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Niveau]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Fonctions rouges]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Levier unique]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Fonctions libérées : n (%)]]]),
    [#block(breakable: false)[HL-HGR-12]], [#block(breakable: false)[Kinkondja Zone de Santé]], [#block(breakable: false)[Niveau 2 (HGR)]], [#block(breakable: false)[17]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[6 (35,3 %)]],
    [#block(breakable: false)[HL-CS-05]], [#block(breakable: false)[Kinkondja Zone de Santé]], [#block(breakable: false)[Niveau 1 (CS)]], [#block(breakable: false)[18]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[6 (33,3 %)]],
    [#block(breakable: false)[HL-HGR-11]], [#block(breakable: false)[Kabongo Zone de Santé]], [#block(breakable: false)[Niveau 2 (HGR)]], [#block(breakable: false)[17]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[5 (29,4 %)]],
    [#block(breakable: false)[HL-HGR-10]], [#block(breakable: false)[Bukama Zone de Santé]], [#block(breakable: false)[Niveau 2 (HGR)]], [#block(breakable: false)[17]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[4 (23,5 %)]],
    [#block(breakable: false)[HL-CSR-09]], [#block(breakable: false)[Kabongo Zone de Santé]], [#block(breakable: false)[Niveau 1+ (CSR)]], [#block(breakable: false)[19]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[4 (21,1 %)]],
    [#block(breakable: false)[HL-CSR-08]], [#block(breakable: false)[Kabongo Zone de Santé]], [#block(breakable: false)[Niveau 1+ (CSR)]], [#block(breakable: false)[19]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[4 (21,1 %)]],
)
#v(4pt)

#heading(level: 2)[Annexe 3 : Kasaï-Central]


#block(width: 100%, above: 9pt, below: 9pt, breakable: false,
  block(width: 100%, fill: rgb("#fffbf7"), radius: 12pt, stroke: 1.1pt + black, inset: (x: 12pt, y: 10pt))[
    #grid(columns: (1fr, 1fr, 1fr, 1fr, 1fr), column-gutter: 9pt,
    [#text(font: display, size: 19pt, fill: rgb("#131d44"))[24]\
     #text(size: 7.3pt, fill: rgb("#5166b7"))[établissements · 6 zones]],
    [#text(font: display, size: 19pt, fill: rgb("#131d44"))[562]\
     #text(size: 7.3pt, fill: rgb("#5166b7"))[évaluations calculables]],
    [#text(font: display, size: 19pt, fill: rgb("#131d44"))[62,8 %]\
     #text(size: 7.3pt, fill: rgb("#5166b7"))[rouge]],
    [#text(font: display, size: 19pt, fill: rgb("#131d44"))[35,9 %]\
     #text(size: 7.3pt, fill: rgb("#5166b7"))[jaune]],
    [#text(font: display, size: 19pt, fill: rgb("#131d44"))[1,2 %]\
     #text(size: 7.3pt, fill: rgb("#5166b7"))[vert]],
    )])


#block(width: 100%, above: 11pt, below: 9pt, breakable: false,
  block(width: 100%, fill: rgb("#fffbf7"), radius: 12pt, stroke: 1.4pt + black, inset: (x: 13pt, y: 11pt))[
    #text(font: "DejaVu Sans", size: 14pt, fill: rgb("#131d44"))[★]
    #v(-4pt)
    #text(size: 7.2pt, tracking: 2.4pt, fill: rgb("#5166b7"))[#upper[LECTURE CHIFFRÉE]]
    #v(1pt)
    #block(above: 3pt, below: 9pt)[#text(size: 11.2pt, weight: "bold", fill: rgb("#131d44"))[Ce que disent les chiffres : Kasaï-Central]]
    #text(size: 9.2pt, fill: rgb("#0f1015"))[Position. 62,8 % de fonctions rouges sur 562 évaluations calculables (24 établissements, 6 zones), soit 5,6 points en dessous de la part d'ensemble (68,4 %). Fonctions vitales rouges dans 203 cas sur 276 (73,6 %). Les plus contraintes : Grossesse à risque (100,0 %), MA non compliquée (100,0 %), Accouchement normal (95,8 %) ; les moins contraintes : Intégration services (0,0 %), Dépistage nutrition (4,2 %). Blocages. D'abord intrants et produits (48,2 % des rouges), puis équipements (45,0 %) et référence (37,4 %). 47,9 % des rouges tiennent à un seul blocage, 14,4 % à trois ou plus : le levier unique y est plus souvent possible qu'ailleurs. Conditions et urgences. Conditions rouges les plus fréquentes : eau, hygiène et assainissement (87,5 %), électricité (58,3 %), circuit de référence (58,3 %). 78,6 % des fonctions d'urgence sont rouges ; 15 établissements sur 24 (62,5 %) ont au moins une fonction d'urgence rouge pour absence d'un élément critique d'urgence. Leviers. Premier levier : intrants et produits, 62 fonctions libérées (17,6 %) ; puis équipements (38). Paire optimale : intrants et produits \+ équipements, 137 (38,8 %). Zone où la part de rouge est la plus élevée : Mikalayi Zone de Santé (72,6 %) ; la plus basse : Demba Zone de Santé (48,4 %) ; quatre établissements par zone, repères seulement.]
  ])

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 8.0pt, weight: "bold", fill: rgb("#131d44"))[Tableau A15 : Classification des 28 fonctions traceuses, Kasaï-Central]]
#set par(justify: false, leading: 0.62em)
#set text(size: 7.4pt)
#table(
  columns: (0.2331fr, 0.1214fr, 0.0586fr, 0.0783fr, 0.0792fr, 0.0792fr, 0.2528fr, 0.0974fr),
  inset: (x: 4.4pt, y: 2.3pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Fonction]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Criticité]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[K]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[% Vert]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[% Jaune]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[% Rouge]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Premier blocage dominant]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Part des rouges]]]),
    [#block(breakable: false)[Grossesse à risque]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[18]], [#block(breakable: false)[0,0]], [#block(breakable: false)[0,0]], [#block(breakable: false)[100,0]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[94,4]],
    [#block(breakable: false)[MA compliquée]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[24]], [#block(breakable: false)[4,2]], [#block(breakable: false)[16,7]], [#block(breakable: false)[79,2]], [#block(breakable: false)[Référence]], [#block(breakable: false)[52,6]],
    [#block(breakable: false)[MAPI]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[18]], [#block(breakable: false)[0,0]], [#block(breakable: false)[5,6]], [#block(breakable: false)[94,4]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[76,5]],
    [#block(breakable: false)[Réanimation néonat.]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[24]], [#block(breakable: false)[0,0]], [#block(breakable: false)[12,5]], [#block(breakable: false)[87,5]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[95,2]],
    [#block(breakable: false)[Pré-éclampsie]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[24]], [#block(breakable: false)[0,0]], [#block(breakable: false)[16,7]], [#block(breakable: false)[83,3]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[70,0]],
    [#block(breakable: false)[Paludisme grave]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[24]], [#block(breakable: false)[0,0]], [#block(breakable: false)[16,7]], [#block(breakable: false)[83,3]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[75,0]],
    [#block(breakable: false)[Chaîne du froid]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[18]], [#block(breakable: false)[0,0]], [#block(breakable: false)[33,3]], [#block(breakable: false)[66,7]], [#block(breakable: false)[Électricité]], [#block(breakable: false)[91,7]],
    [#block(breakable: false)[Césarienne d'urgence]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[8]], [#block(breakable: false)[0,0]], [#block(breakable: false)[12,5]], [#block(breakable: false)[87,5]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[85,7]],
    [#block(breakable: false)[Transfusion]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[8]], [#block(breakable: false)[12,5]], [#block(breakable: false)[12,5]], [#block(breakable: false)[75,0]], [#block(breakable: false)[Électricité]], [#block(breakable: false)[83,3]],
    [#block(breakable: false)[Référence urgente]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[24]], [#block(breakable: false)[0,0]], [#block(breakable: false)[29,2]], [#block(breakable: false)[70,8]], [#block(breakable: false)[Organisation du service]], [#block(breakable: false)[82,4]],
    [#block(breakable: false)[Réception urgences]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[6]], [#block(breakable: false)[0,0]], [#block(breakable: false)[50,0]], [#block(breakable: false)[50,0]], [#block(breakable: false)[Organisation du service]], [#block(breakable: false)[100,0]],
    [#block(breakable: false)[Accouchement assisté]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[8]], [#block(breakable: false)[0,0]], [#block(breakable: false)[37,5]], [#block(breakable: false)[62,5]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[100,0]],
    [#block(breakable: false)[Hémorragie post-partum]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[24]], [#block(breakable: false)[0,0]], [#block(breakable: false)[29,2]], [#block(breakable: false)[70,8]], [#block(breakable: false)[Référence]], [#block(breakable: false)[58,8]],
    [#block(breakable: false)[Sepsis obstétrical]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[24]], [#block(breakable: false)[0,0]], [#block(breakable: false)[41,7]], [#block(breakable: false)[58,3]], [#block(breakable: false)[Référence]], [#block(breakable: false)[71,4]],
    [#block(breakable: false)[Surveillance épidémio]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[24]], [#block(breakable: false)[0,0]], [#block(breakable: false)[70,8]], [#block(breakable: false)[29,2]], [#block(breakable: false)[Communication]], [#block(breakable: false)[85,7]],
    [#block(breakable: false)[MA non compliquée]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[16]], [#block(breakable: false)[0,0]], [#block(breakable: false)[0,0]], [#block(breakable: false)[100,0]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[81,2]],
    [#block(breakable: false)[Accouchement normal]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[24]], [#block(breakable: false)[0,0]], [#block(breakable: false)[4,2]], [#block(breakable: false)[95,8]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[95,7]],
    [#block(breakable: false)[CPoN mère]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[24]], [#block(breakable: false)[0,0]], [#block(breakable: false)[4,2]], [#block(breakable: false)[95,8]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[78,3]],
    [#block(breakable: false)[CPN de routine]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[18]], [#block(breakable: false)[0,0]], [#block(breakable: false)[5,6]], [#block(breakable: false)[94,4]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[94,1]],
    [#block(breakable: false)[Vaccination de routine]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[18]], [#block(breakable: false)[0,0]], [#block(breakable: false)[33,3]], [#block(breakable: false)[66,7]], [#block(breakable: false)[Électricité]], [#block(breakable: false)[91,7]],
    [#block(breakable: false)[Soins du nouveau-né]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[24]], [#block(breakable: false)[0,0]], [#block(breakable: false)[41,7]], [#block(breakable: false)[58,3]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[100,0]],
    [#block(breakable: false)[CPN \+ PTME]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[18]], [#block(breakable: false)[0,0]], [#block(breakable: false)[38,9]], [#block(breakable: false)[61,1]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[100,0]],
    [#block(breakable: false)[CPoN nouveau-né]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[24]], [#block(breakable: false)[0,0]], [#block(breakable: false)[33,3]], [#block(breakable: false)[66,7]], [#block(breakable: false)[Référence]], [#block(breakable: false)[68,8]],
    [#block(breakable: false)[Dépistage nutrition]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[24]], [#block(breakable: false)[12,5]], [#block(breakable: false)[83,3]], [#block(breakable: false)[4,2]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[100,0]],
    [#block(breakable: false)[Paludisme simple]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[24]], [#block(breakable: false)[4,2]], [#block(breakable: false)[62,5]], [#block(breakable: false)[33,3]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[100,0]],
    [#block(breakable: false)[Diagnostic paludisme]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[24]], [#block(breakable: false)[4,2]], [#block(breakable: false)[87,5]], [#block(breakable: false)[8,3]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[100,0]],
    [#block(breakable: false)[Données sanitaires]], [#block(breakable: false)[Systémique]], [#block(breakable: false)[24]], [#block(breakable: false)[0,0]], [#block(breakable: false)[70,8]], [#block(breakable: false)[29,2]], [#block(breakable: false)[Organisation du service]], [#block(breakable: false)[100,0]],
    [#block(breakable: false)[Intégration services]], [#block(breakable: false)[Systémique]], [#block(breakable: false)[24]], [#block(breakable: false)[0,0]], [#block(breakable: false)[100,0]], [#block(breakable: false)[0,0]], [#block(breakable: false)[\-]], [#block(breakable: false)[0,0]],
)
#v(4pt)

#v(6pt)
#pagebreak(weak: true)
#set page(flipped: true)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 7.199999999999999pt, weight: "bold", fill: rgb("#131d44"))[Tableau A16 : Dimensions bloquantes des fonctions rouges, par fonction (n), Kasaï-Central]]
#set par(justify: false, leading: 0.62em)
#set text(size: 6.6pt)
#table(
  columns: (0.1905fr, 0.0674fr, 0.0672fr, 0.0671fr, 0.0666fr, 0.0670fr, 0.0671fr, 0.0672fr, 0.0670fr, 0.0671fr, 0.0717fr, 0.0673fr, 0.0668fr),
  inset: (x: 4.4pt, y: 2.3pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Fonction]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Rouges]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Intrants]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Équip.]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[RH]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Référ.]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Organ.]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Comm.]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Électr.]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Intégr.]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Données]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Surveil.]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Accueil]]]),
    [#block(breakable: false)[Grossesse à risque]], [#block(breakable: false)[18]], [#block(breakable: false)[17]], [#block(breakable: false)[7]], [#block(breakable: false)[1]], [#block(breakable: false)[11]], [#block(breakable: false)[0]], [#block(breakable: false)[5]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[MA compliquée]], [#block(breakable: false)[19]], [#block(breakable: false)[5]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[10]], [#block(breakable: false)[0]], [#block(breakable: false)[5]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[MAPI]], [#block(breakable: false)[17]], [#block(breakable: false)[13]], [#block(breakable: false)[13]], [#block(breakable: false)[0]], [#block(breakable: false)[11]], [#block(breakable: false)[0]], [#block(breakable: false)[5]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[2]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Réanimation néonat.]], [#block(breakable: false)[21]], [#block(breakable: false)[0]], [#block(breakable: false)[20]], [#block(breakable: false)[0]], [#block(breakable: false)[10]], [#block(breakable: false)[0]], [#block(breakable: false)[5]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Pré-éclampsie]], [#block(breakable: false)[20]], [#block(breakable: false)[14]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[10]], [#block(breakable: false)[0]], [#block(breakable: false)[5]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Paludisme grave]], [#block(breakable: false)[20]], [#block(breakable: false)[5]], [#block(breakable: false)[15]], [#block(breakable: false)[0]], [#block(breakable: false)[11]], [#block(breakable: false)[0]], [#block(breakable: false)[5]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Chaîne du froid]], [#block(breakable: false)[12]], [#block(breakable: false)[0]], [#block(breakable: false)[7]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[11]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Césarienne d'urgence]], [#block(breakable: false)[7]], [#block(breakable: false)[4]], [#block(breakable: false)[6]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[5]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Transfusion]], [#block(breakable: false)[6]], [#block(breakable: false)[2]], [#block(breakable: false)[3]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[5]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Référence urgente]], [#block(breakable: false)[17]], [#block(breakable: false)[0]], [#block(breakable: false)[14]], [#block(breakable: false)[0]], [#block(breakable: false)[14]], [#block(breakable: false)[14]], [#block(breakable: false)[6]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Réception urgences]], [#block(breakable: false)[3]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[3]], [#block(breakable: false)[3]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Accouchement assisté]], [#block(breakable: false)[5]], [#block(breakable: false)[0]], [#block(breakable: false)[5]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Hémorragie post-partum]], [#block(breakable: false)[17]], [#block(breakable: false)[4]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[10]], [#block(breakable: false)[0]], [#block(breakable: false)[5]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Sepsis obstétrical]], [#block(breakable: false)[14]], [#block(breakable: false)[5]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[10]], [#block(breakable: false)[0]], [#block(breakable: false)[5]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Surveillance épidémio.]], [#block(breakable: false)[7]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[2]], [#block(breakable: false)[6]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[2]], [#block(breakable: false)[0]],
    [#block(breakable: false)[MA non compliquée]], [#block(breakable: false)[16]], [#block(breakable: false)[13]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[10]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Accouchement normal]], [#block(breakable: false)[23]], [#block(breakable: false)[22]], [#block(breakable: false)[16]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[CPoN mère]], [#block(breakable: false)[23]], [#block(breakable: false)[18]], [#block(breakable: false)[14]], [#block(breakable: false)[1]], [#block(breakable: false)[11]], [#block(breakable: false)[2]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[CPN de routine]], [#block(breakable: false)[17]], [#block(breakable: false)[16]], [#block(breakable: false)[10]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Vaccination de routine]], [#block(breakable: false)[12]], [#block(breakable: false)[8]], [#block(breakable: false)[5]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[11]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Soins du nouveau-né]], [#block(breakable: false)[14]], [#block(breakable: false)[1]], [#block(breakable: false)[14]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[CPN \+ PTME]], [#block(breakable: false)[11]], [#block(breakable: false)[11]], [#block(breakable: false)[0]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[5]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[CPoN nouveau-né]], [#block(breakable: false)[16]], [#block(breakable: false)[2]], [#block(breakable: false)[5]], [#block(breakable: false)[1]], [#block(breakable: false)[11]], [#block(breakable: false)[2]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Dépistage nutrition]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Paludisme simple]], [#block(breakable: false)[8]], [#block(breakable: false)[8]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Diagnostic paludisme]], [#block(breakable: false)[2]], [#block(breakable: false)[2]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Données sanitaires]], [#block(breakable: false)[7]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[7]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[7]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Intégration services]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
)
#pagebreak()
#set page(flipped: false)

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 9.6pt, weight: "bold", fill: rgb("#131d44"))[Tableau A17 : Dimensions bloquantes et fragilités, Kasaï-Central]]
#set par(justify: false, leading: 0.62em)
#set text(size: 9.0pt)
#table(
  columns: (0.3400fr, 0.2200fr, 0.2202fr, 0.2198fr),
  inset: (x: 4.4pt, y: 3.2pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Dimension]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Bloque : n (% des rouges)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Premier blocage : n (%)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Fragilise : n (% des jaunes)]]]),
    [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[170 (48,2 %)]], [#block(breakable: false)[161 (45,6 %)]], [#block(breakable: false)[57 (28,2 %)]],
    [#block(breakable: false)[Équipements]], [#block(breakable: false)[159 (45,0 %)]], [#block(breakable: false)[78 (22,1 %)]], [#block(breakable: false)[51 (25,2 %)]],
    [#block(breakable: false)[Référence]], [#block(breakable: false)[132 (37,4 %)]], [#block(breakable: false)[38 (10,8 %)]], [#block(breakable: false)[96 (47,5 %)]],
    [#block(breakable: false)[Communication]], [#block(breakable: false)[53 (15,0 %)]], [#block(breakable: false)[30 (8,5 %)]], [#block(breakable: false)[29 (14,4 %)]],
    [#block(breakable: false)[Organisation du service]], [#block(breakable: false)[35 (9,9 %)]], [#block(breakable: false)[35 (9,9 %)]], [#block(breakable: false)[43 (21,3 %)]],
    [#block(breakable: false)[Électricité]], [#block(breakable: false)[32 (9,1 %)]], [#block(breakable: false)[8 (2,3 %)]], [#block(breakable: false)[91 (45,0 %)]],
    [#block(breakable: false)[Données sanitaires]], [#block(breakable: false)[7 (2,0 %)]], [#block(breakable: false)[0 (0,0 %)]], [#block(breakable: false)[52 (25,7 %)]],
    [#block(breakable: false)[Ressources humaines]], [#block(breakable: false)[5 (1,4 %)]], [#block(breakable: false)[3 (0,8 %)]], [#block(breakable: false)[76 (37,6 %)]],
    [#block(breakable: false)[Surveillance épidémiologique]], [#block(breakable: false)[4 (1,1 %)]], [#block(breakable: false)[0 (0,0 %)]], [#block(breakable: false)[6 (3,0 %)]],
    [#block(breakable: false)[Capacité d'accueil]], [#block(breakable: false)[0 (0,0 %)]], [#block(breakable: false)[0 (0,0 %)]], [#block(breakable: false)[30 (14,9 %)]],
    [#block(breakable: false)[Eau, hygiène et assainissement]], [#block(breakable: false)[0 (0,0 %)]], [#block(breakable: false)[0 (0,0 %)]], [#block(breakable: false)[91 (45,0 %)]],
)
#v(4pt)

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 9.6pt, weight: "bold", fill: rgb("#131d44"))[Tableau A18 : Conditions transversales et profil d'urgence, Kasaï-Central]]
#set par(justify: false, leading: 0.62em)
#set text(size: 9.0pt)
#table(
  columns: (0.3399fr, 0.2000fr, 0.2003fr, 0.2598fr),
  inset: (x: 4.4pt, y: 3.2pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Condition transversale]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Vert : n (%)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Jaune : n (%)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Rouge : n (%)]]]),
    [#block(breakable: false)[Eau, hygiène et assainissement]], [#block(breakable: false)[2 (8,3 %)]], [#block(breakable: false)[1 (4,2 %)]], [#block(breakable: false)[21 (87,5 %)]],
    [#block(breakable: false)[Électricité]], [#block(breakable: false)[4 (16,7 %)]], [#block(breakable: false)[6 (25,0 %)]], [#block(breakable: false)[14 (58,3 %)]],
    [#block(breakable: false)[Communication]], [#block(breakable: false)[12 (50,0 %)]], [#block(breakable: false)[6 (25,0 %)]], [#block(breakable: false)[6 (25,0 %)]],
    [#block(breakable: false)[Circuit de référence]], [#block(breakable: false)[6 (25,0 %)]], [#block(breakable: false)[4 (16,7 %)]], [#block(breakable: false)[14 (58,3 %)]],
    [#block(breakable: false)[Données sanitaires (SNIS)]], [#block(breakable: false)[8 (33,3 %)]], [#block(breakable: false)[9 (37,5 %)]], [#block(breakable: false)[7 (29,2 %)]],
    [#block(breakable: false)[Surveillance épidémiologique]], [#block(breakable: false)[18 (75,0 %)]], [#block(breakable: false)[4 (16,7 %)]], [#block(breakable: false)[2 (8,3 %)]],
    [#block(breakable: false)[Intégration des services]], [#block(breakable: false)[24 (100,0 %)]], [#block(breakable: false)[0 (0,0 %)]], [#block(breakable: false)[0 (0,0 %)]],
    [#block(breakable: false)[Fonctions d'urgence (K = 234)]], [#block(breakable: false)[0,9 %]], [#block(breakable: false)[20,5 %]], [#block(breakable: false)[78,6 % ; menace immédiate : 15 établissements (62,5 %)]],
)
#v(4pt)

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 9.6pt, weight: "bold", fill: rgb("#131d44"))[Tableau A19 : Leviers simples et paire optimale, Kasaï-Central]]
#set par(justify: false, leading: 0.62em)
#set text(size: 9.0pt)
#table(
  columns: (0.4400fr, 0.1399fr, 0.1401fr, 0.2800fr),
  inset: (x: 4.4pt, y: 3.2pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Levier (base : 353 fonctions rouges)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Rouge → Vert]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Rouge → Jaune]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Gain : n (% des rouges)]]]),
    [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[2]], [#block(breakable: false)[60]], [#block(breakable: false)[62 (17,6 %)]],
    [#block(breakable: false)[Équipements]], [#block(breakable: false)[0]], [#block(breakable: false)[38]], [#block(breakable: false)[38 (10,8 %)]],
    [#block(breakable: false)[Référence]], [#block(breakable: false)[0]], [#block(breakable: false)[37]], [#block(breakable: false)[37 (10,5 %)]],
    [#block(breakable: false)[Communication]], [#block(breakable: false)[0]], [#block(breakable: false)[22]], [#block(breakable: false)[22 (6,2 %)]],
    [#block(breakable: false)[Électricité]], [#block(breakable: false)[0]], [#block(breakable: false)[8]], [#block(breakable: false)[8 (2,3 %)]],
    [#block(breakable: false)[Organisation du service]], [#block(breakable: false)[0]], [#block(breakable: false)[2]], [#block(breakable: false)[2 (0,6 %)]],
    [#block(breakable: false)[Paire optimale : Intrants et produits \+ Équipements]], [#block(breakable: false)[\-]], [#block(breakable: false)[\-]], [#block(breakable: false)[137 (38,8 %)]],
)
#v(4pt)

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 8.0pt, weight: "bold", fill: rgb("#131d44"))[Tableau A20 : Lecture par zone de santé, Kasaï-Central]]
#set par(justify: false, leading: 0.62em)
#set text(size: 7.4pt)
#table(
  columns: (0.1998fr, 0.0606fr, 0.0700fr, 0.0798fr, 0.0800fr, 0.0800fr, 0.1900fr, 0.2398fr),
  inset: (x: 4.4pt, y: 3.2pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Zone de santé]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Établ.]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[K]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[% Vert]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[% Jaune]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[% Rouge]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Dimension dominante]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Premier levier (gain)]]]),
    [#block(breakable: false)[Demba Zone de Santé]], [#block(breakable: false)[4]], [#block(breakable: false)[93]], [#block(breakable: false)[6,5]], [#block(breakable: false)[45,2]], [#block(breakable: false)[48,4]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[Intrants et produits (13 (28,9 %))]],
    [#block(breakable: false)[Katende Zone de Santé]], [#block(breakable: false)[4]], [#block(breakable: false)[93]], [#block(breakable: false)[0,0]], [#block(breakable: false)[38,7]], [#block(breakable: false)[61,3]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[Équipements (13 (22,8 %))]],
    [#block(breakable: false)[Mikalayi Zone de Santé]], [#block(breakable: false)[4]], [#block(breakable: false)[95]], [#block(breakable: false)[0,0]], [#block(breakable: false)[27,4]], [#block(breakable: false)[72,6]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[Intrants et produits (15 (21,7 %))]],
    [#block(breakable: false)[Ndekesha Zone de Santé]], [#block(breakable: false)[4]], [#block(breakable: false)[95]], [#block(breakable: false)[0,0]], [#block(breakable: false)[30,5]], [#block(breakable: false)[69,5]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[Intrants et produits (16 (24,2 %))]],
    [#block(breakable: false)[Ndesha Zone de Santé]], [#block(breakable: false)[4]], [#block(breakable: false)[93]], [#block(breakable: false)[0,0]], [#block(breakable: false)[31,2]], [#block(breakable: false)[68,8]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[Référence (7 (10,9 %))]],
    [#block(breakable: false)[Tshikula Zone de Santé]], [#block(breakable: false)[4]], [#block(breakable: false)[93]], [#block(breakable: false)[1,1]], [#block(breakable: false)[43,0]], [#block(breakable: false)[55,9]], [#block(breakable: false)[Communication]], [#block(breakable: false)[Communication (14 (26,9 %))]],
)
#v(4pt)

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 8.799999999999999pt, weight: "bold", fill: rgb("#131d44"))[Tableau A21 : Établissements où un seul levier libère le plus de fonctions rouges, Kasaï-Central]]
#set par(justify: false, leading: 0.62em)
#set text(size: 8.2pt)
#table(
  columns: (0.1599fr, 0.2200fr, 0.1600fr, 0.1202fr, 0.1799fr, 0.1599fr),
  inset: (x: 4.4pt, y: 3.2pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Établissement (code)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Zone]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Niveau]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Fonctions rouges]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Levier unique]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Fonctions libérées : n (%)]]]),
    [#block(breakable: false)[KC-HGR-22]], [#block(breakable: false)[Ndekesha Zone de Santé]], [#block(breakable: false)[Niveau 2 (HGR)]], [#block(breakable: false)[14]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[9 (64,3 %)]],
    [#block(breakable: false)[KC-CS-02]], [#block(breakable: false)[Demba Zone de Santé]], [#block(breakable: false)[Niveau 1 (CS)]], [#block(breakable: false)[14]], [#block(breakable: false)[Référence]], [#block(breakable: false)[7 (50,0 %)]],
    [#block(breakable: false)[KC-CS-16]], [#block(breakable: false)[Tshikula Zone de Santé]], [#block(breakable: false)[Niveau 1 (CS)]], [#block(breakable: false)[15]], [#block(breakable: false)[Communication]], [#block(breakable: false)[7 (46,7 %)]],
    [#block(breakable: false)[KC-CS-11]], [#block(breakable: false)[Tshikula Zone de Santé]], [#block(breakable: false)[Niveau 1 (CS)]], [#block(breakable: false)[16]], [#block(breakable: false)[Communication]], [#block(breakable: false)[7 (43,8 %)]],
    [#block(breakable: false)[KC-CS-13]], [#block(breakable: false)[Demba Zone de Santé]], [#block(breakable: false)[Niveau 1 (CS)]], [#block(breakable: false)[8]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[6 (75,0 %)]],
    [#block(breakable: false)[KC-HGR-21]], [#block(breakable: false)[Mikalayi Zone de Santé]], [#block(breakable: false)[Niveau 2 (HGR)]], [#block(breakable: false)[13]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[6 (46,2 %)]],
)
#v(4pt)

#heading(level: 2)[Annexe 4 : Kasaï-Oriental]


#block(width: 100%, above: 9pt, below: 9pt, breakable: false,
  block(width: 100%, fill: rgb("#fffbf7"), radius: 12pt, stroke: 1.1pt + black, inset: (x: 12pt, y: 10pt))[
    #grid(columns: (1fr, 1fr, 1fr, 1fr, 1fr), column-gutter: 9pt,
    [#text(font: display, size: 19pt, fill: rgb("#131d44"))[8]\
     #text(size: 7.3pt, fill: rgb("#5166b7"))[établissements · 2 zones]],
    [#text(font: display, size: 19pt, fill: rgb("#131d44"))[190]\
     #text(size: 7.3pt, fill: rgb("#5166b7"))[évaluations calculables]],
    [#text(font: display, size: 19pt, fill: rgb("#131d44"))[43,2 %]\
     #text(size: 7.3pt, fill: rgb("#5166b7"))[rouge]],
    [#text(font: display, size: 19pt, fill: rgb("#131d44"))[45,8 %]\
     #text(size: 7.3pt, fill: rgb("#5166b7"))[jaune]],
    [#text(font: display, size: 19pt, fill: rgb("#131d44"))[11,1 %]\
     #text(size: 7.3pt, fill: rgb("#5166b7"))[vert]],
    )])


#block(width: 100%, above: 11pt, below: 9pt, breakable: false,
  block(width: 100%, fill: rgb("#fffbf7"), radius: 12pt, stroke: 1.4pt + black, inset: (x: 13pt, y: 11pt))[
    #text(font: "DejaVu Sans", size: 14pt, fill: rgb("#131d44"))[★]
    #v(-4pt)
    #text(size: 7.2pt, tracking: 2.4pt, fill: rgb("#5166b7"))[#upper[LECTURE CHIFFRÉE]]
    #v(1pt)
    #block(above: 3pt, below: 9pt)[#text(size: 11.2pt, weight: "bold", fill: rgb("#131d44"))[Ce que disent les chiffres : Kasaï-Oriental]]
    #text(size: 9.2pt, fill: rgb("#0f1015"))[Position. 43,2 % de fonctions rouges sur 190 évaluations calculables (8 établissements, 2 zones), soit 25,2 points en dessous de la part d'ensemble (68,4 %) ; avec 8 établissements, ces parts sont des repères. Fonctions vitales rouges dans 50 cas sur 96 (52,1 %). Les plus contraintes : Césarienne d'urgence (100,0 %), MA non compliquée (100,0 %), Réanimation néonat. (87,5 %) ; les moins contraintes : Surveillance épidémio (0,0 %), Données sanitaires (0,0 %). Blocages. D'abord intrants et produits (50,0 % des rouges), puis équipements (32,9 %) et ressources humaines (23,2 %). 74,4 % des rouges tiennent à un seul blocage, 3,7 % à trois ou plus : le levier unique y est plus souvent possible qu'ailleurs. Conditions et urgences. Conditions rouges les plus fréquentes : eau, hygiène et assainissement (25,0 %), circuit de référence (25,0 %), électricité (12,5 %). 58,5 % des fonctions d'urgence sont rouges ; 5 établissements sur 8 (62,5 %) ont au moins une fonction d'urgence rouge pour absence d'un élément critique d'urgence. Leviers. Premier levier : intrants et produits, 29 fonctions libérées (35,4 %) ; puis équipements (15). Paire optimale : intrants et produits \+ équipements, 47 (57,3 %). Zone où la part de rouge est la plus élevée : Cilundu Zone de Santé (44,2 %) ; la plus basse : Dibindi Zone de Santé (42,1 %) ; quatre établissements par zone, repères seulement.]
  ])

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 8.0pt, weight: "bold", fill: rgb("#131d44"))[Tableau A22 : Classification des 28 fonctions traceuses, Kasaï-Oriental]]
#set par(justify: false, leading: 0.62em)
#set text(size: 7.4pt)
#table(
  columns: (0.2342fr, 0.1214fr, 0.0581fr, 0.0781fr, 0.0787fr, 0.0790fr, 0.2525fr, 0.0981fr),
  inset: (x: 4.4pt, y: 2.3pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Fonction]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Criticité]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[K]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Vert (n \/ K)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Jaune (n \/ K)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Rouge (n \/ K)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Premier blocage dominant]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Rouges avec ce blocage (n)]]]),
    [#block(breakable: false)[Grossesse à risque]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[6]], [#block(breakable: false)[0 \/ 6]], [#block(breakable: false)[2 \/ 6]], [#block(breakable: false)[4 \/ 6]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[4]],
    [#block(breakable: false)[MA compliquée]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[8]], [#block(breakable: false)[0 \/ 8]], [#block(breakable: false)[4 \/ 8]], [#block(breakable: false)[4 \/ 8]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[3]],
    [#block(breakable: false)[MAPI]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[6]], [#block(breakable: false)[0 \/ 6]], [#block(breakable: false)[4 \/ 6]], [#block(breakable: false)[2 \/ 6]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[2]],
    [#block(breakable: false)[Réanimation néonat.]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[8]], [#block(breakable: false)[0 \/ 8]], [#block(breakable: false)[1 \/ 8]], [#block(breakable: false)[7 \/ 8]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[7]],
    [#block(breakable: false)[Pré-éclampsie]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[8]], [#block(breakable: false)[0 \/ 8]], [#block(breakable: false)[2 \/ 8]], [#block(breakable: false)[6 \/ 8]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[5]],
    [#block(breakable: false)[Paludisme grave]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[8]], [#block(breakable: false)[0 \/ 8]], [#block(breakable: false)[4 \/ 8]], [#block(breakable: false)[4 \/ 8]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[2]],
    [#block(breakable: false)[Chaîne du froid]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[6]], [#block(breakable: false)[0 \/ 6]], [#block(breakable: false)[4 \/ 6]], [#block(breakable: false)[2 \/ 6]], [#block(breakable: false)[Électricité]], [#block(breakable: false)[1]],
    [#block(breakable: false)[Césarienne d'urgence]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[4]], [#block(breakable: false)[0 \/ 4]], [#block(breakable: false)[0 \/ 4]], [#block(breakable: false)[4 \/ 4]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[3]],
    [#block(breakable: false)[Transfusion]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[4]], [#block(breakable: false)[0 \/ 4]], [#block(breakable: false)[1 \/ 4]], [#block(breakable: false)[3 \/ 4]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[3]],
    [#block(breakable: false)[Référence urgente]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[8]], [#block(breakable: false)[0 \/ 8]], [#block(breakable: false)[6 \/ 8]], [#block(breakable: false)[2 \/ 8]], [#block(breakable: false)[Organisation du service]], [#block(breakable: false)[2]],
    [#block(breakable: false)[Réception urgences]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[2]], [#block(breakable: false)[0 \/ 2]], [#block(breakable: false)[1 \/ 2]], [#block(breakable: false)[1 \/ 2]], [#block(breakable: false)[Organisation du service]], [#block(breakable: false)[1]],
    [#block(breakable: false)[Accouchement assisté]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[4]], [#block(breakable: false)[0 \/ 4]], [#block(breakable: false)[1 \/ 4]], [#block(breakable: false)[3 \/ 4]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[3]],
    [#block(breakable: false)[Hémorragie post-partum]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[8]], [#block(breakable: false)[0 \/ 8]], [#block(breakable: false)[3 \/ 8]], [#block(breakable: false)[5 \/ 8]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[3]],
    [#block(breakable: false)[Sepsis obstétrical]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[8]], [#block(breakable: false)[2 \/ 8]], [#block(breakable: false)[3 \/ 8]], [#block(breakable: false)[3 \/ 8]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[2]],
    [#block(breakable: false)[Surveillance épidémio]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[8]], [#block(breakable: false)[2 \/ 8]], [#block(breakable: false)[6 \/ 8]], [#block(breakable: false)[0 \/ 8]], [#block(breakable: false)[\-]], [#block(breakable: false)[0]],
    [#block(breakable: false)[MA non compliquée]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[4]], [#block(breakable: false)[0 \/ 4]], [#block(breakable: false)[0 \/ 4]], [#block(breakable: false)[4 \/ 4]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[3]],
    [#block(breakable: false)[Accouchement normal]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[8]], [#block(breakable: false)[1 \/ 8]], [#block(breakable: false)[1 \/ 8]], [#block(breakable: false)[6 \/ 8]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[6]],
    [#block(breakable: false)[CPoN mère]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[8]], [#block(breakable: false)[0 \/ 8]], [#block(breakable: false)[5 \/ 8]], [#block(breakable: false)[3 \/ 8]], [#block(breakable: false)[Référence]], [#block(breakable: false)[1]],
    [#block(breakable: false)[CPN de routine]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[6]], [#block(breakable: false)[1 \/ 6]], [#block(breakable: false)[3 \/ 6]], [#block(breakable: false)[2 \/ 6]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[2]],
    [#block(breakable: false)[Vaccination de routine]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[6]], [#block(breakable: false)[0 \/ 6]], [#block(breakable: false)[4 \/ 6]], [#block(breakable: false)[2 \/ 6]], [#block(breakable: false)[Électricité]], [#block(breakable: false)[1]],
    [#block(breakable: false)[Soins du nouveau-né]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[8]], [#block(breakable: false)[0 \/ 8]], [#block(breakable: false)[2 \/ 8]], [#block(breakable: false)[6 \/ 8]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[6]],
    [#block(breakable: false)[CPN \+ PTME]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[6]], [#block(breakable: false)[1 \/ 6]], [#block(breakable: false)[4 \/ 6]], [#block(breakable: false)[1 \/ 6]], [#block(breakable: false)[Ressources humaines]], [#block(breakable: false)[1]],
    [#block(breakable: false)[CPoN nouveau-né]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[8]], [#block(breakable: false)[0 \/ 8]], [#block(breakable: false)[6 \/ 8]], [#block(breakable: false)[2 \/ 8]], [#block(breakable: false)[Référence]], [#block(breakable: false)[1]],
    [#block(breakable: false)[Dépistage nutrition]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[8]], [#block(breakable: false)[3 \/ 8]], [#block(breakable: false)[4 \/ 8]], [#block(breakable: false)[1 \/ 8]], [#block(breakable: false)[Ressources humaines]], [#block(breakable: false)[1]],
    [#block(breakable: false)[Paludisme simple]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[8]], [#block(breakable: false)[2 \/ 8]], [#block(breakable: false)[2 \/ 8]], [#block(breakable: false)[4 \/ 8]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[3]],
    [#block(breakable: false)[Diagnostic paludisme]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[8]], [#block(breakable: false)[3 \/ 8]], [#block(breakable: false)[4 \/ 8]], [#block(breakable: false)[1 \/ 8]], [#block(breakable: false)[Ressources humaines]], [#block(breakable: false)[1]],
    [#block(breakable: false)[Données sanitaires]], [#block(breakable: false)[Systémique]], [#block(breakable: false)[8]], [#block(breakable: false)[3 \/ 8]], [#block(breakable: false)[5 \/ 8]], [#block(breakable: false)[0 \/ 8]], [#block(breakable: false)[\-]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Intégration services]], [#block(breakable: false)[Systémique]], [#block(breakable: false)[8]], [#block(breakable: false)[3 \/ 8]], [#block(breakable: false)[5 \/ 8]], [#block(breakable: false)[0 \/ 8]], [#block(breakable: false)[\-]], [#block(breakable: false)[0]],
)
#v(4pt)

#v(6pt)
#pagebreak(weak: true)
#set page(flipped: true)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 7.199999999999999pt, weight: "bold", fill: rgb("#131d44"))[Tableau A23 : Dimensions bloquantes des fonctions rouges, par fonction (n), Kasaï-Oriental]]
#set par(justify: false, leading: 0.62em)
#set text(size: 6.6pt)
#table(
  columns: (0.1905fr, 0.0673fr, 0.0672fr, 0.0670fr, 0.0666fr, 0.0670fr, 0.0670fr, 0.0673fr, 0.0670fr, 0.0670fr, 0.0717fr, 0.0673fr, 0.0668fr),
  inset: (x: 4.4pt, y: 2.3pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Fonction]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Rouges]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Intrants]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Équip.]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[RH]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Référ.]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Organ.]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Comm.]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Électr.]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Intégr.]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Données]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Surveil.]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Accueil]]]),
    [#block(breakable: false)[Grossesse à risque]], [#block(breakable: false)[4]], [#block(breakable: false)[4]], [#block(breakable: false)[0]], [#block(breakable: false)[1]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[MA compliquée]], [#block(breakable: false)[4]], [#block(breakable: false)[3]], [#block(breakable: false)[0]], [#block(breakable: false)[1]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[MAPI]], [#block(breakable: false)[2]], [#block(breakable: false)[2]], [#block(breakable: false)[2]], [#block(breakable: false)[0]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Réanimation néonat.]], [#block(breakable: false)[7]], [#block(breakable: false)[0]], [#block(breakable: false)[7]], [#block(breakable: false)[1]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Pré-éclampsie]], [#block(breakable: false)[6]], [#block(breakable: false)[5]], [#block(breakable: false)[0]], [#block(breakable: false)[1]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Paludisme grave]], [#block(breakable: false)[4]], [#block(breakable: false)[2]], [#block(breakable: false)[1]], [#block(breakable: false)[1]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Chaîne du froid]], [#block(breakable: false)[2]], [#block(breakable: false)[0]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Césarienne d'urgence]], [#block(breakable: false)[4]], [#block(breakable: false)[3]], [#block(breakable: false)[0]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Transfusion]], [#block(breakable: false)[3]], [#block(breakable: false)[0]], [#block(breakable: false)[3]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Référence urgente]], [#block(breakable: false)[2]], [#block(breakable: false)[0]], [#block(breakable: false)[2]], [#block(breakable: false)[0]], [#block(breakable: false)[2]], [#block(breakable: false)[2]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Réception urgences]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[1]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Accouchement assisté]], [#block(breakable: false)[3]], [#block(breakable: false)[0]], [#block(breakable: false)[3]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Hémorragie post-partum]], [#block(breakable: false)[5]], [#block(breakable: false)[3]], [#block(breakable: false)[0]], [#block(breakable: false)[1]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Sepsis obstétrical]], [#block(breakable: false)[3]], [#block(breakable: false)[2]], [#block(breakable: false)[0]], [#block(breakable: false)[1]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Surveillance épidémio.]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[MA non compliquée]], [#block(breakable: false)[4]], [#block(breakable: false)[3]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Accouchement normal]], [#block(breakable: false)[6]], [#block(breakable: false)[6]], [#block(breakable: false)[1]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[CPoN mère]], [#block(breakable: false)[3]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[1]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[CPN de routine]], [#block(breakable: false)[2]], [#block(breakable: false)[2]], [#block(breakable: false)[0]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Vaccination de routine]], [#block(breakable: false)[2]], [#block(breakable: false)[1]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Soins du nouveau-né]], [#block(breakable: false)[6]], [#block(breakable: false)[0]], [#block(breakable: false)[6]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[CPN \+ PTME]], [#block(breakable: false)[1]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[CPoN nouveau-né]], [#block(breakable: false)[2]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[1]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Dépistage nutrition]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Paludisme simple]], [#block(breakable: false)[4]], [#block(breakable: false)[3]], [#block(breakable: false)[0]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Diagnostic paludisme]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Données sanitaires]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Intégration services]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
)
#pagebreak()
#set page(flipped: false)

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 9.6pt, weight: "bold", fill: rgb("#131d44"))[Tableau A24 : Dimensions bloquantes et fragilités, Kasaï-Oriental]]
#set par(justify: false, leading: 0.62em)
#set text(size: 9.0pt)
#table(
  columns: (0.3400fr, 0.2200fr, 0.2202fr, 0.2198fr),
  inset: (x: 4.4pt, y: 3.2pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Dimension]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Bloque : n (% des rouges)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Premier blocage : n (%)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Fragilise : n (% des jaunes)]]]),
    [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[41 (50,0 %)]], [#block(breakable: false)[36 (43,9 %)]], [#block(breakable: false)[34 (39,1 %)]],
    [#block(breakable: false)[Équipements]], [#block(breakable: false)[27 (32,9 %)]], [#block(breakable: false)[16 (19,5 %)]], [#block(breakable: false)[13 (14,9 %)]],
    [#block(breakable: false)[Ressources humaines]], [#block(breakable: false)[19 (23,2 %)]], [#block(breakable: false)[19 (23,2 %)]], [#block(breakable: false)[20 (23,0 %)]],
    [#block(breakable: false)[Référence]], [#block(breakable: false)[14 (17,1 %)]], [#block(breakable: false)[6 (7,3 %)]], [#block(breakable: false)[26 (29,9 %)]],
    [#block(breakable: false)[Organisation du service]], [#block(breakable: false)[3 (3,7 %)]], [#block(breakable: false)[3 (3,7 %)]], [#block(breakable: false)[38 (43,7 %)]],
    [#block(breakable: false)[Électricité]], [#block(breakable: false)[2 (2,4 %)]], [#block(breakable: false)[2 (2,4 %)]], [#block(breakable: false)[14 (16,1 %)]],
    [#block(breakable: false)[Capacité d'accueil]], [#block(breakable: false)[0 (0,0 %)]], [#block(breakable: false)[0 (0,0 %)]], [#block(breakable: false)[26 (29,9 %)]],
    [#block(breakable: false)[Eau, hygiène et assainissement]], [#block(breakable: false)[0 (0,0 %)]], [#block(breakable: false)[0 (0,0 %)]], [#block(breakable: false)[25 (28,7 %)]],
    [#block(breakable: false)[Communication]], [#block(breakable: false)[0 (0,0 %)]], [#block(breakable: false)[0 (0,0 %)]], [#block(breakable: false)[8 (9,2 %)]],
    [#block(breakable: false)[Données sanitaires]], [#block(breakable: false)[0 (0,0 %)]], [#block(breakable: false)[0 (0,0 %)]], [#block(breakable: false)[8 (9,2 %)]],
    [#block(breakable: false)[Surveillance épidémiologique]], [#block(breakable: false)[0 (0,0 %)]], [#block(breakable: false)[0 (0,0 %)]], [#block(breakable: false)[7 (8,0 %)]],
)
#v(4pt)

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 9.6pt, weight: "bold", fill: rgb("#131d44"))[Tableau A25 : Conditions transversales et profil d'urgence, Kasaï-Oriental]]
#set par(justify: false, leading: 0.62em)
#set text(size: 9.0pt)
#table(
  columns: (0.3399fr, 0.2000fr, 0.2003fr, 0.2598fr),
  inset: (x: 4.4pt, y: 3.2pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Condition transversale]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Vert : n (%)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Jaune : n (%)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Rouge : n (%)]]]),
    [#block(breakable: false)[Eau, hygiène et assainissement]], [#block(breakable: false)[4 (50,0 %)]], [#block(breakable: false)[2 (25,0 %)]], [#block(breakable: false)[2 (25,0 %)]],
    [#block(breakable: false)[Électricité]], [#block(breakable: false)[6 (75,0 %)]], [#block(breakable: false)[1 (12,5 %)]], [#block(breakable: false)[1 (12,5 %)]],
    [#block(breakable: false)[Communication]], [#block(breakable: false)[6 (75,0 %)]], [#block(breakable: false)[2 (25,0 %)]], [#block(breakable: false)[0 (0,0 %)]],
    [#block(breakable: false)[Circuit de référence]], [#block(breakable: false)[5 (62,5 %)]], [#block(breakable: false)[1 (12,5 %)]], [#block(breakable: false)[2 (25,0 %)]],
    [#block(breakable: false)[Données sanitaires (SNIS)]], [#block(breakable: false)[6 (75,0 %)]], [#block(breakable: false)[2 (25,0 %)]], [#block(breakable: false)[0 (0,0 %)]],
    [#block(breakable: false)[Surveillance épidémiologique]], [#block(breakable: false)[5 (62,5 %)]], [#block(breakable: false)[3 (37,5 %)]], [#block(breakable: false)[0 (0,0 %)]],
    [#block(breakable: false)[Intégration des services]], [#block(breakable: false)[8 (100,0 %)]], [#block(breakable: false)[0 (0,0 %)]], [#block(breakable: false)[0 (0,0 %)]],
    [#block(breakable: false)[Fonctions d'urgence (K = 82)]], [#block(breakable: false)[2,4 %]], [#block(breakable: false)[39,0 %]], [#block(breakable: false)[58,5 % ; menace immédiate : 5 établissements (62,5 %)]],
)
#v(4pt)

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 9.6pt, weight: "bold", fill: rgb("#131d44"))[Tableau A26 : Leviers simples et paire optimale, Kasaï-Oriental]]
#set par(justify: false, leading: 0.62em)
#set text(size: 9.0pt)
#table(
  columns: (0.4400fr, 0.1399fr, 0.1401fr, 0.2800fr),
  inset: (x: 4.4pt, y: 3.2pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Levier (base : 82 fonctions rouges)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Rouge → Vert]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Rouge → Jaune]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Gain : n (% des rouges)]]]),
    [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[9]], [#block(breakable: false)[20]], [#block(breakable: false)[29 (35,4 %)]],
    [#block(breakable: false)[Équipements]], [#block(breakable: false)[3]], [#block(breakable: false)[12]], [#block(breakable: false)[15 (18,3 %)]],
    [#block(breakable: false)[Ressources humaines]], [#block(breakable: false)[0]], [#block(breakable: false)[9]], [#block(breakable: false)[9 (11,0 %)]],
    [#block(breakable: false)[Référence]], [#block(breakable: false)[0]], [#block(breakable: false)[6]], [#block(breakable: false)[6 (7,3 %)]],
    [#block(breakable: false)[Électricité]], [#block(breakable: false)[0]], [#block(breakable: false)[2]], [#block(breakable: false)[2 (2,4 %)]],
    [#block(breakable: false)[Paire optimale : Intrants et produits \+ Équipements]], [#block(breakable: false)[\-]], [#block(breakable: false)[\-]], [#block(breakable: false)[47 (57,3 %)]],
)
#v(4pt)

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 8.0pt, weight: "bold", fill: rgb("#131d44"))[Tableau A27 : Lecture par zone de santé, Kasaï-Oriental]]
#set par(justify: false, leading: 0.62em)
#set text(size: 7.4pt)
#table(
  columns: (0.1997fr, 0.0607fr, 0.0700fr, 0.0799fr, 0.0800fr, 0.0800fr, 0.1899fr, 0.2398fr),
  inset: (x: 4.4pt, y: 3.2pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Zone de santé]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Établ.]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[K]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[% Vert]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[% Jaune]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[% Rouge]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Dimension dominante]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Premier levier (gain)]]]),
    [#block(breakable: false)[Cilundu Zone de Santé]], [#block(breakable: false)[4]], [#block(breakable: false)[95]], [#block(breakable: false)[10,5]], [#block(breakable: false)[45,3]], [#block(breakable: false)[44,2]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[Intrants et produits (17 (40,5 %))]],
    [#block(breakable: false)[Dibindi Zone de Santé]], [#block(breakable: false)[4]], [#block(breakable: false)[95]], [#block(breakable: false)[11,6]], [#block(breakable: false)[46,3]], [#block(breakable: false)[42,1]], [#block(breakable: false)[Ressources humaines]], [#block(breakable: false)[Intrants et produits (12 (30,0 %))]],
)
#v(4pt)

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 8.799999999999999pt, weight: "bold", fill: rgb("#131d44"))[Tableau A28 : Établissements où un seul levier libère le plus de fonctions rouges, Kasaï-Oriental]]
#set par(justify: false, leading: 0.62em)
#set text(size: 8.2pt)
#table(
  columns: (0.1599fr, 0.2200fr, 0.1600fr, 0.1202fr, 0.1799fr, 0.1599fr),
  inset: (x: 4.4pt, y: 3.2pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Établissement (code)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Zone]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Niveau]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Fonctions rouges]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Levier unique]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Fonctions libérées : n (%)]]]),
    [#block(breakable: false)[KO-CSR-05]], [#block(breakable: false)[Cilundu Zone de Santé]], [#block(breakable: false)[Niveau 1+ (CSR)]], [#block(breakable: false)[14]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[9 (64,3 %)]],
    [#block(breakable: false)[KO-CSR-06]], [#block(breakable: false)[Dibindi Zone de Santé]], [#block(breakable: false)[Niveau 1+ (CSR)]], [#block(breakable: false)[19]], [#block(breakable: false)[Ressources humaines]], [#block(breakable: false)[9 (47,4 %)]],
    [#block(breakable: false)[KO-HGR-08]], [#block(breakable: false)[Dibindi Zone de Santé]], [#block(breakable: false)[Niveau 2 (HGR)]], [#block(breakable: false)[7]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[7 (100,0 %)]],
    [#block(breakable: false)[KO-CS-03]], [#block(breakable: false)[Cilundu Zone de Santé]], [#block(breakable: false)[Niveau 1 (CS)]], [#block(breakable: false)[14]], [#block(breakable: false)[Référence]], [#block(breakable: false)[6 (42,9 %)]],
    [#block(breakable: false)[KO-HGR-07]], [#block(breakable: false)[Cilundu Zone de Santé]], [#block(breakable: false)[Niveau 2 (HGR)]], [#block(breakable: false)[9]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[4 (44,4 %)]],
    [#block(breakable: false)[KO-CS-02]], [#block(breakable: false)[Dibindi Zone de Santé]], [#block(breakable: false)[Niveau 1 (CS)]], [#block(breakable: false)[11]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[4 (36,4 %)]],
)
#v(4pt)

#heading(level: 2)[Annexe 5 : Lomami]


#block(width: 100%, above: 9pt, below: 9pt, breakable: false,
  block(width: 100%, fill: rgb("#fffbf7"), radius: 12pt, stroke: 1.1pt + black, inset: (x: 12pt, y: 10pt))[
    #grid(columns: (1fr, 1fr, 1fr, 1fr, 1fr), column-gutter: 9pt,
    [#text(font: display, size: 19pt, fill: rgb("#131d44"))[16]\
     #text(size: 7.3pt, fill: rgb("#5166b7"))[établissements · 4 zones]],
    [#text(font: display, size: 19pt, fill: rgb("#131d44"))[370]\
     #text(size: 7.3pt, fill: rgb("#5166b7"))[évaluations calculables]],
    [#text(font: display, size: 19pt, fill: rgb("#131d44"))[75,4 %]\
     #text(size: 7.3pt, fill: rgb("#5166b7"))[rouge]],
    [#text(font: display, size: 19pt, fill: rgb("#131d44"))[24,6 %]\
     #text(size: 7.3pt, fill: rgb("#5166b7"))[jaune]],
    [#text(font: display, size: 19pt, fill: rgb("#131d44"))[0,0 %]\
     #text(size: 7.3pt, fill: rgb("#5166b7"))[vert]],
    )])


#block(width: 100%, above: 11pt, below: 9pt, breakable: false,
  block(width: 100%, fill: rgb("#fffbf7"), radius: 12pt, stroke: 1.4pt + black, inset: (x: 13pt, y: 11pt))[
    #text(font: "DejaVu Sans", size: 14pt, fill: rgb("#131d44"))[★]
    #v(-4pt)
    #text(size: 7.2pt, tracking: 2.4pt, fill: rgb("#5166b7"))[#upper[LECTURE CHIFFRÉE]]
    #v(1pt)
    #block(above: 3pt, below: 9pt)[#text(size: 11.2pt, weight: "bold", fill: rgb("#131d44"))[Ce que disent les chiffres : Lomami]]
    #text(size: 9.2pt, fill: rgb("#0f1015"))[Position. 75,4 % de fonctions rouges sur 378 évaluations calculables (16 établissements, 4 zones), soit 7,0 points au- dessus de la part d'ensemble (68,4 %). Fonctions vitales rouges dans 156 cas sur 189 (82,5 %). Les plus contraintes : Référence urgente (100,0 %), Grossesse à risque (100,0 %), MAPI (100,0 %) ; les moins contraintes : Diagnostic paludisme (25,0 %), Surveillance épidémio (37,5 %). Blocages. D'abord intrants et produits (56,1 % des rouges), puis équipements (43,5 %) et référence (42,1 %). 37,9 % des rouges tiennent à un seul blocage, 28,8 % à trois ou plus. Conditions et urgences. Conditions rouges les plus fréquentes : circuit de référence (87,5 %), électricité (56,2 %), eau, hygiène et assainissement (56,2 %). 87,6 % des fonctions d'urgence sont rouges ; 15 établissements sur 16 (93,8 %) ont au moins une fonction d'urgence rouge pour absence d'un élément critique d'urgence. Leviers. Premier levier : intrants et produits, 44 fonctions libérées (15,4 %) ; puis équipements (20). Paire optimale : intrants et produits \+ équipements, 88 (30,9 %). Zone où la part de rouge est la plus élevée : Mweneditu Zone de Santé (80,6 %) ; la plus basse : Ngandajika Zone de Santé (68,4 %) ; quatre établissements par zone, repères seulement.]
  ])

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 8.0pt, weight: "bold", fill: rgb("#131d44"))[Tableau A29 : Classification des 28 fonctions traceuses, Lomami]]
#set par(justify: false, leading: 0.62em)
#set text(size: 7.4pt)
#table(
  columns: (0.2335fr, 0.1215fr, 0.0586fr, 0.0779fr, 0.0787fr, 0.0791fr, 0.2532fr, 0.0975fr),
  inset: (x: 4.4pt, y: 2.3pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Fonction]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Criticité]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[K]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[% Vert]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[% Jaune]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[% Rouge]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Premier blocage dominant]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Part des rouges]]]),
    [#block(breakable: false)[Grossesse à risque]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[12]], [#block(breakable: false)[0,0]], [#block(breakable: false)[0,0]], [#block(breakable: false)[100,0]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[100,0]],
    [#block(breakable: false)[MA compliquée]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[16]], [#block(breakable: false)[0,0]], [#block(breakable: false)[6,2]], [#block(breakable: false)[93,8]], [#block(breakable: false)[Référence]], [#block(breakable: false)[53,3]],
    [#block(breakable: false)[MAPI]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[12]], [#block(breakable: false)[0,0]], [#block(breakable: false)[0,0]], [#block(breakable: false)[100,0]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[100,0]],
    [#block(breakable: false)[Réanimation néonat.]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[16]], [#block(breakable: false)[0,0]], [#block(breakable: false)[6,2]], [#block(breakable: false)[93,8]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[93,3]],
    [#block(breakable: false)[Pré-éclampsie]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[16]], [#block(breakable: false)[0,0]], [#block(breakable: false)[6,2]], [#block(breakable: false)[93,8]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[100,0]],
    [#block(breakable: false)[Paludisme grave]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[16]], [#block(breakable: false)[0,0]], [#block(breakable: false)[12,5]], [#block(breakable: false)[87,5]], [#block(breakable: false)[Référence]], [#block(breakable: false)[78,6]],
    [#block(breakable: false)[Chaîne du froid]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[12]], [#block(breakable: false)[0,0]], [#block(breakable: false)[25,0]], [#block(breakable: false)[75,0]], [#block(breakable: false)[Électricité]], [#block(breakable: false)[88,9]],
    [#block(breakable: false)[Césarienne d'urgence]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[7]], [#block(breakable: false)[0,0]], [#block(breakable: false)[14,3]], [#block(breakable: false)[85,7]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[66,7]],
    [#block(breakable: false)[Transfusion]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[7]], [#block(breakable: false)[0,0]], [#block(breakable: false)[28,6]], [#block(breakable: false)[71,4]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[100,0]],
    [#block(breakable: false)[Référence urgente]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[16]], [#block(breakable: false)[0,0]], [#block(breakable: false)[0,0]], [#block(breakable: false)[100,0]], [#block(breakable: false)[Organisation du service]], [#block(breakable: false)[87,5]],
    [#block(breakable: false)[Réception urgences]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[4]], [#block(breakable: false)[0,0]], [#block(breakable: false)[0,0]], [#block(breakable: false)[100,0]], [#block(breakable: false)[Organisation du service]], [#block(breakable: false)[75,0]],
    [#block(breakable: false)[Accouchement assisté]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[7]], [#block(breakable: false)[0,0]], [#block(breakable: false)[42,9]], [#block(breakable: false)[57,1]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[100,0]],
    [#block(breakable: false)[Hémorragie post-partum]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[16]], [#block(breakable: false)[0,0]], [#block(breakable: false)[37,5]], [#block(breakable: false)[62,5]], [#block(breakable: false)[Référence]], [#block(breakable: false)[80,0]],
    [#block(breakable: false)[Sepsis obstétrical]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[16]], [#block(breakable: false)[0,0]], [#block(breakable: false)[18,8]], [#block(breakable: false)[81,2]], [#block(breakable: false)[Référence]], [#block(breakable: false)[61,5]],
    [#block(breakable: false)[Surveillance épidémio]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[16]], [#block(breakable: false)[0,0]], [#block(breakable: false)[62,5]], [#block(breakable: false)[37,5]], [#block(breakable: false)[Communication]], [#block(breakable: false)[83,3]],
    [#block(breakable: false)[MA non compliquée]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[9]], [#block(breakable: false)[0,0]], [#block(breakable: false)[0,0]], [#block(breakable: false)[100,0]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[100,0]],
    [#block(breakable: false)[Accouchement normal]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[16]], [#block(breakable: false)[0,0]], [#block(breakable: false)[12,5]], [#block(breakable: false)[87,5]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[85,7]],
    [#block(breakable: false)[CPoN mère]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[16]], [#block(breakable: false)[0,0]], [#block(breakable: false)[6,2]], [#block(breakable: false)[93,8]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[93,3]],
    [#block(breakable: false)[CPN de routine]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[12]], [#block(breakable: false)[0,0]], [#block(breakable: false)[0,0]], [#block(breakable: false)[100,0]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[100,0]],
    [#block(breakable: false)[Vaccination de routine]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[12]], [#block(breakable: false)[0,0]], [#block(breakable: false)[16,7]], [#block(breakable: false)[83,3]], [#block(breakable: false)[Électricité]], [#block(breakable: false)[80,0]],
    [#block(breakable: false)[Soins du nouveau-né]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[16]], [#block(breakable: false)[0,0]], [#block(breakable: false)[6,2]], [#block(breakable: false)[93,8]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[93,3]],
    [#block(breakable: false)[CPN \+ PTME]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[12]], [#block(breakable: false)[0,0]], [#block(breakable: false)[25,0]], [#block(breakable: false)[75,0]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[88,9]],
    [#block(breakable: false)[CPoN nouveau-né]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[16]], [#block(breakable: false)[0,0]], [#block(breakable: false)[18,8]], [#block(breakable: false)[81,2]], [#block(breakable: false)[Référence]], [#block(breakable: false)[84,6]],
    [#block(breakable: false)[Dépistage nutrition]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[16]], [#block(breakable: false)[0,0]], [#block(breakable: false)[50,0]], [#block(breakable: false)[50,0]], [#block(breakable: false)[Ressources humaines]], [#block(breakable: false)[87,5]],
    [#block(breakable: false)[Paludisme simple]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[16]], [#block(breakable: false)[0,0]], [#block(breakable: false)[56,2]], [#block(breakable: false)[43,8]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[85,7]],
    [#block(breakable: false)[Diagnostic paludisme]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[16]], [#block(breakable: false)[0,0]], [#block(breakable: false)[75,0]], [#block(breakable: false)[25,0]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[75,0]],
    [#block(breakable: false)[Données sanitaires]], [#block(breakable: false)[Systémique]], [#block(breakable: false)[16]], [#block(breakable: false)[0,0]], [#block(breakable: false)[56,2]], [#block(breakable: false)[43,8]], [#block(breakable: false)[Organisation du service]], [#block(breakable: false)[100,0]],
    [#block(breakable: false)[Intégration services]], [#block(breakable: false)[Systémique]], [#block(breakable: false)[16]], [#block(breakable: false)[0,0]], [#block(breakable: false)[62,5]], [#block(breakable: false)[37,5]], [#block(breakable: false)[Intégration des services]], [#block(breakable: false)[100,0]],
)
#v(4pt)

#v(6pt)
#pagebreak(weak: true)
#set page(flipped: true)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 7.199999999999999pt, weight: "bold", fill: rgb("#131d44"))[Tableau A30 : Dimensions bloquantes des fonctions rouges, par fonction (n), Lomami]]
#set par(justify: false, leading: 0.62em)
#set text(size: 6.6pt)
#table(
  columns: (0.1906fr, 0.0673fr, 0.0673fr, 0.0670fr, 0.0666fr, 0.0670fr, 0.0670fr, 0.0673fr, 0.0670fr, 0.0670fr, 0.0717fr, 0.0673fr, 0.0668fr),
  inset: (x: 4.4pt, y: 2.3pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Fonction]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Rouges]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Intrants]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Équip.]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[RH]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Référ.]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Organ.]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Comm.]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Électr.]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Intégr.]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Données]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Surveil.]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Accueil]]]),
    [#block(breakable: false)[Grossesse à risque]], [#block(breakable: false)[12]], [#block(breakable: false)[12]], [#block(breakable: false)[4]], [#block(breakable: false)[3]], [#block(breakable: false)[11]], [#block(breakable: false)[1]], [#block(breakable: false)[3]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[MA compliquée]], [#block(breakable: false)[15]], [#block(breakable: false)[6]], [#block(breakable: false)[1]], [#block(breakable: false)[7]], [#block(breakable: false)[8]], [#block(breakable: false)[6]], [#block(breakable: false)[2]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[MAPI]], [#block(breakable: false)[12]], [#block(breakable: false)[12]], [#block(breakable: false)[12]], [#block(breakable: false)[2]], [#block(breakable: false)[11]], [#block(breakable: false)[3]], [#block(breakable: false)[3]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[1]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Réanimation néonat.]], [#block(breakable: false)[15]], [#block(breakable: false)[0]], [#block(breakable: false)[14]], [#block(breakable: false)[0]], [#block(breakable: false)[8]], [#block(breakable: false)[0]], [#block(breakable: false)[2]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Pré-éclampsie]], [#block(breakable: false)[15]], [#block(breakable: false)[15]], [#block(breakable: false)[2]], [#block(breakable: false)[0]], [#block(breakable: false)[8]], [#block(breakable: false)[0]], [#block(breakable: false)[2]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Paludisme grave]], [#block(breakable: false)[14]], [#block(breakable: false)[10]], [#block(breakable: false)[10]], [#block(breakable: false)[1]], [#block(breakable: false)[11]], [#block(breakable: false)[0]], [#block(breakable: false)[3]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Chaîne du froid]], [#block(breakable: false)[9]], [#block(breakable: false)[0]], [#block(breakable: false)[4]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[3]], [#block(breakable: false)[0]], [#block(breakable: false)[8]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Césarienne d'urgence]], [#block(breakable: false)[6]], [#block(breakable: false)[4]], [#block(breakable: false)[2]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[3]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Transfusion]], [#block(breakable: false)[5]], [#block(breakable: false)[1]], [#block(breakable: false)[5]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[3]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Référence urgente]], [#block(breakable: false)[16]], [#block(breakable: false)[0]], [#block(breakable: false)[14]], [#block(breakable: false)[0]], [#block(breakable: false)[14]], [#block(breakable: false)[14]], [#block(breakable: false)[5]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Réception urgences]], [#block(breakable: false)[4]], [#block(breakable: false)[0]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[3]], [#block(breakable: false)[3]], [#block(breakable: false)[2]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Accouchement assisté]], [#block(breakable: false)[4]], [#block(breakable: false)[0]], [#block(breakable: false)[4]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Hémorragie post-partum]], [#block(breakable: false)[10]], [#block(breakable: false)[5]], [#block(breakable: false)[2]], [#block(breakable: false)[0]], [#block(breakable: false)[8]], [#block(breakable: false)[0]], [#block(breakable: false)[2]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Sepsis obstétrical]], [#block(breakable: false)[13]], [#block(breakable: false)[8]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[8]], [#block(breakable: false)[0]], [#block(breakable: false)[2]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Surveillance épidémio.]], [#block(breakable: false)[6]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[1]], [#block(breakable: false)[5]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[1]], [#block(breakable: false)[0]],
    [#block(breakable: false)[MA non compliquée]], [#block(breakable: false)[9]], [#block(breakable: false)[9]], [#block(breakable: false)[0]], [#block(breakable: false)[6]], [#block(breakable: false)[8]], [#block(breakable: false)[4]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Accouchement normal]], [#block(breakable: false)[14]], [#block(breakable: false)[12]], [#block(breakable: false)[8]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[CPoN mère]], [#block(breakable: false)[15]], [#block(breakable: false)[14]], [#block(breakable: false)[8]], [#block(breakable: false)[1]], [#block(breakable: false)[11]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[CPN de routine]], [#block(breakable: false)[12]], [#block(breakable: false)[12]], [#block(breakable: false)[5]], [#block(breakable: false)[3]], [#block(breakable: false)[0]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Vaccination de routine]], [#block(breakable: false)[10]], [#block(breakable: false)[7]], [#block(breakable: false)[6]], [#block(breakable: false)[2]], [#block(breakable: false)[0]], [#block(breakable: false)[3]], [#block(breakable: false)[0]], [#block(breakable: false)[8]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Soins du nouveau-né]], [#block(breakable: false)[15]], [#block(breakable: false)[13]], [#block(breakable: false)[14]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[CPN \+ PTME]], [#block(breakable: false)[9]], [#block(breakable: false)[8]], [#block(breakable: false)[0]], [#block(breakable: false)[3]], [#block(breakable: false)[0]], [#block(breakable: false)[4]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[5]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[CPoN nouveau-né]], [#block(breakable: false)[13]], [#block(breakable: false)[3]], [#block(breakable: false)[7]], [#block(breakable: false)[1]], [#block(breakable: false)[11]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Dépistage nutrition]], [#block(breakable: false)[8]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[7]], [#block(breakable: false)[0]], [#block(breakable: false)[6]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Paludisme simple]], [#block(breakable: false)[7]], [#block(breakable: false)[6]], [#block(breakable: false)[0]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Diagnostic paludisme]], [#block(breakable: false)[4]], [#block(breakable: false)[3]], [#block(breakable: false)[0]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Données sanitaires]], [#block(breakable: false)[7]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[7]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[7]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Intégration services]], [#block(breakable: false)[6]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[6]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
)
#pagebreak()
#set page(flipped: false)

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 9.6pt, weight: "bold", fill: rgb("#131d44"))[Tableau A31 : Dimensions bloquantes et fragilités, Lomami]]
#set par(justify: false, leading: 0.62em)
#set text(size: 9.0pt)
#table(
  columns: (0.3400fr, 0.2200fr, 0.2202fr, 0.2198fr),
  inset: (x: 4.4pt, y: 3.2pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Dimension]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Bloque : n (% des rouges)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Premier blocage : n (%)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Fragilise : n (% des jaunes)]]]),
    [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[160 (56,1 %)]], [#block(breakable: false)[134 (47,0 %)]], [#block(breakable: false)[33 (35,5 %)]],
    [#block(breakable: false)[Équipements]], [#block(breakable: false)[124 (43,5 %)]], [#block(breakable: false)[39 (13,7 %)]], [#block(breakable: false)[28 (30,1 %)]],
    [#block(breakable: false)[Référence]], [#block(breakable: false)[120 (42,1 %)]], [#block(breakable: false)[17 (6,0 %)]], [#block(breakable: false)[51 (54,8 %)]],
    [#block(breakable: false)[Organisation du service]], [#block(breakable: false)[58 (20,4 %)]], [#block(breakable: false)[58 (20,4 %)]], [#block(breakable: false)[21 (22,6 %)]],
    [#block(breakable: false)[Ressources humaines]], [#block(breakable: false)[38 (13,3 %)]], [#block(breakable: false)[14 (4,9 %)]], [#block(breakable: false)[31 (33,3 %)]],
    [#block(breakable: false)[Communication]], [#block(breakable: false)[31 (10,9 %)]], [#block(breakable: false)[11 (3,9 %)]], [#block(breakable: false)[10 (10,8 %)]],
    [#block(breakable: false)[Électricité]], [#block(breakable: false)[22 (7,7 %)]], [#block(breakable: false)[6 (2,1 %)]], [#block(breakable: false)[29 (31,2 %)]],
    [#block(breakable: false)[Intégration des services]], [#block(breakable: false)[11 (3,9 %)]], [#block(breakable: false)[6 (2,1 %)]], [#block(breakable: false)[1 (1,1 %)]],
    [#block(breakable: false)[Données sanitaires]], [#block(breakable: false)[7 (2,5 %)]], [#block(breakable: false)[0 (0,0 %)]], [#block(breakable: false)[33 (35,5 %)]],
    [#block(breakable: false)[Surveillance épidémiologique]], [#block(breakable: false)[2 (0,7 %)]], [#block(breakable: false)[0 (0,0 %)]], [#block(breakable: false)[3 (3,2 %)]],
    [#block(breakable: false)[Capacité d'accueil]], [#block(breakable: false)[0 (0,0 %)]], [#block(breakable: false)[0 (0,0 %)]], [#block(breakable: false)[22 (23,7 %)]],
    [#block(breakable: false)[Eau, hygiène et assainissement]], [#block(breakable: false)[0 (0,0 %)]], [#block(breakable: false)[0 (0,0 %)]], [#block(breakable: false)[48 (51,6 %)]],
)
#v(4pt)

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 9.6pt, weight: "bold", fill: rgb("#131d44"))[Tableau A32 : Conditions transversales et profil d'urgence, Lomami]]
#set par(justify: false, leading: 0.62em)
#set text(size: 9.0pt)
#table(
  columns: (0.3399fr, 0.2000fr, 0.2003fr, 0.2598fr),
  inset: (x: 4.4pt, y: 3.2pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Condition transversale]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Vert : n (%)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Jaune : n (%)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Rouge : n (%)]]]),
    [#block(breakable: false)[Eau, hygiène et assainissement]], [#block(breakable: false)[2 (12,5 %)]], [#block(breakable: false)[5 (31,2 %)]], [#block(breakable: false)[9 (56,2 %)]],
    [#block(breakable: false)[Électricité]], [#block(breakable: false)[5 (31,2 %)]], [#block(breakable: false)[2 (12,5 %)]], [#block(breakable: false)[9 (56,2 %)]],
    [#block(breakable: false)[Communication]], [#block(breakable: false)[9 (64,3 %)]], [#block(breakable: false)[2 (14,3 %)]], [#block(breakable: false)[3 (21,4 %)]],
    [#block(breakable: false)[Circuit de référence]], [#block(breakable: false)[1 (6,2 %)]], [#block(breakable: false)[1 (6,2 %)]], [#block(breakable: false)[14 (87,5 %)]],
    [#block(breakable: false)[Données sanitaires (SNIS)]], [#block(breakable: false)[1 (6,2 %)]], [#block(breakable: false)[8 (50,0 %)]], [#block(breakable: false)[7 (43,8 %)]],
    [#block(breakable: false)[Surveillance épidémiologique]], [#block(breakable: false)[12 (75,0 %)]], [#block(breakable: false)[3 (18,8 %)]], [#block(breakable: false)[1 (6,2 %)]],
    [#block(breakable: false)[Intégration des services]], [#block(breakable: false)[10 (62,5 %)]], [#block(breakable: false)[0 (0,0 %)]], [#block(breakable: false)[6 (37,5 %)]],
    [#block(breakable: false)[Fonctions d'urgence (K = 161)]], [#block(breakable: false)[0,0 %]], [#block(breakable: false)[12,4 %]], [#block(breakable: false)[87,6 % ; menace immédiate : 15 établissements (93,8 %)]],
)
#v(4pt)

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 9.6pt, weight: "bold", fill: rgb("#131d44"))[Tableau A33 : Leviers simples et paire optimale, Lomami]]
#set par(justify: false, leading: 0.62em)
#set text(size: 9.0pt)
#table(
  columns: (0.4400fr, 0.1399fr, 0.1401fr, 0.2800fr),
  inset: (x: 4.4pt, y: 3.2pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Levier (base : 285 fonctions rouges)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Rouge → Vert]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Rouge → Jaune]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Gain : n (% des rouges)]]]),
    [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[0]], [#block(breakable: false)[44]], [#block(breakable: false)[44 (15,4 %)]],
    [#block(breakable: false)[Équipements]], [#block(breakable: false)[0]], [#block(breakable: false)[20]], [#block(breakable: false)[20 (7,0 %)]],
    [#block(breakable: false)[Référence]], [#block(breakable: false)[0]], [#block(breakable: false)[17]], [#block(breakable: false)[17 (6,0 %)]],
    [#block(breakable: false)[Communication]], [#block(breakable: false)[0]], [#block(breakable: false)[9]], [#block(breakable: false)[9 (3,2 %)]],
    [#block(breakable: false)[Électricité]], [#block(breakable: false)[0]], [#block(breakable: false)[6]], [#block(breakable: false)[6 (2,1 %)]],
    [#block(breakable: false)[Intégration des services]], [#block(breakable: false)[0]], [#block(breakable: false)[6]], [#block(breakable: false)[6 (2,1 %)]],
    [#block(breakable: false)[Ressources humaines]], [#block(breakable: false)[0]], [#block(breakable: false)[4]], [#block(breakable: false)[4 (1,4 %)]],
    [#block(breakable: false)[Organisation du service]], [#block(breakable: false)[0]], [#block(breakable: false)[2]], [#block(breakable: false)[2 (0,7 %)]],
    [#block(breakable: false)[Paire optimale : Intrants et produits \+ Équipements]], [#block(breakable: false)[\-]], [#block(breakable: false)[\-]], [#block(breakable: false)[88 (30,9 %)]],
)
#v(4pt)

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 8.0pt, weight: "bold", fill: rgb("#131d44"))[Tableau A34 : Lecture par zone de santé, Lomami]]
#set par(justify: false, leading: 0.62em)
#set text(size: 7.4pt)
#table(
  columns: (0.1999fr, 0.0606fr, 0.0700fr, 0.0798fr, 0.0800fr, 0.0800fr, 0.1899fr, 0.2398fr),
  inset: (x: 4.4pt, y: 3.2pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Zone de santé]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Établ.]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[K]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[% Vert]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[% Jaune]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[% Rouge]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Dimension dominante]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Premier levier (gain)]]]),
    [#block(breakable: false)[Kamiji Zone de Santé]], [#block(breakable: false)[4]], [#block(breakable: false)[95]], [#block(breakable: false)[0,0]], [#block(breakable: false)[24,2]], [#block(breakable: false)[75,8]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[Intrants et produits (14 (19,4 %))]],
    [#block(breakable: false)[Mulumba Zone de Santé]], [#block(breakable: false)[4]], [#block(breakable: false)[95]], [#block(breakable: false)[0,0]], [#block(breakable: false)[23,2]], [#block(breakable: false)[76,8]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[Intrants et produits (13 (17,8 %))]],
    [#block(breakable: false)[Mweneditu Zone de Santé]], [#block(breakable: false)[4]], [#block(breakable: false)[93]], [#block(breakable: false)[0,0]], [#block(breakable: false)[19,4]], [#block(breakable: false)[80,6]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[Intrants et produits (11 (14,7 %))]],
    [#block(breakable: false)[Ngandajika Zone de Santé]], [#block(breakable: false)[4]], [#block(breakable: false)[95]], [#block(breakable: false)[0,0]], [#block(breakable: false)[31,6]], [#block(breakable: false)[68,4]], [#block(breakable: false)[Référence]], [#block(breakable: false)[Référence (7 (10,8 %))]],
)
#v(4pt)

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 8.799999999999999pt, weight: "bold", fill: rgb("#131d44"))[Tableau A35 : Établissements où un seul levier libère le plus de fonctions rouges, Lomami]]
#set par(justify: false, leading: 0.62em)
#set text(size: 8.2pt)
#table(
  columns: (0.1599fr, 0.2200fr, 0.1600fr, 0.1202fr, 0.1799fr, 0.1599fr),
  inset: (x: 4.4pt, y: 3.2pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Établissement (code)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Zone]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Niveau]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Fonctions rouges]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Levier unique]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Fonctions libérées : n (%)]]]),
    [#block(breakable: false)[LM-HGR-13]], [#block(breakable: false)[Mweneditu Zone de Santé]], [#block(breakable: false)[Niveau 2 (HGR)]], [#block(breakable: false)[15]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[7 (46,7 %)]],
    [#block(breakable: false)[LM-HGR-16]], [#block(breakable: false)[Mulumba Zone de Santé]], [#block(breakable: false)[Niveau 2 (HGR)]], [#block(breakable: false)[12]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[5 (41,7 %)]],
    [#block(breakable: false)[LM-HGR-14]], [#block(breakable: false)[Kamiji Zone de Santé]], [#block(breakable: false)[Niveau 2 (HGR)]], [#block(breakable: false)[16]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[5 (31,2 %)]],
    [#block(breakable: false)[LM-CS-05]], [#block(breakable: false)[Ngandajika Zone de Santé]], [#block(breakable: false)[Niveau 1 (CS)]], [#block(breakable: false)[17]], [#block(breakable: false)[Référence]], [#block(breakable: false)[5 (29,4 %)]],
    [#block(breakable: false)[LM-CSR-11]], [#block(breakable: false)[Mulumba Zone de Santé]], [#block(breakable: false)[Niveau 1+ (CSR)]], [#block(breakable: false)[21]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[5 (23,8 %)]],
    [#block(breakable: false)[LM-CS-07]], [#block(breakable: false)[Kamiji Zone de Santé]], [#block(breakable: false)[Niveau 1 (CS)]], [#block(breakable: false)[17]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[4 (23,5 %)]],
)
#v(4pt)

#heading(level: 2)[Annexe 6 : Lualaba]


#block(width: 100%, above: 9pt, below: 9pt, breakable: false,
  block(width: 100%, fill: rgb("#fffbf7"), radius: 12pt, stroke: 1.1pt + black, inset: (x: 12pt, y: 10pt))[
    #grid(columns: (1fr, 1fr, 1fr, 1fr, 1fr), column-gutter: 9pt,
    [#text(font: display, size: 19pt, fill: rgb("#131d44"))[24]\
     #text(size: 7.3pt, fill: rgb("#5166b7"))[établissements · 6 zones]],
    [#text(font: display, size: 19pt, fill: rgb("#131d44"))[570]\
     #text(size: 7.3pt, fill: rgb("#5166b7"))[évaluations calculables]],
    [#text(font: display, size: 19pt, fill: rgb("#131d44"))[55,9 %]\
     #text(size: 7.3pt, fill: rgb("#5166b7"))[rouge]],
    [#text(font: display, size: 19pt, fill: rgb("#131d44"))[42,0 %]\
     #text(size: 7.3pt, fill: rgb("#5166b7"))[jaune]],
    [#text(font: display, size: 19pt, fill: rgb("#131d44"))[2,1 %]\
     #text(size: 7.3pt, fill: rgb("#5166b7"))[vert]],
    )])


#block(width: 100%, above: 11pt, below: 9pt, breakable: false,
  block(width: 100%, fill: rgb("#fffbf7"), radius: 12pt, stroke: 1.4pt + black, inset: (x: 13pt, y: 11pt))[
    #text(font: "DejaVu Sans", size: 14pt, fill: rgb("#131d44"))[★]
    #v(-4pt)
    #text(size: 7.2pt, tracking: 2.4pt, fill: rgb("#5166b7"))[#upper[LECTURE CHIFFRÉE]]
    #v(1pt)
    #block(above: 3pt, below: 9pt)[#text(size: 11.2pt, weight: "bold", fill: rgb("#131d44"))[Ce que disent les chiffres : Lualaba]]
    #text(size: 9.2pt, fill: rgb("#0f1015"))[Position. 55,9 % de fonctions rouges sur 578 évaluations calculables (24 établissements, 6 zones), soit 12,5 points en dessous de la part d'ensemble (68,4 %). Fonctions vitales rouges dans 176 cas sur 289 (60,9 %). Les plus contraintes : MA non compliquée (92,3 %), MA compliquée (91,7 %), Accouchement normal (87,5 %) ; les moins contraintes : Diagnostic paludisme (0,0 %), Paludisme simple (8,3 %). Blocages. D'abord intrants et produits (46,1 % des rouges), puis équipements (40,6 %) et référence (39,6 %). 36,8 % des rouges tiennent à un seul blocage, 32,2 % à trois ou plus. Conditions et urgences. Conditions rouges les plus fréquentes : eau, hygiène et assainissement (50,0 %), circuit de référence (50,0 %), intégration des services (45,8 %). 64,9 % des fonctions d'urgence sont rouges ; 15 établissements sur 24 (62,5 %) ont au moins une fonction d'urgence rouge pour absence d'un élément critique d'urgence. Leviers. Premier levier : intrants et produits, 32 fonctions libérées (9,9 %) ; puis équipements (31). Paire optimale : intrants et produits \+ équipements, 84 (26,0 %). Zone où la part de rouge est la plus élevée : Kapanga Zone de Santé (85,3 %) ; la plus basse : Dilala Zone de Santé (18,3 %) ; quatre établissements par zone, repères seulement.]
  ])

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 8.0pt, weight: "bold", fill: rgb("#131d44"))[Tableau A36 : Classification des 28 fonctions traceuses, Lualaba]]
#set par(justify: false, leading: 0.62em)
#set text(size: 7.4pt)
#table(
  columns: (0.2335fr, 0.1215fr, 0.0586fr, 0.0784fr, 0.0787fr, 0.0788fr, 0.2531fr, 0.0975fr),
  inset: (x: 4.4pt, y: 2.3pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Fonction]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Criticité]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[K]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[% Vert]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[% Jaune]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[% Rouge]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Premier blocage dominant]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Part des rouges]]]),
    [#block(breakable: false)[Grossesse à risque]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[20]], [#block(breakable: false)[0,0]], [#block(breakable: false)[30,0]], [#block(breakable: false)[70,0]], [#block(breakable: false)[Référence]], [#block(breakable: false)[78,6]],
    [#block(breakable: false)[MA compliquée]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[24]], [#block(breakable: false)[0,0]], [#block(breakable: false)[8,3]], [#block(breakable: false)[91,7]], [#block(breakable: false)[Organisation du service]], [#block(breakable: false)[72,7]],
    [#block(breakable: false)[MAPI]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[20]], [#block(breakable: false)[0,0]], [#block(breakable: false)[25,0]], [#block(breakable: false)[75,0]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[86,7]],
    [#block(breakable: false)[Réanimation néonat.]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[24]], [#block(breakable: false)[0,0]], [#block(breakable: false)[25,0]], [#block(breakable: false)[75,0]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[88,9]],
    [#block(breakable: false)[Pré-éclampsie]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[24]], [#block(breakable: false)[0,0]], [#block(breakable: false)[33,3]], [#block(breakable: false)[66,7]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[81,2]],
    [#block(breakable: false)[Paludisme grave]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[24]], [#block(breakable: false)[0,0]], [#block(breakable: false)[33,3]], [#block(breakable: false)[66,7]], [#block(breakable: false)[Référence]], [#block(breakable: false)[68,8]],
    [#block(breakable: false)[Chaîne du froid]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[20]], [#block(breakable: false)[0,0]], [#block(breakable: false)[40,0]], [#block(breakable: false)[60,0]], [#block(breakable: false)[Électricité]], [#block(breakable: false)[66,7]],
    [#block(breakable: false)[Césarienne d'urgence]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[11]], [#block(breakable: false)[0,0]], [#block(breakable: false)[63,6]], [#block(breakable: false)[36,4]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[100,0]],
    [#block(breakable: false)[Transfusion]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[11]], [#block(breakable: false)[0,0]], [#block(breakable: false)[36,4]], [#block(breakable: false)[63,6]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[85,7]],
    [#block(breakable: false)[Référence urgente]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[24]], [#block(breakable: false)[0,0]], [#block(breakable: false)[45,8]], [#block(breakable: false)[54,2]], [#block(breakable: false)[Organisation du service]], [#block(breakable: false)[92,3]],
    [#block(breakable: false)[Réception urgences]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[4]], [#block(breakable: false)[0,0]], [#block(breakable: false)[75,0]], [#block(breakable: false)[25,0]], [#block(breakable: false)[Organisation du service]], [#block(breakable: false)[100,0]],
    [#block(breakable: false)[Accouchement assisté]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[11]], [#block(breakable: false)[0,0]], [#block(breakable: false)[36,4]], [#block(breakable: false)[63,6]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[85,7]],
    [#block(breakable: false)[Hémorragie post-partum]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[24]], [#block(breakable: false)[0,0]], [#block(breakable: false)[45,8]], [#block(breakable: false)[54,2]], [#block(breakable: false)[Référence]], [#block(breakable: false)[76,9]],
    [#block(breakable: false)[Sepsis obstétrical]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[24]], [#block(breakable: false)[0,0]], [#block(breakable: false)[45,8]], [#block(breakable: false)[54,2]], [#block(breakable: false)[Référence]], [#block(breakable: false)[76,9]],
    [#block(breakable: false)[Surveillance épidémio]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[24]], [#block(breakable: false)[16,7]], [#block(breakable: false)[62,5]], [#block(breakable: false)[20,8]], [#block(breakable: false)[Communication]], [#block(breakable: false)[80,0]],
    [#block(breakable: false)[MA non compliquée]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[13]], [#block(breakable: false)[0,0]], [#block(breakable: false)[7,7]], [#block(breakable: false)[92,3]], [#block(breakable: false)[Organisation du service]], [#block(breakable: false)[83,3]],
    [#block(breakable: false)[Accouchement normal]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[24]], [#block(breakable: false)[0,0]], [#block(breakable: false)[12,5]], [#block(breakable: false)[87,5]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[85,7]],
    [#block(breakable: false)[CPoN mère]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[24]], [#block(breakable: false)[0,0]], [#block(breakable: false)[45,8]], [#block(breakable: false)[54,2]], [#block(breakable: false)[Référence]], [#block(breakable: false)[84,6]],
    [#block(breakable: false)[CPN de routine]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[20]], [#block(breakable: false)[0,0]], [#block(breakable: false)[45,0]], [#block(breakable: false)[55,0]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[90,9]],
    [#block(breakable: false)[Vaccination de routine]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[20]], [#block(breakable: false)[0,0]], [#block(breakable: false)[35,0]], [#block(breakable: false)[65,0]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[61,5]],
    [#block(breakable: false)[Soins du nouveau-né]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[24]], [#block(breakable: false)[0,0]], [#block(breakable: false)[41,7]], [#block(breakable: false)[58,3]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[78,6]],
    [#block(breakable: false)[CPN \+ PTME]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[20]], [#block(breakable: false)[0,0]], [#block(breakable: false)[25,0]], [#block(breakable: false)[75,0]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[93,3]],
    [#block(breakable: false)[CPoN nouveau-né]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[24]], [#block(breakable: false)[0,0]], [#block(breakable: false)[54,2]], [#block(breakable: false)[45,8]], [#block(breakable: false)[Référence]], [#block(breakable: false)[100,0]],
    [#block(breakable: false)[Dépistage nutrition]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[24]], [#block(breakable: false)[0,0]], [#block(breakable: false)[29,2]], [#block(breakable: false)[70,8]], [#block(breakable: false)[Organisation du service]], [#block(breakable: false)[94,1]],
    [#block(breakable: false)[Paludisme simple]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[24]], [#block(breakable: false)[4,2]], [#block(breakable: false)[87,5]], [#block(breakable: false)[8,3]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[100,0]],
    [#block(breakable: false)[Diagnostic paludisme]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[24]], [#block(breakable: false)[4,2]], [#block(breakable: false)[95,8]], [#block(breakable: false)[0,0]], [#block(breakable: false)[\-]], [#block(breakable: false)[0,0]],
    [#block(breakable: false)[Données sanitaires]], [#block(breakable: false)[Systémique]], [#block(breakable: false)[24]], [#block(breakable: false)[16,7]], [#block(breakable: false)[54,2]], [#block(breakable: false)[29,2]], [#block(breakable: false)[Organisation du service]], [#block(breakable: false)[100,0]],
    [#block(breakable: false)[Intégration services]], [#block(breakable: false)[Systémique]], [#block(breakable: false)[24]], [#block(breakable: false)[8,3]], [#block(breakable: false)[45,8]], [#block(breakable: false)[45,8]], [#block(breakable: false)[Intégration des services]], [#block(breakable: false)[100,0]],
)
#v(4pt)

#v(6pt)
#pagebreak(weak: true)
#set page(flipped: true)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 7.199999999999999pt, weight: "bold", fill: rgb("#131d44"))[Tableau A37 : Dimensions bloquantes des fonctions rouges, par fonction (n), Lualaba]]
#set par(justify: false, leading: 0.62em)
#set text(size: 6.6pt)
#table(
  columns: (0.1905fr, 0.0673fr, 0.0672fr, 0.0670fr, 0.0666fr, 0.0670fr, 0.0670fr, 0.0673fr, 0.0670fr, 0.0670fr, 0.0717fr, 0.0673fr, 0.0668fr),
  inset: (x: 4.4pt, y: 2.3pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Fonction]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Rouges]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Intrants]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Équip.]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[RH]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Référ.]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Organ.]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Comm.]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Électr.]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Intégr.]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Données]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Surveil.]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Accueil]]]),
    [#block(breakable: false)[Grossesse à risque]], [#block(breakable: false)[14]], [#block(breakable: false)[10]], [#block(breakable: false)[5]], [#block(breakable: false)[2]], [#block(breakable: false)[11]], [#block(breakable: false)[0]], [#block(breakable: false)[4]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[MA compliquée]], [#block(breakable: false)[22]], [#block(breakable: false)[10]], [#block(breakable: false)[3]], [#block(breakable: false)[15]], [#block(breakable: false)[10]], [#block(breakable: false)[16]], [#block(breakable: false)[2]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[MAPI]], [#block(breakable: false)[15]], [#block(breakable: false)[13]], [#block(breakable: false)[13]], [#block(breakable: false)[1]], [#block(breakable: false)[11]], [#block(breakable: false)[2]], [#block(breakable: false)[4]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[1]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Réanimation néonat.]], [#block(breakable: false)[18]], [#block(breakable: false)[0]], [#block(breakable: false)[16]], [#block(breakable: false)[4]], [#block(breakable: false)[10]], [#block(breakable: false)[4]], [#block(breakable: false)[2]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Pré-éclampsie]], [#block(breakable: false)[16]], [#block(breakable: false)[13]], [#block(breakable: false)[1]], [#block(breakable: false)[4]], [#block(breakable: false)[10]], [#block(breakable: false)[4]], [#block(breakable: false)[2]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Paludisme grave]], [#block(breakable: false)[16]], [#block(breakable: false)[8]], [#block(breakable: false)[10]], [#block(breakable: false)[0]], [#block(breakable: false)[11]], [#block(breakable: false)[0]], [#block(breakable: false)[4]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Chaîne du froid]], [#block(breakable: false)[12]], [#block(breakable: false)[0]], [#block(breakable: false)[7]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[2]], [#block(breakable: false)[0]], [#block(breakable: false)[8]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Césarienne d'urgence]], [#block(breakable: false)[4]], [#block(breakable: false)[2]], [#block(breakable: false)[4]], [#block(breakable: false)[2]], [#block(breakable: false)[0]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Transfusion]], [#block(breakable: false)[7]], [#block(breakable: false)[0]], [#block(breakable: false)[6]], [#block(breakable: false)[2]], [#block(breakable: false)[0]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Référence urgente]], [#block(breakable: false)[13]], [#block(breakable: false)[0]], [#block(breakable: false)[12]], [#block(breakable: false)[0]], [#block(breakable: false)[12]], [#block(breakable: false)[12]], [#block(breakable: false)[4]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Réception urgences]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[1]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Accouchement assisté]], [#block(breakable: false)[7]], [#block(breakable: false)[0]], [#block(breakable: false)[6]], [#block(breakable: false)[2]], [#block(breakable: false)[0]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Hémorragie post-partum]], [#block(breakable: false)[13]], [#block(breakable: false)[2]], [#block(breakable: false)[1]], [#block(breakable: false)[4]], [#block(breakable: false)[10]], [#block(breakable: false)[4]], [#block(breakable: false)[2]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Sepsis obstétrical]], [#block(breakable: false)[13]], [#block(breakable: false)[7]], [#block(breakable: false)[0]], [#block(breakable: false)[4]], [#block(breakable: false)[10]], [#block(breakable: false)[4]], [#block(breakable: false)[2]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Surveillance épidémio.]], [#block(breakable: false)[5]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[2]], [#block(breakable: false)[4]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[2]], [#block(breakable: false)[0]],
    [#block(breakable: false)[MA non compliquée]], [#block(breakable: false)[12]], [#block(breakable: false)[10]], [#block(breakable: false)[2]], [#block(breakable: false)[9]], [#block(breakable: false)[10]], [#block(breakable: false)[10]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Accouchement normal]], [#block(breakable: false)[21]], [#block(breakable: false)[18]], [#block(breakable: false)[10]], [#block(breakable: false)[4]], [#block(breakable: false)[0]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[CPoN mère]], [#block(breakable: false)[13]], [#block(breakable: false)[11]], [#block(breakable: false)[6]], [#block(breakable: false)[1]], [#block(breakable: false)[11]], [#block(breakable: false)[2]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[CPN de routine]], [#block(breakable: false)[11]], [#block(breakable: false)[10]], [#block(breakable: false)[8]], [#block(breakable: false)[2]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Vaccination de routine]], [#block(breakable: false)[13]], [#block(breakable: false)[8]], [#block(breakable: false)[5]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[2]], [#block(breakable: false)[0]], [#block(breakable: false)[8]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Soins du nouveau-né]], [#block(breakable: false)[14]], [#block(breakable: false)[8]], [#block(breakable: false)[11]], [#block(breakable: false)[4]], [#block(breakable: false)[0]], [#block(breakable: false)[4]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[CPN \+ PTME]], [#block(breakable: false)[15]], [#block(breakable: false)[14]], [#block(breakable: false)[0]], [#block(breakable: false)[2]], [#block(breakable: false)[0]], [#block(breakable: false)[9]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[10]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[CPoN nouveau-né]], [#block(breakable: false)[11]], [#block(breakable: false)[3]], [#block(breakable: false)[3]], [#block(breakable: false)[1]], [#block(breakable: false)[11]], [#block(breakable: false)[2]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Dépistage nutrition]], [#block(breakable: false)[17]], [#block(breakable: false)[0]], [#block(breakable: false)[2]], [#block(breakable: false)[15]], [#block(breakable: false)[0]], [#block(breakable: false)[16]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Paludisme simple]], [#block(breakable: false)[2]], [#block(breakable: false)[2]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Diagnostic paludisme]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Données sanitaires]], [#block(breakable: false)[7]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[7]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[7]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Intégration services]], [#block(breakable: false)[11]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[11]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
)
#pagebreak()
#set page(flipped: false)

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 9.6pt, weight: "bold", fill: rgb("#131d44"))[Tableau A38 : Dimensions bloquantes et fragilités, Lualaba]]
#set par(justify: false, leading: 0.62em)
#set text(size: 9.0pt)
#table(
  columns: (0.3400fr, 0.2200fr, 0.2202fr, 0.2198fr),
  inset: (x: 4.4pt, y: 3.2pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Dimension]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Bloque : n (% des rouges)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Premier blocage : n (%)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Fragilise : n (% des jaunes)]]]),
    [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[149 (46,1 %)]], [#block(breakable: false)[100 (31,0 %)]], [#block(breakable: false)[76 (31,3 %)]],
    [#block(breakable: false)[Équipements]], [#block(breakable: false)[131 (40,6 %)]], [#block(breakable: false)[43 (13,3 %)]], [#block(breakable: false)[40 (16,5 %)]],
    [#block(breakable: false)[Référence]], [#block(breakable: false)[128 (39,6 %)]], [#block(breakable: false)[22 (6,8 %)]], [#block(breakable: false)[123 (50,6 %)]],
    [#block(breakable: false)[Organisation du service]], [#block(breakable: false)[107 (33,1 %)]], [#block(breakable: false)[107 (33,1 %)]], [#block(breakable: false)[84 (34,6 %)]],
    [#block(breakable: false)[Ressources humaines]], [#block(breakable: false)[79 (24,5 %)]], [#block(breakable: false)[23 (7,1 %)]], [#block(breakable: false)[136 (56,0 %)]],
    [#block(breakable: false)[Communication]], [#block(breakable: false)[30 (9,3 %)]], [#block(breakable: false)[10 (3,1 %)]], [#block(breakable: false)[14 (5,8 %)]],
    [#block(breakable: false)[Intégration des services]], [#block(breakable: false)[21 (6,5 %)]], [#block(breakable: false)[12 (3,7 %)]], [#block(breakable: false)[14 (5,8 %)]],
    [#block(breakable: false)[Électricité]], [#block(breakable: false)[18 (5,6 %)]], [#block(breakable: false)[6 (1,9 %)]], [#block(breakable: false)[40 (16,5 %)]],
    [#block(breakable: false)[Données sanitaires]], [#block(breakable: false)[7 (2,2 %)]], [#block(breakable: false)[0 (0,0 %)]], [#block(breakable: false)[32 (13,2 %)]],
    [#block(breakable: false)[Surveillance épidémiologique]], [#block(breakable: false)[3 (0,9 %)]], [#block(breakable: false)[0 (0,0 %)]], [#block(breakable: false)[6 (2,5 %)]],
    [#block(breakable: false)[Capacité d'accueil]], [#block(breakable: false)[0 (0,0 %)]], [#block(breakable: false)[0 (0,0 %)]], [#block(breakable: false)[67 (27,6 %)]],
    [#block(breakable: false)[Eau, hygiène et assainissement]], [#block(breakable: false)[0 (0,0 %)]], [#block(breakable: false)[0 (0,0 %)]], [#block(breakable: false)[112 (46,1 %)]],
)
#v(4pt)

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 9.6pt, weight: "bold", fill: rgb("#131d44"))[Tableau A39 : Conditions transversales et profil d'urgence, Lualaba]]
#set par(justify: false, leading: 0.62em)
#set text(size: 9.0pt)
#table(
  columns: (0.3399fr, 0.2000fr, 0.2003fr, 0.2598fr),
  inset: (x: 4.4pt, y: 3.2pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Condition transversale]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Vert : n (%)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Jaune : n (%)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Rouge : n (%)]]]),
    [#block(breakable: false)[Eau, hygiène et assainissement]], [#block(breakable: false)[8 (33,3 %)]], [#block(breakable: false)[4 (16,7 %)]], [#block(breakable: false)[12 (50,0 %)]],
    [#block(breakable: false)[Électricité]], [#block(breakable: false)[13 (54,2 %)]], [#block(breakable: false)[3 (12,5 %)]], [#block(breakable: false)[8 (33,3 %)]],
    [#block(breakable: false)[Communication]], [#block(breakable: false)[18 (81,8 %)]], [#block(breakable: false)[2 (9,1 %)]], [#block(breakable: false)[2 (9,1 %)]],
    [#block(breakable: false)[Circuit de référence]], [#block(breakable: false)[5 (20,8 %)]], [#block(breakable: false)[7 (29,2 %)]], [#block(breakable: false)[12 (50,0 %)]],
    [#block(breakable: false)[Données sanitaires (SNIS)]], [#block(breakable: false)[10 (41,7 %)]], [#block(breakable: false)[7 (29,2 %)]], [#block(breakable: false)[7 (29,2 %)]],
    [#block(breakable: false)[Surveillance épidémiologique]], [#block(breakable: false)[18 (75,0 %)]], [#block(breakable: false)[4 (16,7 %)]], [#block(breakable: false)[2 (8,3 %)]],
    [#block(breakable: false)[Intégration des services]], [#block(breakable: false)[13 (54,2 %)]], [#block(breakable: false)[0 (0,0 %)]], [#block(breakable: false)[11 (45,8 %)]],
    [#block(breakable: false)[Fonctions d'urgence (K = 245)]], [#block(breakable: false)[0,0 %]], [#block(breakable: false)[35,1 %]], [#block(breakable: false)[64,9 % ; menace immédiate : 15 établissements (62,5 %)]],
)
#v(4pt)

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 9.6pt, weight: "bold", fill: rgb("#131d44"))[Tableau A40 : Leviers simples et paire optimale, Lualaba]]
#set par(justify: false, leading: 0.62em)
#set text(size: 9.0pt)
#table(
  columns: (0.4400fr, 0.1399fr, 0.1401fr, 0.2800fr),
  inset: (x: 4.4pt, y: 3.2pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Levier (base : 323 fonctions rouges)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Rouge → Vert]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Rouge → Jaune]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Gain : n (% des rouges)]]]),
    [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[2]], [#block(breakable: false)[30]], [#block(breakable: false)[32 (9,9 %)]],
    [#block(breakable: false)[Équipements]], [#block(breakable: false)[0]], [#block(breakable: false)[31]], [#block(breakable: false)[31 (9,6 %)]],
    [#block(breakable: false)[Référence]], [#block(breakable: false)[0]], [#block(breakable: false)[22]], [#block(breakable: false)[22 (6,8 %)]],
    [#block(breakable: false)[Intégration des services]], [#block(breakable: false)[0]], [#block(breakable: false)[12]], [#block(breakable: false)[12 (3,7 %)]],
    [#block(breakable: false)[Ressources humaines]], [#block(breakable: false)[0]], [#block(breakable: false)[7]], [#block(breakable: false)[7 (2,2 %)]],
    [#block(breakable: false)[Communication]], [#block(breakable: false)[0]], [#block(breakable: false)[7]], [#block(breakable: false)[7 (2,2 %)]],
    [#block(breakable: false)[Électricité]], [#block(breakable: false)[0]], [#block(breakable: false)[6]], [#block(breakable: false)[6 (1,9 %)]],
    [#block(breakable: false)[Organisation du service]], [#block(breakable: false)[0]], [#block(breakable: false)[2]], [#block(breakable: false)[2 (0,6 %)]],
    [#block(breakable: false)[Paire optimale : Intrants et produits \+ Équipements]], [#block(breakable: false)[\-]], [#block(breakable: false)[\-]], [#block(breakable: false)[84 (26,0 %)]],
)
#v(4pt)

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 8.0pt, weight: "bold", fill: rgb("#131d44"))[Tableau A41 : Lecture par zone de santé, Lualaba]]
#set par(justify: false, leading: 0.62em)
#set text(size: 7.4pt)
#table(
  columns: (0.1997fr, 0.0607fr, 0.0701fr, 0.0798fr, 0.0800fr, 0.0800fr, 0.1900fr, 0.2397fr),
  inset: (x: 4.4pt, y: 3.2pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Zone de santé]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Établ.]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[K]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[% Vert]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[% Jaune]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[% Rouge]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Dimension dominante]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Premier levier (gain)]]]),
    [#block(breakable: false)[Dilala Zone de Santé]], [#block(breakable: false)[4]], [#block(breakable: false)[104]], [#block(breakable: false)[3,8]], [#block(breakable: false)[77,9]], [#block(breakable: false)[18,3]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[Équipements (7 (36,8 %))]],
    [#block(breakable: false)[Dilolo Zone de Santé]], [#block(breakable: false)[4]], [#block(breakable: false)[95]], [#block(breakable: false)[0,0]], [#block(breakable: false)[36,8]], [#block(breakable: false)[63,2]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[Communication (6 (10,0 %))]],
    [#block(breakable: false)[Fungurume Zone de Santé]], [#block(breakable: false)[4]], [#block(breakable: false)[98]], [#block(breakable: false)[0,0]], [#block(breakable: false)[46,9]], [#block(breakable: false)[53,1]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[Intrants et produits (12 (23,1 %))]],
    [#block(breakable: false)[Kapanga Zone de Santé]], [#block(breakable: false)[4]], [#block(breakable: false)[95]], [#block(breakable: false)[1,1]], [#block(breakable: false)[13,7]], [#block(breakable: false)[85,3]], [#block(breakable: false)[Organisation du service]], [#block(breakable: false)[Ressources humaines (6 (7,4 %))]],
    [#block(breakable: false)[Manika Zone de Santé]], [#block(breakable: false)[4]], [#block(breakable: false)[93]], [#block(breakable: false)[5,4]], [#block(breakable: false)[43,0]], [#block(breakable: false)[51,6]], [#block(breakable: false)[Référence]], [#block(breakable: false)[Intrants et produits (6 (12,5 %))]],
    [#block(breakable: false)[Sandoa Zone de Santé]], [#block(breakable: false)[4]], [#block(breakable: false)[93]], [#block(breakable: false)[2,2]], [#block(breakable: false)[30,1]], [#block(breakable: false)[67,7]], [#block(breakable: false)[Référence]], [#block(breakable: false)[Référence (11 (17,5 %))]],
)
#v(4pt)

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 8.799999999999999pt, weight: "bold", fill: rgb("#131d44"))[Tableau A42 : Établissements où un seul levier libère le plus de fonctions rouges, Lualaba]]
#set par(justify: false, leading: 0.62em)
#set text(size: 8.2pt)
#table(
  columns: (0.1599fr, 0.2200fr, 0.1600fr, 0.1202fr, 0.1799fr, 0.1599fr),
  inset: (x: 4.4pt, y: 3.2pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Établissement (code)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Zone]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Niveau]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Fonctions rouges]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Levier unique]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Fonctions libérées : n (%)]]]),
    [#block(breakable: false)[LL-HGR-22]], [#block(breakable: false)[Kapanga Zone de Santé]], [#block(breakable: false)[Niveau 2 (HGR)]], [#block(breakable: false)[14]], [#block(breakable: false)[Ressources humaines]], [#block(breakable: false)[6 (42,9 %)]],
    [#block(breakable: false)[LL-CS-07]], [#block(breakable: false)[Fungurume Zone de Santé]], [#block(breakable: false)[Niveau 1 (CS)]], [#block(breakable: false)[11]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[5 (45,5 %)]],
    [#block(breakable: false)[LL-CSR-16]], [#block(breakable: false)[Dilala Zone de Santé]], [#block(breakable: false)[Niveau 1+ (CSR)]], [#block(breakable: false)[11]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[5 (45,5 %)]],
    [#block(breakable: false)[LL-CSR-19]], [#block(breakable: false)[Dilolo Zone de Santé]], [#block(breakable: false)[Niveau 1+ (CSR)]], [#block(breakable: false)[14]], [#block(breakable: false)[Communication]], [#block(breakable: false)[5 (35,7 %)]],
    [#block(breakable: false)[LL-CS-04]], [#block(breakable: false)[Sandoa Zone de Santé]], [#block(breakable: false)[Niveau 1 (CS)]], [#block(breakable: false)[19]], [#block(breakable: false)[Référence]], [#block(breakable: false)[5 (26,3 %)]],
    [#block(breakable: false)[LL-CS-13]], [#block(breakable: false)[Manika Zone de Santé]], [#block(breakable: false)[Niveau 1 (CS)]], [#block(breakable: false)[9]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[4 (44,4 %)]],
)
#v(4pt)

#heading(level: 2)[Annexe 7 : Sankuru]


#block(width: 100%, above: 9pt, below: 9pt, breakable: false,
  block(width: 100%, fill: rgb("#fffbf7"), radius: 12pt, stroke: 1.1pt + black, inset: (x: 12pt, y: 10pt))[
    #grid(columns: (1fr, 1fr, 1fr, 1fr, 1fr), column-gutter: 9pt,
    [#text(font: display, size: 19pt, fill: rgb("#131d44"))[16]\
     #text(size: 7.3pt, fill: rgb("#5166b7"))[établissements · 4 zones]],
    [#text(font: display, size: 19pt, fill: rgb("#131d44"))[371]\
     #text(size: 7.3pt, fill: rgb("#5166b7"))[évaluations calculables]],
    [#text(font: display, size: 19pt, fill: rgb("#131d44"))[86,6 %]\
     #text(size: 7.3pt, fill: rgb("#5166b7"))[rouge]],
    [#text(font: display, size: 19pt, fill: rgb("#131d44"))[13,4 %]\
     #text(size: 7.3pt, fill: rgb("#5166b7"))[jaune]],
    [#text(font: display, size: 19pt, fill: rgb("#131d44"))[0,0 %]\
     #text(size: 7.3pt, fill: rgb("#5166b7"))[vert]],
    )])


#block(width: 100%, above: 11pt, below: 9pt, breakable: false,
  block(width: 100%, fill: rgb("#fffbf7"), radius: 12pt, stroke: 1.4pt + black, inset: (x: 13pt, y: 11pt))[
    #text(font: "DejaVu Sans", size: 14pt, fill: rgb("#131d44"))[★]
    #v(-4pt)
    #text(size: 7.2pt, tracking: 2.4pt, fill: rgb("#5166b7"))[#upper[LECTURE CHIFFRÉE]]
    #v(1pt)
    #block(above: 3pt, below: 9pt)[#text(size: 11.2pt, weight: "bold", fill: rgb("#131d44"))[Ce que disent les chiffres : Sankuru]]
    #text(size: 9.2pt, fill: rgb("#0f1015"))[Position. 86,6 % de fonctions rouges sur 372 évaluations calculables (16 établissements, 4 zones), soit 18,2 points au- dessus de la part d'ensemble (68,4 %). Fonctions vitales rouges dans 170 cas sur 180 (94,4 %). Les plus contraintes : MA compliquée (100,0 %), Réanimation néonat. (100,0 %), Pré-éclampsie (100,0 %) ; les moins contraintes : Diagnostic paludisme (37,5 %), Données sanitaires (37,5 %). Blocages. D'abord équipements (71,7 % des rouges), puis intrants et produits (66,8 %) et référence (47,2 %). 16,8 % des rouges tiennent à un seul blocage, 51,6 % à trois ou plus : blocage plus profond que la moyenne. Conditions et urgences. Conditions rouges les plus fréquentes : eau, hygiène et assainissement (100,0 %), circuit de référence (100,0 %), électricité (81,2 %). 99,3 % des fonctions d'urgence sont rouges ; 16 établissements sur 16 (100,0 %) ont au moins une fonction d'urgence rouge pour absence d'un élément critique d'urgence. Leviers. Premier levier : intrants et produits, 26 fonctions libérées (8,1 %) ; puis équipements (17). Paire optimale : intrants et produits \+ équipements, 90 (28,0 %). Zone où la part de rouge est la plus élevée : Wembo Nyama Zone de Santé (95,7 %) ; la plus basse : Tshudi Loto Zone de Santé (80,6 %) ; quatre établissements par zone, repères seulement.]
  ])

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 8.0pt, weight: "bold", fill: rgb("#131d44"))[Tableau A43 : Classification des 28 fonctions traceuses, Sankuru]]
#set par(justify: false, leading: 0.62em)
#set text(size: 7.4pt)
#table(
  columns: (0.2335fr, 0.1215fr, 0.0586fr, 0.0779fr, 0.0787fr, 0.0792fr, 0.2531fr, 0.0975fr),
  inset: (x: 4.4pt, y: 2.3pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Fonction]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Criticité]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[K]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[% Vert]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[% Jaune]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[% Rouge]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Premier blocage dominant]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Part des rouges]]]),
    [#block(breakable: false)[Grossesse à risque]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[12]], [#block(breakable: false)[0,0]], [#block(breakable: false)[0,0]], [#block(breakable: false)[100,0]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[100,0]],
    [#block(breakable: false)[MA compliquée]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[16]], [#block(breakable: false)[0,0]], [#block(breakable: false)[0,0]], [#block(breakable: false)[100,0]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[87,5]],
    [#block(breakable: false)[MAPI]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[12]], [#block(breakable: false)[0,0]], [#block(breakable: false)[0,0]], [#block(breakable: false)[100,0]], [#block(breakable: false)[Référence]], [#block(breakable: false)[100,0]],
    [#block(breakable: false)[Réanimation néonat.]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[16]], [#block(breakable: false)[0,0]], [#block(breakable: false)[0,0]], [#block(breakable: false)[100,0]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[100,0]],
    [#block(breakable: false)[Pré-éclampsie]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[16]], [#block(breakable: false)[0,0]], [#block(breakable: false)[0,0]], [#block(breakable: false)[100,0]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[100,0]],
    [#block(breakable: false)[Paludisme grave]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[16]], [#block(breakable: false)[0,0]], [#block(breakable: false)[6,2]], [#block(breakable: false)[93,8]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[100,0]],
    [#block(breakable: false)[Chaîne du froid]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[12]], [#block(breakable: false)[0,0]], [#block(breakable: false)[0,0]], [#block(breakable: false)[100,0]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[100,0]],
    [#block(breakable: false)[Césarienne d'urgence]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[4]], [#block(breakable: false)[0,0]], [#block(breakable: false)[0,0]], [#block(breakable: false)[100,0]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[100,0]],
    [#block(breakable: false)[Transfusion]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[4]], [#block(breakable: false)[0,0]], [#block(breakable: false)[0,0]], [#block(breakable: false)[100,0]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[100,0]],
    [#block(breakable: false)[Référence urgente]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[16]], [#block(breakable: false)[0,0]], [#block(breakable: false)[0,0]], [#block(breakable: false)[100,0]], [#block(breakable: false)[Organisation du service]], [#block(breakable: false)[100,0]],
    [#block(breakable: false)[Réception urgences]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[4]], [#block(breakable: false)[0,0]], [#block(breakable: false)[0,0]], [#block(breakable: false)[100,0]], [#block(breakable: false)[Organisation du service]], [#block(breakable: false)[100,0]],
    [#block(breakable: false)[Accouchement assisté]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[4]], [#block(breakable: false)[0,0]], [#block(breakable: false)[0,0]], [#block(breakable: false)[100,0]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[100,0]],
    [#block(breakable: false)[Hémorragie post-partum]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[16]], [#block(breakable: false)[0,0]], [#block(breakable: false)[0,0]], [#block(breakable: false)[100,0]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[100,0]],
    [#block(breakable: false)[Sepsis obstétrical]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[16]], [#block(breakable: false)[0,0]], [#block(breakable: false)[0,0]], [#block(breakable: false)[100,0]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[100,0]],
    [#block(breakable: false)[Surveillance épidémio]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[16]], [#block(breakable: false)[0,0]], [#block(breakable: false)[56,2]], [#block(breakable: false)[43,8]], [#block(breakable: false)[Communication]], [#block(breakable: false)[85,7]],
    [#block(breakable: false)[MA non compliquée]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[12]], [#block(breakable: false)[0,0]], [#block(breakable: false)[0,0]], [#block(breakable: false)[100,0]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[100,0]],
    [#block(breakable: false)[Accouchement normal]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[16]], [#block(breakable: false)[0,0]], [#block(breakable: false)[0,0]], [#block(breakable: false)[100,0]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[100,0]],
    [#block(breakable: false)[CPoN mère]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[16]], [#block(breakable: false)[0,0]], [#block(breakable: false)[0,0]], [#block(breakable: false)[100,0]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[100,0]],
    [#block(breakable: false)[CPN de routine]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[12]], [#block(breakable: false)[0,0]], [#block(breakable: false)[0,0]], [#block(breakable: false)[100,0]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[100,0]],
    [#block(breakable: false)[Vaccination de routine]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[12]], [#block(breakable: false)[0,0]], [#block(breakable: false)[0,0]], [#block(breakable: false)[100,0]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[100,0]],
    [#block(breakable: false)[Soins du nouveau-né]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[16]], [#block(breakable: false)[0,0]], [#block(breakable: false)[0,0]], [#block(breakable: false)[100,0]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[100,0]],
    [#block(breakable: false)[CPN \+ PTME]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[12]], [#block(breakable: false)[0,0]], [#block(breakable: false)[8,3]], [#block(breakable: false)[91,7]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[100,0]],
    [#block(breakable: false)[CPoN nouveau-né]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[16]], [#block(breakable: false)[0,0]], [#block(breakable: false)[6,2]], [#block(breakable: false)[93,8]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[100,0]],
    [#block(breakable: false)[Dépistage nutrition]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[16]], [#block(breakable: false)[0,0]], [#block(breakable: false)[6,2]], [#block(breakable: false)[93,8]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[80,0]],
    [#block(breakable: false)[Paludisme simple]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[16]], [#block(breakable: false)[0,0]], [#block(breakable: false)[43,8]], [#block(breakable: false)[56,2]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[88,9]],
    [#block(breakable: false)[Diagnostic paludisme]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[16]], [#block(breakable: false)[0,0]], [#block(breakable: false)[62,5]], [#block(breakable: false)[37,5]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[100,0]],
    [#block(breakable: false)[Données sanitaires]], [#block(breakable: false)[Systémique]], [#block(breakable: false)[16]], [#block(breakable: false)[0,0]], [#block(breakable: false)[62,5]], [#block(breakable: false)[37,5]], [#block(breakable: false)[Organisation du service]], [#block(breakable: false)[100,0]],
    [#block(breakable: false)[Intégration services]], [#block(breakable: false)[Systémique]], [#block(breakable: false)[16]], [#block(breakable: false)[0,0]], [#block(breakable: false)[62,5]], [#block(breakable: false)[37,5]], [#block(breakable: false)[Intégration des services]], [#block(breakable: false)[100,0]],
)
#v(4pt)

#v(6pt)
#pagebreak(weak: true)
#set page(flipped: true)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 7.199999999999999pt, weight: "bold", fill: rgb("#131d44"))[Tableau A44 : Dimensions bloquantes des fonctions rouges, par fonction (n), Sankuru]]
#set par(justify: false, leading: 0.62em)
#set text(size: 6.6pt)
#table(
  columns: (0.1905fr, 0.0674fr, 0.0672fr, 0.0671fr, 0.0666fr, 0.0670fr, 0.0671fr, 0.0672fr, 0.0670fr, 0.0671fr, 0.0717fr, 0.0673fr, 0.0668fr),
  inset: (x: 4.4pt, y: 2.3pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Fonction]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Rouges]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Intrants]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Équip.]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[RH]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Référ.]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Organ.]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Comm.]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Électr.]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Intégr.]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Données]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Surveil.]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Accueil]]]),
    [#block(breakable: false)[Grossesse à risque]], [#block(breakable: false)[12]], [#block(breakable: false)[12]], [#block(breakable: false)[10]], [#block(breakable: false)[2]], [#block(breakable: false)[12]], [#block(breakable: false)[2]], [#block(breakable: false)[5]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[MA compliquée]], [#block(breakable: false)[16]], [#block(breakable: false)[4]], [#block(breakable: false)[14]], [#block(breakable: false)[6]], [#block(breakable: false)[12]], [#block(breakable: false)[9]], [#block(breakable: false)[5]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[MAPI]], [#block(breakable: false)[12]], [#block(breakable: false)[11]], [#block(breakable: false)[11]], [#block(breakable: false)[1]], [#block(breakable: false)[12]], [#block(breakable: false)[0]], [#block(breakable: false)[5]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[3]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Réanimation néonat.]], [#block(breakable: false)[16]], [#block(breakable: false)[0]], [#block(breakable: false)[16]], [#block(breakable: false)[1]], [#block(breakable: false)[12]], [#block(breakable: false)[5]], [#block(breakable: false)[5]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Pré-éclampsie]], [#block(breakable: false)[16]], [#block(breakable: false)[16]], [#block(breakable: false)[10]], [#block(breakable: false)[1]], [#block(breakable: false)[12]], [#block(breakable: false)[5]], [#block(breakable: false)[5]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Paludisme grave]], [#block(breakable: false)[15]], [#block(breakable: false)[8]], [#block(breakable: false)[15]], [#block(breakable: false)[2]], [#block(breakable: false)[12]], [#block(breakable: false)[2]], [#block(breakable: false)[5]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Chaîne du froid]], [#block(breakable: false)[12]], [#block(breakable: false)[0]], [#block(breakable: false)[12]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[11]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Césarienne d'urgence]], [#block(breakable: false)[4]], [#block(breakable: false)[4]], [#block(breakable: false)[2]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[2]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Transfusion]], [#block(breakable: false)[4]], [#block(breakable: false)[4]], [#block(breakable: false)[4]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[2]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Référence urgente]], [#block(breakable: false)[16]], [#block(breakable: false)[0]], [#block(breakable: false)[16]], [#block(breakable: false)[0]], [#block(breakable: false)[16]], [#block(breakable: false)[16]], [#block(breakable: false)[6]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Réception urgences]], [#block(breakable: false)[4]], [#block(breakable: false)[0]], [#block(breakable: false)[2]], [#block(breakable: false)[0]], [#block(breakable: false)[4]], [#block(breakable: false)[4]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Accouchement assisté]], [#block(breakable: false)[4]], [#block(breakable: false)[0]], [#block(breakable: false)[4]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Hémorragie post-partum]], [#block(breakable: false)[16]], [#block(breakable: false)[16]], [#block(breakable: false)[10]], [#block(breakable: false)[1]], [#block(breakable: false)[12]], [#block(breakable: false)[5]], [#block(breakable: false)[5]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Sepsis obstétrical]], [#block(breakable: false)[16]], [#block(breakable: false)[16]], [#block(breakable: false)[2]], [#block(breakable: false)[1]], [#block(breakable: false)[12]], [#block(breakable: false)[5]], [#block(breakable: false)[5]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Surveillance épidémio.]], [#block(breakable: false)[7]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[3]], [#block(breakable: false)[6]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[3]], [#block(breakable: false)[0]],
    [#block(breakable: false)[MA non compliquée]], [#block(breakable: false)[12]], [#block(breakable: false)[12]], [#block(breakable: false)[11]], [#block(breakable: false)[5]], [#block(breakable: false)[12]], [#block(breakable: false)[7]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Accouchement normal]], [#block(breakable: false)[16]], [#block(breakable: false)[16]], [#block(breakable: false)[16]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[2]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[CPoN mère]], [#block(breakable: false)[16]], [#block(breakable: false)[16]], [#block(breakable: false)[14]], [#block(breakable: false)[0]], [#block(breakable: false)[12]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[CPN de routine]], [#block(breakable: false)[12]], [#block(breakable: false)[12]], [#block(breakable: false)[12]], [#block(breakable: false)[2]], [#block(breakable: false)[0]], [#block(breakable: false)[2]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Vaccination de routine]], [#block(breakable: false)[12]], [#block(breakable: false)[12]], [#block(breakable: false)[6]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[11]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Soins du nouveau-né]], [#block(breakable: false)[16]], [#block(breakable: false)[16]], [#block(breakable: false)[16]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[5]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[CPN \+ PTME]], [#block(breakable: false)[11]], [#block(breakable: false)[11]], [#block(breakable: false)[0]], [#block(breakable: false)[2]], [#block(breakable: false)[0]], [#block(breakable: false)[6]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[3]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[CPoN nouveau-né]], [#block(breakable: false)[15]], [#block(breakable: false)[15]], [#block(breakable: false)[13]], [#block(breakable: false)[0]], [#block(breakable: false)[12]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Dépistage nutrition]], [#block(breakable: false)[15]], [#block(breakable: false)[0]], [#block(breakable: false)[12]], [#block(breakable: false)[6]], [#block(breakable: false)[0]], [#block(breakable: false)[9]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Paludisme simple]], [#block(breakable: false)[9]], [#block(breakable: false)[8]], [#block(breakable: false)[0]], [#block(breakable: false)[2]], [#block(breakable: false)[0]], [#block(breakable: false)[2]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Diagnostic paludisme]], [#block(breakable: false)[6]], [#block(breakable: false)[6]], [#block(breakable: false)[3]], [#block(breakable: false)[2]], [#block(breakable: false)[0]], [#block(breakable: false)[2]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Données sanitaires]], [#block(breakable: false)[6]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[6]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[6]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Intégration services]], [#block(breakable: false)[6]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[6]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
)
#pagebreak()
#set page(flipped: false)

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 9.6pt, weight: "bold", fill: rgb("#131d44"))[Tableau A45 : Dimensions bloquantes et fragilités, Sankuru]]
#set par(justify: false, leading: 0.62em)
#set text(size: 9.0pt)
#table(
  columns: (0.3400fr, 0.2200fr, 0.2202fr, 0.2198fr),
  inset: (x: 4.4pt, y: 3.2pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Dimension]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Bloque : n (% des rouges)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Premier blocage : n (%)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Fragilise : n (% des jaunes)]]]),
    [#block(breakable: false)[Équipements]], [#block(breakable: false)[231 (71,7 %)]], [#block(breakable: false)[44 (13,7 %)]], [#block(breakable: false)[19 (38,0 %)]],
    [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[215 (66,8 %)]], [#block(breakable: false)[157 (48,8 %)]], [#block(breakable: false)[6 (12,0 %)]],
    [#block(breakable: false)[Référence]], [#block(breakable: false)[152 (47,2 %)]], [#block(breakable: false)[0 (0,0 %)]], [#block(breakable: false)[31 (62,0 %)]],
    [#block(breakable: false)[Organisation du service]], [#block(breakable: false)[99 (30,7 %)]], [#block(breakable: false)[99 (30,7 %)]], [#block(breakable: false)[13 (26,0 %)]],
    [#block(breakable: false)[Communication]], [#block(breakable: false)[53 (16,5 %)]], [#block(breakable: false)[5 (1,6 %)]], [#block(breakable: false)[9 (18,0 %)]],
    [#block(breakable: false)[Ressources humaines]], [#block(breakable: false)[37 (11,5 %)]], [#block(breakable: false)[11 (3,4 %)]], [#block(breakable: false)[37 (74,0 %)]],
    [#block(breakable: false)[Électricité]], [#block(breakable: false)[26 (8,1 %)]], [#block(breakable: false)[0 (0,0 %)]], [#block(breakable: false)[26 (52,0 %)]],
    [#block(breakable: false)[Intégration des services]], [#block(breakable: false)[9 (2,8 %)]], [#block(breakable: false)[6 (1,9 %)]], [#block(breakable: false)[2 (4,0 %)]],
    [#block(breakable: false)[Données sanitaires]], [#block(breakable: false)[6 (1,9 %)]], [#block(breakable: false)[0 (0,0 %)]], [#block(breakable: false)[30 (60,0 %)]],
    [#block(breakable: false)[Surveillance épidémiologique]], [#block(breakable: false)[6 (1,9 %)]], [#block(breakable: false)[0 (0,0 %)]], [#block(breakable: false)[1 (2,0 %)]],
    [#block(breakable: false)[Capacité d'accueil]], [#block(breakable: false)[0 (0,0 %)]], [#block(breakable: false)[0 (0,0 %)]], [#block(breakable: false)[1 (2,0 %)]],
    [#block(breakable: false)[Eau, hygiène et assainissement]], [#block(breakable: false)[0 (0,0 %)]], [#block(breakable: false)[0 (0,0 %)]], [#block(breakable: false)[20 (40,0 %)]],
)
#v(4pt)

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 9.6pt, weight: "bold", fill: rgb("#131d44"))[Tableau A46 : Conditions transversales et profil d'urgence, Sankuru]]
#set par(justify: false, leading: 0.62em)
#set text(size: 9.0pt)
#table(
  columns: (0.3399fr, 0.2000fr, 0.2003fr, 0.2598fr),
  inset: (x: 4.4pt, y: 3.2pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Condition transversale]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Vert : n (%)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Jaune : n (%)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Rouge : n (%)]]]),
    [#block(breakable: false)[Eau, hygiène et assainissement]], [#block(breakable: false)[0 (0,0 %)]], [#block(breakable: false)[0 (0,0 %)]], [#block(breakable: false)[16 (100,0 %)]],
    [#block(breakable: false)[Électricité]], [#block(breakable: false)[2 (12,5 %)]], [#block(breakable: false)[1 (6,2 %)]], [#block(breakable: false)[13 (81,2 %)]],
    [#block(breakable: false)[Communication]], [#block(breakable: false)[6 (37,5 %)]], [#block(breakable: false)[4 (25,0 %)]], [#block(breakable: false)[6 (37,5 %)]],
    [#block(breakable: false)[Circuit de référence]], [#block(breakable: false)[0 (0,0 %)]], [#block(breakable: false)[0 (0,0 %)]], [#block(breakable: false)[16 (100,0 %)]],
    [#block(breakable: false)[Données sanitaires (SNIS)]], [#block(breakable: false)[0 (0,0 %)]], [#block(breakable: false)[10 (62,5 %)]], [#block(breakable: false)[6 (37,5 %)]],
    [#block(breakable: false)[Surveillance épidémiologique]], [#block(breakable: false)[12 (75,0 %)]], [#block(breakable: false)[1 (6,2 %)]], [#block(breakable: false)[3 (18,8 %)]],
    [#block(breakable: false)[Intégration des services]], [#block(breakable: false)[9 (56,2 %)]], [#block(breakable: false)[1 (6,2 %)]], [#block(breakable: false)[6 (37,5 %)]],
    [#block(breakable: false)[Fonctions d'urgence (K = 152)]], [#block(breakable: false)[0,0 %]], [#block(breakable: false)[0,7 %]], [#block(breakable: false)[99,3 % ; menace immédiate : 16 établissements (100,0 %)]],
)
#v(4pt)

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 9.6pt, weight: "bold", fill: rgb("#131d44"))[Tableau A47 : Leviers simples et paire optimale, Sankuru]]
#set par(justify: false, leading: 0.62em)
#set text(size: 9.0pt)
#table(
  columns: (0.4400fr, 0.1399fr, 0.1401fr, 0.2800fr),
  inset: (x: 4.4pt, y: 3.2pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Levier (base : 322 fonctions rouges)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Rouge → Vert]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Rouge → Jaune]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Gain : n (% des rouges)]]]),
    [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[0]], [#block(breakable: false)[26]], [#block(breakable: false)[26 (8,1 %)]],
    [#block(breakable: false)[Équipements]], [#block(breakable: false)[0]], [#block(breakable: false)[17]], [#block(breakable: false)[17 (5,3 %)]],
    [#block(breakable: false)[Intégration des services]], [#block(breakable: false)[0]], [#block(breakable: false)[6]], [#block(breakable: false)[6 (1,9 %)]],
    [#block(breakable: false)[Communication]], [#block(breakable: false)[0]], [#block(breakable: false)[4]], [#block(breakable: false)[4 (1,2 %)]],
    [#block(breakable: false)[Organisation du service]], [#block(breakable: false)[0]], [#block(breakable: false)[1]], [#block(breakable: false)[1 (0,3 %)]],
    [#block(breakable: false)[Paire optimale : Intrants et produits \+ Équipements]], [#block(breakable: false)[\-]], [#block(breakable: false)[\-]], [#block(breakable: false)[90 (28,0 %)]],
)
#v(4pt)

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 8.0pt, weight: "bold", fill: rgb("#131d44"))[Tableau A48 : Lecture par zone de santé, Sankuru]]
#set par(justify: false, leading: 0.62em)
#set text(size: 7.4pt)
#table(
  columns: (0.1999fr, 0.0607fr, 0.0700fr, 0.0797fr, 0.0801fr, 0.0798fr, 0.1900fr, 0.2398fr),
  inset: (x: 4.4pt, y: 3.2pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Zone de santé]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Établ.]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[K]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[% Vert]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[% Jaune]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[% Rouge]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Dimension dominante]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Premier levier (gain)]]]),
    [#block(breakable: false)[Dikungu Zone de Santé]], [#block(breakable: false)[4]], [#block(breakable: false)[93]], [#block(breakable: false)[0,0]], [#block(breakable: false)[17,2]], [#block(breakable: false)[82,8]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[Intrants et produits (5 (6,5 %))]],
    [#block(breakable: false)[Omendjadi Zone de Santé]], [#block(breakable: false)[4]], [#block(breakable: false)[93]], [#block(breakable: false)[0,0]], [#block(breakable: false)[12,9]], [#block(breakable: false)[87,1]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[Intrants et produits (7 (8,6 %))]],
    [#block(breakable: false)[Tshudi Loto Zone de Santé]], [#block(breakable: false)[4]], [#block(breakable: false)[93]], [#block(breakable: false)[0,0]], [#block(breakable: false)[19,4]], [#block(breakable: false)[80,6]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[Intrants et produits (6 (8,0 %))]],
    [#block(breakable: false)[Wembo Nyama Zone de Santé]], [#block(breakable: false)[4]], [#block(breakable: false)[93]], [#block(breakable: false)[0,0]], [#block(breakable: false)[4,3]], [#block(breakable: false)[95,7]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[Intrants et produits (8 (9,0 %))]],
)
#v(4pt)

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 8.799999999999999pt, weight: "bold", fill: rgb("#131d44"))[Tableau A49 : Établissements où un seul levier libère le plus de fonctions rouges, Sankuru]]
#set par(justify: false, leading: 0.62em)
#set text(size: 8.2pt)
#table(
  columns: (0.1599fr, 0.2200fr, 0.1600fr, 0.1202fr, 0.1799fr, 0.1599fr),
  inset: (x: 4.4pt, y: 3.2pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Établissement (code)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Zone]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Niveau]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Fonctions rouges]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Levier unique]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Fonctions libérées : n (%)]]]),
    [#block(breakable: false)[SK-HGR-16]], [#block(breakable: false)[Wembo Nyama Zone de Santé]], [#block(breakable: false)[Niveau 2 (HGR)]], [#block(breakable: false)[19]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[6 (31,6 %)]],
    [#block(breakable: false)[SK-HGR-15]], [#block(breakable: false)[Tshudi Loto Zone de Santé]], [#block(breakable: false)[Niveau 2 (HGR)]], [#block(breakable: false)[17]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[5 (29,4 %)]],
    [#block(breakable: false)[SK-HGR-14]], [#block(breakable: false)[Omendjadi Zone de Santé]], [#block(breakable: false)[Niveau 2 (HGR)]], [#block(breakable: false)[19]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[4 (21,1 %)]],
    [#block(breakable: false)[SK-HGR-13]], [#block(breakable: false)[Dikungu Zone de Santé]], [#block(breakable: false)[Niveau 2 (HGR)]], [#block(breakable: false)[17]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[3 (17,6 %)]],
    [#block(breakable: false)[SK-CS-09]], [#block(breakable: false)[Wembo Nyama Zone de Santé]], [#block(breakable: false)[Niveau 1 (CS)]], [#block(breakable: false)[22]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[2 (9,1 %)]],
    [#block(breakable: false)[SK-CS-12]], [#block(breakable: false)[Tshudi Loto Zone de Santé]], [#block(breakable: false)[Niveau 1 (CS)]], [#block(breakable: false)[19]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[1 (5,3 %)]],
)
#v(4pt)

#heading(level: 2)[Annexe 8 : Tanganyika]


#block(width: 100%, above: 9pt, below: 9pt, breakable: false,
  block(width: 100%, fill: rgb("#fffbf7"), radius: 12pt, stroke: 1.1pt + black, inset: (x: 12pt, y: 10pt))[
    #grid(columns: (1fr, 1fr, 1fr, 1fr, 1fr), column-gutter: 9pt,
    [#text(font: display, size: 19pt, fill: rgb("#131d44"))[8]\
     #text(size: 7.3pt, fill: rgb("#5166b7"))[établissements · 2 zones]],
    [#text(font: display, size: 19pt, fill: rgb("#131d44"))[181]\
     #text(size: 7.3pt, fill: rgb("#5166b7"))[évaluations calculables]],
    [#text(font: display, size: 19pt, fill: rgb("#131d44"))[46,1 %]\
     #text(size: 7.3pt, fill: rgb("#5166b7"))[rouge]],
    [#text(font: display, size: 19pt, fill: rgb("#131d44"))[53,4 %]\
     #text(size: 7.3pt, fill: rgb("#5166b7"))[jaune]],
    [#text(font: display, size: 19pt, fill: rgb("#131d44"))[0,5 %]\
     #text(size: 7.3pt, fill: rgb("#5166b7"))[vert]],
    )])


#block(width: 100%, above: 11pt, below: 9pt, breakable: false,
  block(width: 100%, fill: rgb("#fffbf7"), radius: 12pt, stroke: 1.4pt + black, inset: (x: 13pt, y: 11pt))[
    #text(font: "DejaVu Sans", size: 14pt, fill: rgb("#131d44"))[★]
    #v(-4pt)
    #text(size: 7.2pt, tracking: 2.4pt, fill: rgb("#5166b7"))[#upper[LECTURE CHIFFRÉE]]
    #v(1pt)
    #block(above: 3pt, below: 9pt)[#text(size: 11.2pt, weight: "bold", fill: rgb("#131d44"))[Ce que disent les chiffres : Tanganyika]]
    #text(size: 9.2pt, fill: rgb("#0f1015"))[Position. 46,1 % de fonctions rouges sur 193 évaluations calculables (8 établissements, 2 zones), soit 22,3 points en dessous de la part d'ensemble (68,4 %) ; avec 8 établissements, ces parts sont des repères. Fonctions vitales rouges dans 54 cas sur 95 (56,8 %). Les plus contraintes : Réception urgences (100,0 %), Paludisme grave (87,5 %), Grossesse à risque (85,7 %) ; les moins contraintes : Paludisme simple (0,0 %), Diagnostic paludisme (0,0 %). Blocages. D'abord référence (56,2 % des rouges), puis équipements (48,3 %) et intrants et produits (41,6 %). 44,9 % des rouges tiennent à un seul blocage, 24,7 % à trois ou plus. Conditions et urgences. Conditions rouges les plus fréquentes : circuit de référence (75,0 %), eau, hygiène et assainissement (42,9 %), électricité (37,5 %). 60,0 % des fonctions d'urgence sont rouges ; 4 établissements sur 8 (50,0 %) ont au moins une fonction d'urgence rouge pour absence d'un élément critique d'urgence. Leviers. Premier levier : référence, 13 fonctions libérées (14,6 %) ; puis intrants et produits (10). Paire optimale : équipements \+ référence, 31 (34,8 %). Zone où la part de rouge est la plus élevée : Nyemba Zone de Santé (58,2 %) ; la plus basse : Kalemie Zone de Santé (33,7 %) ; quatre établissements par zone, repères seulement.]
  ])

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 8.0pt, weight: "bold", fill: rgb("#131d44"))[Tableau A50 : Classification des 28 fonctions traceuses, Tanganyika]]
#set par(justify: false, leading: 0.62em)
#set text(size: 7.4pt)
#table(
  columns: (0.2338fr, 0.1215fr, 0.0579fr, 0.0779fr, 0.0787fr, 0.0790fr, 0.2533fr, 0.0980fr),
  inset: (x: 4.4pt, y: 2.3pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Fonction]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Criticité]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[K]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Vert (n \/ K)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Jaune (n \/ K)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Rouge (n \/ K)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Premier blocage dominant]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Rouges avec ce blocage (n)]]]),
    [#block(breakable: false)[Grossesse à risque]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[7]], [#block(breakable: false)[0 \/ 7]], [#block(breakable: false)[1 \/ 7]], [#block(breakable: false)[6 \/ 7]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[5]],
    [#block(breakable: false)[MA compliquée]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[8]], [#block(breakable: false)[0 \/ 8]], [#block(breakable: false)[3 \/ 8]], [#block(breakable: false)[5 \/ 8]], [#block(breakable: false)[Référence]], [#block(breakable: false)[3]],
    [#block(breakable: false)[MAPI]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[7]], [#block(breakable: false)[0 \/ 7]], [#block(breakable: false)[2 \/ 7]], [#block(breakable: false)[5 \/ 7]], [#block(breakable: false)[Référence]], [#block(breakable: false)[5]],
    [#block(breakable: false)[Réanimation néonat.]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[8]], [#block(breakable: false)[0 \/ 8]], [#block(breakable: false)[3 \/ 8]], [#block(breakable: false)[5 \/ 8]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[5]],
    [#block(breakable: false)[Pré-éclampsie]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[8]], [#block(breakable: false)[0 \/ 8]], [#block(breakable: false)[3 \/ 8]], [#block(breakable: false)[5 \/ 8]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[4]],
    [#block(breakable: false)[Paludisme grave]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[8]], [#block(breakable: false)[0 \/ 8]], [#block(breakable: false)[1 \/ 8]], [#block(breakable: false)[7 \/ 8]], [#block(breakable: false)[Référence]], [#block(breakable: false)[5]],
    [#block(breakable: false)[Chaîne du froid]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[7]], [#block(breakable: false)[0 \/ 7]], [#block(breakable: false)[2 \/ 7]], [#block(breakable: false)[5 \/ 7]], [#block(breakable: false)[Électricité]], [#block(breakable: false)[3]],
    [#block(breakable: false)[Césarienne d'urgence]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[3]], [#block(breakable: false)[0 \/ 3]], [#block(breakable: false)[3 \/ 3]], [#block(breakable: false)[0 \/ 3]], [#block(breakable: false)[\-]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Transfusion]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[3]], [#block(breakable: false)[0 \/ 3]], [#block(breakable: false)[1 \/ 3]], [#block(breakable: false)[2 \/ 3]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[1]],
    [#block(breakable: false)[Référence urgente]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[8]], [#block(breakable: false)[0 \/ 8]], [#block(breakable: false)[2 \/ 8]], [#block(breakable: false)[6 \/ 8]], [#block(breakable: false)[Organisation du service]], [#block(breakable: false)[6]],
    [#block(breakable: false)[Réception urgences]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[1]], [#block(breakable: false)[0 \/ 1]], [#block(breakable: false)[0 \/ 1]], [#block(breakable: false)[1 \/ 1]], [#block(breakable: false)[Organisation du service]], [#block(breakable: false)[1]],
    [#block(breakable: false)[Accouchement assisté]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[3]], [#block(breakable: false)[0 \/ 3]], [#block(breakable: false)[3 \/ 3]], [#block(breakable: false)[0 \/ 3]], [#block(breakable: false)[\-]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Hémorragie post-partum]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[8]], [#block(breakable: false)[0 \/ 8]], [#block(breakable: false)[5 \/ 8]], [#block(breakable: false)[3 \/ 8]], [#block(breakable: false)[Référence]], [#block(breakable: false)[3]],
    [#block(breakable: false)[Sepsis obstétrical]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[8]], [#block(breakable: false)[0 \/ 8]], [#block(breakable: false)[5 \/ 8]], [#block(breakable: false)[3 \/ 8]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[3]],
    [#block(breakable: false)[Surveillance épidémio]], [#block(breakable: false)[Vitale]], [#block(breakable: false)[8]], [#block(breakable: false)[0 \/ 8]], [#block(breakable: false)[7 \/ 8]], [#block(breakable: false)[1 \/ 8]], [#block(breakable: false)[Communication]], [#block(breakable: false)[1]],
    [#block(breakable: false)[MA non compliquée]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[5]], [#block(breakable: false)[0 \/ 5]], [#block(breakable: false)[1 \/ 5]], [#block(breakable: false)[4 \/ 5]], [#block(breakable: false)[Référence]], [#block(breakable: false)[3]],
    [#block(breakable: false)[Accouchement normal]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[8]], [#block(breakable: false)[0 \/ 8]], [#block(breakable: false)[4 \/ 8]], [#block(breakable: false)[4 \/ 8]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[3]],
    [#block(breakable: false)[CPoN mère]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[8]], [#block(breakable: false)[0 \/ 8]], [#block(breakable: false)[3 \/ 8]], [#block(breakable: false)[5 \/ 8]], [#block(breakable: false)[Référence]], [#block(breakable: false)[5]],
    [#block(breakable: false)[CPN de routine]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[7]], [#block(breakable: false)[0 \/ 7]], [#block(breakable: false)[3 \/ 7]], [#block(breakable: false)[4 \/ 7]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[4]],
    [#block(breakable: false)[Vaccination de routine]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[7]], [#block(breakable: false)[0 \/ 7]], [#block(breakable: false)[2 \/ 7]], [#block(breakable: false)[5 \/ 7]], [#block(breakable: false)[Électricité]], [#block(breakable: false)[3]],
    [#block(breakable: false)[Soins du nouveau-né]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[8]], [#block(breakable: false)[0 \/ 8]], [#block(breakable: false)[5 \/ 8]], [#block(breakable: false)[3 \/ 8]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[3]],
    [#block(breakable: false)[CPN \+ PTME]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[7]], [#block(breakable: false)[0 \/ 7]], [#block(breakable: false)[4 \/ 7]], [#block(breakable: false)[3 \/ 7]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[3]],
    [#block(breakable: false)[CPoN nouveau-né]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[8]], [#block(breakable: false)[0 \/ 8]], [#block(breakable: false)[3 \/ 8]], [#block(breakable: false)[5 \/ 8]], [#block(breakable: false)[Référence]], [#block(breakable: false)[5]],
    [#block(breakable: false)[Dépistage nutrition]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[8]], [#block(breakable: false)[0 \/ 8]], [#block(breakable: false)[6 \/ 8]], [#block(breakable: false)[2 \/ 8]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[2]],
    [#block(breakable: false)[Paludisme simple]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[8]], [#block(breakable: false)[0 \/ 8]], [#block(breakable: false)[8 \/ 8]], [#block(breakable: false)[0 \/ 8]], [#block(breakable: false)[\-]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Diagnostic paludisme]], [#block(breakable: false)[Essentielle]], [#block(breakable: false)[8]], [#block(breakable: false)[0 \/ 8]], [#block(breakable: false)[8 \/ 8]], [#block(breakable: false)[0 \/ 8]], [#block(breakable: false)[\-]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Données sanitaires]], [#block(breakable: false)[Systémique]], [#block(breakable: false)[8]], [#block(breakable: false)[1 \/ 8]], [#block(breakable: false)[7 \/ 8]], [#block(breakable: false)[0 \/ 8]], [#block(breakable: false)[\-]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Intégration services]], [#block(breakable: false)[Systémique]], [#block(breakable: false)[8]], [#block(breakable: false)[0 \/ 8]], [#block(breakable: false)[8 \/ 8]], [#block(breakable: false)[0 \/ 8]], [#block(breakable: false)[\-]], [#block(breakable: false)[0]],
)
#v(4pt)

#v(6pt)
#pagebreak(weak: true)
#set page(flipped: true)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 7.199999999999999pt, weight: "bold", fill: rgb("#131d44"))[Tableau A51 : Dimensions bloquantes des fonctions rouges, par fonction (n), Tanganyika]]
#set par(justify: false, leading: 0.62em)
#set text(size: 6.6pt)
#table(
  columns: (0.1905fr, 0.0674fr, 0.0672fr, 0.0671fr, 0.0666fr, 0.0670fr, 0.0671fr, 0.0672fr, 0.0670fr, 0.0671fr, 0.0717fr, 0.0673fr, 0.0668fr),
  inset: (x: 4.4pt, y: 2.3pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Fonction]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Rouges]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Intrants]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Équip.]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[RH]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Référ.]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Organ.]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Comm.]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Électr.]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Intégr.]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Données]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Surveil.]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Accueil]]]),
    [#block(breakable: false)[Grossesse à risque]], [#block(breakable: false)[6]], [#block(breakable: false)[5]], [#block(breakable: false)[1]], [#block(breakable: false)[1]], [#block(breakable: false)[5]], [#block(breakable: false)[0]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[MA compliquée]], [#block(breakable: false)[5]], [#block(breakable: false)[1]], [#block(breakable: false)[2]], [#block(breakable: false)[1]], [#block(breakable: false)[3]], [#block(breakable: false)[1]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[MAPI]], [#block(breakable: false)[5]], [#block(breakable: false)[3]], [#block(breakable: false)[3]], [#block(breakable: false)[0]], [#block(breakable: false)[5]], [#block(breakable: false)[0]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Réanimation néonat.]], [#block(breakable: false)[5]], [#block(breakable: false)[0]], [#block(breakable: false)[5]], [#block(breakable: false)[0]], [#block(breakable: false)[3]], [#block(breakable: false)[0]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Pré-éclampsie]], [#block(breakable: false)[5]], [#block(breakable: false)[4]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[3]], [#block(breakable: false)[0]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Paludisme grave]], [#block(breakable: false)[7]], [#block(breakable: false)[3]], [#block(breakable: false)[4]], [#block(breakable: false)[0]], [#block(breakable: false)[5]], [#block(breakable: false)[0]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Chaîne du froid]], [#block(breakable: false)[5]], [#block(breakable: false)[0]], [#block(breakable: false)[2]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[3]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Césarienne d'urgence]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Transfusion]], [#block(breakable: false)[2]], [#block(breakable: false)[1]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Référence urgente]], [#block(breakable: false)[6]], [#block(breakable: false)[0]], [#block(breakable: false)[6]], [#block(breakable: false)[0]], [#block(breakable: false)[6]], [#block(breakable: false)[6]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Réception urgences]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[1]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Accouchement assisté]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Hémorragie post-partum]], [#block(breakable: false)[3]], [#block(breakable: false)[1]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[3]], [#block(breakable: false)[0]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Sepsis obstétrical]], [#block(breakable: false)[3]], [#block(breakable: false)[3]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[3]], [#block(breakable: false)[0]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Surveillance épidémio.]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[MA non compliquée]], [#block(breakable: false)[4]], [#block(breakable: false)[1]], [#block(breakable: false)[2]], [#block(breakable: false)[1]], [#block(breakable: false)[3]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Accouchement normal]], [#block(breakable: false)[4]], [#block(breakable: false)[3]], [#block(breakable: false)[3]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[CPoN mère]], [#block(breakable: false)[5]], [#block(breakable: false)[2]], [#block(breakable: false)[2]], [#block(breakable: false)[0]], [#block(breakable: false)[5]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[CPN de routine]], [#block(breakable: false)[4]], [#block(breakable: false)[4]], [#block(breakable: false)[2]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Vaccination de routine]], [#block(breakable: false)[5]], [#block(breakable: false)[1]], [#block(breakable: false)[2]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[3]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Soins du nouveau-né]], [#block(breakable: false)[3]], [#block(breakable: false)[2]], [#block(breakable: false)[3]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[CPN \+ PTME]], [#block(breakable: false)[3]], [#block(breakable: false)[3]], [#block(breakable: false)[0]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[2]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[CPoN nouveau-né]], [#block(breakable: false)[5]], [#block(breakable: false)[0]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[5]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Dépistage nutrition]], [#block(breakable: false)[2]], [#block(breakable: false)[0]], [#block(breakable: false)[2]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Paludisme simple]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Diagnostic paludisme]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Données sanitaires]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Intégration services]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0]],
)
#pagebreak()
#set page(flipped: false)

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 9.6pt, weight: "bold", fill: rgb("#131d44"))[Tableau A52 : Dimensions bloquantes et fragilités, Tanganyika]]
#set par(justify: false, leading: 0.62em)
#set text(size: 9.0pt)
#table(
  columns: (0.3400fr, 0.2200fr, 0.2202fr, 0.2198fr),
  inset: (x: 4.4pt, y: 3.2pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Dimension]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Bloque : n (% des rouges)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Premier blocage : n (%)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Fragilise : n (% des jaunes)]]]),
    [#block(breakable: false)[Référence]], [#block(breakable: false)[50 (56,2 %)]], [#block(breakable: false)[13 (14,6 %)]], [#block(breakable: false)[77 (74,8 %)]],
    [#block(breakable: false)[Équipements]], [#block(breakable: false)[43 (48,3 %)]], [#block(breakable: false)[20 (22,5 %)]], [#block(breakable: false)[16 (15,5 %)]],
    [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[37 (41,6 %)]], [#block(breakable: false)[32 (36,0 %)]], [#block(breakable: false)[18 (17,5 %)]],
    [#block(breakable: false)[Organisation du service]], [#block(breakable: false)[12 (13,5 %)]], [#block(breakable: false)[12 (13,5 %)]], [#block(breakable: false)[23 (22,3 %)]],
    [#block(breakable: false)[Communication]], [#block(breakable: false)[10 (11,2 %)]], [#block(breakable: false)[4 (4,5 %)]], [#block(breakable: false)[3 (2,9 %)]],
    [#block(breakable: false)[Ressources humaines]], [#block(breakable: false)[6 (6,7 %)]], [#block(breakable: false)[2 (2,2 %)]], [#block(breakable: false)[39 (37,9 %)]],
    [#block(breakable: false)[Électricité]], [#block(breakable: false)[6 (6,7 %)]], [#block(breakable: false)[6 (6,7 %)]], [#block(breakable: false)[33 (32,0 %)]],
    [#block(breakable: false)[Capacité d'accueil]], [#block(breakable: false)[0 (0,0 %)]], [#block(breakable: false)[0 (0,0 %)]], [#block(breakable: false)[12 (11,7 %)]],
    [#block(breakable: false)[Eau, hygiène et assainissement]], [#block(breakable: false)[0 (0,0 %)]], [#block(breakable: false)[0 (0,0 %)]], [#block(breakable: false)[53 (51,5 %)]],
    [#block(breakable: false)[Données sanitaires]], [#block(breakable: false)[0 (0,0 %)]], [#block(breakable: false)[0 (0,0 %)]], [#block(breakable: false)[12 (11,7 %)]],
)
#v(4pt)

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 9.6pt, weight: "bold", fill: rgb("#131d44"))[Tableau A53 : Conditions transversales et profil d'urgence, Tanganyika]]
#set par(justify: false, leading: 0.62em)
#set text(size: 9.0pt)
#table(
  columns: (0.3399fr, 0.2000fr, 0.2003fr, 0.2598fr),
  inset: (x: 4.4pt, y: 3.2pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Condition transversale]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Vert : n (%)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Jaune : n (%)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Rouge : n (%)]]]),
    [#block(breakable: false)[Eau, hygiène et assainissement]], [#block(breakable: false)[2 (28,6 %)]], [#block(breakable: false)[2 (28,6 %)]], [#block(breakable: false)[3 (42,9 %)]],
    [#block(breakable: false)[Électricité]], [#block(breakable: false)[3 (37,5 %)]], [#block(breakable: false)[2 (25,0 %)]], [#block(breakable: false)[3 (37,5 %)]],
    [#block(breakable: false)[Communication]], [#block(breakable: false)[6 (75,0 %)]], [#block(breakable: false)[1 (12,5 %)]], [#block(breakable: false)[1 (12,5 %)]],
    [#block(breakable: false)[Circuit de référence]], [#block(breakable: false)[0 (0,0 %)]], [#block(breakable: false)[2 (25,0 %)]], [#block(breakable: false)[6 (75,0 %)]],
    [#block(breakable: false)[Données sanitaires (SNIS)]], [#block(breakable: false)[5 (62,5 %)]], [#block(breakable: false)[3 (37,5 %)]], [#block(breakable: false)[0 (0,0 %)]],
    [#block(breakable: false)[Surveillance épidémiologique]], [#block(breakable: false)[8 (100,0 %)]], [#block(breakable: false)[0 (0,0 %)]], [#block(breakable: false)[0 (0,0 %)]],
    [#block(breakable: false)[Intégration des services]], [#block(breakable: false)[8 (100,0 %)]], [#block(breakable: false)[0 (0,0 %)]], [#block(breakable: false)[0 (0,0 %)]],
    [#block(breakable: false)[Fonctions d'urgence (K = 80)]], [#block(breakable: false)[0,0 %]], [#block(breakable: false)[40,0 %]], [#block(breakable: false)[60,0 % ; menace immédiate : 4 établissements (50,0 %)]],
)
#v(4pt)

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 9.6pt, weight: "bold", fill: rgb("#131d44"))[Tableau A54 : Leviers simples et paire optimale, Tanganyika]]
#set par(justify: false, leading: 0.62em)
#set text(size: 9.0pt)
#table(
  columns: (0.4400fr, 0.1399fr, 0.1401fr, 0.2800fr),
  inset: (x: 4.4pt, y: 3.2pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Levier (base : 89 fonctions rouges)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Rouge → Vert]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Rouge → Jaune]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Gain : n (% des rouges)]]]),
    [#block(breakable: false)[Référence]], [#block(breakable: false)[0]], [#block(breakable: false)[13]], [#block(breakable: false)[13 (14,6 %)]],
    [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[0]], [#block(breakable: false)[10]], [#block(breakable: false)[10 (11,2 %)]],
    [#block(breakable: false)[Équipements]], [#block(breakable: false)[0]], [#block(breakable: false)[10]], [#block(breakable: false)[10 (11,2 %)]],
    [#block(breakable: false)[Électricité]], [#block(breakable: false)[0]], [#block(breakable: false)[6]], [#block(breakable: false)[6 (6,7 %)]],
    [#block(breakable: false)[Communication]], [#block(breakable: false)[0]], [#block(breakable: false)[1]], [#block(breakable: false)[1 (1,1 %)]],
    [#block(breakable: false)[Paire optimale : Équipements \+ Référence]], [#block(breakable: false)[\-]], [#block(breakable: false)[\-]], [#block(breakable: false)[31 (34,8 %)]],
)
#v(4pt)

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 8.0pt, weight: "bold", fill: rgb("#131d44"))[Tableau A55 : Lecture par zone de santé, Tanganyika]]
#set par(justify: false, leading: 0.62em)
#set text(size: 7.4pt)
#table(
  columns: (0.1997fr, 0.0607fr, 0.0701fr, 0.0798fr, 0.0800fr, 0.0800fr, 0.1899fr, 0.2398fr),
  inset: (x: 4.4pt, y: 3.2pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Zone de santé]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Établ.]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[K]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[% Vert]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[% Jaune]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[% Rouge]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Dimension dominante]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Premier levier (gain)]]]),
    [#block(breakable: false)[Kalemie Zone de Santé]], [#block(breakable: false)[4]], [#block(breakable: false)[95]], [#block(breakable: false)[1,1]], [#block(breakable: false)[65,3]], [#block(breakable: false)[33,7]], [#block(breakable: false)[Référence]], [#block(breakable: false)[Référence (6 (18,8 %))]],
    [#block(breakable: false)[Nyemba Zone de Santé]], [#block(breakable: false)[4]], [#block(breakable: false)[98]], [#block(breakable: false)[0,0]], [#block(breakable: false)[41,8]], [#block(breakable: false)[58,2]], [#block(breakable: false)[Référence]], [#block(breakable: false)[Intrants et produits (7 (12,3 %))]],
)
#v(4pt)

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 8.799999999999999pt, weight: "bold", fill: rgb("#131d44"))[Tableau A56 : Établissements où un seul levier libère le plus de fonctions rouges, Tanganyika]]
#set par(justify: false, leading: 0.62em)
#set text(size: 8.2pt)
#table(
  columns: (0.1599fr, 0.2200fr, 0.1600fr, 0.1202fr, 0.1799fr, 0.1599fr),
  inset: (x: 4.4pt, y: 3.2pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Établissement (code)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Zone]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Niveau]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Fonctions rouges]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Levier unique]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Fonctions libérées : n (%)]]]),
    [#block(breakable: false)[TG-CSR-06]], [#block(breakable: false)[Kalemie Zone de Santé]], [#block(breakable: false)[Niveau 1+ (CSR)]], [#block(breakable: false)[7]], [#block(breakable: false)[Référence]], [#block(breakable: false)[5 (71,4 %)]],
    [#block(breakable: false)[TG-CSR-07]], [#block(breakable: false)[Nyemba Zone de Santé]], [#block(breakable: false)[Niveau 1+ (CSR)]], [#block(breakable: false)[12]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[4 (33,3 %)]],
    [#block(breakable: false)[TG-CS-04]], [#block(breakable: false)[Kalemie Zone de Santé]], [#block(breakable: false)[Niveau 1 (CS)]], [#block(breakable: false)[7]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[3 (42,9 %)]],
    [#block(breakable: false)[TG-CS-01]], [#block(breakable: false)[Nyemba Zone de Santé]], [#block(breakable: false)[Niveau 1 (CS)]], [#block(breakable: false)[10]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[2 (20,0 %)]],
    [#block(breakable: false)[TG-CS-05]], [#block(breakable: false)[Nyemba Zone de Santé]], [#block(breakable: false)[Niveau 1 (CS)]], [#block(breakable: false)[17]], [#block(breakable: false)[Référence]], [#block(breakable: false)[2 (11,8 %)]],
    [#block(breakable: false)[TG-CS-02]], [#block(breakable: false)[Nyemba Zone de Santé]], [#block(breakable: false)[Niveau 1 (CS)]], [#block(breakable: false)[18]], [#block(breakable: false)[Référence]], [#block(breakable: false)[2 (11,1 %)]],
)
#v(4pt)

#heading(level: 2)[Annexe 9 : Éléments en cause dans les fonctions d’urgence rouges, par niveau]

#para[Ce tableau détaille, pour chaque fonction d’urgence et chaque niveau de soins, les éléments et composantes en cause dans les fonctions rouges. Deux dénominateurs sont présentés : le nombre de fonctions rouges de la ligne où l’élément manque et, pour les intrants et les équipements, le nombre d’établissements du niveau où l’élément est en déficit. Une même fonction rouge peut être concernée par plusieurs éléments ; seuls les éléments en cause dans au moins une fonction rouge sont présentés.]

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 8.799999999999999pt, weight: "bold", fill: rgb("#131d44"))[Tableau A57 : Éléments et composantes en cause dans les fonctions d’urgence rouges, par fonction et par niveau]]
#set par(justify: false, leading: 0.62em)
#set text(size: 8.2pt)
#table(
  columns: (0.2385fr, 0.0832fr, 0.3839fr, 0.1556fr, 0.1388fr),
  inset: (x: 4.4pt, y: 2.3pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Fonction et niveau]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Fonctions rouges]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Élément ou composante en cause (type)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Fonctions rouges où l’élément manque : n (%)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Établissements du niveau en déficit : n \/ N]]]),
    [#block(breakable: false)[Grossesse à risque : Niveau 1 (CS)]], [#block(breakable: false)[96]], [#block(breakable: false)[Bandelettes urinaires (intrant)]], [#block(breakable: false)[77 (80,2 %)]], [#block(breakable: false)[77 \/ 101]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Méthyldopa (alpha) (intrant)]], [#block(breakable: false)[80 (83,3 %)]], [#block(breakable: false)[80 \/ 101]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Tensiomètre \+ stéthoscope (équipement)]], [#block(breakable: false)[31 (32,3 %)]], [#block(breakable: false)[31 \/ 101]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Stéthoscope fœtal (Pinard) ou Doppler fœtal (équipement)]], [#block(breakable: false)[20 (20,8 %)]], [#block(breakable: false)[20 \/ 101]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Prestataire formé présent (ressources humaines)]], [#block(breakable: false)[14 (14,6 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Contact préalable (référence)]], [#block(breakable: false)[19 (19,8 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Moyen de transport (référence)]], [#block(breakable: false)[71 (74,0 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Continuité de la communication (communication)]], [#block(breakable: false)[12 (12,5 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Moyens essentiels fonctionnels le jour de la visite (communication)]], [#block(breakable: false)[10 (10,4 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Service organisé et continu (organisation du service)]], [#block(breakable: false)[4 (4,2 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[Grossesse à risque : Niveau 1+ (CSR)]], [#block(breakable: false)[17]], [#block(breakable: false)[Bandelettes urinaires (intrant)]], [#block(breakable: false)[12 (70,6 %)]], [#block(breakable: false)[12 \/ 22]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Méthyldopa (alpha) (intrant)]], [#block(breakable: false)[9 (52,9 %)]], [#block(breakable: false)[9 \/ 22]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Tensiomètre \+ stéthoscope (équipement)]], [#block(breakable: false)[4 (23,5 %)]], [#block(breakable: false)[4 \/ 22]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Stéthoscope fœtal (Pinard) ou Doppler fœtal (équipement)]], [#block(breakable: false)[3 (17,6 %)]], [#block(breakable: false)[3 \/ 22]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Prestataire formé présent (ressources humaines)]], [#block(breakable: false)[1 (5,9 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Contact préalable (référence)]], [#block(breakable: false)[5 (29,4 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Moyen de transport (référence)]], [#block(breakable: false)[13 (76,5 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Au moins un moyen de communication existant (communication)]], [#block(breakable: false)[2 (11,8 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Continuité de la communication (communication)]], [#block(breakable: false)[3 (17,6 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[Hémorragie post-partum : Niveau 1 (CS)]], [#block(breakable: false)[86]], [#block(breakable: false)[Ocytocine (intrant)]], [#block(breakable: false)[18 (20,9 %)]], [#block(breakable: false)[18 \/ 101]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Trousse de perfusion (intrant)]], [#block(breakable: false)[25 (29,1 %)]], [#block(breakable: false)[25 \/ 101]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Tensiomètre \+ stéthoscope (équipement)]], [#block(breakable: false)[28 (32,6 %)]], [#block(breakable: false)[28 \/ 101]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Soluté intraveineux (lactate de Ringer ou NaCl 0,9 %) : aucun disponible (intrant)]], [#block(breakable: false)[26 (30,2 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Prestataire formé présent (ressources humaines)]], [#block(breakable: false)[5 (5,8 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Contact préalable (référence)]], [#block(breakable: false)[19 (22,1 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Moyen de transport (référence)]], [#block(breakable: false)[71 (82,6 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Continuité de la communication (communication)]], [#block(breakable: false)[12 (14,0 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Moyens essentiels fonctionnels le jour de la visite (communication)]], [#block(breakable: false)[10 (11,6 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Service organisé et continu (organisation du service)]], [#block(breakable: false)[13 (15,1 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[Hémorragie post-partum : Niveau 1+ (CSR)]], [#block(breakable: false)[10]], [#block(breakable: false)[Ocytocine (intrant)]], [#block(breakable: false)[2 (20,0 %)]], [#block(breakable: false)[2 \/ 22]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Seringues et aiguilles (intrant)]], [#block(breakable: false)[4 (40,0 %)]], [#block(breakable: false)[4 \/ 22]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Trousse de perfusion (intrant)]], [#block(breakable: false)[1 (10,0 %)]], [#block(breakable: false)[1 \/ 22]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Tensiomètre \+ stéthoscope (équipement)]], [#block(breakable: false)[3 (30,0 %)]], [#block(breakable: false)[3 \/ 22]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Soluté intraveineux (lactate de Ringer ou NaCl 0,9 %) : aucun disponible (intrant)]], [#block(breakable: false)[3 (30,0 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Prestataire formé présent (ressources humaines)]], [#block(breakable: false)[2 (20,0 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Service organisé et continu (organisation du service)]], [#block(breakable: false)[1 (10,0 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[Hémorragie post-partum : Niveau 2 (HGR)]], [#block(breakable: false)[17]], [#block(breakable: false)[Ocytocine (intrant)]], [#block(breakable: false)[3 (17,6 %)]], [#block(breakable: false)[3 \/ 37]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Seringues et aiguilles (intrant)]], [#block(breakable: false)[11 (64,7 %)]], [#block(breakable: false)[11 \/ 37]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Trousse de perfusion (intrant)]], [#block(breakable: false)[6 (35,3 %)]], [#block(breakable: false)[6 \/ 37]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Tensiomètre \+ stéthoscope (équipement)]], [#block(breakable: false)[1 (5,9 %)]], [#block(breakable: false)[1 \/ 37]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Soluté intraveineux (lactate de Ringer ou NaCl 0,9 %) : aucun disponible (intrant)]], [#block(breakable: false)[3 (17,6 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Prestataire formé présent (ressources humaines)]], [#block(breakable: false)[3 (17,6 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[Pré-éclampsie : Niveau 1 (CS)]], [#block(breakable: false)[94]], [#block(breakable: false)[Sulfate de magnésium (intrant)]], [#block(breakable: false)[77 (81,9 %)]], [#block(breakable: false)[77 \/ 101]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Trousse de perfusion (intrant)]], [#block(breakable: false)[25 (26,6 %)]], [#block(breakable: false)[25 \/ 101]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Tensiomètre \+ stéthoscope (équipement)]], [#block(breakable: false)[28 (29,8 %)]], [#block(breakable: false)[28 \/ 101]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Soluté intraveineux (lactate de Ringer ou NaCl 0,9 %) : aucun disponible (intrant)]], [#block(breakable: false)[26 (27,7 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Prestataire formé présent (ressources humaines)]], [#block(breakable: false)[5 (5,3 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Contact préalable (référence)]], [#block(breakable: false)[19 (20,2 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Moyen de transport (référence)]], [#block(breakable: false)[71 (75,5 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Continuité de la communication (communication)]], [#block(breakable: false)[12 (12,8 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Moyens essentiels fonctionnels le jour de la visite (communication)]], [#block(breakable: false)[10 (10,6 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Service organisé et continu (organisation du service)]], [#block(breakable: false)[13 (13,8 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[Pré-éclampsie : Niveau 1+ (CSR)]], [#block(breakable: false)[15]], [#block(breakable: false)[Sulfate de magnésium (intrant)]], [#block(breakable: false)[11 (73,3 %)]], [#block(breakable: false)[11 \/ 22]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Seringues et aiguilles (intrant)]], [#block(breakable: false)[4 (26,7 %)]], [#block(breakable: false)[4 \/ 22]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Trousse de perfusion (intrant)]], [#block(breakable: false)[1 (6,7 %)]], [#block(breakable: false)[1 \/ 22]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Tensiomètre \+ stéthoscope (équipement)]], [#block(breakable: false)[3 (20,0 %)]], [#block(breakable: false)[3 \/ 22]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Soluté intraveineux (lactate de Ringer ou NaCl 0,9 %) : aucun disponible (intrant)]], [#block(breakable: false)[3 (20,0 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Prestataire formé présent (ressources humaines)]], [#block(breakable: false)[2 (13,3 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Service organisé et continu (organisation du service)]], [#block(breakable: false)[1 (6,7 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[Pré-éclampsie : Niveau 2 (HGR)]], [#block(breakable: false)[23]], [#block(breakable: false)[Sulfate de magnésium (intrant)]], [#block(breakable: false)[10 (43,5 %)]], [#block(breakable: false)[10 \/ 37]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Seringues et aiguilles (intrant)]], [#block(breakable: false)[11 (47,8 %)]], [#block(breakable: false)[11 \/ 37]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Trousse de perfusion (intrant)]], [#block(breakable: false)[6 (26,1 %)]], [#block(breakable: false)[6 \/ 37]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Tensiomètre \+ stéthoscope (équipement)]], [#block(breakable: false)[1 (4,3 %)]], [#block(breakable: false)[1 \/ 37]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Soluté intraveineux (lactate de Ringer ou NaCl 0,9 %) : aucun disponible (intrant)]], [#block(breakable: false)[3 (13,0 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Prestataire formé présent (ressources humaines)]], [#block(breakable: false)[3 (13,0 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[Sepsis obstétrical : Niveau 1 (CS)]], [#block(breakable: false)[85]], [#block(breakable: false)[Ampicilline (intrant)]], [#block(breakable: false)[48 (56,5 %)]], [#block(breakable: false)[48 \/ 101]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Gentamycine sulfate (intrant)]], [#block(breakable: false)[32 (37,6 %)]], [#block(breakable: false)[32 \/ 101]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Métronidazole (intrant)]], [#block(breakable: false)[31 (36,5 %)]], [#block(breakable: false)[31 \/ 101]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Tensiomètre \+ stéthoscope (équipement)]], [#block(breakable: false)[26 (30,6 %)]], [#block(breakable: false)[28 \/ 101]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Thermomètre (équipement)]], [#block(breakable: false)[23 (27,1 %)]], [#block(breakable: false)[25 \/ 101]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Prestataire formé présent (ressources humaines)]], [#block(breakable: false)[5 (5,9 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Contact préalable (référence)]], [#block(breakable: false)[19 (22,4 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Moyen de transport (référence)]], [#block(breakable: false)[71 (83,5 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Continuité de la communication (communication)]], [#block(breakable: false)[12 (14,1 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Moyens essentiels fonctionnels le jour de la visite (communication)]], [#block(breakable: false)[10 (11,8 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Service organisé et continu (organisation du service)]], [#block(breakable: false)[13 (15,3 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[Sepsis obstétrical : Niveau 1+ (CSR)]], [#block(breakable: false)[9]], [#block(breakable: false)[Ampicilline (intrant)]], [#block(breakable: false)[5 (55,6 %)]], [#block(breakable: false)[5 \/ 22]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Gentamycine sulfate (intrant)]], [#block(breakable: false)[3 (33,3 %)]], [#block(breakable: false)[3 \/ 22]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Métronidazole (intrant)]], [#block(breakable: false)[3 (33,3 %)]], [#block(breakable: false)[3 \/ 22]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Tensiomètre \+ stéthoscope (équipement)]], [#block(breakable: false)[3 (33,3 %)]], [#block(breakable: false)[3 \/ 22]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Thermomètre (équipement)]], [#block(breakable: false)[2 (22,2 %)]], [#block(breakable: false)[2 \/ 22]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Prestataire formé présent (ressources humaines)]], [#block(breakable: false)[2 (22,2 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Service organisé et continu (organisation du service)]], [#block(breakable: false)[1 (11,1 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[Sepsis obstétrical : Niveau 2 (HGR)]], [#block(breakable: false)[17]], [#block(breakable: false)[Ampicilline (intrant)]], [#block(breakable: false)[11 (64,7 %)]], [#block(breakable: false)[11 \/ 37]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Gentamycine sulfate (intrant)]], [#block(breakable: false)[7 (41,2 %)]], [#block(breakable: false)[7 \/ 37]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Métronidazole (intrant)]], [#block(breakable: false)[6 (35,3 %)]], [#block(breakable: false)[6 \/ 37]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Tensiomètre \+ stéthoscope (équipement)]], [#block(breakable: false)[1 (5,9 %)]], [#block(breakable: false)[1 \/ 37]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Thermomètre (équipement)]], [#block(breakable: false)[4 (23,5 %)]], [#block(breakable: false)[4 \/ 37]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Prestataire formé présent (ressources humaines)]], [#block(breakable: false)[3 (17,6 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[Accouchement assisté : Niveau 1+ (CSR)]], [#block(breakable: false)[18]], [#block(breakable: false)[Lidocaïne (intrant)]], [#block(breakable: false)[4 (22,2 %)]], [#block(breakable: false)[5 \/ 22]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Gants (utilité, stériles, longs pour délivrance manuelle) (intrant)]], [#block(breakable: false)[12 (66,7 %)]], [#block(breakable: false)[13 \/ 22]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Fil de suture (intrant)]], [#block(breakable: false)[1 (5,6 %)]], [#block(breakable: false)[1 \/ 22]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Lit d'accouchement (semi-assis ou décubitus latéral, étriers amovibles) (équipement)]], [#block(breakable: false)[8 (44,4 %)]], [#block(breakable: false)[8 \/ 22]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Source de lumière adéquate (équipement)]], [#block(breakable: false)[5 (27,8 %)]], [#block(breakable: false)[5 \/ 22]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Stéthoscope fœtal (Pinard) ou Doppler fœtal (équipement)]], [#block(breakable: false)[2 (11,1 %)]], [#block(breakable: false)[2 \/ 22]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Ventouse ou forceps (équipement)]], [#block(breakable: false)[13 (72,2 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Prestataire formé présent (ressources humaines)]], [#block(breakable: false)[2 (11,1 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Service organisé et continu (organisation du service)]], [#block(breakable: false)[1 (5,6 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[Accouchement assisté : Niveau 2 (HGR)]], [#block(breakable: false)[25]], [#block(breakable: false)[Lidocaïne (intrant)]], [#block(breakable: false)[4 (16,0 %)]], [#block(breakable: false)[5 \/ 37]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Gants (utilité, stériles, longs pour délivrance manuelle) (intrant)]], [#block(breakable: false)[13 (52,0 %)]], [#block(breakable: false)[17 \/ 37]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Fil de suture (intrant)]], [#block(breakable: false)[6 (24,0 %)]], [#block(breakable: false)[6 \/ 37]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Lit d'accouchement (semi-assis ou décubitus latéral, étriers amovibles) (équipement)]], [#block(breakable: false)[7 (28,0 %)]], [#block(breakable: false)[7 \/ 37]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Source de lumière adéquate (équipement)]], [#block(breakable: false)[8 (32,0 %)]], [#block(breakable: false)[8 \/ 37]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Stéthoscope fœtal (Pinard) ou Doppler fœtal (équipement)]], [#block(breakable: false)[4 (16,0 %)]], [#block(breakable: false)[4 \/ 37]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Ventouse ou forceps (équipement)]], [#block(breakable: false)[17 (68,0 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Prestataire formé présent (ressources humaines)]], [#block(breakable: false)[3 (12,0 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[Césarienne d'urgence : Niveau 1+ (CSR)]], [#block(breakable: false)[15]], [#block(breakable: false)[Seringues et aiguilles (intrant)]], [#block(breakable: false)[4 (26,7 %)]], [#block(breakable: false)[4 \/ 22]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Trousse de perfusion (intrant)]], [#block(breakable: false)[1 (6,7 %)]], [#block(breakable: false)[1 \/ 22]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Fil de suture (intrant)]], [#block(breakable: false)[1 (6,7 %)]], [#block(breakable: false)[1 \/ 22]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Antiseptique (intrant)]], [#block(breakable: false)[5 (33,3 %)]], [#block(breakable: false)[5 \/ 22]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Compresses stériles (intrant)]], [#block(breakable: false)[3 (20,0 %)]], [#block(breakable: false)[3 \/ 22]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Bloc opératoire équipé (équipement)]], [#block(breakable: false)[6 (40,0 %)]], [#block(breakable: false)[6 \/ 22]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Boîte de césarienne (plateau chirurgical complet : bistouris, pinces hémostatiques, écarteurs, porte-aiguilles, ciseaux chirurgicaux) (équipement)]], [#block(breakable: false)[4 (26,7 %)]], [#block(breakable: false)[4 \/ 22]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Matériel d'anesthésie (équipement)]], [#block(breakable: false)[8 (53,3 %)]], [#block(breakable: false)[8 \/ 22]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Soluté intraveineux (lactate de Ringer ou NaCl 0,9 %) : aucun disponible (intrant)]], [#block(breakable: false)[3 (20,0 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Prestataire formé présent (ressources humaines)]], [#block(breakable: false)[4 (26,7 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Source d'électricité existante (électricité)]], [#block(breakable: false)[2 (13,3 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Électricité disponible de manière stable (électricité)]], [#block(breakable: false)[2 (13,3 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Continuité de l'électricité sur trois mois (électricité)]], [#block(breakable: false)[2 (13,3 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Source électrique de secours (électricité)]], [#block(breakable: false)[7 (46,7 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Service organisé et continu (organisation du service)]], [#block(breakable: false)[1 (6,7 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[Césarienne d'urgence : Niveau 2 (HGR)]], [#block(breakable: false)[30]], [#block(breakable: false)[Seringues et aiguilles (intrant)]], [#block(breakable: false)[11 (36,7 %)]], [#block(breakable: false)[11 \/ 37]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Trousse de perfusion (intrant)]], [#block(breakable: false)[6 (20,0 %)]], [#block(breakable: false)[6 \/ 37]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Fil de suture (intrant)]], [#block(breakable: false)[6 (20,0 %)]], [#block(breakable: false)[6 \/ 37]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Antiseptique (intrant)]], [#block(breakable: false)[17 (56,7 %)]], [#block(breakable: false)[17 \/ 37]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Compresses stériles (intrant)]], [#block(breakable: false)[7 (23,3 %)]], [#block(breakable: false)[7 \/ 37]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Bloc opératoire équipé (équipement)]], [#block(breakable: false)[9 (30,0 %)]], [#block(breakable: false)[9 \/ 37]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Boîte de césarienne (plateau chirurgical complet : bistouris, pinces hémostatiques, écarteurs, porte-aiguilles, ciseaux chirurgicaux) (équipement)]], [#block(breakable: false)[8 (26,7 %)]], [#block(breakable: false)[8 \/ 37]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Matériel d'anesthésie (équipement)]], [#block(breakable: false)[14 (46,7 %)]], [#block(breakable: false)[14 \/ 37]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Soluté intraveineux (lactate de Ringer ou NaCl 0,9 %) : aucun disponible (intrant)]], [#block(breakable: false)[3 (10,0 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Prestataire formé présent (ressources humaines)]], [#block(breakable: false)[3 (10,0 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Source d'électricité existante (électricité)]], [#block(breakable: false)[2 (6,7 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Électricité disponible de manière stable (électricité)]], [#block(breakable: false)[7 (23,3 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Continuité de l'électricité sur trois mois (électricité)]], [#block(breakable: false)[6 (20,0 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Source électrique de secours (électricité)]], [#block(breakable: false)[9 (30,0 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[Transfusion : Niveau 1+ (CSR)]], [#block(breakable: false)[19]], [#block(breakable: false)[Poches de sang et trousse de transfusion (intrant)]], [#block(breakable: false)[3 (15,8 %)]], [#block(breakable: false)[3 \/ 22]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Test de groupage sanguin (intrant)]], [#block(breakable: false)[2 (10,5 %)]], [#block(breakable: false)[2 \/ 22]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Réfrigérateur à sang (équipement)]], [#block(breakable: false)[17 (89,5 %)]], [#block(breakable: false)[17 \/ 22]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Prestataire formé présent (ressources humaines)]], [#block(breakable: false)[4 (21,1 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Source d'électricité existante (électricité)]], [#block(breakable: false)[2 (10,5 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Électricité disponible de manière stable (électricité)]], [#block(breakable: false)[2 (10,5 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Continuité de l'électricité sur trois mois (électricité)]], [#block(breakable: false)[2 (10,5 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Source électrique de secours (électricité)]], [#block(breakable: false)[7 (36,8 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Service organisé et continu (organisation du service)]], [#block(breakable: false)[1 (5,3 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[Transfusion : Niveau 2 (HGR)]], [#block(breakable: false)[26]], [#block(breakable: false)[Poches de sang et trousse de transfusion (intrant)]], [#block(breakable: false)[6 (23,1 %)]], [#block(breakable: false)[6 \/ 37]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Test de groupage sanguin (intrant)]], [#block(breakable: false)[4 (15,4 %)]], [#block(breakable: false)[4 \/ 37]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Réfrigérateur à sang (équipement)]], [#block(breakable: false)[19 (73,1 %)]], [#block(breakable: false)[19 \/ 37]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Prestataire formé présent (ressources humaines)]], [#block(breakable: false)[7 (26,9 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Source d'électricité existante (électricité)]], [#block(breakable: false)[2 (7,7 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Électricité disponible de manière stable (électricité)]], [#block(breakable: false)[7 (26,9 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Continuité de l'électricité sur trois mois (électricité)]], [#block(breakable: false)[6 (23,1 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Source électrique de secours (électricité)]], [#block(breakable: false)[9 (34,6 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[Réanimation néonat. : Niveau 1 (CS)]], [#block(breakable: false)[99]], [#block(breakable: false)[Gants (utilité, stériles, longs pour délivrance manuelle) (intrant)]], [#block(breakable: false)[50 (50,5 %)]], [#block(breakable: false)[52 \/ 101]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Source de chaleur (équipement)]], [#block(breakable: false)[77 (77,8 %)]], [#block(breakable: false)[77 \/ 101]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Surface/espace dédié à la réanimation du nouveau-né, à proximité du lit (équipement)]], [#block(breakable: false)[58 (58,6 %)]], [#block(breakable: false)[58 \/ 101]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Ballon et masque néonatals (équipement)]], [#block(breakable: false)[47 (47,5 %)]], [#block(breakable: false)[47 \/ 101]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Appareil d'aspiration (équipement)]], [#block(breakable: false)[77 (77,8 %)]], [#block(breakable: false)[77 \/ 101]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Prestataire formé présent (ressources humaines)]], [#block(breakable: false)[5 (5,1 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Contact préalable (référence)]], [#block(breakable: false)[19 (19,2 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Moyen de transport (référence)]], [#block(breakable: false)[71 (71,7 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Continuité de la communication (communication)]], [#block(breakable: false)[12 (12,1 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Moyens essentiels fonctionnels le jour de la visite (communication)]], [#block(breakable: false)[10 (10,1 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Service organisé et continu (organisation du service)]], [#block(breakable: false)[13 (13,1 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[Réanimation néonat. : Niveau 1+ (CSR)]], [#block(breakable: false)[17]], [#block(breakable: false)[Serviettes pour sécher/envelopper le nouveau-né (intrant)]], [#block(breakable: false)[11 (64,7 %)]], [#block(breakable: false)[11 \/ 22]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Couverture pour le bébé (intrant)]], [#block(breakable: false)[15 (88,2 %)]], [#block(breakable: false)[18 \/ 22]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Source de chaleur (équipement)]], [#block(breakable: false)[14 (82,4 %)]], [#block(breakable: false)[14 \/ 22]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Surface/espace dédié à la réanimation du nouveau-né, à proximité du lit (équipement)]], [#block(breakable: false)[3 (17,6 %)]], [#block(breakable: false)[3 \/ 22]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Ballon et masque néonatals (équipement)]], [#block(breakable: false)[3 (17,6 %)]], [#block(breakable: false)[3 \/ 22]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Appareil d'aspiration (équipement)]], [#block(breakable: false)[10 (58,8 %)]], [#block(breakable: false)[10 \/ 22]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Prestataire formé présent (ressources humaines)]], [#block(breakable: false)[2 (11,8 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Service organisé et continu (organisation du service)]], [#block(breakable: false)[1 (5,9 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[Réanimation néonat. : Niveau 2 (HGR)]], [#block(breakable: false)[24]], [#block(breakable: false)[Serviettes pour sécher/envelopper le nouveau-né (intrant)]], [#block(breakable: false)[18 (75,0 %)]], [#block(breakable: false)[23 \/ 37]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Couverture pour le bébé (intrant)]], [#block(breakable: false)[22 (91,7 %)]], [#block(breakable: false)[30 \/ 37]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Source de chaleur (équipement)]], [#block(breakable: false)[19 (79,2 %)]], [#block(breakable: false)[19 \/ 37]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Surface/espace dédié à la réanimation du nouveau-né, à proximité du lit (équipement)]], [#block(breakable: false)[7 (29,2 %)]], [#block(breakable: false)[7 \/ 37]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Ballon et masque néonatals (équipement)]], [#block(breakable: false)[6 (25,0 %)]], [#block(breakable: false)[6 \/ 37]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Appareil d'aspiration (équipement)]], [#block(breakable: false)[13 (54,2 %)]], [#block(breakable: false)[13 \/ 37]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Prestataire formé présent (ressources humaines)]], [#block(breakable: false)[3 (12,5 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[Réception urgences : Niveau 2 (HGR)]], [#block(breakable: false)[27]], [#block(breakable: false)[Tensiomètre \+ stéthoscope (équipement)]], [#block(breakable: false)[1 (3,7 %)]], [#block(breakable: false)[1 \/ 37]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Thermomètre (équipement)]], [#block(breakable: false)[4 (14,8 %)]], [#block(breakable: false)[4 \/ 37]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Contact préalable (référence)]], [#block(breakable: false)[8 (29,6 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Moyen de transport (référence)]], [#block(breakable: false)[21 (77,8 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Au moins un moyen de communication existant (communication)]], [#block(breakable: false)[1 (3,7 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Continuité de la communication (communication)]], [#block(breakable: false)[8 (29,6 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Moyens essentiels fonctionnels le jour de la visite (communication)]], [#block(breakable: false)[1 (3,7 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[Paludisme grave : Niveau 1 (CS)]], [#block(breakable: false)[96]], [#block(breakable: false)[Artésunate, suppositoire (intrant)]], [#block(breakable: false)[62 (64,6 %)]], [#block(breakable: false)[62 \/ 101]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Glucomètre et bandelettes (équipement)]], [#block(breakable: false)[63 (65,6 %)]], [#block(breakable: false)[63 \/ 101]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Cathéter/voie veineuse périphérique \+ seringues stériles (dont 10 cc) (équipement)]], [#block(breakable: false)[29 (30,2 %)]], [#block(breakable: false)[29 \/ 101]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Prestataire formé présent (ressources humaines)]], [#block(breakable: false)[3 (3,1 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Contact préalable (référence)]], [#block(breakable: false)[19 (19,8 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Moyen de transport (référence)]], [#block(breakable: false)[71 (74,0 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Continuité de la communication (communication)]], [#block(breakable: false)[12 (12,5 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Moyens essentiels fonctionnels le jour de la visite (communication)]], [#block(breakable: false)[10 (10,4 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Service organisé et continu (organisation du service)]], [#block(breakable: false)[2 (2,1 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[Paludisme grave : Niveau 1+ (CSR)]], [#block(breakable: false)[18]], [#block(breakable: false)[Artésunate, injectable (intrant)]], [#block(breakable: false)[6 (33,3 %)]], [#block(breakable: false)[6 \/ 22]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Glucomètre (équipement)]], [#block(breakable: false)[4 (22,2 %)]], [#block(breakable: false)[4 \/ 22]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Thermomètre (équipement)]], [#block(breakable: false)[2 (11,1 %)]], [#block(breakable: false)[2 \/ 22]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Tensiomètre (équipement)]], [#block(breakable: false)[4 (22,2 %)]], [#block(breakable: false)[4 \/ 22]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Échelle de coma (équipement)]], [#block(breakable: false)[10 (55,6 %)]], [#block(breakable: false)[10 \/ 22]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Prestataire formé présent (ressources humaines)]], [#block(breakable: false)[1 (5,6 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Contact préalable (référence)]], [#block(breakable: false)[5 (27,8 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Moyen de transport (référence)]], [#block(breakable: false)[13 (72,2 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Au moins un moyen de communication existant (communication)]], [#block(breakable: false)[2 (11,1 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Continuité de la communication (communication)]], [#block(breakable: false)[3 (16,7 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[Paludisme grave : Niveau 2 (HGR)]], [#block(breakable: false)[17]], [#block(breakable: false)[Artésunate, injectable (intrant)]], [#block(breakable: false)[8 (47,1 %)]], [#block(breakable: false)[8 \/ 37]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Glucomètre (équipement)]], [#block(breakable: false)[2 (11,8 %)]], [#block(breakable: false)[2 \/ 37]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Thermomètre (équipement)]], [#block(breakable: false)[2 (11,8 %)]], [#block(breakable: false)[2 \/ 37]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Tensiomètre (équipement)]], [#block(breakable: false)[1 (5,9 %)]], [#block(breakable: false)[1 \/ 37]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Échelle de coma (équipement)]], [#block(breakable: false)[10 (58,8 %)]], [#block(breakable: false)[10 \/ 37]],
    [#block(breakable: false)[MA compliquée : Niveau 1 (CS)]], [#block(breakable: false)[94]], [#block(breakable: false)[Brassard PB (ruban MUAC) (équipement)]], [#block(breakable: false)[32 (34,0 %)]], [#block(breakable: false)[32 \/ 98]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Balance (aucune des trois fonctionnelle) (équipement)]], [#block(breakable: false)[23 (24,5 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Prestataire formé présent (ressources humaines)]], [#block(breakable: false)[55 (58,5 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Contact préalable (référence)]], [#block(breakable: false)[19 (20,2 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Moyen de transport (référence)]], [#block(breakable: false)[71 (75,5 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Continuité de la communication (communication)]], [#block(breakable: false)[12 (12,8 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Moyens essentiels fonctionnels le jour de la visite (communication)]], [#block(breakable: false)[10 (10,6 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Service organisé et continu (organisation du service)]], [#block(breakable: false)[55 (58,5 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[MA compliquée : Niveau 1+ (CSR)]], [#block(breakable: false)[20]], [#block(breakable: false)[ReSoMal (solution de réhydratation) (intrant)]], [#block(breakable: false)[17 (85,0 %)]], [#block(breakable: false)[17 \/ 22]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[F75 (intrant)]], [#block(breakable: false)[18 (90,0 %)]], [#block(breakable: false)[18 \/ 22]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[F100 (intrant)]], [#block(breakable: false)[20 (100,0 %)]], [#block(breakable: false)[20 \/ 22]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Brassard PB (ruban MUAC) (équipement)]], [#block(breakable: false)[2 (10,0 %)]], [#block(breakable: false)[2 \/ 22]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Thermomètre (équipement)]], [#block(breakable: false)[5 (25,0 %)]], [#block(breakable: false)[5 \/ 22]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Balance (aucune des trois fonctionnelle) (équipement)]], [#block(breakable: false)[2 (10,0 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Prestataire formé présent (ressources humaines)]], [#block(breakable: false)[12 (60,0 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Service organisé et continu (organisation du service)]], [#block(breakable: false)[10 (50,0 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[MA compliquée : Niveau 2 (HGR)]], [#block(breakable: false)[31]], [#block(breakable: false)[ReSoMal (solution de réhydratation) (intrant)]], [#block(breakable: false)[26 (83,9 %)]], [#block(breakable: false)[26 \/ 37]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[F75 (intrant)]], [#block(breakable: false)[29 (93,5 %)]], [#block(breakable: false)[29 \/ 37]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[F100 (intrant)]], [#block(breakable: false)[29 (93,5 %)]], [#block(breakable: false)[29 \/ 37]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Brassard PB (ruban MUAC) (équipement)]], [#block(breakable: false)[6 (19,4 %)]], [#block(breakable: false)[6 \/ 37]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Thermomètre (équipement)]], [#block(breakable: false)[9 (29,0 %)]], [#block(breakable: false)[9 \/ 37]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Balance (aucune des trois fonctionnelle) (équipement)]], [#block(breakable: false)[6 (19,4 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Prestataire formé présent (ressources humaines)]], [#block(breakable: false)[10 (32,3 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Service organisé et continu (organisation du service)]], [#block(breakable: false)[11 (35,5 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[MAPI : Niveau 1 (CS)]], [#block(breakable: false)[93]], [#block(breakable: false)[Kit anti-choc (adrénaline) (intrant)]], [#block(breakable: false)[85 (91,4 %)]], [#block(breakable: false)[85 \/ 101]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Prestataire formé présent (ressources humaines)]], [#block(breakable: false)[2 (2,2 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Contact préalable (référence)]], [#block(breakable: false)[19 (20,4 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Moyen de transport (référence)]], [#block(breakable: false)[71 (76,3 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Continuité de la communication (communication)]], [#block(breakable: false)[12 (12,9 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Moyens essentiels fonctionnels le jour de la visite (communication)]], [#block(breakable: false)[10 (10,8 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Service organisé et continu (organisation du service)]], [#block(breakable: false)[4 (4,3 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Rapportage hebdomadaire sur trois mois (surveillance épidémiologique)]], [#block(breakable: false)[12 (12,9 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Notification des cas suspects de maladie à potentiel épidémique (surveillance épidémiologique)]], [#block(breakable: false)[7 (7,5 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[MAPI : Niveau 1+ (CSR)]], [#block(breakable: false)[18]], [#block(breakable: false)[Kit anti-choc (adrénaline) (intrant)]], [#block(breakable: false)[14 (77,8 %)]], [#block(breakable: false)[14 \/ 22]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Prestataire formé présent (ressources humaines)]], [#block(breakable: false)[2 (11,1 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Contact préalable (référence)]], [#block(breakable: false)[5 (27,8 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Moyen de transport (référence)]], [#block(breakable: false)[13 (72,2 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Au moins un moyen de communication existant (communication)]], [#block(breakable: false)[2 (11,1 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Continuité de la communication (communication)]], [#block(breakable: false)[3 (16,7 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Service organisé et continu (organisation du service)]], [#block(breakable: false)[3 (16,7 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Rapportage hebdomadaire sur trois mois (surveillance épidémiologique)]], [#block(breakable: false)[2 (11,1 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Notification des cas suspects de maladie à potentiel épidémique (surveillance épidémiologique)]], [#block(breakable: false)[1 (5,6 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[Référence urgente : Niveau 1 (CS)]], [#block(breakable: false)[80]], [#block(breakable: false)[Contact préalable (référence)]], [#block(breakable: false)[19 (23,8 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Moyen de transport (référence)]], [#block(breakable: false)[71 (88,8 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Continuité de la communication (communication)]], [#block(breakable: false)[12 (15,0 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Moyens essentiels fonctionnels le jour de la visite (communication)]], [#block(breakable: false)[10 (12,5 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[Référence urgente : Niveau 1+ (CSR)]], [#block(breakable: false)[14]], [#block(breakable: false)[Contact préalable (référence)]], [#block(breakable: false)[5 (35,7 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Moyen de transport (référence)]], [#block(breakable: false)[13 (92,9 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Au moins un moyen de communication existant (communication)]], [#block(breakable: false)[2 (14,3 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Continuité de la communication (communication)]], [#block(breakable: false)[3 (21,4 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[Référence urgente : Niveau 2 (HGR)]], [#block(breakable: false)[26]], [#block(breakable: false)[Contact préalable (référence)]], [#block(breakable: false)[8 (30,8 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Moyen de transport (référence)]], [#block(breakable: false)[21 (80,8 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Au moins un moyen de communication existant (communication)]], [#block(breakable: false)[1 (3,8 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Continuité de la communication (communication)]], [#block(breakable: false)[8 (30,8 %)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[Moyens essentiels fonctionnels le jour de la visite (communication)]], [#block(breakable: false)[1 (3,8 %)]], [#block(breakable: false)[\-]],
)
#v(4pt)

#heading(level: 2)[Annexe 10 : Compléments sur le cumul des blocages, les fragilités et les simulations]

#para[Les tableaux suivants donnent les effectifs qui accompagnent les figures du rapport sur le cumul des blocages, les fonctions jaunes proches du vert et les simulations de levée des contraintes.]

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 8.0pt, weight: "bold", fill: rgb("#131d44"))[Tableau A58 : Nombre de dimensions bloquantes par fonction rouge, par niveau]]
#set par(justify: false, leading: 0.62em)
#set text(size: 7.4pt)
#table(
  columns: (0.1555fr, 0.1140fr, 0.1462fr, 0.1460fr, 0.1461fr, 0.1460fr, 0.1463fr),
  inset: (x: 4.4pt, y: 3.2pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Niveau]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Fonctions rouges]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[1 dimension : n (%)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[2 dimensions : n (%)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[3 dimensions : n (%)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[≥ 4 dimensions : n (%)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[≥ 2 dimensions : n (%)]]]),
    [#block(breakable: false)[Niveau 1 (CS)]], [#block(breakable: false)[1 820]], [#block(breakable: false)[523 (28,7 %)]], [#block(breakable: false)[654 (35,9 %)]], [#block(breakable: false)[449 (24,7 %)]], [#block(breakable: false)[194 (10,7 %)]], [#block(breakable: false)[1 297 (71,3 %)]],
    [#block(breakable: false)[Niveau 1+ (CSR)]], [#block(breakable: false)[338]], [#block(breakable: false)[164 (48,5 %)]], [#block(breakable: false)[98 (29,0 %)]], [#block(breakable: false)[59 (17,5 %)]], [#block(breakable: false)[17 (5,0 %)]], [#block(breakable: false)[174 (51,5 %)]],
    [#block(breakable: false)[Niveau 2 (HGR)]], [#block(breakable: false)[421]], [#block(breakable: false)[252 (59,9 %)]], [#block(breakable: false)[104 (24,7 %)]], [#block(breakable: false)[47 (11,2 %)]], [#block(breakable: false)[18 (4,3 %)]], [#block(breakable: false)[169 (40,1 %)]],
    [#block(breakable: false)[Ensemble]], [#block(breakable: false)[2 579]], [#block(breakable: false)[939 (36,4 %)]], [#block(breakable: false)[856 (33,2 %)]], [#block(breakable: false)[555 (21,5 %)]], [#block(breakable: false)[229 (8,9 %)]], [#block(breakable: false)[1 640 (63,6 %)]],
)
#v(4pt)

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 8.799999999999999pt, weight: "bold", fill: rgb("#131d44"))[Tableau A59 : Fonctions jaunes à fragilité unique, par fonction]]
#set par(justify: false, leading: 0.62em)
#set text(size: 8.2pt)
#table(
  columns: (0.1969fr, 0.0935fr, 0.1557fr, 0.1971fr, 0.1973fr, 0.1594fr),
  inset: (x: 4.4pt, y: 2.3pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Fonction]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Fonctions jaunes]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Fragilité unique : n (% des jaunes)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Fragilité dominante parmi les fragilités uniques (n)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Fragilité la plus fréquente, toutes jaunes (n)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Fragilité présente dans toutes les jaunes de la fonction]]]),
    [#block(breakable: false)[Grossesse à risque]], [#block(breakable: false)[10]], [#block(breakable: false)[0 (0,0 %)]], [#block(breakable: false)[\-]], [#block(breakable: false)[Organisation du service (10)]], [#block(breakable: false)[Organisation du service, Capacité d'accueil]],
    [#block(breakable: false)[MA compliquée]], [#block(breakable: false)[14]], [#block(breakable: false)[5 (35,7 %)]], [#block(breakable: false)[Intrants et produits (2)]], [#block(breakable: false)[Eau, hygiène et assainissement (8)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[MAPI]], [#block(breakable: false)[12]], [#block(breakable: false)[3 (25,0 %)]], [#block(breakable: false)[Organisation du service (3)]], [#block(breakable: false)[Organisation du service (11)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[Réanimation néonat.]], [#block(breakable: false)[19]], [#block(breakable: false)[3 (15,8 %)]], [#block(breakable: false)[Intrants et produits (2)]], [#block(breakable: false)[Intrants et produits (14)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[Pré-éclampsie]], [#block(breakable: false)[27]], [#block(breakable: false)[5 (18,5 %)]], [#block(breakable: false)[Intrants et produits (3)]], [#block(breakable: false)[Eau, hygiène et assainissement (18)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[Paludisme grave]], [#block(breakable: false)[29]], [#block(breakable: false)[4 (13,8 %)]], [#block(breakable: false)[Équipements (2)]], [#block(breakable: false)[Intrants et produits (19)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[Chaîne du froid]], [#block(breakable: false)[27]], [#block(breakable: false)[5 (18,5 %)]], [#block(breakable: false)[Organisation du service (5)]], [#block(breakable: false)[Organisation du service (26)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[Césarienne d'urgence]], [#block(breakable: false)[14]], [#block(breakable: false)[2 (14,3 %)]], [#block(breakable: false)[Ressources humaines (2)]], [#block(breakable: false)[Ressources humaines (14)]], [#block(breakable: false)[Ressources humaines]],
    [#block(breakable: false)[Transfusion]], [#block(breakable: false)[12]], [#block(breakable: false)[5 (41,7 %)]], [#block(breakable: false)[Eau, hygiène et assainissement (2)]], [#block(breakable: false)[Eau, hygiène et assainissement (7)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[Référence urgente]], [#block(breakable: false)[40]], [#block(breakable: false)[6 (15,0 %)]], [#block(breakable: false)[Intrants et produits (4)]], [#block(breakable: false)[Intrants et produits (30)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[Réception urgences]], [#block(breakable: false)[10]], [#block(breakable: false)[2 (20,0 %)]], [#block(breakable: false)[Capacité d'accueil (1)]], [#block(breakable: false)[Capacité d'accueil (7)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[Accouchement assisté]], [#block(breakable: false)[16]], [#block(breakable: false)[4 (25,0 %)]], [#block(breakable: false)[Intrants et produits (2)]], [#block(breakable: false)[Eau, hygiène et assainissement (10)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[Hémorragie post-partum]], [#block(breakable: false)[47]], [#block(breakable: false)[6 (12,8 %)]], [#block(breakable: false)[Intrants et produits (5)]], [#block(breakable: false)[Intrants et produits (37)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[Sepsis obstétrical]], [#block(breakable: false)[46]], [#block(breakable: false)[6 (13,0 %)]], [#block(breakable: false)[Intrants et produits (3)]], [#block(breakable: false)[Eau, hygiène et assainissement (35)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[Surveillance épidémiologique]], [#block(breakable: false)[109]], [#block(breakable: false)[22 (20,2 %)]], [#block(breakable: false)[Données sanitaires (7)]], [#block(breakable: false)[Données sanitaires (81)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[MA non compliquée]], [#block(breakable: false)[2]], [#block(breakable: false)[1 (50,0 %)]], [#block(breakable: false)[Ressources humaines (1)]], [#block(breakable: false)[Eau, hygiène et assainissement (1)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[Accouchement normal]], [#block(breakable: false)[11]], [#block(breakable: false)[0 (0,0 %)]], [#block(breakable: false)[\-]], [#block(breakable: false)[Référence (11)]], [#block(breakable: false)[Référence]],
    [#block(breakable: false)[CPoN mère]], [#block(breakable: false)[27]], [#block(breakable: false)[0 (0,0 %)]], [#block(breakable: false)[\-]], [#block(breakable: false)[Organisation du service (24)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[CPN de routine]], [#block(breakable: false)[20]], [#block(breakable: false)[0 (0,0 %)]], [#block(breakable: false)[\-]], [#block(breakable: false)[Organisation du service (20)]], [#block(breakable: false)[Organisation du service, Capacité d'accueil]],
    [#block(breakable: false)[Vaccination de routine]], [#block(breakable: false)[23]], [#block(breakable: false)[3 (13,0 %)]], [#block(breakable: false)[Organisation du service (3)]], [#block(breakable: false)[Organisation du service (23)]], [#block(breakable: false)[Organisation du service]],
    [#block(breakable: false)[Soins du nouveau-né]], [#block(breakable: false)[36]], [#block(breakable: false)[1 (2,8 %)]], [#block(breakable: false)[Eau, hygiène et assainissement (1)]], [#block(breakable: false)[Intrants et produits (32)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[CPN \+ PTME]], [#block(breakable: false)[37]], [#block(breakable: false)[0 (0,0 %)]], [#block(breakable: false)[\-]], [#block(breakable: false)[Organisation du service (36)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[CPoN nouveau-né]], [#block(breakable: false)[50]], [#block(breakable: false)[1 (2,0 %)]], [#block(breakable: false)[Équipements (1)]], [#block(breakable: false)[Eau, hygiène et assainissement (35)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[Dépistage nutrition]], [#block(breakable: false)[61]], [#block(breakable: false)[23 (37,7 %)]], [#block(breakable: false)[Référence (17)]], [#block(breakable: false)[Référence (52)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[Paludisme simple]], [#block(breakable: false)[102]], [#block(breakable: false)[14 (13,7 %)]], [#block(breakable: false)[Référence (7)]], [#block(breakable: false)[Référence (88)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[Diagnostic paludisme]], [#block(breakable: false)[134]], [#block(breakable: false)[12 (9,0 %)]], [#block(breakable: false)[Référence (5)]], [#block(breakable: false)[Référence (116)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[Données sanitaires]], [#block(breakable: false)[95]], [#block(breakable: false)[19 (20,0 %)]], [#block(breakable: false)[Électricité (11)]], [#block(breakable: false)[Électricité (68)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[Intégration services]], [#block(breakable: false)[110]], [#block(breakable: false)[20 (18,2 %)]], [#block(breakable: false)[Référence (9)]], [#block(breakable: false)[Référence (93)]], [#block(breakable: false)[\-]],
    [#block(breakable: false)[Ensemble]], [#block(breakable: false)[1 140]], [#block(breakable: false)[172 (15,1 %)]], [#block(breakable: false)[]], [#block(breakable: false)[]], [#block(breakable: false)[]],
)
#v(4pt)

#para[_Fragilité unique : fonction jaune dont une seule dimension est jaune ou restrictive. Une fonction n’a aucune fragilité unique lorsque toutes ses fonctions jaunes cumulent au moins deux fragilités ; la dernière colonne indique, le cas échéant, la dimension présente dans toutes ses fonctions jaunes._]

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 8.799999999999999pt, weight: "bold", fill: rgb("#131d44"))[Tableau A60 : Rétablissement conjoint de tous les éléments critiques en déficit, par niveau]]
#set par(justify: false, leading: 0.62em)
#set text(size: 8.2pt)
#table(
  columns: (0.1347fr, 0.1556fr, 0.1347fr, 0.0832fr, 0.0830fr, 0.4087fr),
  inset: (x: 4.4pt, y: 3.2pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Niveau]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Fonctions rouges bloquées par ≥ 1 élément critique en déficit]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Restent rouges : n (%)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Passent jaune]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Passent vert]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Blocages résiduels (fonctions)]]]),
    [#block(breakable: false)[Niveau 1 (CS)]], [#block(breakable: false)[1 257]], [#block(breakable: false)[826 (65,7 %)]], [#block(breakable: false)[424]], [#block(breakable: false)[7]], [#block(breakable: false)[Référence 582 ; Organisation du service 233 ; Ressources humaines 195 ; Communication 92 ; Électricité 84 ; Intégration des services 31]],
    [#block(breakable: false)[Niveau 1+ (CSR)]], [#block(breakable: false)[253]], [#block(breakable: false)[103 (40,7 %)]], [#block(breakable: false)[148]], [#block(breakable: false)[2]], [#block(breakable: false)[Référence 39 ; Ressources humaines 37 ; Organisation du service 27 ; Électricité 26 ; Intégration des services 4 ; Communication 4]],
    [#block(breakable: false)[Niveau 2 (HGR)]], [#block(breakable: false)[309]], [#block(breakable: false)[60 (19,4 %)]], [#block(breakable: false)[245]], [#block(breakable: false)[4]], [#block(breakable: false)[Ressources humaines 35 ; Organisation du service 23 ; Électricité 22 ; Référence 4 ; Capacité d'accueil 2 ; Communication 1]],
    [#block(breakable: false)[Ensemble]], [#block(breakable: false)[1 819]], [#block(breakable: false)[989 (54,4 %)]], [#block(breakable: false)[817]], [#block(breakable: false)[13]], [#block(breakable: false)[Référence 625 ; Organisation du service 283 ; Ressources humaines 267 ; Électricité 132 ; Communication 97 ; Intégration des services 35]],
)
#v(4pt)

#para[_Base : fonctions rouges bloquées par les intrants ou les équipements (au moins un élément critique, ou un groupe substituable entier, en déficit). Les blocages résiduels se cumulent dans une même fonction._]

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 8.0pt, weight: "bold", fill: rgb("#131d44"))[Tableau A61 : Fonctions rouges libérées par le rétablissement d’un seul élément critique, par niveau]]
#set par(justify: false, leading: 0.62em)
#set text(size: 7.4pt)
#table(
  columns: (0.1347fr, 0.3217fr, 0.1039fr, 0.1245fr, 0.1039fr, 0.0830fr, 0.1283fr),
  inset: (x: 4.4pt, y: 2.3pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Niveau]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Élément critique rétabli seul]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Type]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Fonctions rouges où l’élément manque]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Sorties du rouge : vers jaune]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[vers vert]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Total libérées : n (% des rouges dépendantes)]]]),
    [#block(breakable: false)[Niveau 1 (CS)]], [#block(breakable: false)[Source de chaleur (salle et nouveau-né)]], [#block(breakable: false)[Équipement]], [#block(breakable: false)[154]], [#block(breakable: false)[28]], [#block(breakable: false)[2]], [#block(breakable: false)[30 (19,5 %)]],
    [#block(breakable: false)[]], [#block(breakable: false)[Bandelettes urinaires (protéinurie)]], [#block(breakable: false)[Intrant]], [#block(breakable: false)[154]], [#block(breakable: false)[15]], [#block(breakable: false)[0]], [#block(breakable: false)[15 (9,7 %)]],
    [#block(breakable: false)[]], [#block(breakable: false)[Lit ou table d'examen avec linge propre]], [#block(breakable: false)[Équipement]], [#block(breakable: false)[113]], [#block(breakable: false)[5]], [#block(breakable: false)[0]], [#block(breakable: false)[5 (4,4 %)]],
    [#block(breakable: false)[]], [#block(breakable: false)[Gants (utilité, stériles, longs pour délivrance manuelle)]], [#block(breakable: false)[Intrant]], [#block(breakable: false)[102]], [#block(breakable: false)[2]], [#block(breakable: false)[1]], [#block(breakable: false)[3 (2,9 %)]],
    [#block(breakable: false)[]], [#block(breakable: false)[Brassard PB (ruban MUAC)]], [#block(breakable: false)[Équipement]], [#block(breakable: false)[96]], [#block(breakable: false)[6]], [#block(breakable: false)[0]], [#block(breakable: false)[6 (6,2 %)]],
    [#block(breakable: false)[]], [#block(breakable: false)[ATPE (Aliment Thérapeutique Prêt à l'Emploi)]], [#block(breakable: false)[Intrant]], [#block(breakable: false)[87]], [#block(breakable: false)[7]], [#block(breakable: false)[2]], [#block(breakable: false)[9 (10,3 %)]],
    [#block(breakable: false)[]], [#block(breakable: false)[Kit d'accouchement à usage unique (champ plastique, liens de cordon stériles, lame stérile, chlorhexidine 4%)]], [#block(breakable: false)[Intrant]], [#block(breakable: false)[84]], [#block(breakable: false)[15]], [#block(breakable: false)[0]], [#block(breakable: false)[15 (17,9 %)]],
    [#block(breakable: false)[]], [#block(breakable: false)[Tensiomètre \+ stéthoscope]], [#block(breakable: false)[Équipement]], [#block(breakable: false)[82]], [#block(breakable: false)[5]], [#block(breakable: false)[0]], [#block(breakable: false)[5 (6,1 %)]],
    [#block(breakable: false)[]], [#block(breakable: false)[Méthyldopa (alpha)]], [#block(breakable: false)[Intrant]], [#block(breakable: false)[80]], [#block(breakable: false)[4]], [#block(breakable: false)[1]], [#block(breakable: false)[5 (6,2 %)]],
    [#block(breakable: false)[]], [#block(breakable: false)[Sulfate de magnésium]], [#block(breakable: false)[Intrant]], [#block(breakable: false)[77]], [#block(breakable: false)[8]], [#block(breakable: false)[0]], [#block(breakable: false)[8 (10,4 %)]],
    [#block(breakable: false)[]], [#block(breakable: false)[Appareil d'aspiration \+ sondes d'aspiration]], [#block(breakable: false)[Équipement]], [#block(breakable: false)[77]], [#block(breakable: false)[4]], [#block(breakable: false)[0]], [#block(breakable: false)[4 (5,2 %)]],
    [#block(breakable: false)[]], [#block(breakable: false)[Bandelettes urinaires (protéinurie/glycosurie)]], [#block(breakable: false)[Intrant]], [#block(breakable: false)[75]], [#block(breakable: false)[5]], [#block(breakable: false)[0]], [#block(breakable: false)[5 (6,7 %)]],
    [#block(breakable: false)[Niveau 1+ (CSR)]], [#block(breakable: false)[Source de chaleur (salle et nouveau-né)]], [#block(breakable: false)[Équipement]], [#block(breakable: false)[28]], [#block(breakable: false)[10]], [#block(breakable: false)[0]], [#block(breakable: false)[10 (35,7 %)]],
    [#block(breakable: false)[]], [#block(breakable: false)[Gants (utilité, stériles, longs pour délivrance manuelle)]], [#block(breakable: false)[Intrant]], [#block(breakable: false)[25]], [#block(breakable: false)[4]], [#block(breakable: false)[0]], [#block(breakable: false)[4 (16,0 %)]],
    [#block(breakable: false)[]], [#block(breakable: false)[Bandelettes urinaires (protéinurie)]], [#block(breakable: false)[Intrant]], [#block(breakable: false)[24]], [#block(breakable: false)[7]], [#block(breakable: false)[0]], [#block(breakable: false)[7 (29,2 %)]],
    [#block(breakable: false)[]], [#block(breakable: false)[F100 \/ F100-dilué]], [#block(breakable: false)[Intrant]], [#block(breakable: false)[20]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[1 (5,0 %)]],
    [#block(breakable: false)[]], [#block(breakable: false)[F75]], [#block(breakable: false)[Intrant]], [#block(breakable: false)[18]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0 (0,0 %)]],
    [#block(breakable: false)[]], [#block(breakable: false)[Réfrigérateur à sang \/ banque de sang (conservation des poches)]], [#block(breakable: false)[Équipement]], [#block(breakable: false)[17]], [#block(breakable: false)[7]], [#block(breakable: false)[0]], [#block(breakable: false)[7 (41,2 %)]],
    [#block(breakable: false)[]], [#block(breakable: false)[ReSoMal (solution de réhydratation)]], [#block(breakable: false)[Intrant]], [#block(breakable: false)[17]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0 (0,0 %)]],
    [#block(breakable: false)[]], [#block(breakable: false)[Seringues et aiguilles (dont 1-2 ml pour le nouveau-né)]], [#block(breakable: false)[Intrant]], [#block(breakable: false)[16]], [#block(breakable: false)[5]], [#block(breakable: false)[0]], [#block(breakable: false)[5 (31,2 %)]],
    [#block(breakable: false)[]], [#block(breakable: false)[Lit d'accouchement (semi-assis ou décubitus latéral, étriers amovibles)]], [#block(breakable: false)[Équipement]], [#block(breakable: false)[16]], [#block(breakable: false)[3]], [#block(breakable: false)[0]], [#block(breakable: false)[3 (18,8 %)]],
    [#block(breakable: false)[]], [#block(breakable: false)[Réfrigérateur PEV (absorption, compression ou solaire, homologué OMS)]], [#block(breakable: false)[Équipement]], [#block(breakable: false)[16]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[1 (6,2 %)]],
    [#block(breakable: false)[]], [#block(breakable: false)[Kit d'accouchement à usage unique (champ plastique, liens de cordon stériles, lame stérile, chlorhexidine 4%)]], [#block(breakable: false)[Intrant]], [#block(breakable: false)[15]], [#block(breakable: false)[3]], [#block(breakable: false)[0]], [#block(breakable: false)[3 (20,0 %)]],
    [#block(breakable: false)[]], [#block(breakable: false)[Couverture pour le bébé]], [#block(breakable: false)[Intrant]], [#block(breakable: false)[15]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0 (0,0 %)]],
    [#block(breakable: false)[Niveau 2 (HGR)]], [#block(breakable: false)[Seringues et aiguilles (dont 1-2 ml pour le nouveau-né)]], [#block(breakable: false)[Intrant]], [#block(breakable: false)[44]], [#block(breakable: false)[14]], [#block(breakable: false)[1]], [#block(breakable: false)[15 (34,1 %)]],
    [#block(breakable: false)[]], [#block(breakable: false)[Source de chaleur (salle et nouveau-né)]], [#block(breakable: false)[Équipement]], [#block(breakable: false)[38]], [#block(breakable: false)[14]], [#block(breakable: false)[0]], [#block(breakable: false)[14 (36,8 %)]],
    [#block(breakable: false)[]], [#block(breakable: false)[Gants (utilité, stériles, longs pour délivrance manuelle)]], [#block(breakable: false)[Intrant]], [#block(breakable: false)[30]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0 (0,0 %)]],
    [#block(breakable: false)[]], [#block(breakable: false)[F75]], [#block(breakable: false)[Intrant]], [#block(breakable: false)[29]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[1 (3,4 %)]],
    [#block(breakable: false)[]], [#block(breakable: false)[F100 \/ F100-dilué]], [#block(breakable: false)[Intrant]], [#block(breakable: false)[29]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0 (0,0 %)]],
    [#block(breakable: false)[]], [#block(breakable: false)[Kit d'accouchement à usage unique (champ plastique, liens de cordon stériles, lame stérile, chlorhexidine 4%)]], [#block(breakable: false)[Intrant]], [#block(breakable: false)[28]], [#block(breakable: false)[8]], [#block(breakable: false)[0]], [#block(breakable: false)[8 (28,6 %)]],
    [#block(breakable: false)[]], [#block(breakable: false)[ReSoMal (solution de réhydratation)]], [#block(breakable: false)[Intrant]], [#block(breakable: false)[26]], [#block(breakable: false)[1]], [#block(breakable: false)[0]], [#block(breakable: false)[1 (3,8 %)]],
    [#block(breakable: false)[]], [#block(breakable: false)[Couverture pour le bébé]], [#block(breakable: false)[Intrant]], [#block(breakable: false)[22]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0 (0,0 %)]],
    [#block(breakable: false)[]], [#block(breakable: false)[Lit ou table d'examen avec linge propre]], [#block(breakable: false)[Équipement]], [#block(breakable: false)[20]], [#block(breakable: false)[6]], [#block(breakable: false)[0]], [#block(breakable: false)[6 (30,0 %)]],
    [#block(breakable: false)[]], [#block(breakable: false)[Réfrigérateur à sang \/ banque de sang (conservation des poches)]], [#block(breakable: false)[Équipement]], [#block(breakable: false)[19]], [#block(breakable: false)[5]], [#block(breakable: false)[0]], [#block(breakable: false)[5 (26,3 %)]],
    [#block(breakable: false)[]], [#block(breakable: false)[Trousse de perfusion IV]], [#block(breakable: false)[Intrant]], [#block(breakable: false)[18]], [#block(breakable: false)[2]], [#block(breakable: false)[0]], [#block(breakable: false)[2 (11,1 %)]],
    [#block(breakable: false)[]], [#block(breakable: false)[Serviettes pour sécher/envelopper le nouveau-né]], [#block(breakable: false)[Intrant]], [#block(breakable: false)[18]], [#block(breakable: false)[0]], [#block(breakable: false)[0]], [#block(breakable: false)[0 (0,0 %)]],
)
#v(4pt)

#para[_Douze éléments par niveau, classés par nombre de fonctions rouges dépendantes. Scénario : l’élément est rendu disponible (intrant disponible sans rupture ; équipement présent et fonctionnel), toutes les autres conditions restant inchangées._]

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 8.0pt, weight: "bold", fill: rgb("#131d44"))[Tableau A62 : Fonctions rouges libérées à chaque étape du paquet cumulatif]]
#set par(justify: false, leading: 0.62em)
#set text(size: 7.4pt)
#table(
  columns: (0.0620fr, 0.1868fr, 0.1142fr, 0.1144fr, 0.1557fr, 0.1246fr, 0.1285fr, 0.1138fr),
  inset: (x: 4.4pt, y: 3.2pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Étape]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Dimension ajoutée au paquet]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Rouge → Vert (cumul)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Rouge → Jaune (cumul)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Libérées (cumul) : n (% des rouges)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Gain additionnel de l’étape]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[dont rouge → vert additionnel]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Restent rouges]]]),
    [#block(breakable: false)[1]], [#block(breakable: false)[Intrants et produits]], [#block(breakable: false)[19]], [#block(breakable: false)[319]], [#block(breakable: false)[338 (13,1 %)]], [#block(breakable: false)[338]], [#block(breakable: false)[19]], [#block(breakable: false)[2 241]],
    [#block(breakable: false)[2]], [#block(breakable: false)[Équipements]], [#block(breakable: false)[36]], [#block(breakable: false)[825]], [#block(breakable: false)[861 (33,4 %)]], [#block(breakable: false)[523]], [#block(breakable: false)[17]], [#block(breakable: false)[1 718]],
    [#block(breakable: false)[3]], [#block(breakable: false)[Référence]], [#block(breakable: false)[55]], [#block(breakable: false)[1 545]], [#block(breakable: false)[1 600 (62,0 %)]], [#block(breakable: false)[739]], [#block(breakable: false)[19]], [#block(breakable: false)[979]],
    [#block(breakable: false)[4]], [#block(breakable: false)[Eau, hygiène et assainissement]], [#block(breakable: false)[215]], [#block(breakable: false)[1 385]], [#block(breakable: false)[1 600 (62,0 %)]], [#block(breakable: false)[0]], [#block(breakable: false)[160]], [#block(breakable: false)[979]],
    [#block(breakable: false)[5]], [#block(breakable: false)[Électricité]], [#block(breakable: false)[397]], [#block(breakable: false)[1 372]], [#block(breakable: false)[1 769 (68,6 %)]], [#block(breakable: false)[169]], [#block(breakable: false)[182]], [#block(breakable: false)[810]],
    [#block(breakable: false)[6]], [#block(breakable: false)[Ressources humaines]], [#block(breakable: false)[696]], [#block(breakable: false)[1 183]], [#block(breakable: false)[1 879 (72,9 %)]], [#block(breakable: false)[110]], [#block(breakable: false)[299]], [#block(breakable: false)[700]],
    [#block(breakable: false)[7]], [#block(breakable: false)[Organisation du service]], [#block(breakable: false)[1 363]], [#block(breakable: false)[947]], [#block(breakable: false)[2 310 (89,6 %)]], [#block(breakable: false)[431]], [#block(breakable: false)[667]], [#block(breakable: false)[269]],
    [#block(breakable: false)[8]], [#block(breakable: false)[Communication]], [#block(breakable: false)[1 757]], [#block(breakable: false)[766]], [#block(breakable: false)[2 523 (97,8 %)]], [#block(breakable: false)[213]], [#block(breakable: false)[394]], [#block(breakable: false)[56]],
    [#block(breakable: false)[9]], [#block(breakable: false)[Intégration des services]], [#block(breakable: false)[1 958]], [#block(breakable: false)[601]], [#block(breakable: false)[2 559 (99,2 %)]], [#block(breakable: false)[36]], [#block(breakable: false)[201]], [#block(breakable: false)[20]],
)
#v(4pt)

#para[_Base : 2 579 fonctions rouges. Lorsqu’une même observation relève de plusieurs dimensions (par exemple l’organisation du service et la référence pour la référence urgente), elle est résolue en même temps pour ces dimensions._]

#heading(level: 2)[Annexe 11 : Analyse de sensibilité : observations rattachées à plusieurs dimensions]

#para[La grille de classification rattache certaines observations à plus d’une dimension : le moyen de transport est ainsi lu à la fois comme composante du circuit de référence, comme équipement et comme élément d’organisation du service de la référence urgente, et le kit anti-choc comme intrant et comme équipement pour les MAPI. Ce choix reflète la nature transversale de ces éléments, mais il peut augmenter le nombre de dimensions comptées pour une même fonction rouge. Pour en mesurer l’effet, les principaux indicateurs ont été recalculés en rattachant chaque observation à une seule dimension.]

#para[Les ordres de grandeur et les messages du rapport restent inchangés. Les intrants et les équipements demeurent les deux premières dimensions bloquantes ; plus d’une fonction rouge sur deux cumule au moins deux blocages (56,3 %, contre 63,6 %) ; la paire intrants \+ équipements reste la plus efficace et la plus complémentaire (Δ = 247, contre 261). Le principal effet porte sur la référence, dont le gain lorsqu’elle est résolue seule passe de 5,9 % à 10,0 % des fonctions rouges.]

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 8.799999999999999pt, weight: "bold", fill: rgb("#131d44"))[Tableau A63 : Observations lues dans plusieurs dimensions de la grille]]
#set par(justify: false, leading: 0.62em)
#set text(size: 8.2pt)
#table(
  columns: (0.1450fr, 0.3322fr, 0.2323fr, 0.1245fr, 0.1659fr),
  inset: (x: 4.4pt, y: 3.2pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Fonction]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Observation commune]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Dimensions concernées]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Fonctions rouges]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Fonctions rouges où ces dimensions bloquent ensemble (n)]]]),
    [#block(breakable: false)[Référence urgente]], [#block(breakable: false)[Mécanisme de référence (destination, contact, transport) : lu comme organisation du service, comme équipements et comme référence]], [#block(breakable: false)[Organisation du service = Référence ; Équipements = Référence]], [#block(breakable: false)[120]], [#block(breakable: false)[113]],
    [#block(breakable: false)[Réception urgences]], [#block(breakable: false)[Mécanisme de référence : lu comme organisation du service et comme référence]], [#block(breakable: false)[Organisation du service = Référence]], [#block(breakable: false)[27]], [#block(breakable: false)[24]],
    [#block(breakable: false)[Intégration services]], [#block(breakable: false)[Intégration des services : lue comme équipements et comme intégration]], [#block(breakable: false)[Équipements = Intégration des services]], [#block(breakable: false)[45]], [#block(breakable: false)[0]],
    [#block(breakable: false)[Données sanitaires]], [#block(breakable: false)[Données sanitaires (SNIS) : lues comme organisation du service et comme données sanitaires]], [#block(breakable: false)[Organisation du service = Données sanitaires]], [#block(breakable: false)[53]], [#block(breakable: false)[53]],
    [#block(breakable: false)[Surveillance épidémio]], [#block(breakable: false)[Surveillance : lue comme organisation du service et comme surveillance]], [#block(breakable: false)[Organisation du service = Surveillance épidémiologique]], [#block(breakable: false)[43]], [#block(breakable: false)[20]],
    [#block(breakable: false)[MAPI]], [#block(breakable: false)[Kit anti-choc \/ adrénaline : lu comme intrant et comme équipement]], [#block(breakable: false)[Équipements = Intrants et produits]], [#block(breakable: false)[111]], [#block(breakable: false)[99]],
)
#v(4pt)

#v(6pt)
#block(width: 100%, above: 0pt, below: 3.5pt, breakable: false)[#text(size: 9.6pt, weight: "bold", fill: rgb("#131d44"))[Tableau A64 : Effet du rattachement unique sur les principaux indicateurs]]
#set par(justify: false, leading: 0.62em)
#set text(size: 9.0pt)
#table(
  columns: (0.4813fr, 0.2594fr, 0.2593fr),
  inset: (x: 4.4pt, y: 3.2pt),
  align: left + top,
  stroke: (x, y) => if y == 0 { (bottom: 0.9pt + rgb("#131d44")) } else { (bottom: 0.35pt + rgb("#c9d2ee")) },
  fill: (col, row) => if row == 0 { rgb("#131d44") } else if calc.odd(row) { rgb("#fffbf7") } else { rgb("#eef2fd") },
  table.header(repeat: true, table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Indicateur]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Grille appliquée telle quelle (chiffres du rapport)]]], table.cell(fill: rgb("#131d44"))[#block(breakable: false)[#text(fill: white, weight: "bold")[Chaque observation rattachée à une seule dimension]]]),
    [#block(breakable: false)[Bloque : Intrants et produits (n, % des rouges)]], [#block(breakable: false)[1 357 (52,6 %)]], [#block(breakable: false)[1 357 (52,6 %)]],
    [#block(breakable: false)[Bloque : Équipements (n, % des rouges)]], [#block(breakable: false)[1 370 (53,1 %)]], [#block(breakable: false)[1 158 (44,9 %)]],
    [#block(breakable: false)[Bloque : Référence (n, % des rouges)]], [#block(breakable: false)[1 038 (40,2 %)]], [#block(breakable: false)[1 038 (40,2 %)]],
    [#block(breakable: false)[Bloque : Organisation du service (n, % des rouges)]], [#block(breakable: false)[583 (22,6 %)]], [#block(breakable: false)[373 (14,5 %)]],
    [#block(breakable: false)[Bloque : Intégration des services (n, % des rouges)]], [#block(breakable: false)[81 (3,1 %)]], [#block(breakable: false)[81 (3,1 %)]],
    [#block(breakable: false)[Bloque : Données sanitaires (n, % des rouges)]], [#block(breakable: false)[53 (2,1 %)]], [#block(breakable: false)[53 (2,1 %)]],
    [#block(breakable: false)[Bloque : Surveillance épidémiologique (n, % des rouges)]], [#block(breakable: false)[38 (1,5 %)]], [#block(breakable: false)[38 (1,5 %)]],
    [#block(breakable: false)[Fonctions rouges à ≥ 2 dimensions bloquantes (n, %)]], [#block(breakable: false)[1 640 (63,6 %)]], [#block(breakable: false)[1 453 (56,3 %)]],
    [#block(breakable: false)[Fonctions rouges à ≥ 3 dimensions bloquantes (n, %)]], [#block(breakable: false)[784 (30,4 %)]], [#block(breakable: false)[598 (23,2 %)]],
    [#block(breakable: false)[Fonctions rouges à blocage unique (n, %)]], [#block(breakable: false)[939 (36,4 %)]], [#block(breakable: false)[1 126 (43,7 %)]],
    [#block(breakable: false)[Libère si résolue seule : Intrants et produits (n, % des rouges)]], [#block(breakable: false)[338 (13,1 %)]], [#block(breakable: false)[352 (13,6 %)]],
    [#block(breakable: false)[Libère si résolue seule : Équipements (n, % des rouges)]], [#block(breakable: false)[262 (10,2 %)]], [#block(breakable: false)[262 (10,2 %)]],
    [#block(breakable: false)[Libère si résolue seule : Référence (n, % des rouges)]], [#block(breakable: false)[152 (5,9 %)]], [#block(breakable: false)[258 (10,0 %)]],
    [#block(breakable: false)[Libère si résolue seule : Organisation du service (n, % des rouges)]], [#block(breakable: false)[7 (0,3 %)]], [#block(breakable: false)[7 (0,3 %)]],
    [#block(breakable: false)[Paire intrants \+ équipements : gain (n, %) ; complémentarité Δ]], [#block(breakable: false)[861 (33,4 %) ; Δ = 261]], [#block(breakable: false)[861 (33,4 %) ; Δ = 247]],
)
#v(4pt)

#para[_Dans la lecture à rattachement unique, la dimension dupliquée n’est pas comptée lorsque la dimension d’origine bloque déjà la fonction ; dans les simulations, résoudre la dimension d’origine résout aussi la dimension dupliquée. La grille de classification elle-même n’est pas modifiée._]


#pagebreak()
#set page(fill: rgb("#c2cfea"), header: none, footer: none)
#block(width: 100%, height: 100%)[
  #place(top + left, dx: -21mm, dy: -23mm, rect(width: 210mm, height: 29pt, fill: rgb("#131d44")))
  #place(bottom + left, dx: -21mm, dy: 27mm, rect(width: 210mm, height: 26pt, fill: rgb("#131d44")))
  #align(center + horizon)[
    #image("/home/user/Rp/assets/img/image3.png", width: 5.2cm)
    #v(14pt)
    #text(font: display, size: 21pt, fill: rgb("#131d44"))[DIAGNOSTIC OPÉRATIONNEL RAPIDE]
    #v(2pt)
    #text(font: script, size: 17pt, fill: rgb("#131d44"))[Établissements de soins de santé · RDC]
    #v(12pt)
    #line(length: 34%, stroke: 0.9pt + rgb("#131d44"))
    #v(12pt)
    #text(size: 8.8pt, fill: rgb("#0f1015"))[ICHESS, LLC · Projet EpiC RDC · FHI 360]
    #v(3pt)
    #text(size: 8.8pt, fill: rgb("#0f1015"))[Kinshasa, RDC · Octobre 2026]
    #v(18pt)
    #image("/home/user/Rp/assets/img/image2.png", width: 4.4cm)
  ]
]
