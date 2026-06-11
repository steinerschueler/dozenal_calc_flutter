part of 'info_content.dart';

/// French chapter content. Uses the locale-specific dozenal pronunciation
/// convention agreed on with the user: "douzaine" as the base unit,
/// hyphen at unit position parallel to "vingt-trois", "et un" exception
/// at position 1 when the douzaine multiplier is 2–B (parallel to French
/// decimal "vingt et un"), pure juxtaposition between magnitudes (no
/// magnitude-level "et" connector — mirrors French decimal "cent vingt
/// et un" which has a single "et" only at the position-1 spot). Germanic
/// magnitude loan-words (quader, cuber, tesser, penter, hexer, hepter)
/// stay invariant across all languages.
List<Widget> _chapterFr(int chapter, AppLocalizations l) {
  switch (chapter) {
    case 0:
      return [
        const _H("Les chiffres"),
        const _P(
          "Cette calculatrice utilise ses propres symboles pour les "
          "douze chiffres. Quatre chiffres-pivots sont des pointes de "
          "flèche stylisées pointant dans les quatre points cardinaux "
          "— 1 (haut), 4 (gauche), 7 (droite), A (bas). Ils divisent "
          "le cercle numérique en quatre groupes de trois, comme les "
          "heures 12, 3, 6 et 9 sur un cadran d'horloge.",
        ),
        const _P(
          "Tous les chiffres intermédiaires sont construits à partir "
          "de demi-cercles et de cercles pleins. Le zéro est un simple "
          "cercle, B (= onze) un demi-cercle au-dessus d’un cercle plein.",
        ),
        const _DigitLegend(),
        const _H("Utilisation de base"),
        const _P(
          "Tapez les nombres et les opérateurs comme sur une "
          "calculatrice de poche ordinaire. Appuyez sur la large "
          "touche = en bas pour calculer le résultat. AC (en rouge "
          "d'avertissement) efface toute la saisie et le résultat ; "
          "Del supprime le caractère à gauche du curseur.",
        ),
        const _H("Aide et théorie"),
        const _P(
          "À gauche et à droite de la touche =, deux boutons ronds : "
          "(i) ouvre ces douze chapitres de théorie, (?) rejoue la "
          "visite guidée avec les marqueurs rouges. La visite "
          "s'ouvre automatiquement au premier lancement.",
        ),
        const _H("Curseur et navigation"),
        const _P(
          "La barre rouge dans le champ de saisie est le curseur. "
          "Utilisez ◀ et ▶ pour le déplacer, en insérant ou en "
          "supprimant des caractères au milieu d'une formule. Après "
          "un calcul, le curseur passe dans le champ de résultat — "
          "les flèches déplacent alors le curseur du résultat. Dès "
          "qu'une nouvelle saisie commence, le curseur revient dans "
          "le champ de saisie.",
        ),
        const _H("Poursuivre un calcul"),
        const _P(
          "Après un calcul, vous pouvez poursuivre directement avec "
          "un opérateur. Tapez + 5 = par exemple, et la calculatrice "
          "utilise automatiquement le dernier résultat comme premier "
          "opérande. Pour commencer un calcul entièrement nouveau, "
          "appuyez d'abord sur AC.",
        ),
        const _H("Double appui pour les fonctions inverses"),
        const _P(
          "Un second appui sur une touche de fonction la transforme "
          "en son inverse : sin devient sin⁻¹, cos devient cos⁻¹, et "
          "ainsi de suite. La même règle s'applique aux fonctions "
          "hyperboliques du panneau d'extension. Un petit point doré "
          "sur la touche signale que le prochain appui inversera.",
        ),
        const _H("Appui long pour plus de fonctions"),
        const _P(
          "Les touches marquées d'un petit coin en bas à droite "
          "offrent des fonctions apparentées par appui long : x□ "
          "contient x², log contient ln, log₁₂ et eˣ, − contient ±, "
          "STO contient M+ et M−, n! contient nCr et nPr. Pour "
          "choisir, glissez le doigt sur l'option voulue et relâchez "
          "— ou relâchez puis touchez l'option. Un tap à côté ferme "
          "le panneau.",
        ),
        const _H("Opérateurs spéciaux"),
        const _P(
          "x² élève le nombre précédent au carré. √ calcule la racine "
          "carrée ; si un nombre se trouve à sa gauche, ce nombre sert de "
          "degré de la racine : 3√8 donne la racine cubique de 8, soit 2. "
          "log calcule un logarithme où le nombre de gauche est l'argument "
          "et celui de droite la base : 8 log 2 est le logarithme de 8 en "
          "base 2, soit 3. ⊕ calcule la somme parallèle : "
          "a ⊕ b = (a·b)/(a+b), utile pour les résistances en "
          "parallèle.",
        ),
        const _H("Panneau d'extension"),
        const _P(
          "La touche … en bas à droite ouvre le panneau d'extension "
          "avec d'autres fonctions : mémoire, constantes (π, e, φ, "
          "√2), fonctions hyperboliques, opérateurs avancés, ainsi "
          "que EXP et DRG. La même touche le ferme, ou un tap en dehors du "
          "panneau. Sur tablette, tous les ensembles sont visibles "
          "côte à côte de toute façon — pas de superposition.",
        ),
        const _Pre(
          "  6 — Mémoire :        STO   RCL   MC    Ans\n"
          "  7 — Constantes :     π     e     φ     √2\n"
          "  8 — Hyperboliques :  sinh  cosh  tanh  coth\n"
          "  9 — Avancés :        n!    |x|   1/x   mod\n"
          "  10 — Modes :         EXP   DRG   …",
        ),
        const _H("Mémoire"),
        const _P(
          "STO mémorise le résultat actuel, RCL insère la valeur "
          "mémorisée dans la saisie, MC efface la mémoire. Un petit "
          "M sur l'écran indique que quelque chose est mémorisé. Ans "
          "insère le résultat du dernier calcul — les valeurs "
          "rationnelles exactes sont mémorisées entièrement, la "
          "périodicité est préservée.",
        ),
        const _H("Trait de période"),
        const _P(
          "Lorsque le résultat est une fraction périodique, la "
          "calculatrice marque les chiffres répétés d'une barre "
          "au-dessus. Exemple : 1/5 donne 0.2497 avec une barre sur "
          "les quatre chiffres. Pour les périodes de plus de cinq "
          "chiffres, seuls les cinq premiers sont affichés, suivis "
          "de …",
        ),
        const _H("Système numérique : Doz / Dez"),
        const _P(
          "Vous changez le système numérique dans les réglages, "
          "accessibles via la touche (i) : duodécimal calcule en base "
          "12 (par défaut), décimal en base 10. Le système actif "
          "s'affiche en haut à droite de l'écran.",
        ),
        const _P(
          "En basculant, le nombre actuellement visible est "
          "automatiquement converti dans l'autre système. « 10 » en "
          "Doz devient « 12 » en Dez. En mode Dez, les symboles 10 "
          "et 11 deviennent inactifs (grisés), puisqu'ils n'existent "
          "pas comme chiffres uniques en base 10 — pour le Doz, il "
          "suffit de rebasculer.",
        ),
        const _H("Mode angle"),
        const _P(
          "DRG cycle le mode angle pour les fonctions "
          "trigonométriques : DEG → RAD → GRAD → DEG. Le mode actuel "
          "s'affiche en haut à droite de l'écran, juste au-dessus de "
          "l'indicateur Doz/Dez. Par défaut : DEG.",
        ),
      ];
    case 1:
      return [
        const _H("Le principe"),
        const _P(
          "En décimal, chaque position a une valeur dix fois "
          "supérieure à la position à sa droite : unités, dizaines, "
          "centaines. Dans le système duodécimal, la base n'est pas "
          "dix mais douze. Les valeurs de position sont des "
          "puissances de 12 : unités, douzaines, "
          "cent-quarante-quatres. Le nombre « 100 » ne signifie pas "
          "ici dix fois dix mais douze fois douze — soit 144 en "
          "décimal.",
        ),
        const _P(
          "Cela demande douze chiffres au lieu de dix. Deux nouveaux "
          "s'ajoutent pour les valeurs dix et onze ; cette "
          "calculatrice leur donne leurs propres symboles (A = dix, "
          "B = onze). Exemple : 2B (duodécimal) = 2·12 + 11 = 35 "
          "(décimal).",
        ),
        const _H("Comment prononcer le duodécimal ?"),
        const _P(
          "Les unités 0–9 restent comme vous les connaissez : zéro, "
          "un, deux … neuf. Les nouveaux glyphes A et B se lisent "
          "dix et onze — même magnitude que les mots familiers, pas "
          "de vocabulaire nouveau à apprendre. Douze lui-même — "
          "écrit « 10 » — se lit douzaine. Pour éviter la confusion "
          "entre nombres décimaux et duodécimaux dans ce chapitre, "
          "un petit préfixe e marque la lecture décimale et un petit "
          "o la duodécimale : e144 = o100, les deux représentent la "
          "même valeur.",
        ),
        const _P(
          "L'ordre des mots suit la logique française : la magnitude "
          "la plus grande d'abord, la plus petite ensuite. Dans la "
          "plage sous-quader (douzaines + unités), la forme prend "
          "un trait d'union à l'unité, comme dans « vingt-trois » : "
          "o11 se lit douzaine-un, o23 se lit deux douzaines-trois. "
          "Les multiplicateurs 2 à B précèdent la douzaine comme mot "
          "séparé : deux douzaines (o20 = e24), trois douzaines, …, "
          "neuf douzaines (o90 = e108). Avec A ou B à la position "
          "des douzaines : dix douzaines (oA0 = e120), onze "
          "douzaines (oB0 = e132). Un multiplicateur 1 est "
          "implicite : o10 se lit simplement douzaine, pas « une "
          "douzaine ».",
        ),
        const _P(
          "Une exception française reste vivante : à la position "
          "d'unité 1, après un multiplicateur de douzaines de 2 à B, "
          "on écrit « et un » au lieu du trait d'union — exactement "
          "comme « vingt et un, trente et un » en décimal. Donc o21 "
          "se lit deux douzaines et un, o31 trois douzaines et un, "
          "tandis que o22 reste deux douzaines-deux, et o11 reste "
          "douzaine-un (parce qu'ici le multiplicateur est l'unité "
          "implicite, pas 2 à B).",
        ),
        const _Pre(
          "Décimal  Dozénal  Prononciation\n"
          "     10        A  dix\n"
          "     11        B  onze\n"
          "     12       10  douzaine\n"
          "     13       11  douzaine-un\n"
          "     14       12  douzaine-deux\n"
          "     20       18  douzaine-huit\n"
          "     22       1A  douzaine-dix\n"
          "     23       1B  douzaine-onze\n"
          "     24       20  deux douzaines\n"
          "     25       21  deux douzaines et un\n"
          "     26       22  deux douzaines-deux\n"
          "     36       30  trois douzaines\n"
          "     48       40  quatre douzaines\n"
          "     60       50  cinq douzaines\n"
          "     72       60  six douzaines\n"
          "     84       70  sept douzaines\n"
          "     96       80  huit douzaines\n"
          "    101       85  huit douzaines-cinq\n"
          "    108       90  neuf douzaines\n"
          "    120       A0  dix douzaines\n"
          "    132       B0  onze douzaines\n"
          "    143       BB  onze douzaines-onze\n"
          "    ...      ...  et ainsi de suite…",
        ),
        const _H("Les magnitudes supérieures"),
        const _P(
          "Au-delà de la douzaine suit une série de magnitudes "
          "géométriquement motivées — une par position duodécimale, "
          "une par dimension. Quader désigne le carré 2D (12² = "
          "e144), cuber le cube classique (12³ = e1728), tesser le "
          "tesseract en quatre dimensions (12⁴), et ensuite les "
          "hypercubes numérotés en grec : penter (12⁵), hexer (12⁶), "
          "hepter (12⁷). Chaque pas est une dimension de plus et "
          "exactement une position duodécimale plus loin.",
        ),
        const _Pre(
          " Décimal   Dozénal  Prononciation\n"
          "     144       100  quader   (12²)\n"
          "    1728      1000  cuber    (12³)\n"
          "   20736     10000  tesser   (12⁴)\n"
          "  248832    100000  penter   (12⁵)\n"
          " 2985984   1000000  hexer    (12⁶)\n"
          "35831808  10000000  hepter   (12⁷)\n"
          "     ...       ...  et ainsi de suite…",
        ),
        const _P(
          "En français, les magnitudes s'empilent par simple "
          "juxtaposition, sans connecteur — exactement comme en "
          "décimal : on dit « cent vingt-trois » et non « cent et "
          "vingt-trois ». Donc o101 se lit quader un, o123 quader "
          "deux douzaines-trois, o2300 deux cubers trois quaders. "
          "Le seul « et » qui apparaît est l'exception de position 1 "
          "à l'intérieur du dernier bloc sous-quader — o121 se lit "
          "quader deux douzaines et un. Les magnitudes vides sont "
          "sautées : o1023 se lit cuber deux douzaines-trois, pas "
          "« cuber zéro quader … ».",
        ),
        const _H("Pourquoi justement douze ?"),
        const _P(
          "La raison est la divisibilité. Douze a six diviseurs : 1, "
          "2, 3, 4, 6 et 12. Dix n'en a que quatre : 1, 2, 5 et 10. "
          "Cela paraît une petite différence, mais l'effet sur les "
          "calculs quotidiens est considérable — surtout pour les "
          "fractions.",
        ),
        const _H("Fractions unitaires comparées"),
        const _Pre(
          "  Fraction   Base 10    Base 12\n"
          "  1/2        0.5        0.6\n"
          "  1/3        0.333…     0.4\n"
          "  1/4        0.25       0.3\n"
          "  1/5        0.2        0.2497…\n"
          "  1/6        0.166…     0.2\n"
          "  1/8        0.125      0.16\n"
          "  1/9        0.111…     0.14\n"
          "  1/10       0.1        0.1249…\n"
          "  1/12       0.0833…    0.1",
        ),
        const _P(
          "En base 10, les tiers et les sixièmes sont des fractions "
          "périodiques infinies. En base 12, elles sont courtes et "
          "exactes. En contrepartie, les cinquièmes et dixièmes "
          "deviennent périodiques — un échange équitable quand on "
          "songe à quel point on divise plus souvent par trois et "
          "par quatre que par cinq.",
        ),
        const _H("La règle derrière"),
        const _P(
          "Quelles fractions sont finies et lesquelles deviennent "
          "périodiques suit une loi simple : une fraction 1/n a une "
          "représentation finie en base b exactement quand tous les "
          "facteurs premiers de n sont aussi facteurs premiers de b. "
          "Les facteurs premiers de 12 sont 2 et 3. Donc toute "
          "fraction dont le dénominateur n'est composé que de deux "
          "et de trois est finie. Tout le reste — dénominateurs "
          "avec 5, 7 ou 11 — devient périodique. La calculatrice "
          "marque cette périodicité d'une barre au-dessus des "
          "chiffres répétés.",
        ),
        const _H("Traces dans l'histoire"),
        const _P(
          "Le douze comme grandeur d'organisation est plus ancien "
          "que tout système numérique. Les Babyloniens calculaient "
          "en base 60 mais organisaient leurs chiffres en groupes "
          "de 12. Dans le commerce, on comptait par douzaines (12) "
          "et par grosses (144 = 12²). Le jour a 2×12 heures, "
          "l'année 12 mois, le cercle complet 360 = 30×12 degrés.",
        ),
        const _H("Le français et la trace vigésimale"),
        const _P(
          "Le français standard porte dans ses nombres la trace d'un "
          "ancien système vigésimal — base 20 — hérité du gaulois et "
          "de l'usage médiéval européen. Soixante-dix (70) se lit "
          "littéralement « soixante plus dix », quatre-vingts (80) "
          "« quatre fois vingt », et quatre-vingt-dix (90) « quatre "
          "fois vingt plus dix ». Là où l'allemand dit siebzig, "
          "achtzig, neunzig en suivant simplement la logique décimale, "
          "le français continue à compter par paquets de vingt "
          "jusqu'à cent.",
        ),
        const _P(
          "Le français de Belgique et le français de Suisse ont "
          "simplifié cette particularité : septante (70), nonante "
          "(90), et — en Suisse romande — huitante (80) suivent le "
          "modèle décimal régulier. Mais le français standard "
          "hexagonal a gardé la forme vigésimale. Le résultat : "
          "chaque enfant français apprend dès l'école élémentaire à "
          "manipuler une base différente sans s'en rendre compte. "
          "Cette familiarité avec l'arithmétique vigésimale est un "
          "terrain favorable pour la base douze — un système qui "
          "partage avec vingt la propriété d'avoir plus de diviseurs "
          "que dix.",
        ),
        const _P(
          "(In English: Standard French carries within its numbers "
          "the trace of an old vigesimal system — base 20 — inherited "
          "from Gaulish and medieval European usage. Soixante-dix "
          "(70) reads literally \"sixty plus ten\", quatre-vingts "
          "(80) \"four times twenty\", and quatre-vingt-dix (90) "
          "\"four times twenty plus ten\". Where German says siebzig, "
          "achtzig, neunzig following simple decimal logic, French "
          "continues to count by groups of twenty up to one hundred. "
          "Belgian French and Swiss French have simplified this "
          "peculiarity: septante (70), nonante (90), and — in Suisse "
          "romande — huitante (80) follow the regular decimal model. "
          "But standard hexagonal French has kept the vigesimal form. "
          "The result: every French child learns from primary school "
          "to handle a different base without realising it. This "
          "familiarity with vigesimal arithmetic is fertile ground "
          "for base twelve — a system that shares with twenty the "
          "property of having more divisors than ten.)",
        ),
        const _P(
          "La Dozenal Society of America (fondée en 1944, avec "
          "aujourd'hui des branches dans d'autres pays) œuvre à "
          "faire connaître les avantages de la base 12. Cette "
          "calculatrice s'inscrit dans cette tradition — non comme "
          "une exigence de changement de système, mais comme un "
          "outil d'exploration et d'émerveillement.",
        ),
      ];
    case 2:
      return [
        const _H("144 — où deux mondes se rencontrent"),
        const _P(
          "La suite de Fibonacci commence par 1, 1, et chaque "
          "nombre suivant est la somme des deux précédents : 1, 1, "
          "2, 3, 5, 8, 13, 21, 34, 55, 89, 144, … Elle croît "
          "exponentiellement. Les nombres carrés — 1, 4, 9, 16, "
          "25, 36, … — ne croissent au contraire que "
          "quadratiquement. Deux suites si différentes n'ont "
          "presque aucune raison de se rencontrer. Et pourtant "
          "elles le font : le douzième nombre de Fibonacci est "
          "144, et 144 = 12².",
        ),
        const _P(
          "J. H. E. Cohn a prouvé en 1964 que ce n'est pas une "
          "coïncidence mais un événement unique : à part F(1) = "
          "F(2) = 1, aucun autre nombre de Fibonacci n'est en même "
          "temps un carré parfait. Le douze se trouve à un "
          "croisement unique de deux suites numériques "
          "fondamentales.",
        ),
        const _H("Le nombre d'or"),
        const _P(
          "φ = (1+√5)/2 ≈ 1.618 est la limite du rapport des "
          "nombres de Fibonacci successifs : F(n+1)/F(n) → φ. En "
          "base 12 : φ ≈ 1.74BB677… — la calculatrice a φ comme "
          "constante dans le panneau d'extension.",
        ),
        const _P(
          "Tapez φ² = et le résultat est exactement φ+1 — la "
          "propriété définissante du nombre d'or. Cette identité "
          "fait de φ une constante algébriquement unique.",
        ),
        const _H(
          "12 = 2² × 3 — une décomposition en facteurs aux conséquences",
        ),
        const _P(
          "Douze est un nombre hautement composé (highly composite "
          "number) : il a plus de diviseurs que n'importe quel "
          "nombre naturel plus petit. Les diviseurs de 12 sont 1, "
          "2, 3, 4, 6, 12 — soit six. Srinivasa Ramanujan a défini "
          "et étudié cette classe de nombres dans un article "
          "célèbre de 1915 dans les Proceedings of the London "
          "Mathematical Society.",
        ),
        const _P(
          "Douze est aussi le plus petit nombre abondant : la "
          "somme de ses diviseurs propres (1+2+3+4+6 = 16) "
          "dépasse le nombre lui-même. Pour la plupart des petits "
          "nombres, c'est l'inverse — pour 10, 1+2+5 = 8, ce qui "
          "est inférieur à 10. Douze est le premier nombre où les "
          "diviseurs « débordent ».",
        ),
        const _H("La cité idéale de Platon"),
        const _P(
          "Dans ses « Lois » (livre V), Platon pose la question du "
          "nombre idéal de citoyens d'une cité. Sa réponse : 5040. "
          "L'argument n'est pas mystique mais pratique : une cité "
          "doit continuellement répartir ses citoyens en groupes "
          "de tailles égales. 5040 est divisible par chaque nombre "
          "de 1 à 12 (à la seule exception de 11).",
        ),
        const _P(
          "Ce que Platon décrit intuitivement est la même "
          "intuition qui sous-tend le système duodécimal : dans "
          "la vie quotidienne, les petits diviseurs sont ceux qui "
          "comptent. 5040 = 7! est la grande sœur du douze — la "
          "même philosophie de divisibilité appliquée à toute une "
          "population urbaine.",
        ),
      ];
    case 3:
      return [
        const _H("Qu'est-ce qu'un dodécagone régulier ?"),
        const _P(
          "Un dodécagone régulier est un polygone à douze côtés "
          "égaux et douze angles intérieurs égaux. Chaque angle "
          "intérieur mesure 150° — ou, en duodécimal, 106°. C'est "
          "l'une des formes géométriques les plus anciennes et les "
          "plus utilisées : on la retrouve sur les cadrans "
          "d'horloge, les pièces de monnaie, les ornements "
          "architecturaux et les motifs de pavage.",
        ),
        const _H("Le couteau suisse des polygones"),
        const _P(
          "Ce qui rend le dodécagone unique n'est pas sa forme en "
          "soi mais tout ce qu'il contient. En reliant un sommet "
          "sur quatre, on obtient un triangle équilatéral — exact, "
          "pas approximatif. Un sommet sur trois donne un carré. "
          "Un sommet sur deux donne un hexagone régulier. Les trois "
          "figures s'inscrivent parfaitement dans le même cercle "
          "qui circonscrit le dodécagone.",
        ),
        const _P(
          "Cela signifie : le dodécagone contient les trois "
          "polygones réguliers fondamentaux de la géométrie comme "
          "sous-figures exactes. Aucun autre polygone avec aussi "
          "peu de sommets ne peut en dire autant. Conséquence "
          "directe de la divisibilité de 12 par 2, 3, 4 et 6.",
        ),
        const _H("Constructible au compas et à la règle"),
        const _P(
          "Tout polygone régulier ne peut pas être exactement "
          "construit au compas et à la règle. Le dodécagone, en "
          "revanche, l'est : on part d'un cercle, on le divise en "
          "six parties égales (cela se fait, l'hexagone étant "
          "constructible), puis on bissectie chacun de ces arcs, "
          "et on obtient douze points uniformément répartis sur "
          "le cercle.",
        ),
        const _P(
          "La base mathématique : un n-gone régulier est "
          "constructible exactement quand n est le produit d'une "
          "puissance de deux et de nombres premiers de Fermat "
          "distincts (Gauss, 1796). Pour 12 = 2² × 3 cela tient, "
          "parce que 3 est un nombre premier de Fermat.",
        ),
        const _H("Symétrie"),
        const _P(
          "Le dodécagone régulier a 24 symétries : 12 rotations "
          "(de 0°, 30°, 60°, …, 330°) et 12 réflexions (6 par "
          "sommets opposés, 6 par milieux de côtés opposés). Dans "
          "le langage de l'algèbre, ces 24 symétries forment le "
          "groupe dièdre D₁₂. Tout n-gone régulier a exactement "
          "2n symétries.",
        ),
        const Chapter4Illustration(),
      ];
    case 4:
      return [
        const _H("54 diagonales"),
        const _P(
          "Une diagonale relie deux sommets non adjacents d'un "
          "polygone. La formule n(n−3)/2 donne au dodécagone "
          "12×9/2 = 54 diagonales. Cela ressemble à un maillage "
          "touffu — mais la structure est remarquablement "
          "ordonnée.",
        ),
        const _H("Six longueurs différentes"),
        const _P(
          "Chaque diagonale saute un certain nombre de sommets. "
          "Comme le dodécagone est symétrique, toutes les "
          "diagonales qui sautent le même nombre de sommets "
          "partagent la même longueur. Il y a cinq largeurs de "
          "saut possibles (1 à 5 sommets), plus le diamètre "
          "couvrant 6 — six types de longueurs en tout. Pour une "
          "longueur de côté s = 1 :",
        ),
        const _Pre(
          "  Type        Sauts          Longueur (exacte)    Approx\n"
          "  s (côté)    —              1                    1.000\n"
          "  d₂          1 sommet       √(2+√3)              1.932\n"
          "  d₃          2 sommets      1+√3                 2.732\n"
          "  d₄          3 sommets      (3√2+√6)/2           3.346\n"
          "  d₅          4 sommets      2+√3                 3.732\n"
          "  d₆ (⌀)      5 sommets      √6+√2                3.864",
        ),
        const _H("Motifs cachés"),
        const _P(
          "La troisième et la cinquième diagonale diffèrent "
          "d'exactement 1 : d₃ = 1+√3 et d₅ = 2+√3. La différence "
          "est égale à la longueur du côté elle-même — un fait "
          "géométrique, pas calculatoire.",
        ),
        const _P(
          "Le diamètre d₆ est exactement deux fois la plus courte "
          "diagonale d₂ : √6+√2 = 2·√(2+√3). Diamètre et plus "
          "courte diagonale sont dans le rapport 2:1 — la même "
          "proportion que l'octave en musique.",
        ),
        const _H("Le quadrillage à 15 degrés"),
        const _P(
          "Tous les angles qui apparaissent dans le dodécagone — "
          "entre les côtés, entre les diagonales — sont des "
          "multiples de 15°. Cela vient de ce que les douze sommets "
          "divisent le cercle complet en douze secteurs de 30° "
          "chacun. 15° = 1/24 du cercle complet. En duodécimal : "
          "15° = 13°doz, et 30° = 26°doz. Tous les angles "
          "apparaissant peuvent s'écrire en duodécimal comme des "
          "multiples entiers de 13°.",
        ),
        const Chapter5Illustration(),
      ];
    case 5:
      return [
        const _H("L'aire du dodécagone"),
        const _P(
          "Un dodécagone régulier de côté s a pour aire "
          "A = 3s²(2+√3). La démonstration est intuitive : on "
          "découpe le dodécagone depuis son centre en 12 triangles "
          "isocèles congruents, on calcule l'aire d'un seul "
          "triangle et on multiplie par 12.",
        ),
        const _P(
          "Pour s = 1, cela donne A ≈ 11.196 (décimal). À "
          "comparer : le cercle circonscrit a une aire πR² ≈ "
          "11.725. Le dodécagone remplit son cercle circonscrit à "
          "plus de 95 % — sensiblement mieux qu'un hexagone "
          "(83 %) et bien mieux qu'un carré (64 %) ou qu'un "
          "triangle (41 %).",
        ),
        const _H("3/π — un rapport élégant"),
        const _P(
          "Le rapport de l'aire du dodécagone à celle du cercle "
          "circonscrit se simplifie en 3/π. La démonstration "
          "utilise sin²(15°) = (2−√3)/4, ce qui annule le facteur "
          "(2+√3)(2−√3) à 1 dans le rapport, laissant exactement "
          "3/π.",
        ),
        const _P(
          "3/π ≈ 0.9549 (décimal) — le dodécagone capture 95.5 % "
          "de l'aire du cercle. Tapez 3 / π = dans la calculatrice "
          "pour le vérifier.",
        ),
        const _H("Quatre polygones comparés"),
        const _P(
          "Toutes les figures ci-dessous partagent le même cercle "
          "circonscrit. Formule : A = (n/2)·R²·sin(2π/n).",
        ),
        const _Pre(
          "  Figure         Part      Formule\n"
          "  Triangle       41.3 %    3√3/(4π)\n"
          "  Carré          63.7 %    2/π\n"
          "  Hexagone       82.7 %    3√3/(2π)\n"
          "  Dodécagone     95.5 %    3/π",
        ),
        const _P(
          "L'hexagone a exactement deux fois l'aire du triangle "
          "(tous deux contiennent le facteur 3√3). Et chaque pas "
          "apporte un gain d'aire plus grand, parce que les "
          "sommets épousent le cercle de plus en plus étroitement.",
        ),
        const _H("Archimède et π"),
        const _P(
          "Archimède calculait π via des polygones. Il utilisait "
          "un 96-gone — 96 = 12×8 = 12×2³. Il partait de "
          "l'hexagone (trivialement constructible) et doublait le "
          "nombre de sommets trois fois : 6→12→24→48→96. Le point "
          "de départ de sa méthode était donc le dodécagone.",
        ),
        const _P(
          "Son résultat : 3 + 10/71 < π < 3 + 1/7. Un 96-gone "
          "remplit le cercle circonscrit à 99.93 %. Des 95.5 % du "
          "dodécagone aux 99.93 % il n'y a que trois étapes de "
          "doublement — un rythme de convergence remarquable.",
        ),
      ];
    case 6:
      return [
        const _H("Douze faces"),
        const _P(
          "Le dodécaèdre est un solide construit de douze "
          "pentagones réguliers. Chaque face est identique, chaque "
          "arête de longueur égale, et exactement trois pentagones "
          "se rencontrent à chaque sommet. Au total il a 12 faces, "
          "30 arêtes et 20 sommets. C'est l'un des cinq solides de "
          "Platon — les seuls solides convexes dont les faces se "
          "composent exclusivement de polygones réguliers "
          "identiques.",
        ),
        const _H("Les cinq solides de Platon"),
        const _Pre(
          "  Solide              Faces  Sommets  Arêtes  Forme\n"
          "  Tétraèdre              4      4        6   Triangles\n"
          "  Cube                   6      8       12   Carrés\n"
          "  Octaèdre               8      6       12   Triangles\n"
          "  Dodécaèdre            12     20       30   Pentagones\n"
          "  Icosaèdre             20     12       30   Triangles",
        ),
        const _P(
          "Le dodécaèdre est le seul solide de Platon à faces "
          "pentagonales. Dans sa cosmologie, Platon attribuait les "
          "quatre autres solides aux éléments — et le dodécaèdre "
          "au cosmos lui-même.",
        ),
        const _H("À quoi ressemble-t-il ?"),
        const _P(
          "Qui joue aux jeux de rôle le connaît comme le D12 — le "
          "dé à douze faces. Il tient agréablement dans la main et "
          "tombe avec fiabilité sur une face. Le ballon de "
          "football n'est pas un dodécaèdre : c'est un icosaèdre "
          "tronqué fait de 12 pentagones et 20 hexagones.",
        ),
        const _H("Dodécaèdres pentagonaux gallo-romains"),
        const _P(
          "Plus d'une centaine de petits objets en bronze en forme "
          "de dodécaèdre ont été trouvés en Europe du Nord, datés "
          "des IIᵉ–IVᵉ siècles. Ils ont douze faces pentagonales "
          "avec des trous ronds de tailles variées. Personne ne "
          "sait avec certitude à quoi ils servaient. Les "
          "hypothèses vont des chandeliers aux instruments "
          "d'arpentage en passant par les objets religieux. "
          "L'énigme reste irrésolue.",
        ),
        const _H("La formule des polyèdres d'Euler"),
        const _P(
          "Pour tout polyèdre convexe vaut une relation simple : "
          "sommets moins arêtes plus faces font toujours deux. "
          "Leonhard Euler formula cette loi en 1758. Pour le "
          "dodécaèdre : 20 − 30 + 12 = 2. La formule vaut pour "
          "les cinq solides de Platon, pour tout prisme, pour "
          "toute pyramide, pour tout polyèdre convexe quelconque.",
        ),
      ];
    case 7:
      return [
        const _H("Le nombre d'or dans le dodécaèdre"),
        const _P(
          "Chaque face du dodécaèdre est un pentagone régulier — "
          "et le pentagone régulier est la maison du nombre d'or. "
          "La diagonale d'un tel pentagone est à son côté "
          "exactement comme φ = (1+√5)/2 ≈ 1.618 (décimal) est à "
          "1. Cette proportion imprègne tout le solide.",
        ),
        const _Pre(
          "  Grandeur            Formule             Décimal\n"
          "  Volume              (15+7√5)/4          ≈ 7.663\n"
          "  Aire                3√(25+10√5)         ≈ 20.646\n"
          "  Rayon circonscrit   √3·φ/2              ≈ 1.401\n"
          "  Rayon inscrit       √(25+11√5)/(2√10)   ≈ 1.114",
        ),
        const _P(
          "Tapez φ² = dans la calculatrice et vous obtenez φ+1. "
          "C'est la propriété définissante du nombre d'or — et la "
          "raison pour laquelle φ apparaît dans tant de formules "
          "du dodécaèdre.",
        ),
        const _H("Dualité — le miroir de l'icosaèdre"),
        const _P(
          "À chaque solide de Platon correspond un solide dual : "
          "on remplace chaque face par un sommet (au centre de la "
          "face) et on relie les nouveaux sommets adjacents par "
          "des arêtes. Pour le dodécaèdre, cela donne "
          "l'icosaèdre — et inversement :",
        ),
        const _Pre(
          "                  Dodécaèdre    Icosaèdre\n"
          "  Faces               12            20\n"
          "  Arêtes              30            30\n"
          "  Sommets             20            12",
        ),
        const _P(
          "Faces et sommets échangent leurs places ; le nombre "
          "d'arêtes reste le même. Le nombre 12 apparaît dans les "
          "deux solides — une fois comme nombre de faces, une "
          "fois comme nombre de sommets.",
        ),
        const _H("120 symétries"),
        const _P(
          "Le dodécaèdre possède la symétrie la plus riche parmi "
          "les solides de Platon : le groupe icosaédrique Iₕ à "
          "120 éléments — 60 rotations et 60 "
          "rotations-réflexions. À comparer : le cube n'a que "
          "48 symétries, le tétraèdre 24.",
        ),
        const _P(
          "120 = 5! = 2³×3×5. Les trois facteurs premiers 2, 3 "
          "et 5 sont exactement ceux qui convergent dans les "
          "faces du dodécaèdre (pentagones) et dans la "
          "divisibilité de 12 (= 2²×3).",
        ),
      ];
    case 8:
      return [
        const _H("360 degrés et les Babyloniens"),
        const _P(
          "Qu'un cercle complet ait 360 degrés n'est pas une "
          "constante naturelle — c'est une convention humaine, "
          "qui remonte aux Babyloniens. La mathématique "
          "babylonienne utilisait la base 60, et 360 = 6×60. "
          "Mais 360 peut aussi s'écrire 12×30, et c'est "
          "exactement ainsi que les Babyloniens divisaient le "
          "ciel : la trajectoire apparente du soleil "
          "(l'écliptique) était partagée en 12 sections égales "
          "de 30° chacune. À chaque section était attribuée une "
          "constellation — les douze signes du zodiaque.",
        ),
        const _P(
          "Le choix de 12 n'était pas un hasard. Les Babyloniens "
          "organisaient leur système base-60 en interne en "
          "groupes de 12, puisque 60 = 12×5. Pour eux, douze "
          "était une sous-unité naturelle — dans la mesure du "
          "temps, dans le calendrier, en astronomie.",
        ),
        const _H("La lune et le douze"),
        const _P(
          "Pourquoi justement douze sections du ciel ? Parce que "
          "la nature elle-même suggère une division par douze : "
          "une année solaire contient presque exactement 12 "
          "cycles lunaires. Un mois synodique dure environ 29.53 "
          "jours. 12 cycles lunaires donnent 354.4 jours — "
          "seulement 11 jours de moins qu'une année solaire de "
          "365.24 jours. Cette quasi-coïncidence faisait du "
          "douze la division évidente de l'année.",
        ),
        const _H("Ordre dans le ciel"),
        const _P(
          "La division duodécimale du ciel était bien plus qu'un "
          "système de coordonnées pour les cultures anciennes. "
          "Un détail fascinant : le point vernal dérive lentement "
          "à travers les constellations parce que l'axe de la "
          "Terre vacille comme une toupie (précession, période "
          "d'environ 25 800 ans). Les constellations à travers "
          "lesquelles dérive le point vernal sont appelées pour "
          "cela aussi des âges. Ici aussi le douze structure le "
          "temps : douze constellations, douze âges, un grand "
          "cercle.",
        ),
        const _H("Le douze ailleurs dans les cieux"),
        const _P(
          "Les Égyptiens anciens divisaient le jour et la nuit "
          "en 12 heures chacun — d'où notre journée de 24 "
          "heures. Le zodiaque chinois compte également douze "
          "signes dans des cycles de 12 ans, dérivés de l'orbite "
          "de 12 ans de Jupiter. Les deux traditions sont "
          "apparues indépendamment. La convergence sur le nombre "
          "12 est remarquable.",
        ),
      ];
    case 9:
      return [
        const _H("Pyrite — le dodécaèdre du fou"),
        const _P(
          "La pyrite (FeS₂), connue sous le nom d'« or des fous » "
          "pour son éclat doré, cristallise souvent dans une "
          "forme trompeusement similaire au dodécaèdre de "
          "Platon : le pyritoèdre. Il a douze faces pentagonales, "
          "20 sommets et 30 arêtes — la même topologie que le "
          "dodécaèdre régulier du chapitre 7. Mais à y regarder "
          "de près, les pentagones ne sont pas réguliers. En "
          "cristallographie, la véritable symétrie de rotation "
          "d'ordre cinq est impossible pour les cristaux "
          "périodiques — seules les symétries d'ordres 1, 2, 3, "
          "4 et 6 sont permises. Le pyritoèdre contourne cette "
          "règle avec des pentagones irréguliers.",
        ),
        const _H("Grenat — un autre solide à douze faces"),
        const _P(
          "Les minéraux du groupe du grenat cristallisent "
          "préférentiellement comme dodécaèdres rhombiques — "
          "également un solide à douze faces, mais d'une nature "
          "entièrement différente : les faces sont des losanges, "
          "pas des pentagones. Le dodécaèdre rhombique a 14 "
          "sommets et 24 arêtes et appartient au système "
          "cristallin cubique. Il pave l'espace sans lacunes — "
          "l'équivalent tridimensionnel du nid d'abeilles.",
        ),
        const _P(
          "La nature utilise le nombre 12 comme nombre de faces "
          "pour deux formes cristallines complètement "
          "différentes — pentagones dans la pyrite, losanges "
          "dans le grenat. Douze n'est pas lié à une géométrie "
          "particulière.",
        ),
        const _H("Radiolaires — squelettes de verre"),
        const _P(
          "Les radiolaires sont des organismes marins "
          "unicellulaires, à peine un dixième de millimètre de "
          "diamètre, qui construisent des squelettes filigranés "
          "en silice. Certaines espèces forment des squelettes à "
          "symétrie icosaédrique — la symétrie de l'icosaèdre, "
          "le dual du dodécaèdre. Le biologiste allemand Ernst "
          "Haeckel a dessiné ces organismes en 1904 dans son "
          "ouvrage « Formes artistiques de la nature » avec un "
          "détail qui impressionne encore aujourd'hui.",
        ),
        const _H("Quasicristaux — l'exception qui confirme la règle"),
        const _P(
          "En 1982, Dan Shechtman a découvert un motif à "
          "symétrie icosaédrique dans un alliage "
          "aluminium-manganèse — symétrie interdite dans les "
          "cristaux ordinaires. La communauté experte a "
          "initialement réagi par le rejet. Mais l'observation a "
          "tenu, et en 2011 Shechtman recevait le prix Nobel de "
          "chimie. Ces quasicristaux ont une symétrie "
          "icosaédrique, qui contient à la fois la géométrie "
          "dodécaédrique et icosaédrique. Des quasicristaux "
          "naturels — le minéral icosaédrite — ont été "
          "découverts en 2009 dans une météorite au Kamtchatka.",
        ),
      ];
    case 10:
      return [
        const _H("Douze sur une main"),
        const _P(
          "Tenez une main devant vous, pouce écarté, et regardez "
          "les quatre doigts. Chaque doigt a trois segments "
          "(phalanges), séparés par des articulations visibles. "
          "Quatre doigts fois trois segments — soit douze. Le "
          "pouce peut servir de pointeur : il touche tour à tour "
          "chaque segment des quatre doigts et compte ainsi de "
          "un à douze.",
        ),
        const _P(
          "Cette méthode n'est pas une invention moderne. Dans "
          "certaines parties d'Asie du Sud-Est, d'Inde et du "
          "Proche-Orient, elle est utilisée depuis des siècles. "
          "Elle a un avantage décisif sur le comptage occidental "
          "sur les doigts : elle utilise une main pour douze "
          "unités au lieu de cinq.",
        ),
        const _H("De douze à soixante"),
        const _P(
          "La seconde main compte les passages complets. Chaque "
          "fois que la première main a achevé un tour de douze, "
          "la seconde main étend un doigt. Cinq doigts fois "
          "douze — soit soixante. Avec les deux mains on peut "
          "compter jusqu'à 60, sans aucun auxiliaire.",
        ),
        const _P(
          "Cette connexion entre 12 et 60 n'est probablement pas "
          "un hasard : le système sexagésimal babylonien (base "
          "60) pourrait bien avoir son origine dans cette "
          "méthode de comptage précise. 60 = 12×5 — une fusion "
          "élégante d'anatomie et d'arithmétique.",
        ),
        const _H("D'autres douzes dans l'anatomie humaine"),
        const _Pre(
          "  — 12 paires de côtes (anatomie standard)\n"
          "  — 12 paires de nerfs crâniens (I Olfactif à XII Hypoglosse)\n"
          "  — 12 vertèbres thoraciques (reliées aux 12 paires de côtes)",
        ),
        const _P(
          "Des variations anatomiques se produisent (11 ou 13 "
          "paires de côtes sont rarement possibles).",
        ),
        const _H("La main a-t-elle façonné le système numérique ?"),
        const _P(
          "Si l'anatomie des phalanges a influencé l'émergence "
          "des systèmes numériques duodécimaux, ou inversement, "
          "ne peut pas être tranché avec certitude historique. "
          "Il pourrait s'agir d'un renforcement mutuel : les "
          "gens ont commencé à compter sur les phalanges parce "
          "que le douze était déjà important dans leur culture. "
          "Ce qui est certain : la main humaine offre une base "
          "physique naturelle pour le douze.",
        ),
      ];
    case 11:
      return [
        const _H("Douzes dans la vie quotidienne"),
        const _Pre(
          "  12 pouces  = 1 pied\n"
          "  12 onces   = 1 livre troy (métaux précieux)\n"
          "  12 pence   = 1 shilling (monnaie britannique jusqu'en 1971)\n"
          "  12 pièces  = 1 douzaine\n"
          "  144        = 12² = 1 grosse",
        ),
        const _P(
          "Ces divisions ne sont pas des hasards historiques — "
          "elles ont été choisies parce qu'elles facilitent le "
          "partage. Un pied se divise en deux parties égales "
          "(6 pouces chacune), en trois (4 pouces chacune), en "
          "quatre (3 pouces chacune) et en six (2 pouces "
          "chacune). Chacune de ces divisions tombe juste.",
        ),
        const _P(
          "Un mètre, en revanche, se divise en deux parties "
          "égales (50 cm chacune) et en cinq (20 cm chacune), "
          "mais un tiers de mètre fait 33.333… cm — une "
          "fraction infinie dès qu'on veut l'exactitude. Dans "
          "les métiers où l'on tiers et quarte continuellement, "
          "le douze est plus pratique que le dix.",
        ),
        const _H("Le système métrique — et son angle mort"),
        const _P(
          "Le système métrique a de grandes forces : il est "
          "cohérent (toutes les unités s'emboîtent), il monte "
          "décimalement (kilo, méga, milli, micro), et il est "
          "internationalement standardisé. Ces avantages sont "
          "réels et substantiels. Aucune personne raisonnable "
          "ne proposerait d'abolir le SI.",
        ),
        const _P(
          "Mais le système métrique hérite de la faiblesse de "
          "sa base. En base 10, un tiers est une fraction "
          "infinie : 0.333… Dans un système métrique "
          "duodécimal, 1/3 serait 0.4 — exact, court, sans "
          "reste. L'élégance du principe métrique serait "
          "préservée — seule la base serait meilleure.",
        ),
        const _H("Le TGM de Tom Pendlebury"),
        const _P(
          "Tom Pendlebury, membre de la Dozenal Society of "
          "Great Britain, a poussé cette pensée jusqu'au bout. "
          "Son système s'appelle TGM — du nom de ses trois "
          "unités de base Tim (temps), Grafut (longueur), Maz "
          "(masse). Pendlebury ne partait pas de la longueur "
          "mais du temps : il divisait l'heure en 12⁴ parties "
          "égales. Du Tim il dérivait le Grafut via "
          "l'accélération gravitationnelle terrestre "
          "(≈ 29.6 cm), et l'unité de masse Maz à partir du "
          "volume d'un Grafut cube d'eau.",
        ),
        const _P(
          "Le résultat est un système d'unités entièrement "
          "cohérent, dans lequel toutes les conversions sont "
          "des puissances de 12. Le TGM n'a jamais été adopté "
          "au-delà des cercles d'enthousiastes, mais démontre "
          "qu'un système métrique duodécimal ne serait pas "
          "seulement possible — à certains égards il serait "
          "supérieur au décimal.",
        ),
        const _H("Ce que cette calculatrice montre"),
        const _P(
          "Tapez 1 / 3 = et voyez 0.4 — court, exact, sans "
          "barre de période — et vous saisissez en une seconde "
          "ce que des pages d'arguments ne peuvent transmettre. "
          "La question « duodécimal ou décimal ? » ne sera "
          "jamais tranchée en pratique. Mais les avantages "
          "mathématiques de la base 12 sont objectifs et "
          "mesurables, et cette calculatrice les rend "
          "perceptibles.",
        ),
        const _P(
          "Astuce : le menu Info propose un outil «Conversions "
          "impériales-12» qui décompose n'importe quelle valeur dans "
          "ces échelles d'unités — pièces/douzaines/grosse, pouces/"
          "pieds/yards/milles, onces troy jusqu'aux long tons, pence/"
          "shillings/livres, temps et angle. Tapez un nombre et voyez "
          "comment la même valeur se répartit dans l'échelle de chaque "
          "domaine.",
        ),
      ];
    default:
      return [_P(l.chapterNotFound)];
  }
}
