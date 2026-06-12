// fr manual chapters. part of ../manual.dart.
// Grundbedienung migrated verbatim from the retired
// info_content_fr.dart (legacy chapter 0). Teaching chapters are
// German-first and fall back until translated; the chapter title is the
// German placeholder until the manual translation pass.

part of '../manual.dart';

List<ManualChapter> _manualChaptersFr() => const [
  ManualChapter('Prise en main', [
    _H("Les chiffres"),
    _P(
      "Cette calculatrice utilise ses propres symboles pour les "
      "douze chiffres. Quatre chiffres-pivots sont des pointes de "
      "flèche stylisées pointant dans les quatre points cardinaux "
      "— 1 (haut), 4 (gauche), 7 (droite), A (bas). Ils divisent "
      "le cercle numérique en quatre groupes de trois, comme les "
      "heures 12, 3, 6 et 9 sur un cadran d'horloge.",
    ),
    _P(
      "Tous les chiffres intermédiaires sont construits à partir "
      "de demi-cercles et de cercles pleins. Le zéro est un simple "
      "cercle, B (= onze) un demi-cercle au-dessus d'un cercle plein.",
    ),
    _DigitLegend(),
    _H("Utilisation de base"),
    _P(
      "Tapez les nombres et les opérateurs comme sur une "
      "calculatrice de poche ordinaire. Appuyez sur la large "
      "touche = en bas pour calculer le résultat. AC (en rouge "
      "d'avertissement) efface toute la saisie et le résultat ; "
      "Del supprime le caractère à gauche du curseur.",
    ),
    _H("Aide et théorie"),
    _P(
      "À gauche et à droite de la touche =, deux boutons ronds : "
      "(i) ouvre ces douze chapitres de théorie, (?) rejoue la "
      "visite guidée avec les marqueurs rouges. La visite "
      "s'ouvre automatiquement au premier lancement.",
    ),
    _H("Curseur et navigation"),
    _P(
      "La barre rouge dans le champ de saisie est le curseur. "
      "Utilisez ◀ et ▶ pour le déplacer, en insérant ou en "
      "supprimant des caractères au milieu d'une formule. Après "
      "un calcul, le curseur passe dans le champ de résultat — "
      "les flèches déplacent alors le curseur du résultat. Dès "
      "qu'une nouvelle saisie commence, le curseur revient dans "
      "le champ de saisie.",
    ),
    _H("Poursuivre un calcul"),
    _P(
      "Après un calcul, vous pouvez poursuivre directement avec "
      "un opérateur. Tapez + 5 = par exemple, et la calculatrice "
      "utilise automatiquement le dernier résultat comme premier "
      "opérande. Pour commencer un calcul entièrement nouveau, "
      "appuyez d'abord sur AC.",
    ),
    _H("Double appui pour les fonctions inverses"),
    _P(
      "Un second appui sur une touche de fonction la transforme "
      "en son inverse : sin devient sin⁻¹, cos devient cos⁻¹, et "
      "ainsi de suite. La même règle s'applique aux fonctions "
      "hyperboliques du panneau d'extension. Un petit point doré "
      "sur la touche signale que le prochain appui inversera.",
    ),
    _H("Appui long pour plus de fonctions"),
    _P(
      "Les touches marquées d'un petit coin en bas à droite "
      "offrent des fonctions apparentées par appui long : x□ "
      "contient x², log contient ln, log₁₂ et eˣ, − contient ±, "
      "STO contient M+ et M−, n! contient nCr et nPr. Pour "
      "choisir, glissez le doigt sur l'option voulue et relâchez "
      "— ou relâchez puis touchez l'option. Un tap à côté ferme "
      "le panneau.",
    ),
    _H("Opérateurs spéciaux"),
    _P(
      "x² élève le nombre précédent au carré. √ calcule la racine "
      "carrée ; si un nombre se trouve à sa gauche, ce nombre sert de "
      "degré de la racine : 3√8 donne la racine cubique de 8, soit 2. "
      "log calcule un logarithme où le nombre de gauche est l'argument "
      "et celui de droite la base : 8 log 2 est le logarithme de 8 en "
      "base 2, soit 3. ⊕ calcule la somme parallèle : "
      "a ⊕ b = (a·b)/(a+b), utile pour les résistances en "
      "parallèle.",
    ),
    _H("Panneau d'extension"),
    _P(
      "La touche … en bas à droite ouvre le panneau d'extension "
      "avec d'autres fonctions : mémoire, constantes (π, e, φ, "
      "√2), fonctions hyperboliques, opérateurs avancés, ainsi "
      "que EXP et DRG. La même touche le ferme, ou un tap en dehors du "
      "panneau. Sur tablette, tous les ensembles sont visibles "
      "côte à côte de toute façon — pas de superposition.",
    ),
    _Pre(
      "  6 — Mémoire :        STO   RCL   MC    Ans\n"
      "  7 — Constantes :     π     e     φ     √2\n"
      "  8 — Hyperboliques :  sinh  cosh  tanh  coth\n"
      "  9 — Avancés :        n!    |x|   1/x   mod\n"
      "  10 — Modes :         EXP   DRG   …",
    ),
    _H("Mémoire"),
    _P(
      "STO mémorise le résultat actuel, RCL insère la valeur "
      "mémorisée dans la saisie, MC efface la mémoire. Un petit "
      "M sur l'écran indique que quelque chose est mémorisé. Ans "
      "insère le résultat du dernier calcul — les valeurs "
      "rationnelles exactes sont mémorisées entièrement, la "
      "périodicité est préservée.",
    ),
    _H("Trait de période"),
    _P(
      "Lorsque le résultat est une fraction périodique, la "
      "calculatrice marque les chiffres répétés d'une barre "
      "au-dessus. Exemple : 1/5 donne 0.2497 avec une barre sur "
      "les quatre chiffres. Pour les périodes de plus de cinq "
      "chiffres, seuls les cinq premiers sont affichés, suivis "
      "de …",
    ),
    _H("Système numérique : Doz / Dez"),
    _P(
      "Vous changez le système numérique dans les réglages, "
      "accessibles via la touche (i) : duodécimal calcule en base "
      "12 (par défaut), décimal en base 10. Le système actif "
      "s'affiche en haut à droite de l'écran.",
    ),
    _P(
      "En basculant, le nombre actuellement visible est "
      "automatiquement converti dans l'autre système. « 10 » en "
      "Doz devient « 12 » en Dez. En mode Dez, les symboles 10 "
      "et 11 deviennent inactifs (grisés), puisqu'ils n'existent "
      "pas comme chiffres uniques en base 10 — pour le Doz, il "
      "suffit de rebasculer.",
    ),
    _H("Mode angle"),
    _P(
      "DRG cycle le mode angle pour les fonctions "
      "trigonométriques : DEG → RAD → GRAD → DEG. Le mode actuel "
      "s'affiche en haut à droite de l'écran, juste au-dessus de "
      "l'indicateur Doz/Dez. Par défaut : DEG.",
    ),
  ]),
  ManualChapter("Exposants, racines et logarithmes", [
    _H("Trois questions sur une même relation"),
    _P(
      "L'élévation à une puissance, l'extraction d'une racine et le calcul "
      "d'un logarithme semblent être trois opérations distinctes. En réalité, "
      "ce sont trois questions sur une seule et même relation : b élevé à e "
      "donne n, en abrégé b^e = n. Ici b est la base, e l'exposant et n le "
      "résultat. Si vous connaissez deux de ces trois grandeurs, vous pouvez "
      "trouver la troisième — et c'est exactement à cela que servent les trois "
      "touches x^□, √ et log.",
    ),
    _P(
      "La puissance répond : la base et l'exposant sont connus, quelle est la "
      "taille du résultat ? La racine répond : le résultat et l'exposant sont "
      "connus, quelle était la base ? Le logarithme répond : la base et le "
      "résultat sont connus, quel exposant se cache derrière ? La racine et le "
      "logarithme sont donc les deux inverses de l'élévation à une puissance.",
    ),
    PowerTriangleFigure(power: 'Puissance', base: 'Base', exponent: 'Exposant'),
    _H("Puissances : multiplication répétée"),
    _P(
      "La puissance b^e signifie, pour commencer, rien de plus que multiplier b "
      "par lui-même exactement e fois. Ainsi 2^3 = 2·2·2 = 8 et 3^2 = 3·3 = 9. "
      "L'élévation à une puissance condense une multiplication, tout comme la "
      "multiplication condense une addition.",
    ),
    _P(
      "De cette idée simple découlent les lois des exposants, que l'on comprend "
      "immédiatement en comptant les facteurs. Multiplier deux puissances de même "
      "base additionne les exposants : b^m · b^n = b^(m+n) — on aligne simplement "
      "les facteurs. Élever une puissance à une puissance multiplie les exposants : "
      "(b^m)^n = b^(m·n).",
    ),
    _P(
      "Deux cas particuliers découlent de la même règle. b^0 vaut toujours 1, car "
      "b^1 divisé par b^1 donne à la fois 1 et b^(1−1) = b^0. Et un exposant "
      "négatif signifie le réciproque : b^(−n) = 1/b^n, puisque b^n · b^(−n) doit "
      "donner b^0 = 1.",
    ),
    _P(
      "Tracer les valeurs d'une puissance comme 2^x produit une courbe qui monte "
      "de plus en plus steeply — l'image familière de la croissance exponentielle.",
    ),
    ExpCurveFigure(),
    _H("La racine — le premier inverse"),
    _P(
      "La racine annule l'élévation à une puissance lorsque l'exposant est connu. "
      "La racine carrée de 9 est 3, car 3^2 = 9 ; la racine cubique de 8 est 2, "
      "car 2^3 = 8. Sur la calculatrice √ désigne la racine carrée ; tapez un "
      "nombre à sa gauche et ce nombre devient l'indice de la racine — 3√8 est la "
      "racine cubique de 8.",
    ),
    _P(
      "Une racine n'est rien d'autre qu'une puissance avec un exposant fractionnaire : "
      "la racine n-ième de x est x^(1/n). Ce n'est pas une simple notation mais "
      "découle directement des lois des exposants — élevez x^(1/n) à la puissance n "
      "et vous obtenez x^((1/n)·n) = x^1 = x. Tracez y = x² et y = √x dans le même "
      "repère et ils sont images miroir l'un de l'autre par rapport à la droite y = x. "
      "C'est le signe visible qu'une fonction inverse l'autre.",
    ),
    SquareRootFigure(),
    _H("Le logarithme — le second inverse"),
    _P(
      "Le logarithme annule l'élévation à une puissance lorsque la base est connue. "
      "Il répond : avec quel exposant dois-je élever la base pour obtenir le résultat ? "
      "On écrit log_b(n) = e. Ainsi log_2(8) = 3, car 2^3 = 8. Sur la calculatrice "
      "on saisit cela comme 8 log 2 — l'argument à gauche, la base à droite.",
    ),
    _P(
      "Le logarithme est lui aussi une image miroir : y = log_2(x) provient de "
      "y = 2^x par réflexion autour de la droite y = x. Là où la courbe "
      "exponentielle monte en pente raide, le logarithme ne croît que lentement — "
      "il transforme des plages immenses en nombres maniables.",
    ),
    ExpLogFigure(),
    _H("Les lois des logarithmes"),
    _P(
      "Parce que le logarithme inverse les puissances, les lois des exposants se "
      "transforment en lois miroir des logarithmes. Un produit devient une somme : "
      "log(x·y) = log x + log y. Un quotient devient une différence : "
      "log(x/y) = log x − log y. Et un exposant dans l'argument devient un "
      "facteur devant : log(x^k) = k · log x.",
    ),
    _P(
      "Cette conversion de la multiplication en addition fut pendant des siècles "
      "le véritable but des logarithmes : avec des tables de logarithmes, des "
      "multiplications fastidieuses pouvaient être remplacées par de simples "
      "consultations et additions. Le même principe est à la base de toute échelle "
      "logarithmique — de l'échelle des décibels du son à la magnitude des "
      "séismes.",
    ),
    _P(
      "La base d'un logarithme est librement choisissable, et n'importe quelle "
      "base se convertit en une autre : log_b(x) = log_c(x) / log_c(b). ln "
      "(base e), log en base 2 et log₁₂ ne sont donc pas des fonctions "
      "fondamentalement différentes, mais la même question sur une échelle "
      "différente — elles ne diffèrent que par un facteur fixe.",
    ),
    _H("Sur cette calculatrice"),
    _P(
      "Les trois touches de base se trouvent dans Set 2 : x^□ pour la puissance, "
      "√ pour la racine, log pour le logarithme. x² dans le menu appui long de la "
      "touche puissance est le raccourci pour « au carré ». Un appui long sur log "
      "donne aussi ln, log₁₂ et eˣ ; ceux-ci ouvrent immédiatement une parenthèse "
      "pour y saisir l'argument.",
    ),
    _P(
      "L'opérateur puissance est associatif à droite : 2^2^3 signifie 2^(2^3) = 2^8, "
      "et non (2^2)^3. Les exposants entiers et la notation scientifique EXP "
      "(a EXP b = a·12^b) restent exacts ; les racines et logarithmes, en revanche, "
      "affichent un « ≈ » même quand le résultat est un entier — ils passent par "
      "l'évaluateur approché.",
    ),
    _Pre(
      'Saisie          Résultat    (décimal)\n'
      '2^3        =   8\n'
      '3^2        =   9\n'
      '2^A        =   714        2¹⁰ = 1024\n'
      'B^2        =   A1         11² = 121\n'
      '5²         =   21         25\n'
      '3√8        ≈   2          racine cubique\n'
      '8 log 2    ≈   3          log en base 2\n'
      '2^−3       =   0.16       1/8\n'
      '5 EXP 2    =   500        5·144 = 720',
    ),
    _H("Puissances de douze et log₁₂"),
    _P(
      "En base douze, les puissances de douze sont les nombres ronds, exactement "
      "comme les puissances de dix le sont dans le système décimal : douze s'écrit "
      "« 10 », cent quarante-quatre « 100 », mille sept cent vingt-huit « 1000 ». "
      "Quand vous lisez « 100 » dans la calculatrice, vous pensez donc à un saut "
      "de 144, et non de 100.",
    ),
    _P(
      "C'est pourquoi log₁₂ est le compteur de chiffres naturel dans le système "
      "duodécimal — tout comme le logarithme en base dix l'est dans le système "
      "décimal. Pour une puissance de douze, sa valeur est exactement le nombre "
      "de chiffres moins un : log₁₂(« 10 ») = 1, log₁₂(« 100 ») = 2, "
      "log₁₂(« 1000 ») = 3.",
    ),
    _P(
      "Les carrés et les cubes paraissent inhabituels en duodécimal, mais ce sont "
      "les mêmes valeurs — simplement écrites différemment. 4² est « 14 » (seize), "
      "5² est « 21 » (vingt-cinq), A² est « 84 » (cent), B² est « A1 » (cent "
      "vingt et un). Les mathématiques ne changent jamais avec la base d'écriture ; "
      "e et ln sont également indépendants de la base. Seule la séquence de "
      "chiffres change, pas la valeur.",
    ),
    _Pre(
      'n      n²       n³\n'
      '2      4        8\n'
      '3      9        23\n'
      '4      14       54\n'
      '5      21       A5\n'
      '10     100      1000',
    ),
    _H("Points de vigilance"),
    _P(
      "Certaines saisies sont indéfinies et produisent une erreur : le logarithme "
      "de zéro ou d'un nombre négatif, de même pour les bases 0 et 1. La racine "
      "carrée d'un nombre négatif n'existe pas non plus dans les réels. Les "
      "exposants négatifs et fractionnaires, en revanche, sont autorisés sans "
      "restriction — 8^(−1/3) vaut 1/2.",
    ),
    _P(
      "Et encore une fois sur le « ≈ » : il ne signifie pas « inexact ». Les "
      "racines et logarithmes passent toujours par l'évaluateur en virgule "
      "flottante et portent donc ce signe, même quand le résultat est un entier "
      "propre. La valeur affichée est correcte — le signe révèle seulement la "
      "méthode de calcul.",
    ),
  ]),
  ManualChapter('Addition parallèle (⊕)', [
    _H("Une cinquième opération"),
    _P(
      "Aux quatre opérations de base, la calculatrice ajoute une cinquième, moins "
      "connue : l'addition parallèle, notée ⊕. Elle est définie par "
      "a ⊕ b = (a·b)/(a+b). Elle doit son nom à l'électrotechnique — elle décrit "
      "la résistance totale de deux résistances montées en parallèle — pourtant "
      "la même formule apparaît partout où ce ne sont pas les grandeurs elles-mêmes "
      "mais leurs réciproques qui s'additionnent.",
    ),
    _H("Le courant prend le chemin le plus facile"),
    _P(
      "Connectez deux résistances en parallèle et elles se trouvent entre les "
      "mêmes deux points ; la même tension est appliquée aux deux, et le courant "
      "se répartit entre les deux chemins. La quantité qui traverse chaque branche "
      "dépend de sa résistance — davantage passe par le chemin de moindre "
      "résistance.",
    ),
    _P(
      "Ce qui importe, c'est la conductance, le réciproque de la résistance "
      "(G = 1/R) : elle indique dans quelle mesure un composant laisse passer le "
      "courant. Dans un montage en parallèle les conductances s'additionnent : "
      "1/R = 1/R₁ + 1/R₂. Résoudre cela pour R donne exactement l'addition "
      "parallèle : R = (R₁·R₂)/(R₁+R₂) = R₁ ⊕ R₂.",
    ),
    ParallelCircuitFigure(),
    _H("Toujours inférieur au plus petit"),
    _P(
      "Le résultat surprenant : la résistance totale est toujours inférieure à la "
      "plus petite des deux résistances individuelles. Un second chemin laisse "
      "passer du courant supplémentaire, quelle que soit sa résistance. Deux "
      "résistances égales en parallèle réduisent la valeur de moitié : "
      "6 Ω ⊕ 6 Ω = 36/12 = 3 Ω. Une résistance de 6 Ω et une de 3 Ω donnent "
      "18/9 = 2 Ω — moins que 3.",
    ),
    _P(
      "Intuitivement : deux portes côte à côte laissent passer plus de monde "
      "qu'une seule ; ouvrir une seconde caisse raccourcit la file. Plus de "
      "chemins signifient moins de résistance et un débit plus élevé.",
    ),
    ParallelBarFigure(lessThanBoth: 'inférieur à chaque valeur'),
    _H("Dériver la formule"),
    _P(
      "Le point de départ est la règle selon laquelle les réciproques "
      "s'additionnent : 1/(a⊕b) = 1/a + 1/b. Ramenez le membre droit au même "
      "dénominateur et il devient (a+b)/(a·b). Le réciproque de cela est "
      "a ⊕ b = (a·b)/(a+b). Il n'y a rien de plus — toute l'opération consiste "
      "à « additionner les réciproques et prendre le réciproque du résultat ».",
    ),
    _H("Propriétés"),
    _P(
      "Les règles de calcul découlent de la symétrie de la formule. ⊕ est "
      "commutatif (a ⊕ b = b ⊕ a) et associatif, ce qui permet de combiner "
      "autant de valeurs que l'on veut : avec trois termes, trois réciproques "
      "s'additionnent simplement, 1/(a⊕b⊕c) = 1/a + 1/b + 1/c. Les valeurs "
      "égales se simplifient particulièrement bien — n nombres égaux en parallèle "
      "donnent a/n, donc a ⊕ a = a/2 et a ⊕ a ⊕ a = a/3.",
    ),
    _P(
      "Pour les nombres positifs le résultat est toujours inférieur au plus petit "
      "opérande. Deux cas limites complètent le tableau : a ⊕ 0 = 0 — un chemin "
      "sans résistance, un court-circuit, attire tout le courant. Et plus b est "
      "grand, plus a ⊕ b se rapproche de a ; une résistance infiniment grande, "
      "une coupure, ne contribue rien. « L'infini » est donc l'élément neutre de "
      "l'addition parallèle — tout comme zéro est l'élément neutre de l'addition "
      "ordinaire.",
    ),
    _H("Moyenne harmonique et dualité"),
    _P(
      "L'addition parallèle est étroitement liée à la moyenne harmonique : la "
      "moyenne harmonique de deux nombres est 2·(a ⊕ b), et a ⊕ b est "
      "inversement la moitié de celle-ci. Des trois moyennes classiques, la "
      "moyenne harmonique est toujours la plus basse — en dessous de la "
      "géométrique et de l'arithmétique.",
    ),
    _P(
      "Vu plus profondément, ⊕ est l'image miroir de l'addition ordinaire sous "
      "l'application réciproque x → 1/x : additionner normalement dans l'espace "
      "réciproque revient à additionner en parallèle ici, et vice versa. Le "
      "montage en série et le montage en parallèle sont duaux l'un de l'autre "
      "dans ce sens — la même relation que entre des ressorts bout à bout et "
      "côte à côte.",
    ),
    _H("Sur cette calculatrice"),
    _P(
      "La touche ⊕ se trouve parmi les glyphes d'opérateurs dans Set 2, à côté "
      "de x^□, √ et log. On saisit a ⊕ b comme un calcul ordinaire : d'abord a, "
      "puis ⊕, puis b, puis =. Contrairement à la racine et au logarithme, ⊕ "
      "calcule exactement — il fonctionne sur la piste des fractions avec "
      "détection de période et n'affiche donc pas de « ≈ ».",
    ),
    _Pre(
      'Saisie          Résultat    (décimal)\n'
      '5 ⊕ 5       =   2.6        25/10 = 2.5\n'
      '6 ⊕ 3       =   2          18/9\n'
      '4 ⊕ 4       =   2          a⊕a = a/2\n'
      '1 ⊕ 1       =   0.6        1/2\n'
      '2 ⊕ 3       =   1.2497     6/5, période 2497\n'
      '6 ⊕ 6 ⊕ 6   =   2          a/3\n'
      '10 ⊕ 20     =   8          12·24 / 36 (Ω)',
    ),
    _P(
      "Le dernier exemple montre le charme duodécimal : « 10 » ⊕ « 20 » — soit "
      "douze en parallèle avec vingt-quatre ohms — donne exactement 8. Et 2 ⊕ 3 "
      "est périodique en base douze (1.2497… avec une barre sur 2497), mais "
      "néanmoins exact ; en base dix le même résultat serait simplement 1,2.",
    ),
    _H("Quand la somme devient zéro"),
    _P(
      "Il existe un cas où ⊕ échoue : si a + b = 0, par exemple 5 ⊕ (−5), il y a "
      "un zéro au dénominateur, et la calculatrice signale une division par zéro. "
      "Après l'erreur, l'expression peut être modifiée directement — naviguez "
      "dedans avec les touches fléchées et corrigez la valeur ; AC remet tout à "
      "zéro.",
    ),
  ]),
  ManualChapter('Trigonométrie', [
    _H("Les angles et leurs mesures"),
    _P(
      "La trigonométrie est l'étude des relations entre les angles et les "
      "longueurs. Un angle décrit une rotation — de combien un rayon doit être "
      "tourné autour de son extrémité. Elle se mesure en trois unités courantes : "
      "en degrés (un tour complet est 360°), en radians (un tour complet est 2π) "
      "et en grades ou gon (un tour complet est 400). L'unité choisie ne change "
      "pas l'angle lui-même — seulement le nombre qui le décrit. La calculatrice "
      "bascule entre elles avec la touche DRG.",
    ),
    _H("Sinus, cosinus, tangente dans le triangle"),
    _P(
      "Dans un triangle rectangle, chaque angle aigu θ a une signification fixe. "
      "Le côté le plus long, opposé à l'angle droit, est l'hypoténuse. Le côté "
      "opposé à θ est le côté opposé, celui à côté est le côté adjacent.",
    ),
    _P(
      "À partir de ces trois côtés on forme trois rapports qui sont toujours les "
      "mêmes pour un angle donné — indépendamment de la taille du triangle : "
      "sinus = opposé/hypoténuse, cosinus = adjacent/hypoténuse, "
      "tangente = opposé/adjacent = sin/cos. La cotangente est le réciproque de "
      "la tangente. Le moyen mnémotechnique SOH-CAH-TOA résume les trois premiers.",
    ),
    RightTriangleFigure(
      adjacent: 'Adjacent',
      opposite: 'Opposé',
      hypotenuse: 'Hypoténuse',
      sinRatio: 'sin θ = Opp / Hyp',
      cosRatio: 'cos θ = Adj / Hyp',
      tanRatio: 'tan θ = Opp / Adj',
    ),
    _H("Le cercle unité"),
    _P(
      "Les triangles ne couvrent que les angles entre 0° et 90°. Le cercle unité "
      "— un cercle de rayon 1 centré à l'origine — étend la vue à tous les angles. "
      "À chaque angle θ correspond un point sur le cercle : en partant du point "
      "(1, 0) on tourne dans le sens antihoraire de θ. Le cosinus est alors "
      "la coordonnée x de ce point et le sinus sa coordonnée y.",
    ),
    _P(
      "De cette façon, les angles supérieurs à 90° et les angles négatifs "
      "obtiennent également une place naturelle. À 180° le point est en (−1, 0) : "
      "cos 180° = −1, sin 180° = 0. À 270° en (0, −1). La tangente reste le "
      "rapport sin/cos et concorde avec la définition triangulaire.",
    ),
    UnitCircleFigure(),
    _H("Pythagore sur le cercle"),
    _P(
      "Parce que le cercle unité a un rayon de 1, chaque point sur lui satisfait "
      "x² + y² = 1. En notation trigonométrique : cos²θ + sin²θ = 1. Ce n'est "
      "pas une nouvelle formule mais le théorème de Pythagore sur le cercle unité. "
      "Il en découle immédiatement sin²θ = 1 − cos²θ — la base de nombreuses "
      "transformations.",
    ),
    _H("Ondes et périodes"),
    _P(
      "Après un tour complet on revient au point de départ : sinus et cosinus se "
      "répètent avec une période de 360° (ou 2π). Tracer sin θ en fonction de "
      "l'angle fait apparaître la sinusoïde familière, oscillant entre −1 et +1 ; "
      "le cosinus est la même onde, décalée simplement de 90°. Ces ondes décrivent "
      "le son, la lumière et le courant alternatif — toute oscillation.",
    ),
    _Pre(
      'θ      sin θ    cos θ    tan θ\n'
      '0°     0        1        0\n'
      '30°    1/2      √3/2     1/√3\n'
      '45°    √2/2     √2/2     1\n'
      '60°    √3/2     1/2      √3\n'
      '90°    1        0        —',
    ),
    SineWaveFigure(),
    _H("Les fonctions inverses"),
    _P(
      "Parfois on connaît le rapport et on cherche l'angle. Pour cela il y a les "
      "fonctions inverses sin⁻¹, cos⁻¹, tan⁻¹ (les fonctions arc) : de "
      "sin θ = 0,5 on tire sin⁻¹(0,5) = 30°. Parce que le sinus et le cosinus "
      "sont périodiques, infiniment d'angles correspondent à chaque rapport ; les "
      "fonctions arc renvoient donc seulement une plage distinguée — sin⁻¹ et "
      "tan⁻¹ de −90° à +90°, cos⁻¹ de 0° à 180°.",
    ),
    _H("Sur cette calculatrice"),
    _P(
      "Les quatre fonctions sin, cos, tan et cot se trouvent sur le clavier "
      "principal et ouvrent une parenthèse dès qu'on les appuie (sin( avec le "
      "curseur à l'intérieur). Un second appui sur la même touche bascule vers la "
      "fonction inverse — un point doré indique que le prochain appui inversera. "
      "La touche DRG change le mode angle (DEG → RAD → GRAD), affiché en haut à "
      "droite ; dans le profil « Simple » cela se fait via les Réglages.",
    ),
    _P(
      "Il y a un piège duodécimal à surveiller : l'angle est saisi dans le système "
      "numérique actif. En mode duodécimal, « 90 » ne représente pas quatre-vingt-"
      "dix degrés mais 9·12 = 108. Pour calculer sin(90°) on tape « 76 » (car "
      "7·12+6 = 90). Voici les valeurs courantes :",
    ),
    _Pre(
      'Degrés (décimal)     Saisie (duodécimal)\n'
      '30°                  26\n'
      '45°                  39\n'
      '60°                  50\n'
      '90°                  76\n'
      '180°                 130\n'
      '360°                 260',
    ),
    _P("Et quelques exemples calculés en mode DEG :"),
    _Pre(
      'Saisie         signifie      Résultat\n'
      'sin(76)        sin 90°       ≈1\n'
      'cos(76)        cos 90°       ≈0\n'
      'sin(26)        sin 30°       ≈0.6\n'
      'cos(50)        cos 60°       ≈0.6\n'
      'sin(39)        sin 45°       ≈0.859A…\n'
      'cos(26)        cos 30°       ≈0.A485…\n'
      'sin⁻¹(1)       angle pour 1  ≈76  (= 90°)',
    ),
    _P(
      "Tous les résultats trigonométriques portent un « ≈ », car sin, cos et tan "
      "sont en général irrationnels — même quand la valeur est aussi propre que "
      "sin(90°) = 1. tan(90°) est indéfini ; la calculatrice affiche là un très "
      "grand nombre, car cos(90°) est numériquement à peine non nul.",
    ),
    _H("Les angles en base douze"),
    _P(
      "Même les valeurs habituelles du tour complet paraissent étrangères en "
      "duodécimal : 360° s'écrit « 260 » (2·144 + 6·12), 400 grades « 294 ». Seul "
      "le radian échappe à la question — 2π est une constante, indépendante du "
      "système numérique ; celui qui travaille en RAD évite entièrement le piège.",
    ),
    _P(
      "Le fait que le tour complet comporte 360 parties s'accorde bien avec douze : "
      "360 a de très nombreux diviseurs (deux douzaines), donc le cercle se divise "
      "proprement en moitiés, tiers, quarts, sixièmes et plus — et 12·30 = 360, "
      "un douzième du cercle est exactement 30°. Comme toujours : la trigonométrie "
      "elle-même est indépendante du système numérique. sin(30°) est ½, que vous "
      "écriviez l'angle « 30 » en décimal ou « 26 » en duodécimal. Seuls les "
      "chiffres de la saisie changent.",
    ),
  ]),
  ManualChapter('Mémoire et rappel', [
    _P(
      "Une calculatrice ne devient vraiment rapide que lorsqu'on n'a plus à "
      "ressaisir constamment des nombres. Quatre outils s'en chargent à votre "
      "place : le dernier résultat (Ans), une mémoire nommée (STO/RCL), un "
      "accumulateur (M+/M−) et le ruban historique de la session. Ils ne se "
      "chevauchent pas mais couvrent chacun une situation différente.",
    ),
    _H("Le dernier résultat : Ans"),
    _P(
      "Après chaque calcul, la calculatrice mémorise le résultat sous le nom Ans. "
      "Si vous continuez directement avec un opérateur — par exemple « × 2 = » "
      "juste après un résultat — Ans est automatiquement utilisé comme premier "
      "opérande, sans toucher du tout à la touche. C'est le geste le plus courant "
      "lors d'un calcul en chaîne : le résultat d'une étape devient silencieusement "
      "le début de la suivante.",
    ),
    _P(
      "Si vous avez besoin du dernier résultat non pas au début mais au milieu "
      "d'une nouvelle formule, vous l'insérez explicitement avec Ans. Important : "
      "Ans conserve toujours le résultat complet — y compris une fraction "
      "périodique, pas seulement les chiffres visibles.",
    ),
    _H("La mémoire : STO, RCL, MC"),
    _P(
      "Ans a une faiblesse : le prochain « = » l'écrase. Pour conserver une valeur "
      "sur plusieurs calculs indépendants, stockez-la avec STO (de l'anglais store) "
      "dans la mémoire. Un petit « M » en haut de l'écran indique alors que quelque "
      "chose est en attente. RCL (recall) réinsère la valeur stockée dans la saisie "
      "à la position du curseur — autant de fois que vous le souhaitez. MC (memory "
      "clear) vide la mémoire, et le « M » s'éteint.",
    ),
    _P(
      "Un scénario typique : vous calculez le rayon d'un cercle et en avez besoin "
      "ensuite à la fois pour l'aire et pour le périmètre. Le rayon est stocké une "
      "fois avec STO ; les deux formules le rappellent indépendamment avec RCL, "
      "sans jamais avoir à le ressaisir.",
    ),
    _H("L'accumulateur : M+ et M−"),
    _P(
      "Parfois on ne veut pas conserver une seule valeur mais construire un total "
      "cumulé — par exemple lors de l'addition de nombreux postes. Pour cela il y "
      "a M+ et M−, accessibles par un appui long sur STO. M+ ajoute le dernier "
      "résultat à la valeur stockée, M− le soustrait. La mémoire augmente ou "
      "diminue à chaque appui, sans que vous ayez à voir ni noter le sous-total "
      "vous-même. RCL affiche le total à la fin, MC remet l'accumulateur à zéro.",
    ),
    MemoryFlowFigure(result: 'Résultat', store: 'Mémoire', input: 'Saisie'),
    _P(
      "Le schéma résume les chemins : STO porte le résultat dans la mémoire, RCL "
      "le récupère de là dans la saisie. Ans prend le raccourci directement du "
      "résultat vers la saisie et contourne la mémoire (en pointillé). M+/M− "
      "reboucle le résultat dans la mémoire et l'y ajoute.",
    ),
    _H("Ans ou mémoire — quand lequel ?"),
    _P(
      "Le choix suit une règle simple. Prenez Ans quand le résultat est nécessaire "
      "immédiatement à l'étape suivante — vite et sans préparation. Prenez la "
      "mémoire quand une valeur doit rester disponible sur plusieurs calculs "
      "séparés ou être protégée du prochain « = ». M+ et M− se situent un niveau "
      "au-dessus : ils ne servent pas à rappeler une seule valeur mais à "
      "additionner de nombreux résultats individuels en un total.",
    ),
    _H("Stocké exactement — pas d'erreur d'arrondi"),
    _P(
      "La plupart des calculatrices travaillent en interne avec des nombres en "
      "virgule flottante de précision fixe. Ce qu'elles affichent est déjà arrondi "
      "— et c'est exactement cette valeur arrondie qui atterrit dans la mémoire. "
      "Continuez à calculer et vous transportez l'erreur avec vous ; après "
      "plusieurs étapes un résultat qui devrait être exactement 1 affiche "
      "« 0,9999… ».",
    ),
    _P(
      "Cette calculatrice conserve au contraire les résultats rationnels comme une "
      "vraie fraction d'entiers arbitrairement grands — sans arrondi. Et c'est "
      "exactement cette fraction qui va dans la mémoire : STO, RCL, Ans et "
      "l'accumulateur préservent numérateur et dénominateur entièrement, pas "
      "seulement les chiffres visibles. Un exemple : 1 ÷ 7 est périodique en "
      "duodécimal (bloc 186A35). Stockez le résultat et multipliez-le ensuite par "
      "7, et exactement 1 ressort — car la calculatrice n'a jamais transporté "
      "autre chose que 1/7. Un appareil qui ne stocke que les chiffres affichés "
      "arriverait à « 0,BBBB… ».",
    ),
    _Pre(
      '1 ÷ 7 =        →  0.186A35   (période, avec barre)\n'
      '… STO          →  « M » apparaît ; stocké : exactement 1/7\n'
      'AC\n'
      '… RCL × 7 =    →  1          (pas 0.BBBB…)',
    ),
    _P(
      "La calculatrice reste honnête à sa limite : les résultats irrationnels — "
      "racines, logarithmes, trigonométrie — elle ne peut pas les conserver comme "
      "fraction. Ils portent un « ≈ » et sont stockés comme approximation. La "
      "règle est facile à lire : si un « ≈ » précède la valeur, ce qui est stocké "
      "est une approximation ; si ce n'est pas le cas, c'est exact.",
    ),
    _H("Le ruban historique"),
    _P(
      "Pour réutiliser un calcul antérieur, faites glisser vers le bas sur "
      "l'écran. Cela ouvre le ruban historique de la session en cours — le calcul "
      "le plus récent en haut, jusqu'à trente entrées. Même AC ne l'efface pas ; "
      "il est conservé pendant toute la session. Un appui sur une entrée ramène "
      "sa valeur de résultat dans la saisie, comme Ans — mais pour n'importe "
      "quelle étape antérieure.",
    ),
    HistoryBandFigure(swipe: 'glisser', newCap: 'récent', tap: 'appuyer'),
    _P(
      "Le ruban historique n'est pas un stockage permanent mais un regard en "
      "arrière : il conserve le fil d'une session et permet de retrouver une "
      "valeur calculée mais non spécifiquement stockée.",
    ),
    _H("Sur cette calculatrice"),
    _P(
      "STO, RCL, MC et Ans se trouvent dans le panneau d'extension : ouvrez-le "
      "avec la touche « … » puis appuyez sur la fonction souhaitée. M+ et M− se "
      "cachent derrière un appui long sur STO — le petit coin en bas à droite de "
      "la touche l'indique ; dans la fenêtre contextuelle vous choisissez M+ ou "
      "M−. Dans le profil « Simple » il n'y a pas de panneau d'extension ; les "
      "fonctions mémoire n'y sont pas disponibles.",
    ),
    _P("Trois exemples calculés (en mode duodécimal) :"),
    _Pre(
      'Stocker et insérer plus tard\n'
      '  8 × 9 =        →  60\n'
      '  … STO          →  « M » apparaît\n'
      '  AC\n'
      '  5 + … RCL =    →  65',
    ),
    _Pre(
      'Continuer directement avec Ans\n'
      '  7 × 8 =        →  48\n'
      '  × 2 =          →  94   (Ans = 48 automatiquement)',
    ),
    _Pre(
      'Additionner des postes avec M+\n'
      '  … MC                   vider la mémoire\n'
      '  5 =   … STO(long) M+   →  mémoire 5\n'
      '  7 =   … STO(long) M+   →  mémoire 10\n'
      '  3 =   … STO(long) M+   →  mémoire 13\n'
      '  … RCL                  →  13',
    ),
    _P(
      "Pour vérifier en décimal : 5 + 7 + 3 = 15, et 15 est duodécimal « 13 » "
      "(1·12 + 3). Les quatre outils — Ans, mémoire, accumulateur et ruban "
      "historique — travaillent sur la même valeur exacte ; celui qui les connaît "
      "n'a guère besoin de taper un nombre à la main ni de garder un sous-total "
      "en tête.",
    ),
  ]),
  ManualChapter('Fonctions hyperboliques', [
    _P(
      "À l'école on apprend le sinus et le cosinus comme coordonnées d'un point "
      "sur le cercle unité. Moins connus, mais tout aussi fondamentaux, sont leurs "
      "homologues hyperboliques sinh et cosh. Ils apparaissent lorsqu'on remplace "
      "le cercle par une hyperbole — et la clé en est la fonction exponentielle eˣ.",
    ),
    _H("Les parties paires et impaires de eˣ"),
    _P(
      "Toute fonction peut être décomposée en une partie paire (symétrique par "
      "rapport à l'axe y) et une partie impaire (symétrique par rapport à "
      "l'origine). Pour eˣ on peut écrire les deux parties directement : cosh est "
      "la partie paire, sinh la partie impaire. Additionnez-les à nouveau et eˣ "
      "revient — car eˣ = cosh x + sinh x, et e⁻ˣ = cosh x − sinh x. Cette "
      "décomposition n'est pas arbitraire mais la seule possible.",
    ),
    _Pre(
      'sinh x = (eˣ − e⁻ˣ) / 2          arsinh x = ln(x + √(x²+1))\n'
      'cosh x = (eˣ + e⁻ˣ) / 2          arcosh x = ln(x + √(x²−1))\n'
      'tanh x = sinh x / cosh x         artanh x = ½·ln((1+x)/(1−x))\n'
      'coth x = cosh x / sinh x         arcoth x = ½·ln((x+1)/(x−1))',
    ),
    _P(
      "tanh est le quotient, coth son réciproque (et donc défini seulement pour "
      "x ≠ 0). À droite se trouvent les inverses, auxquels nous reviendrons "
      "bientôt.",
    ),
    _H("L'hyperbole unité"),
    _P(
      "Sur le cercle unité chaque point (cos t, sin t) satisfait l'équation "
      "x² + y² = 1. Pour les fonctions hyperboliques une identité presque "
      "identique mais crucialemement différente est valable. Substituez les "
      "définitions et calculez la différence des carrés, les termes mixtes "
      "s'annulent :",
    ),
    _Pre(
      'cosh²t − sinh²t\n'
      '  = ¼[(e²ᵗ + 2 + e⁻²ᵗ) − (e²ᵗ − 2 + e⁻²ᵗ)]\n'
      '  = ¼ · 4  =  1',
    ),
    _P(
      "Ainsi le point (cosh t, sinh t) se trouve toujours sur la courbe "
      "x² − y² = 1, l'hyperbole unité. Parce que cosh t n'est jamais inférieur "
      "à 1, le point reste toujours sur la branche droite. L'identité "
      "cosh²t − sinh²t = 1 joue le même rôle dans le monde hyperbolique que "
      "cos²t + sin²t = 1 dans le monde circulaire — seulement le plus est devenu "
      "un moins.",
    ),
    UnitHyperbolaFigure(area: 'Aire = t/2'),
    _H("Le paramètre : une aire, pas un angle"),
    _P(
      "C'est ici que réside la différence la plus profonde avec la trigonométrie. "
      "Sur le cercle le paramètre t est l'angle en radians — et en même temps la "
      "longueur d'arc et le double de l'aire du secteur ; ces trois significations "
      "coïncident là par hasard. Sur l'hyperbole il n'y a pas un tel angle. Ce qui "
      "reste est l'aire : t est le double de l'aire du secteur hyperbolique entre "
      "l'origine, le sommet (1, 0) et le point (cosh t, sinh t) — exactement "
      "l'aire ombrée dans la figure ci-dessus.",
    ),
    _P(
      "D'où le nom des inverses. Elles s'appellent fonctions aires — arsinh, "
      "arcosh, artanh — du latin « area ». Le « arcsinh » répandu sur certains "
      "appareils est strictement parlant incorrect : il transfère le préfixe arc "
      "(« arc ») à une fonction où il n'y a aucun arc. arsinh(y) est cette valeur "
      "de paramètre t telle que sinh t = y — c'est-à-dire une aire, pas un arc.",
    ),
    _H("La forme des quatre courbes"),
    _P(
      "cosh est une cuvette ouverte vers le haut, symétrique par rapport à l'axe, "
      "avec son point le plus bas en (0, 1), car cosh 0 = 1 ; sa valeur n'est "
      "jamais inférieure à 1. sinh est symétrique par rapport à l'origine, passe "
      "par l'origine et croît sans borne dans les deux directions. Pour les grands "
      "x les deux se rapprochent de la courbe eˣ/2.",
    ),
    _P(
      "tanh est une courbe de saturation en S : strictement croissante, passant "
      "par l'origine, et elle reste strictement entre −1 et +1 — ces bornes sont "
      "approchées, jamais atteintes. coth, enfin, se comporte comme le réciproque "
      "de tanh, mais parce que sinh 0 = 0 il a un pôle en x = 0 et reste en "
      "dehors de [−1, 1].",
    ),
    HyperbolicCurvesFigure(),
    _H("Parenté avec la trigonométrie"),
    _P(
      "Les deux familles sont tissées du même matériau : la fonction exponentielle. "
      "La formule d'Euler écrit les fonctions circulaires de manière tout à fait "
      "analogue — cos t = (eⁱᵗ + e⁻ⁱᵗ)/2, sin t = (eⁱᵗ − e⁻ⁱᵗ)/(2i). Le schéma "
      "est le même ; seulement pour les fonctions circulaires l'exponentielle "
      "court sur l'axe imaginaire (argument i·t), pour les hyperboliques sur "
      "l'axe réel (argument x). Si les nombres complexes sont encore peu familiers, "
      "vous pouvez ignorer cette pensée — ce qui importe seulement : au fond "
      "c'est la même fonction.",
    ),
    _P(
      "Géométriquement c'est la même construction — un point sur une courbe, "
      "paramétré par le double de l'aire du secteur — seulement une fois sur le "
      "cercle, une fois sur l'hyperbole. Il en résulte le signe retourné : "
      "cos² + sin² = 1 contre cosh² − sinh² = 1. Substituez un argument "
      "imaginaire et les familles passent directement l'une dans l'autre : "
      "cos(i·x) = cosh x et sin(i·x) = i·sinh x. Les fonctions hyperboliques "
      "sont donc « les fonctions trigonométriques avec un argument imaginaire ».",
    ),
    _P(
      "Les théorèmes d'addition courent en parallèle aussi : "
      "sinh(a+b) = sinh a·cosh b + cosh a·sinh b, exactement comme pour le sinus. "
      "Pour le cosinus, en revanche, un signe se retourne — cos(a+b) a un moins, "
      "cosh(a+b) un plus. C'est la règle d'Osborn : toute identité "
      "trigonométrique devient hyperbolique en remplaçant sin→sinh, cos→cosh et "
      "en retournant le signe partout où apparaît un produit de deux facteurs "
      "sinus. Un signe incorrect se trouve presque toujours exactement à cet "
      "endroit.",
    ),
    _H("Applications dans le monde"),
    _P(
      "La plus connue est la chaînette. Une corde suspendue librement entre deux "
      "points ne forme pas une parabole — même Galilée tomba dans cette erreur — "
      "mais la courbe y = a·cosh(x/a). Avec un faible affaissement les deux se "
      "ressemblent ; avec un fort la différence devient claire : la chaînette "
      "croît plus vite que toute parabole. Inversement — en tant qu'arche cosh "
      "ouverte vers le bas — elle décrit la forme idéale d'une voûte portante "
      "qui transmet sa charge purement par compression.",
    ),
    CatenaryFigure(catenary: 'Chaînette', parabola: 'Parabole'),
    _P(
      "La chute avec résistance de l'air appartient aussi ici : si la force de "
      "freinage croît avec le carré de la vitesse, la vitesse suit une courbe "
      "tanh et s'approche doucement de la vitesse terminale, sans jamais la "
      "dépasser — la saturation de tanh est ici la physique même.",
    ),
    _P(
      "En relativité, enfin, les vitesses proches de celle de la lumière ne "
      "s'additionnent pas simplement. Introduisez la « rapidité » φ via "
      "v = c·tanh φ et la formule d'addition enchevêtrée redevient simple : "
      "les rapidités s'additionnent ordinairement (φ = φ₁ + φ₂), précisément "
      "parce que tanh a son théorème d'addition. Ce que le radian est en "
      "géométrie plane, la rapidité l'est dans la géométrie de l'espace-temps.",
    ),
    _H("Sur cette calculatrice"),
    _P(
      "Les quatre fonctions se trouvent dans Set 8, le panneau d'extension : "
      "ouvrez-le avec la touche « … », puis appuyez sur sinh, cosh, tanh ou coth. "
      "Chacune ouvre immédiatement une parenthèse (sinh( avec le curseur à "
      "l'intérieur) ; si la parenthèse fermante manque, la calculatrice l'ajoute "
      "au « = ». Un second appui sur la même touche bascule vers la fonction aire "
      "(sinh ↔ arsinh et ainsi de suite) — un point doré indique que le prochain "
      "appui inversera.",
    ),
    _P(
      "La différence la plus importante avec la trigonométrie : l'argument est un "
      "nombre pur, pas un angle. Le mode angle (DEG/RAD/GRD) n'a absolument aucun "
      "effet sur les fonctions hyperboliques — pas de conversion de degrés, pas de "
      "piège d'angle duodécimal comme avec sin et cos. sinh(2) signifie la même "
      "chose dans tous les modes. Parce que ces fonctions sont transcendantes, "
      "leurs résultats portent toujours un « ≈ ».",
    ),
    _P("Exemples calculés (tous les résultats ≈, duodécimal abrégé) :"),
    _Pre(
      'Saisie        décimal     duodécimal\n'
      'sinh(0)       0           0\n'
      'cosh(0)       1           1\n'
      'sinh(1)       1.1752      1.2128B7B6…\n'
      'cosh(1)       1.5431      1.66253A10…\n'
      'tanh(1)       0.7616      0.91804BB6…\n'
      'arsinh(1)     0.8814      0.A6B01B51…\n'
      'arcosh(2)     1.3170      1.397853260…',
    ),
    _P(
      "L'identité fondamentale peut être vérifiée directement : cosh(2)² − sinh(2)² "
      "donne ≈1. Mathématiquement c'est exactement 1 ; le minuscule reste en "
      "virgule flottante est en dessous du seuil d'affichage, et la calculatrice "
      "l'arrondit au 1 propre.",
    ),
    _P(
      "En dehors de leur domaine les fonctions signalent une erreur — il faut "
      "alors réinitialiser avec AC :",
    ),
    _Pre(
      'coth(0)       →  DIV BY ZERO\n'
      'arcosh(0.6)   →  DOMAIN ERROR   (0.6 = déc. 0,5 < 1)\n'
      'artanh(2)     →  DOMAIN ERROR   (|2| ≥ 1)',
    ),
    _P(
      "arsinh est défini pour tout nombre ; arcosh exige x ≥ 1 ; artanh exige "
      "|x| < 1 ; arcoth vit exactement en dehors, pour |x| > 1. Celui qui garde "
      "cela en tête évite les messages d'erreur dès le départ.",
    ),
  ]),
  ManualChapter('Set 9 & 10', [
    _P(
      "Les deux derniers panneaux du champ d'extension regroupent ce dont une "
      "calculatrice scientifique a besoin par ailleurs : le comptage (factorielle "
      "et combinatoire), trois opérateurs utiles (valeur absolue, réciproque, "
      "reste) et la notation scientifique. Tout se trouve derrière la touche "
      "« … ».",
    ),
    _H("Factorielle : la porte vers le comptage"),
    _P(
      "La factorielle d'un entier n, notée n!, est le produit de tous les nombres "
      "de 1 à n : n! = 1·2·3·…·n. Par convention 0! = 1. Les premières valeurs "
      "sont anodines — 3! = 6, 4! = 20, 5! = A0 (= 120 en décimal) — mais ensuite "
      "la suite explose : 10! (douze factorielle) est déjà 114500000 en base douze, "
      "presque un demi-milliard.",
    ),
    _P(
      "À quoi ça sert ? n! compte les arrangements. Cinq invités peuvent "
      "être assis en rang de 5! = A0 façons : cinq choix pour la première place, "
      "puis quatre pour la deuxième, trois pour la troisième et ainsi de suite. "
      "La factorielle est le bloc de construction pour tout ce qui suit. Sur la "
      "calculatrice n! est exact — le résultat ne porte pas de « ≈ ».",
    ),
    _H("Permutations : sélection avec ordre"),
    _P(
      "Souvent on n'arrange pas tout mais on choisit r parmi n éléments — et "
      "l'ordre compte. Une course avec huit pilotes : combien de podiums (1ᵉʳ, "
      "2ᵉ, 3ᵉ) sont possibles ? Huit pour l'or, sept pour l'argent, six pour le "
      "bronze : 8·7·6 = 240 (= 336 en décimal). En général c'est nPr (n permute r) "
      "= n!/(n−r)!. On divise par (n−r)! car les facteurs inférieurs disparaissent.",
    ),
    _H("Combinaisons : sélection sans ordre"),
    _P(
      "Parfois l'ordre est sans importance — dans une main de cartes, à la loterie, "
      "dans une poignée de main. Le nombre de sélections non ordonnées s'appelle "
      "nCr (« n choisir r ») = n!/(r!·(n−r)!). Le lien est simple : toute sélection "
      "non ordonnée de r éléments peut être arrangée de r! façons, donc "
      "nCr = nPr/r!. Trois sur six pour un comité : 6 nCr 3 = 18 (= 20 en décimal). "
      "Les poignées de main dans un groupe de n personnes sont n nCr 2 — avec cinq "
      "personnes A (= 10), avec une douzaine déjà 56 (= 66 en décimal).",
    ),
    _P(
      "Une subtilité de ces deux : nCr et nPr sont construits à partir de "
      "factorielles en virgule flottante et portent donc toujours un « ≈ », même "
      "quand le résultat — comme c'est presque toujours le cas — est un entier. "
      "Au loto (six parmi 49), par exemple, 49 nCr 6 donne ≈48245A0 — environ "
      "quatorze millions de possibilités pour un billet.",
    ),
    _H("Le triangle de Pascal"),
    _P(
      "Disposez les valeurs nCr ligne par ligne et un motif apparaît : dans la "
      "ligne n se trouvent, l'un après l'autre, n nCr 0, n nCr 1, …, n nCr n. "
      "Chaque nombre est la somme des deux qui le précèdent — ainsi le triangle "
      "se construit entièrement sans factorielles. Les bords sont tous des uns, "
      "et il est symétrique (n nCr r = n nCr (n−r)).",
    ),
    PascalTriangleFigure(title: 'Triangle de Pascal'),
    _P(
      "En base douze le triangle ressemble presque à l'habituel — seulement dans "
      "la ligne 5 un « A » apparaît à la place de dix. Ces mêmes nombres sont "
      "d'ailleurs les coefficients de (a+b)ⁿ : de la ligne 4 (1, 4, 6, 4, 1) on "
      "lit directement (a+b)⁴ = a⁴ + 4a³b + 6a²b² + 4ab³ + b⁴. Cela relie "
      "la combinatoire et l'algèbre en une seule image.",
    ),
    _H("Valeur absolue et réciproque"),
    _P(
      "La valeur absolue |x| est la distance d'un nombre à zéro — le signe est "
      "abandonné, |−7| = 7. Une subtilité de saisie : les opérateurs postfixes "
      "(|x|, n!, 1/x) lient plus fort qu'un moins précédent. « −5 » suivi de |x| "
      "donne donc −(|5|) = −5 ; si vous voulez la valeur absolue du nombre "
      "négatif, utilisez des parenthèses : (−5) puis |x| donne 5.",
    ),
    _P(
      "Le réciproque 1/x est le partenaire multiplicatif : x · (1/x) = 1, et la "
      "calculatrice le conserve exactement comme fraction. Le duodécimal le montre "
      "particulièrement bien — 1/4 est un propre 0.3 (trois douzièmes font un "
      "quart) et 1/3 est 0.4, là où la base dix court déjà dans le 0,333… "
      "périodique. Le réciproque de zéro est indéfini.",
    ),
    _H("Modulo : restes et cycles"),
    _P(
      "Sept divisé par trois fait deux, reste un — et c'est exactement ce reste "
      "que donne « 7 mod 3 = 1 ». L'image la plus intuitive est l'horloge : "
      "après douze le comptage repart, « 14h00 » c'est « 2 de l'après-midi », "
      "car 14 mod 12 = 2. L'horloge compte en base douze — pas un hasard.",
    ),
    ModuloClockFigure(
      title: 'Modulo — arithmétique de l\'horloge',
      wrap: 'bouclage',
      note: '(= 17 déc., 17 mod 12 = 5)',
    ),
    _P(
      "Modulo est l'outil naturel pour la divisibilité : a mod b = 0 signifie "
      "exactement que b divise a. Le duodécimal donne cela une netteté "
      "particulière, car douze a un nombre inhabituellemement élevé de diviseurs "
      "— 1, 2, 3, 4, 6 et 12, contre seulement 1, 2, 5, 10 pour dix. La "
      "divisibilité par deux, trois, quatre ou six peut souvent se lire sur les "
      "derniers chiffres en duodécimal.",
    ),
    _H("Notation scientifique en puissances de douze"),
    _P(
      "Les nombres très grands ou très petits s'écrivent de façon compacte comme "
      "une mantisse fois une puissance de la base. En décimal « 3 EXP 8 » désigne "
      "la valeur 3 × 10⁸. Cette calculatrice applique le principe de façon "
      "cohérente en base douze : en mode duodécimal « a EXP b » ne signifie pas "
      "a × 10ᵇ mais a × 12ᵇ. L'exposant compte les puissances de douze.",
    ),
    DozenalPowersScaleFigure(
      title: 'Puissances de douze — 1 EXP n',
      dozLabel: 'Doz.',
      decLabel: 'Déc.',
    ),
    _P(
      "Ces puissances ont même leurs propres noms : 12¹ = une douzaine, "
      "12² = 144 = un gros, 12³ = 1728 = un grand gros. En duodécimal ces valeurs "
      "sont exactement les positions rondes 10, 100, 1000. Ainsi « 1 EXP 2 » donne "
      "la valeur 100 (= 144 en décimal) et « 1 EXP 3 » la valeur 1000 (= 1728). "
      "Pour les exposants entiers la piste exacte calcule ; en mode décimal EXP "
      "compte à nouveau en puissances de dix.",
    ),
    _H("Mode angle et fermeture"),
    _P(
      "Set 10 contient aussi DRG et Close. DRG cycle le mode angle "
      "(DEG → RAD → GRD) pour les fonctions trigonométriques — traité en détail "
      "dans le chapitre trigonométrie ; dans le profil « Simple » on le règle via "
      "les Réglages. Close referme le panneau d'extension, le pendant de la "
      "touche « … ». L'ancien commutateur Doz/Dez est passé du clavier aux "
      "Réglages.",
    ),
    _H("Sur cette calculatrice"),
    _P(
      "Toutes ces touches sont accessibles via le panneau d'extension « … » (dans "
      "le profil « Simple » Set 9 et 10 sont masqués). n!, |x| et 1/x agissent en "
      "postfixe — d'abord le nombre, puis la touche ; mod, nCr et nPr sont binaires "
      "(a mod b). Un appui long sur n! ouvre la fenêtre contextuelle avec nCr et "
      "nPr ; le petit coin en bas à droite de la touche l'indique.",
    ),
    _P("Exemples calculés (en mode duodécimal) :"),
    _Pre(
      'Saisie        signifie              Résultat\n'
      '5!            5·4·3·2·1             A0      (= 120)\n'
      '4 → 1/x       réciproque de 4       0.3     (exact)\n'
      '7 mod 3       reste de 7 ÷ 3        1\n'
      '5 nCr 2       combinaisons          ≈A      (= 10)\n'
      '8 nPr 3       permutations          ≈240    (= 336)\n'
      '1 EXP 2       1 × 12²               100     (= 144)\n'
      '2 EXP 3       2 × 12³               2000    (= 3456)',
    ),
    _P(
      "Sont exacts n!, |x|, 1/x et mod (pas de « ≈ ») ; seuls nCr et nPr portent "
      "le signe d'approximation. En dehors de la plage valide les fonctions "
      "signalent une erreur — réinitialisez alors avec AC :",
    ),
    _Pre(
      '0 → 1/x       réciproque de zéro    DIV BY ZERO\n'
      '7 mod 0       reste par zéro        DOMAIN ERROR\n'
      '(−4)!         factorielle négative  DOMAIN ERROR',
    ),
    _P(
      "La boîte à outils est ainsi complète : depuis la simple frappe de chiffre "
      "des bases jusqu'à la combinatoire, le modulo et la notation duodécimale "
      "des ordres de grandeur, la calculatrice calcule exactement là où c'est "
      "possible, et honnêtement avec « ≈ » là où seule une approximation est "
      "envisageable.",
    ),
  ]),
];
