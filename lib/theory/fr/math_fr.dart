part of '../math_theory.dart';

List<ProseChapter> _mathChaptersFr() => const [
  ProseChapter('Diviseurs, fractions et périodes', [
    ProseSection(
      'Pourquoi douze se divise si bien',
      'En base douze, nous écrivons douze chiffres : 0 à 9, plus A pour dix '
          'et B pour onze. « 10 » signifie donc ici douze.\n\n'
          'Douze se divise sans reste par un nombre particulièrement élevé de '
          'nombres : 1, 2, 3, 4, 6 et 12. Dix, en revanche, seulement par 1, '
          '2, 5 et 10. La raison tient à la structure des nombres : dix est '
          'deux fois cinq, douze est deux fois deux fois trois. Douze place '
          'ses composants dans les petits diviseurs fréquents 2 et 3 — et se '
          'trouve ainsi divisible par 3 et par 4, ce à quoi dix échoue. La '
          'taille n\'y change rien : 16 est plus grand, mais divisible '
          'uniquement par des puissances de deux.',
    ),
    ProseSection(
      'Quelles fractions tombent juste',
      'Qu\'une fraction donne ou non un nombre décimal fini dépend d\'une '
          'règle simple : elle tombe juste exactement lorsque le dénominateur '
          'n\'est composé que de facteurs premiers de la base.\n\n'
          'Comme douze contient le trois, beaucoup de fractions du quotidien '
          'sont finies en base douze : un demi = 0,6 ; un tiers = 0,4 ; un '
          'quart = 0,3 ; un sixième = 0,2 ; un neuvième = 0,14 ; un douzième '
          '= 0,1. En base dix, en revanche, les tiers, sixièmes et neuvièmes '
          'sont infinis. Le prix de douze : les fractions ayant cinq au '
          'dénominateur deviennent biscornues — un cinquième vaut en base '
          'douze 0,2497, avec répétition.',
    ),
    ProseSection(
      'Quand cela se répète',
      'Si une fraction ne tombe pas juste, un groupe fixe de chiffres se '
          'répète à partir d\'un certain rang — la période. Sa longueur suit '
          'une règle claire de la théorie des nombres et dépend de la base et '
          'du dénominateur.\n\n'
          'Certaines choses sont tout aussi rétives dans les deux mondes : un '
          'septième a, en base dix (0,142857) comme en base douze (0,186A35), '
          'une période de six chiffres. Au total, parmi les petits '
          'dénominateurs, il y a en base douze un peu moins de fractions '
          'périodiques qu\'en base dix — en contrepartie, les périodes, '
          'lorsqu\'elles apparaissent, peuvent être un peu plus longues.',
    ),
    ProseSection(
      'La divisibilité d\'un coup d\'œil',
      'Concrètement, la force de douze se révèle dans les règles de '
          'divisibilité. En base douze, le dernier chiffre suffit déjà à dire '
          'si un nombre est divisible par 2, 3, 4 ou 6. En base dix, cela ne '
          'marche que pour 2, 5 et 10.\n\n'
          'Pour onze (B), il existe une règle de somme des chiffres — '
          'exactement comme la fameuse preuve par neuf en base dix, parce que '
          'douze est juste un de plus que onze. Seul le sept n\'a, comme en '
          'base dix, aucun test simple.',
    ),
    ProseSection(
      'Aucune base ne gagne partout',
      'Douze a donc un véritable avantage pour diviser en tiers et en quarts '
          '— et un véritable inconvénient pour diviser en cinquièmes, ce qui '
          'compte pour les pourcentages et l\'argent. Elle échange l\'un '
          'contre l\'autre.\n\n'
          'Davantage de diviseurs n\'est pas non plus arbitrairement '
          'meilleur : sinon, soixante serait avantagée, elle qui est '
          'divisible par encore plus de nombres — mais elle aurait besoin de '
          'soixante chiffres et d\'une immense table de multiplication. Les '
          'sociétés dozenales voient en douze un bon compromis : seulement '
          'deux signes supplémentaires, une petite table de multiplication, '
          'mais les diviseurs 2, 3 et 4. C\'est leur arbitrage, pas une '
          'preuve.',
    ),
  ], sources: [
    Source('Duodecimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Duodecimal', 'R2', 'A1'),
    Source('Repeating decimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Repeating_decimal', 'R2', 'A1'),
    Source('Highly composite number — Wikipedia',
        'https://en.wikipedia.org/wiki/Highly_composite_number', 'R2', 'A1'),
    Source('Dozenal Divisibility Rules — Dozenal Society of America',
        'https://dozenal.org/drupal/content/dozenal-divisibility-rules.html',
        'R2', 'A1'),
    Source('Decimal Period — Wolfram MathWorld',
        'https://mathworld.wolfram.com/DecimalPeriod.html', 'R1', 'A2'),
    Source('Orders of Units in Modular Arithmetic — Keith Conrad (UConn)',
        'https://kconrad.math.uconn.edu/blurbs/ugradnumthy/ordersmodm.pdf',
        'R1', 'A2'),
  ]),
  ProseChapter('Les bases numériques en comparaison', [
    ProseSection(
      'Ce qu\'est une base',
      'Un système de numération positionnelle attribue à chaque chiffre une '
          'valeur selon sa position. La base indique combien il y a de '
          'chiffres et de quel facteur croît chaque rang. La base dix utilise '
          'dix chiffres, la base douze douze (0–9, A, B), la base deux '
          'seulement deux (0 et 1).\n\n'
          'Le même nombre se présente différemment selon la base, mais '
          'désigne la même chose. Une petite base demande beaucoup de rangs '
          '(le binaire devient très long), une grande base beaucoup de signes '
          'différents.',
    ),
    ProseSection(
      'Six bases en bref',
      '• Base 2 (binaire) : la langue des ordinateurs — un interrupteur est '
          'allumé ou éteint.\n'
          '• Base 8 (octal) : aujourd\'hui une niche, par exemple pour les '
          'droits de fichiers sous Unix.\n'
          '• Base 10 (décimal) : notre quotidien et le système métrique.\n'
          '• Base 12 (dozenal) : la douzaine, l\'horloge et le pouce — et la '
          'cause du mouvement dozenal.\n'
          '• Base 16 (hexadécimal) : notation compacte pour les données '
          'informatiques.\n'
          '• Base 60 (sexagésimal) : le temps et les angles, un héritage de '
          'Babylone.',
    ),
    ProseSection(
      'Convertir d\'une base à l\'autre',
      'Les nombres passent d\'une base à l\'autre selon des procédés fixes. '
          'On divise la partie entière à plusieurs reprises par la base cible '
          'et on lit les restes de bas en haut. On multiplie la partie '
          'décimale à plusieurs reprises par la base cible et on lit les '
          'parties entières de haut en bas.\n\n'
          'Exemple : 0,5 devient en base douze 0,6 ; 0,125 devient 0,16. '
          'Entre bases apparentées, c\'est encore plus simple : comme seize '
          'est une puissance de deux, un chiffre hexadécimal correspond '
          'exactement à quatre rangs binaires — il suffit de regrouper.',
    ),
    ProseSection(
      'Où chaque base est chez elle',
      'Les ordinateurs calculent en binaire, parce qu\'un transistor ne '
          'connaît que deux états. L\'hexadécimal en est l\'abréviation '
          'maniable — on le trouve dans les adresses mémoire, les couleurs '
          'web comme #FF00FF et les numéros Unicode. Le temps et les angles '
          'suivent le soixante : soixante minutes, 360 degrés, faciles à '
          'diviser en tiers et en quarts. Le quotidien et presque toute la '
          'science fonctionnent en décimal — surtout par habitude et parce '
          'que le système métrique repose là-dessus.\n\n'
          'Douze survit dans la douzaine, la grosse, l\'horloge et le pouce. '
          'Depuis le 18e siècle, il existe des défenseurs d\'un véritable '
          'calcul en douze — de Buffon à Frank Emerson Andrews, qui écrivit '
          'en 1935 le premier livre sur le sujet, en passant par Isaac '
          'Pitman. Des sociétés dédiées entretiennent l\'idée jusqu\'à '
          'aujourd\'hui ; davantage à ce sujet dans le bloc « La société '
          'dozenale ».',
    ),
    ProseSection(
      'Aucune base n\'est la meilleure partout',
      'Chaque base a son usage. Deux et seize ne sont pas « meilleures pour '
          'les humains », mais idéales pour les machines. Dix est familière et '
          'solidement ancrée. Douze divise joliment en tiers et en quarts, '
          'mais perd sur le cinquième. Soixante divise le mieux, mais avec '
          'soixante signes elle est trop grande pour le quotidien.\n\n'
          'Pour les systèmes de mesure, ce qui compte au bout du compte, '
          'c\'est moins la base elle-même que la rigueur avec laquelle on s\'en '
          'tient à une seule base : le système métrique l\'emporte parce que '
          'tout passe par le même dix — un système mêlant mille, yard, pied '
          'et pouce n\'aurait cet avantage dans aucune base.',
    ),
  ], sources: [
    Source('Positional notation — Wikipedia',
        'https://en.wikipedia.org/wiki/Positional_notation', 'R2', 'A1'),
    Source('Duodecimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Duodecimal', 'R2', 'A1'),
    Source('Hexadecimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Hexadecimal', 'R2', 'A1'),
    Source('Sexagesimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Sexagesimal', 'R2', 'A1'),
    Source('Superior highly composite number — Wikipedia',
        'https://en.wikipedia.org/wiki/Superior_highly_composite_number',
        'R2', 'A1'),
    Source('Octal — Wikipedia', 'https://en.wikipedia.org/wiki/Octal', 'R2',
        'A2'),
  ]),
  ProseChapter('Une brève histoire des systèmes positionnels', [
    ProseSection(
      'Avant la valeur de position',
      'Longtemps, on a écrit les nombres en additionnant des signes. Les '
          'chiffres romains sont un tel système : XVII signifie dix plus cinq '
          'plus un plus un. C\'est commode à lire, mais pénible à calculer, et '
          'les grands nombres deviennent peu maniables.\n\n'
          'Le grand bond fut le système positionnel : le même chiffre '
          'signifie quelque chose de différent selon sa position. C\'est cela '
          'seul qui rend le calcul écrit facile avec des nombres '
          'arbitrairement grands — et qui exige un chiffre pour « rien à ce '
          'rang » : le zéro.',
    ),
    ProseSection(
      'Babylone et le soixante',
      'Le premier véritable système positionnel naquit chez les Sumériens et '
          'les Babyloniens, il y a plus de quatre mille ans, en base soixante. '
          'Il passe pour leur plus grande réussite mathématique.\n\n'
          'Ils n\'avaient toutefois pas encore de vrai zéro : ils '
          'connaissaient un signe de remplissage pour les rangs vides au '
          'milieu, mais jamais à la fin d\'un nombre. Leur héritage nous '
          'accompagne jusqu\'à aujourd\'hui — dans les soixante minutes de '
          'l\'heure et les 360 degrés du cercle.',
    ),
    ProseSection(
      'L\'invention indienne du zéro',
      'Le système décimal actuel avec le zéro vient d\'Inde. Aryabhata '
          'utilisa au 5e siècle la notation positionnelle ; Brahmagupta '
          'traita en 628 le zéro pour la première fois comme un nombre à part '
          'entière, avec ses propres règles de calcul, et non plus seulement '
          'comme un vide.\n\n'
          'De là, des savants arabes et persans le reprirent — al-Khwarizmi '
          'en écrivit vers 825 —, et c\'est par eux qu\'il parvint en Europe. '
          'Voilà pourquoi nos chiffres s\'appellent encore aujourd\'hui '
          '« chiffres arabes », bien que l\'idée vienne d\'Inde.',
    ),
    ProseSection(
      'Les bases des machines',
      'Avec les machines à calculer vinrent de nouvelles bases. Gottfried '
          'Wilhelm Leibniz publia en 1703 le système binaire fait uniquement '
          'de 0 et de 1 — il y retrouva même les anciens hexagrammes du Yi '
          'King chinois.\n\n'
          'Aujourd\'hui, les ordinateurs calculent en binaire, mais '
          'l\'écrivent le plus souvent en hexadécimal : avec l\'octet de 8 '
          'bits de l\'IBM System/360 dans les années 1960, la base seize '
          's\'imposa, parce que deux chiffres hexadécimaux forment exactement '
          'un octet. Chaque base trouva ainsi sa place — non parce qu\'elle '
          'serait « la meilleure », mais parce qu\'elle convient à sa tâche.',
    ),
  ], sources: [
    Source('Babylonian mathematics — MacTutor (St Andrews)',
        'https://mathshistory.st-andrews.ac.uk/HistTopics/Babylonian_mathematics/',
        'R2', 'A1'),
    Source('Sexagesimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Sexagesimal', 'R2', 'A1'),
    Source('History of the Hindu–Arabic numeral system — Wikipedia',
        'https://en.wikipedia.org/wiki/History_of_the_Hindu%E2%80%93Arabic_numeral_system',
        'R2', 'A2'),
    Source('Binary number — Wikipedia',
        'https://en.wikipedia.org/wiki/Binary_number', 'R3', 'A2'),
    Source('Hexadecimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Hexadecimal', 'R2', 'A1'),
    Source('IBM System/360 — Wikipedia',
        'https://en.wikipedia.org/wiki/IBM_System/360', 'R2', 'A2'),
  ]),
  ProseChapter('Comment cette calculatrice calcule', [
    ProseSection(
      'Deux calculatrices en une',
      'Quand tu appuies sur la touche égal, l\'application ne calcule pas une '
          'fois, mais deux — avec deux machines tout à fait différentes.\n\n'
          'La première est une calculatrice de fractions exacte. Elle calcule '
          'sans le moindre arrondi, avec des nombres entiers arbitrairement '
          'grands. La seconde est une calculatrice à virgule flottante rapide, '
          'comme en possèdent presque toutes les calculatrices — elle calcule '
          'avec une précision limitée, mais traite tout, y compris le sinus, '
          'la racine et le logarithme. Toutes deux se lancent à chaque signe '
          'd\'égalité.',
    ),
    ProseSection(
      'La fraction exacte',
      'La calculatrice de fractions conserve les nombres comme rapport de '
          'deux entiers. Un tiers reste vraiment un tiers, et non 0,333… Ce '
          'n\'est qu\'à l\'affichage qu\'elle transforme la fraction en '
          'décimales dozenales.\n\n'
          'Ce faisant, elle reconnaît quand les décimales se répètent. Un '
          'tiers vaut en base douze exactement 0,4. Un cinquième, en revanche, '
          'est périodique : 0,2497 2497 2497 … L\'application le montre avec '
          'un trait au-dessus du groupe qui se répète et un point qui marque '
          'le début de la période. Ainsi le résultat reste exact, au lieu '
          'd\'être silencieusement arrondi.',
    ),
    ProseSection(
      'Quand la fraction ne suffit pas',
      'Certains calculs ne peuvent pas s\'écrire sous forme de fraction. Dès '
          'qu\'un sinus, une racine, un logarithme ou une fonction semblable '
          'apparaît — ou qu\'on divise par zéro —, la calculatrice de '
          'fractions abandonne.\n\n'
          'Alors la calculatrice à virgule flottante prend le relais. Son '
          'résultat n\'est qu\'approximatif, c\'est pourquoi l\'application le '
          'fait précéder d\'un signe « ≈ » : « environ ». Si les deux voies '
          'aboutissent, c\'est toujours la fraction exacte qui l\'emporte. Le '
          '« ≈ » n\'apparaît donc que là où une véritable approximation est '
          'nécessaire.',
    ),
    ProseSection(
      'Longues périodes et affichage',
      'Les résultats exacts peuvent devenir très longs. Certaines fractions '
          'ont des périodes de plus de cent chiffres — bien plus que ce qui '
          'tient sur une ligne.\n\n'
          'Pour que rien ne déborde de l\'affichage, l\'application omet par '
          'la droite autant des derniers chiffres (les moins significatifs) '
          'qu\'il le faut pour que le reste tienne sur la ligne, et place un '
          '« … » comme signe qu\'il y a encore une suite. Le marquage de la '
          'période est alors raccourci proprement en conséquence. Le nombre '
          'reste donc honnête : ce qui est coupé est affiché de façon '
          'visible, et non caché.',
    ),
  ]),
];
