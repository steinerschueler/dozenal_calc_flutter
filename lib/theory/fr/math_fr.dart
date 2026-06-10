part of '../math_theory.dart';

List<ProseChapter> _mathChaptersFr() => const [
  ProseChapter(
    'Diviseurs, fractions et périodes',
    [
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
    ],
    sources: [
      Source(
        'Duodecimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Duodecimal',
        'R2',
        'A1',
      ),
      Source(
        'Repeating decimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Repeating_decimal',
        'R2',
        'A1',
      ),
      Source(
        'Highly composite number — Wikipedia',
        'https://en.wikipedia.org/wiki/Highly_composite_number',
        'R2',
        'A1',
      ),
      Source(
        'Dozenal Divisibility Rules — Dozenal Society of America',
        'https://dozenal.org/drupal/content/dozenal-divisibility-rules.html',
        'R2',
        'A1',
      ),
      Source(
        'Decimal Period — Wolfram MathWorld',
        'https://mathworld.wolfram.com/DecimalPeriod.html',
        'R1',
        'A2',
      ),
      Source(
        'Orders of Units in Modular Arithmetic — Keith Conrad (UConn)',
        'https://kconrad.math.uconn.edu/blurbs/ugradnumthy/ordersmodm.pdf',
        'R1',
        'A2',
      ),
    ],
  ),
  ProseChapter(
    'Les bases numériques en comparaison',
    [
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
    ],
    sources: [
      Source(
        'Positional notation — Wikipedia',
        'https://en.wikipedia.org/wiki/Positional_notation',
        'R2',
        'A1',
      ),
      Source(
        'Duodecimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Duodecimal',
        'R2',
        'A1',
      ),
      Source(
        'Hexadecimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Hexadecimal',
        'R2',
        'A1',
      ),
      Source(
        'Sexagesimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Sexagesimal',
        'R2',
        'A1',
      ),
      Source(
        'Superior highly composite number — Wikipedia',
        'https://en.wikipedia.org/wiki/Superior_highly_composite_number',
        'R2',
        'A1',
      ),
      Source(
        'Octal — Wikipedia',
        'https://en.wikipedia.org/wiki/Octal',
        'R2',
        'A2',
      ),
    ],
  ),
  ProseChapter(
    'Une brève histoire des systèmes positionnels',
    [
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
    ],
    sources: [
      Source(
        'Babylonian mathematics — MacTutor (St Andrews)',
        'https://mathshistory.st-andrews.ac.uk/HistTopics/Babylonian_mathematics/',
        'R2',
        'A1',
      ),
      Source(
        'Sexagesimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Sexagesimal',
        'R2',
        'A1',
      ),
      Source(
        'History of the Hindu–Arabic numeral system — Wikipedia',
        'https://en.wikipedia.org/wiki/History_of_the_Hindu%E2%80%93Arabic_numeral_system',
        'R2',
        'A2',
      ),
      Source(
        'Binary number — Wikipedia',
        'https://en.wikipedia.org/wiki/Binary_number',
        'R3',
        'A2',
      ),
      Source(
        'Hexadecimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Hexadecimal',
        'R2',
        'A1',
      ),
      Source(
        'IBM System/360 — Wikipedia',
        'https://en.wikipedia.org/wiki/IBM_System/360',
        'R2',
        'A2',
      ),
    ],
  ),
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
  ProseChapter(
    'Fibonacci, carrés et curiosités',
    [
      ProseSection(
        '144 — là où deux mondes se croisent',
        'La suite de Fibonacci commence par 1, 1, et chaque nombre suivant '
            'est la somme des deux précédents : 1, 1, 2, 3, 5, 8, 13, 21, 34, '
            '55, 89, 144, … Elle croît de façon exponentielle — les termes '
            'deviennent très grands rapidement. Les carrés parfaits 1, 4, 9, '
            '16, 25, 36, … ne croissent eux que quadratiquement, donc bien '
            'plus lentement. Deux suites qui croissent si différemment n\'ont '
            'presque aucune raison de se rencontrer un jour.\n\n'
            'Et pourtant elles le font : le douzième nombre de Fibonacci est '
            '144, et 144 = 12² est un carré parfait. On note ce terme '
            'brièvement F₁₂ = 144. En base 12, 144 est aussi « 100 », le '
            'premier nombre à trois chiffres, et dans le commerce la grosse — '
            'une douzaine de douzaines. Trois propriétés coïncident dans un '
            'seul nombre.\n\n'
            'Que ceci ne soit pas une simple coïncidence mais un cas unique '
            'a été prouvé par J. H. E. Cohn en 1964 : en dehors de 0, 1 et '
            '144, il n\'existe dans toute la suite infinie de Fibonacci aucun '
            'autre nombre qui soit à la fois un carré parfait. Sa preuve est '
            'élémentaire, mais pas simple ; elle utilise la suite de Lucas '
            'étroitement liée et des arguments de divisibilité. Le douze se '
            'trouve ainsi à un croisement prouvé et unique de deux suites '
            'fondamentales — une particularité, pas du mysticisme.\n\n'
            'Un théorème encore plus fort de 2006 (Bugeaud, Mignotte et Siksek) '
            'va plus loin : les seules puissances parfaites dans la suite de '
            'Fibonacci sont 0, 1, 8 = 2³ et 144 = 12². L\'affirmation de Cohn '
            'sur les carrés parfaits en est le cas particulier.',
      ),
      ProseSection(
        'Le nombre d\'or',
        'En divisant un nombre de Fibonacci par son prédécesseur, ces rapports '
            'se rapprochent toujours davantage d\'un nombre fixe : le nombre '
            'd\'or φ = (1+√5)/2 ≈ 1,618. Formellement F(n+1)/F(n) → φ. Johannes '
            'Kepler remarqua ce rapprochement dès 1611. En base 12, '
            'φ ≈ 1,74BB677… ; la calculatrice tient φ comme constante dans '
            'le champ étendu.\n\n'
            'φ possède une propriété définissante simple : φ² = φ + 1. C\'est '
            'le seul nombre positif dont le carré est exactement supérieur de 1 '
            'à lui-même. Qui saisit φ² = dans la calculatrice obtient exactement '
            'φ + 1 — l\'identité devient immédiatement visible.\n\n'
            'Dans la nature, φ apparaît réellement là où feuilles et graines '
            'poussent décalées du « angle d\'or » ; les nombres de spirales '
            'des tournesols ou des pommes de pin sont alors souvent des nombres '
            'de Fibonacci voisins. Beaucoup d\'autres choses attribuées à φ ne '
            'résistent cependant pas à l\'examen : la spirale du nautile ne suit '
            'pas φ, et un emploi conscient dans le Parthénon ou chez de Vinci '
            'n\'est pas attesté. φ est réel en mathématiques et dans la '
            'phyllotaxie — pas partout.',
      ),
      ProseSection(
        'Le douze comme nombre hautement composé',
        'La théorie des nombres connaît plusieurs façons précises de décrire '
            'un nombre comme « riche en diviseurs » — et le douze apparaît dans '
            'certaines d\'entre elles. Douze est hautement composé : il possède '
            'plus de diviseurs que tout nombre plus petit. Ses diviseurs sont '
            '1, 2, 3, 4, 6, 12 — six en tout ; aucun nombre inférieur à 12 '
            'n\'en a autant. Srinivasa Ramanujan étudia cette classe en 1915 '
            'dans un célèbre article des Proceedings of the London Mathematical '
            'Society.\n\n'
            'Douze est en outre le plus petit nombre abondant : la somme de ses '
            'diviseurs propres, 1+2+3+4+6 = 16, dépasse le nombre lui-même. '
            'Pour les nombres plus petits, c\'est l\'inverse — pour 10, on '
            'obtient 1+2+5 = 8, inférieur à 10. Douze est le premier nombre '
            'dont les diviseurs « débordent ».\n\n'
            'Une propriété plus rare : douze est un nombre sublime. Cela signifie '
            'que deux indicateurs clés de ses diviseurs sont eux-mêmes des '
            'nombres parfaits. Le nombre de diviseurs est 6 (et 6 = 1+2+3 est '
            'parfait). La somme de tous les diviseurs est 1+2+3+4+6+12 = 28 '
            '(et 28 = 1+2+4+7+14 est également parfait). À ce jour, seuls deux '
            'nombres sublimes sont connus — le douze et un nombre à 76 chiffres. '
            'Le terme provient cependant des mathématiques récréatives et est '
            'étroitement construit ; sa rareté n\'est donc pas une preuve '
            'd\'une signification cosmique, mais la conséquence d\'une définition '
            'spéciale.',
      ),
      ProseSection(
        'Une pyramide de boulets de canon',
        'En empilant des boulets de canon en pyramide à base carrée, la n-ième '
            'pyramide contient 1² + 2² + … + n² boulets. Thomas Harriot établit '
            'cette formule de somme vers 1587, quand Sir Walter Raleigh voulut '
            'savoir comment compter des boulets empilés.\n\n'
            'Une question plus difficile est : quand une telle pyramide est-elle '
            'à la fois un carré parfait de boulets ? Il n\'existe qu\'un seul '
            'cas non trivial, et il est beau : '
            '1² + 2² + … + 24² = 4900 = 70². Les mêmes 4900 boulets peuvent '
            'être disposés soit en pyramide de 24 couches, soit en carré 70×70. '
            'Édouard Lucas conjectura en 1875 que c\'est l\'unique solution ; '
            'elle ne fut entièrement prouvée qu\'en 1918 par G. N. Watson — '
            'le problème était vraiment difficile.\n\n'
            'Le nombre 24 est précisément le double de 12. C\'est une jolie '
            'observation — mais honnêtement pas une raison démontrée : le 24 '
            'apparaît ici parce que l\'équation sous-jacente a précisément cette '
            'solution, non en raison d\'un lien avec la base douze.',
      ),
      ProseSection(
        'La cité idéale de Platon',
        'Dans ses « Lois » (livre V), Platon demande combien de citoyens '
            'devrait avoir une cité idéale. Sa réponse : 5040. L\'argument n\'est '
            'pas mystique, mais pratique — une cité doit constamment diviser ses '
            'citoyens en groupes égaux, et 5040 est divisible par chaque nombre '
            'de 1 à 12, à la seule exception de 11. (Pour la divisibilité par '
            '11, Platon propose de retrancher deux familles.)\n\n'
            'Ce que Platon décrit ici est la même intuition qui sous-tend le '
            'système duodécimal : dans la vie quotidienne, ce sont les petits '
            'diviseurs qui comptent. 5040 = 7! est en quelque sorte la grande '
            'sœur du douze — la même philosophie de la divisibilité, appliquée '
            'à toute une population citadine plutôt qu\'à un système de '
            'numération.',
      ),
      ProseSection(
        'La curiosité n\'est pas de la numérologie',
        'Le douze porte de nombreuses étiquettes à la fois : hautement composé, '
            'abondant, sublime, indice du seul carré de Fibonacci non trivial. '
            'Cette accumulation est impressionnante — mais chaque propriété est '
            'une définition propre et indépendante. Leur coïncidence n\'est ni '
            'la cause ni le symbole de quelque chose de supérieur. Ce qui '
            'distingue vraiment le douze, c\'est sa petitesse : c\'est le plus '
            'petit nombre ayant ces propriétés ; des nombres plus grands '
            'comme 24, 36 ou 60 ont même encore plus de diviseurs.\n\n'
            'Une erreur répandue mérite d\'être clairement nommée : le douze est '
            'souvent appelé « nombre parfait ». C\'est mathématiquement faux. '
            'Parfait signifie : la somme des diviseurs propres donne le nombre '
            'lui-même — comme pour 6 (1+2+3) ou 28 (1+2+4+7+14). Pour le '
            'douze, les diviseurs propres donnent 16, donc plus que 12. Le '
            'douze est abondant, pas parfait. La confusion remonte à Nicomaque '
            'de Gérase (vers 100 apr. J.-C.), qui associait ces classes de '
            'nombres à des jugements moraux — une interprétation de l\'Antiquité, '
            'pas des mathématiques.\n\n'
            'La valeur de ce chapitre réside précisément dans cette séparation : '
            'le théorème de Cohn, l\'identité des boulets de canon et le plus '
            'petit nombre abondant sont des faits prouvés. Ils méritent d\'être '
            'vus pour ce qu\'ils sont — de belles mathématiques honnêtes, qui '
            'n\'ont pas besoin d\'une charge mystique.',
      ),
    ],
    sources: [
      Source(
        'Square Fibonacci Numbers, Etc. (J. H. E. Cohn, 1964)',
        'https://math.la.asu.edu/~checkman/SquareFibonacci.html',
        'R1',
        'A1',
      ),
      Source(
        'Fibonacci and Lucas perfect powers (Bugeaud, Mignotte, Siksek, 2006) — Annals of Mathematics',
        'https://annals.math.princeton.edu/2006/163-3/p05',
        'R1',
        'A1',
      ),
      Source(
        'Fibonacci sequence — Wikipedia',
        'https://en.wikipedia.org/wiki/Fibonacci_sequence',
        'R2',
        'A1',
      ),
      Source(
        'Cannonball problem — Wikipedia',
        'https://en.wikipedia.org/wiki/Cannonball_problem',
        'R2',
        'A1',
      ),
      Source(
        'Highly composite number — Wikipedia',
        'https://en.wikipedia.org/wiki/Highly_composite_number',
        'R2',
        'A1',
      ),
      Source(
        'Abundant number — Wikipedia',
        'https://en.wikipedia.org/wiki/Abundant_number',
        'R2',
        'A1',
      ),
      Source(
        'Sublime number — Wikipedia',
        'https://en.wikipedia.org/wiki/Sublime_number',
        'R2',
        'A1',
      ),
      Source(
        '5040 (number) — Wikipedia',
        'https://en.wikipedia.org/wiki/5040_(number)',
        'R2',
        'A1',
      ),
    ],
  ),
  ProseChapter(
    'Le dodécagone (polygone à douze côtés)',
    [
      ProseSection(
        'Ce qu\'est un dodécagone régulier',
        'Un dodécagone régulier (du grec dodekagon : dōdeka = douze, '
            'gōnía = angle) est un polygone à douze côtés de longueur égale '
            'et à douze angles intérieurs égaux. Les douze sommets sont '
            'régulièrement répartis sur un cercle, le cercle circonscrit, '
            'espacés de 30° chacun.\n\n'
            'Chaque angle intérieur mesure exactement 150°. Cela découle d\'un '
            'raisonnement simple : en parcourant la figure tout entière, on '
            'tourne aux douze sommets d\'un total de 360°, soit 30° par sommet. '
            'Cet angle extérieur et l\'angle intérieur se complètent à 180°, '
            'il reste donc 180° − 30° = 150°. En système duodécimal, 150° '
            's\'écrit 106°, et l\'angle extérieur 30° s\'écrit 26°. Tous les '
            'angles présents dans le dodécagone sont des multiples de 15° — '
            'soit 13° en duodécimal.\n\n'
            'Le dodécagone compte parmi les formes que l\'on peut tracer '
            'exactement avec compas et règle. La démarche est courte : tracer '
            'un cercle, le diviser en six parties égales (possible au compas '
            'seul, car dans l\'hexagone le côté est exactement égal au rayon), '
            'puis bissecter chacun des six arcs — on obtient douze points '
            'régulièrement répartis. Que cela soit possible n\'est pas un '
            'hasard : un polygone régulier à n côtés est constructible si et '
            'seulement si n est composé d\'une puissance de deux et de nombres '
            'premiers de Fermat distincts (théorème de Gauss et Wantzel). '
            'Pour 12 = 2² × 3, c\'est satisfait, car 3 est un tel nombre '
            'premier.',
      ),
      ProseSection(
        'Trois polygones partagent les mêmes sommets',
        'Ce qui est remarquable dans le dodécagone, c\'est moins sa forme que '
            'ce qu\'il renferme. En ne reliant qu\'un sommet sur deux, on obtient '
            'un hexagone régulier. Un sommet sur trois donne un carré, un sur '
            'quatre un triangle équilatéral — tous trois exacts, sans '
            'approximation, et tous sur le même cercle circonscrit que le '
            'dodécagone.\n\n'
            'Une règle générale est à l\'œuvre : un polygone régulier à m côtés '
            's\'inscrit avec les mêmes sommets dans un polygone à n côtés si et '
            'seulement si m divise n ; on relie alors chaque (n/m)-ième '
            'sommet. L\'hexagone, le carré et le triangle s\'inscrivent dans le '
            'dodécagone parce que 12 est divisible par 6, 4 et 3. Et 12 est le '
            'plus petit nombre divisible à la fois par 3, 4 et 6 — leur plus '
            'petit commun multiple. C\'est pourquoi le dodécagone est le plus '
            'petit polygone régulier qui contient ces trois figures '
            'fondamentales ; un pentagone, un octogone ou un décagone ne '
            'le peuvent pas.\n\n'
            'C\'est exactement la même divisibilité qui rend le système '
            'duodécimal si agréable. Le fait que 12 se divise par 2, 3, 4 et 6 '
            'fait géométriquement coïncider les trois polygones dans un '
            'dodécagone — et rend arithmétiquement les fractions un demi, un '
            'tiers, un quart et un sixième de courtes fractions duodécimales '
            'exactes. Forme et calcul fractionnaire ont la même racine.',
      ),
      ProseSection(
        'Cinquante-quatre diagonales, six longueurs',
        'Une diagonale relie deux sommets non adjacents. La formule n(n−3)/2 '
            'donne pour le dodécagone 12 × 9 / 2 = 54 diagonales. Cela paraît '
            'complexe, mais est strictement ordonné : comme le dodécagone est '
            'si symétrique, toutes les diagonales qui sautent le même nombre '
            'de sommets ont la même longueur. Il y a cinq telles distances de '
            'saut et en plus le diamètre — soit seulement six longueurs '
            'différentes. Pour un côté de longueur 1 :\n\n'
            'd₂ saute un sommet et mesure √(2+√3) ≈ 1,932. d₃ saute deux '
            'sommets, 1+√3 ≈ 2,732. d₄ saute trois sommets, (3√2+√6)/2 ≈ '
            '3,346. d₅ saute quatre sommets, 2+√3 ≈ 3,732. d₆ enfin relie '
            'des sommets opposés — c\'est le diamètre, √6+√2 ≈ 3,864.\n\n'
            'Dans ces valeurs se cachent des motifs nets. La cinquième et la '
            'troisième diagonale diffèrent exactement d\'un côté : '
            '(2+√3) − (1+√3) = 1. Et le diamètre est exactement deux fois plus '
            'long que la diagonale la plus courte, d₆ = 2 · d₂ — le même '
            'rapport 2:1 que l\'octave en musique. Tous les angles entre les '
            'diagonales sont à nouveau des multiples de 15°, car les douze '
            'sommets découpent le cercle complet en pas de 30°.',
      ),
      ProseSection(
        'L\'aire et le « trois rond »',
        'Pour trouver l\'aire, on décompose le dodécagone depuis le centre en '
            'douze triangles égaux et étroits. Chacun a deux côtés de longueur '
            'R — le rayon du cercle circonscrit, la distance du centre à un '
            'sommet — et à son sommet l\'angle de 30°. En calculant les douze '
            'triangles ensemble, quelque chose de beau se dégage :\n\n'
            'A = 3 · R².\n\n'
            'Le facteur est un trois entier et net, sans racine. Cela se produit '
            'parce que sin(30°) = un demi intervient dans le calcul, et 30° est '
            'précisément l\'angle de sommet du dodécagone. Parmi les polygones '
            'constructibles à la règle et au compas, c\'est le seul plus grand '
            'dont la formule d\'aire soit aussi nette ; pour l\'hexagone par '
            'exemple, une racine subsiste. En préférant la longueur de côté s, '
            'l\'aire est A = 3(2+√3)·s² ≈ 11,196·s².\n\n'
            'En rapportant l\'aire au cercle circonscrit, dont l\'aire vaut π·R², '
            'R² se simplifie et il reste exactement 3/π ≈ 0,9549. Le dodécagone '
            'remplit donc son cercle circonscrit à environ 95,5 % — bien plus '
            'qu\'un hexagone (environ 83 %), un carré (environ 64 %) ou un '
            'triangle (environ 41 %). Au lieu du nombre irrationnel π, on a ici '
            'le trois rond : pour R = 1, l\'aire du dodécagone est exactement 3 '
            'et se situe juste en dessous de π ≈ 3,1416.\n\n'
            'Cette proximité fut déjà utilisée par Archimède. Il approchait π '
            'par des polygones, commençant par le facile hexagone et doublant '
            'le nombre de côtés : 6, 12, 24, 48, 96. Le dodécagone était sa '
            'première étape. Le polygone à 96 côtés — vu en duodécimal 12 × 8 '
            '— remplit le cercle à 99,93 % et lui donna '
            '3 + 10/71 < π < 3 + 1/7.',
      ),
      ProseSection(
        'Où le dodécagone apparaît comme forme',
        'Les douze repères horaires d\'une horloge analogique forment un '
            'dodécagone régulier : douze points espacés de 30° sur le cercle. '
            'Que le cercle complet compte 360° = 12 × 30° et que la journée '
            'comporte deux fois douze heures, c\'est la même grille de 30° '
            'qu\'utilisent aussi les roses des vents pour douze directions.\n\n'
            'Plusieurs pays frappèrent des pièces à douze côtés — surtout pour '
            'qu\'elles se distinguent des pièces rondes au toucher. Le '
            '« threepence » britannique en laiton (à partir de 1937) fut la '
            'première pièce non ronde en circulation en Grande-Bretagne ; '
            'la pièce d\'une livre à douze côtés (à partir de 2017) fut '
            'introduite contre la contrefaçon et délibérément conçue sur ce '
            'modèle. Contrairement à ce qu\'on dit parfois, ces pièces n\'ont '
            'pas une largeur uniforme — cette propriété appartient aux pièces '
            'à sept côtés que sont les 20 et 50 pence britanniques, qui ne '
            'sont pas des dodécagones.\n\n'
            'Le dodécagone seul ne pave pas le plan : 150° ne se divise pas '
            'exactement dans 360°. Mais avec d\'autres polygones si — par '
            'exemple avec des triangles ou avec des carrés et des hexagones, '
            'dont les angles se complètent à 360° à chaque sommet. De tels '
            'motifs à symétrie douze constituent une base de l\'ornementation '
            'géométrique islamique. Comment le douze est parvenu au-delà dans '
            'la construction et dans l\'art est traité dans le chapitre '
            '« Le douze dans l\'architecture ».',
      ),
      ProseSection(
        'Géométrie, pas mysticisme des nombres',
        'Les propriétés du dodécagone sont de vraies vérités mathématiques, '
            'pas des mystères. Que l\'aire soit dans le rapport 3/π au cercle '
            'circonscrit découle nécessairement de sin(30°) = un demi ; '
            'cela montre seulement que le dodécagone approche bien le cercle, '
            'et n\'établit aucun lien secret entre le trois et π. De même, le '
            'simple trois dans « aire = 3·R² » est une conséquence de l\'angle '
            'de sommet, pas un prodige.\n\n'
            'Le théorème « A = 3·R² » appelle aussi la bonne lecture : le trois '
            'net vaut pour le rayon du cercle circonscrit. Pour un côté de '
            'longueur 1, l\'aire est environ 11,2, pas 3. Et pour les diagonales, '
            'la précision vaut la peine — la quatrième est (3√2+√6)/2 ≈ 3,346, '
            'pas une expression radicale plus simple ; certaines sources '
            'font circuler de fausses valeurs.\n\n'
            'Enfin, la facilité de construction indique seulement que la forme '
            'se réalise avec des outils simples. Cela explique bien pourquoi '
            'les dodécagones sont si fréquents dans l\'artisanat, sur les pièces '
            'et dans les ornements. Mais pourquoi l\'horloge a douze heures '
            'est une question de tradition, pas de géométrie. Le dodécagone est '
            'un bel outil géométrique — et on ne devrait rien lui attribuer de '
            'plus.',
      ),
    ],
    sources: [
      Source(
        'Dodecagon — Wikipedia',
        'https://en.wikipedia.org/wiki/Dodecagon',
        'R2',
        'A1',
      ),
      Source(
        'Constructible polygon — Wikipedia',
        'https://en.wikipedia.org/wiki/Constructible_polygon',
        'R2',
        'A1',
      ),
      Source(
        'Dodecagon (12-gon) calculator and formulas — RedCrab Software',
        'https://www.redcrab-software.com/en/Calculator/Geometry/Dodecagon',
        'R2',
        'A1',
      ),
      Source(
        'Area of a Dodecagon — Alison Kiddle',
        'https://alisonkiddle.co.uk/area-of-a-dodecagon/',
        'R3',
        'A1',
      ),
      Source(
        'Getting Closer to π: Inscribing and Circumscribing Polygons — Univ. Alberta',
        'https://sites.ualberta.ca/~esimmt/think/main/richMathTasks/evan/files/InscribingAndCircumscribingPolygons.pdf',
        'R3',
        'A1',
      ),
      Source(
        'Archimedes on the Circumference and Area of a Circle — AMS Feature Column',
        'https://www.ams.org/publicoutreach/feature-column/fc-2012-02',
        'R2',
        'A1',
      ),
      Source(
        'Brass threepence — Wikipedia',
        'https://en.wikipedia.org/wiki/Brass_threepence',
        'R2',
        'A1',
      ),
      Source(
        'Dodecagonal coin — Wikipedia',
        'https://en.wikipedia.org/wiki/Dodecagonal_coin',
        'R2',
        'A1',
      ),
    ],
    imageId: 'math/dodekagon',
  ),
  ProseChapter(
    'Le dodécaèdre',
    [
      ProseSection(
        'Douze pentagones dans l\'espace',
        'Le dodécaèdre (du grec dōdeka = douze, hédra = face) est un solide '
            'composé de douze pentagones réguliers identiques. Toutes les faces '
            'sont identiques, toutes les arêtes ont la même longueur, et à '
            'chaque sommet se rejoignent exactement trois pentagones. Le '
            'comptage donne douze faces, trente arêtes et vingt sommets.\n\n'
            'C\'est l\'un des cinq solides platoniciens — les solides convexes '
            'dont les faces sont exclusivement des polygones réguliers '
            'identiques et auxquels le même nombre de faces se rejoignent à '
            'chaque sommet. Les quatre autres sont le tétraèdre (quatre '
            'triangles), le cube (six carrés), l\'octaèdre (huit triangles) '
            'et l\'icosaèdre (vingt triangles). Parmi ces cinq, le dodécaèdre '
            'est le seul à avoir des faces pentagonales.\n\n'
            'En notation concise, le dodécaèdre s\'écrit {5, 3} : des '
            'pentagones comme faces, trois d\'entre eux à chaque sommet. '
            'L\'angle dièdre entre deux faces adjacentes est d\'environ 116,57° '
            '(décimal). À titre de comparaison : pour le cube, il est de 90°.',
      ),
      ProseSection(
        'Pourquoi il en existe exactement cinq',
        'Qu\'il ne puisse exister que cinq tels solides — ni plus ni moins — '
            'est un résultat prouvé. Deux voies y mènent, et toutes deux '
            'aboutissent au même résultat.\n\n'
            'La première voie est un simple dénombrement, la formule d\'Euler '
            'pour les polyèdres : pour tout solide convexe, les sommets moins '
            'les arêtes plus les faces égalent deux. Pour le dodécaèdre : '
            '20 − 30 + 12 = 2. Leonhard Euler nota cette relation vers 1750 ; '
            'la première preuve rigoureuse fut donnée par Cauchy en 1811. '
            'La formule vaut pour tout solide convexe sans trous, pour toute '
            'pyramide, tout prisme. En la combinant avec l\'exigence que les '
            'faces soient des polygones réguliers identiques, il ne reste '
            'exactement que cinq solutions.\n\n'
            'La seconde voie est plus intuitive et examine un seul sommet. '
            'L\'angle intérieur d\'un pentagone régulier est de 108°. Si trois '
            'pentagones se rejoignent à un sommet, leurs angles totalisent '
            '324°. Les 36° manquants jusqu\'au tour complet sont exactement '
            'le vide qui se plie vers l\'espace — c\'est ainsi que naît un '
            'sommet du dodécaèdre. Quatre pentagones donneraient déjà 432° '
            'et ne rentreraient plus dans un sommet. Trois pentagones sont '
            'donc la seule possibilité, et le dodécaèdre le seul solide à '
            'faces pentagonales.',
      ),
      ProseSection(
        'Le nombre d\'or dans le pentagone et dans le solide',
        'Chaque face du dodécaèdre est un pentagone régulier — et le '
            'pentagone est le lieu plan le plus simple où le nombre d\'or '
            'φ = (1+√5)/2 ≈ 1,618 apparaît comme rapport de longueurs. La '
            'diagonale d\'un pentagone régulier est exactement φ fois la '
            'longueur de son côté. Qui saisit φ² = dans la calculatrice '
            'obtient φ+1 — c\'est l\'équation définissante du nombre d\'or.\n\n'
            'Parce que chaque face porte ce rapport, φ traverse tout le '
            'solide. En plaçant le dodécaèdre dans un système de coordonnées, '
            'φ apparaît littéralement dans les coordonnées de ses vingt '
            'sommets. Huit de ces sommets forment à eux seuls un cube ; '
            'au total, cinq cubes différents peuvent être inscrits dans le '
            'dodécaèdre. D\'autres sommets délimitent trois rectangles d\'or '
            '— des rectangles de rapport de côtés φ pour un — perpendiculaires '
            'deux à deux.\n\n'
            'φ apparaît ici non par magie, mais par nécessité : là où il y a '
            'des pentagones réguliers, il y a φ. Les interprétations plus '
            'poussées du nombre d\'or comme « divine proportion » sont des '
            'attributions humaines, pas une propriété de la géométrie elle-même.',
      ),
      ProseSection(
        'Dualité et la plus riche symétrie',
        'À chaque solide platonicien correspond un solide dual : on place une '
            'nouvelle arête au centre de chaque face et on relie les sommets '
            'des faces adjacentes. Pour le dodécaèdre, on obtient ainsi '
            'l\'icosaèdre — et réciproquement. Ce faisant, faces et sommets '
            'échangent leurs places : le dodécaèdre a 12 faces et 20 sommets, '
            'l\'icosaèdre 20 faces et 12 sommets. Le nombre d\'arêtes, 30, '
            'reste identique pour les deux. Le douze apparaît dans les deux '
            '— une fois comme nombre de faces, une fois comme nombre de '
            'sommets.\n\n'
            'Parce que les deux partagent la même structure, ils ont aussi la '
            'même symétrie — et c\'est la plus riche de tous les solides '
            'platoniciens : 120 symétries, soit 60 rotations et 60 '
            'rotations-réflexions. Le cube n\'en a que 48, le tétraèdre 24. '
            'Les 60 rotations se répartissent sur six axes quintuple passant '
            'par les centres de faces opposées, dix axes triple passant '
            'par les sommets opposés et quinze axes double passant '
            'par les milieux d\'arêtes opposées.\n\n'
            'Le nombre 120 peut s\'écrire 5! (5 × 4 × 3 × 2 × 1) et se '
            'décompose en facteurs premiers 2, 3 et 5 — les trois mêmes '
            'nombres qui réapparaissent dans les axes et dans la forme '
            'pentagonale des faces. Ces axes quintuple sont en même temps '
            'la raison pour laquelle aucun cristal ordinaire ne peut former '
            'un vrai dodécaèdre : un réseau périodique ne tolère pas la '
            'symétrie cinq (voir le chapitre sur la pyrite).',
      ),
      ProseSection(
        'Les douze d\'Euler : pourquoi toujours douze pentagones',
        'Un dernier résultat relie le dodécaèdre à des choses qui semblent '
            'a priori sans rapport avec lui. La question est : peut-on '
            'construire une enveloppe fermée sphérique uniquement à partir '
            'd\'hexagones réguliers ? La réponse est non. Des hexagones purs '
            'donnent une surface plate ; pour la courber en sphère, il faut '
            'exactement douze pentagones — peu importe le nombre d\'hexagones '
            'utilisés par ailleurs.\n\n'
            'Cela découle encore de la formule d\'Euler. Sans hexagone, on '
            'obtient le dodécaèdre régulier. Avec douze pentagones et vingt '
            'hexagones, on obtient le ballon de football classique — et c\'est '
            'précisément là que réside une erreur fréquente : le ballon de '
            'football n\'est pas un dodécaèdre. C\'est un icosaèdre tronqué '
            'à 32 faces, soit douze pentagones plus vingt hexagones. Les deux '
            'ne partagent que les douze pentagones ; le dodécaèdre n\'a '
            'lui aucun hexagone.\n\n'
            'Le dodécaèdre régulier est ainsi le cas le plus pur de cette '
            'douzéité : douze pentagones et rien d\'autre.',
      ),
      ProseSection(
        'Cube, dodécagone et pyritoèdre — ce qu\'il n\'est pas',
        'Dans les jeux de rôle, le dodécaèdre est connu comme D12, le dé '
            'à douze faces. Parce qu\'il est de tous les cinq solides celui qui '
            'se rapproche le plus d\'une sphère, il roule agréablement et '
            's\'arrête de façon fiable sur une face ; ses douze faces égales '
            'le rendent équitable.\n\n'
            'Trois confusions méritent d\'être clarifiées. Premièrement : le '
            'dodécagone n\'est pas le dodécaèdre. Les deux mots portent '
            '« dodéca- » (douze), mais le dodécagone est un polygone plat à '
            'douze côtés, le dodécaèdre un solide spatial à douze faces. '
            'Deuxièmement : le pyritoèdre du minéral pyrite a également douze '
            'faces pentagonales, mais ce n\'est pas un dodécaèdre régulier — '
            'ses pentagones sont déformés et il n\'a pas de vraie symétrie '
            'd\'ordre cinq (traité en détail dans le chapitre sur la pyrite). '
            'Troisièmement enfin, Platon attribua le dodécaèdre au cosmos '
            'tout entier ; c\'est une ancienne interprétation philosophique, '
            'pas un résultat mathématique. La géométrie du solide se suffit '
            'à elle-même, indépendamment de la signification que les humains '
            'lui ont accordée.',
      ),
    ],
    sources: [
      Source(
        'Regular dodecahedron — Wikipedia',
        'https://en.wikipedia.org/wiki/Regular_dodecahedron',
        'R2',
        'A1',
      ),
      Source(
        'Dodekaeder — Wikipedia (de)',
        'https://de.wikipedia.org/wiki/Dodekaeder',
        'R2',
        'A1',
      ),
      Source(
        'Platonic solid — Wikipedia',
        'https://en.wikipedia.org/wiki/Platonic_solid',
        'R2',
        'A1',
      ),
      Source(
        'Eulers Polyederformel — Plus Maths (Cambridge)',
        'https://plus.maths.org/content/eulers-polyhedron-formula',
        'R1',
        'A1',
      ),
      Source(
        'Platonic Solids: Why Five? — MathsIsFun',
        'https://www.mathsisfun.com/geometry/platonic-solids-why-five.html',
        'R1',
        'A1',
      ),
      Source(
        'Golden ratio — Wikipedia',
        'https://en.wikipedia.org/wiki/Golden_ratio',
        'R2',
        'A1',
      ),
      Source(
        'Phi in 3D Geometry (Ron Knott) — University of Surrey',
        'https://r-knott.surrey.ac.uk/Fibonacci/phi3DGeom.html',
        'R2',
        'A1',
      ),
      Source(
        'Icosahedral symmetry — Wikipedia',
        'https://en.wikipedia.org/wiki/Icosahedral_symmetry',
        'R2',
        'A1',
      ),
      Source(
        'Truncated icosahedron — Wikipedia',
        'https://en.wikipedia.org/wiki/Truncated_icosahedron',
        'R2',
        'A1',
      ),
    ],
  ),
];
