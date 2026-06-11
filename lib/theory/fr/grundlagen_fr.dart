part of '../grundlagen_theory.dart';

List<ProseChapter> _grundlagenChaptersFr() => const [
  ProseChapter(
    'Qu\'est-ce que le système duodécimal ?',
    [
      ProseSection(
        'Ce qu\'est une base',
        'Dans un système de numération positionnel, la valeur d\'un chiffre '
            'dépend de sa place. Dans le nombre 347, le 3 représente trois '
            'cents, le 4 représente quarante, le 7 représente sept. Chaque '
            'position vaut autant de fois plus que sa voisine de droite que '
            'l\'indique la base. Dans le système décimal habituel, la base est '
            'dix.\n\n'
            'Le système duodécimal a la base douze. Les positions ne sont donc '
            'pas des unités, des dizaines, des centaines, mais des unités, des '
            'douzaines, des cent quarante-quatre. Le nombre « 100 » ne signifie '
            'pas ici cent, mais douze fois douze, soit 144 en décimal. Et « 10 » '
            'signifie exactement une douzaine.\n\n'
            'Important : la quantité elle-même ne change jamais, seulement '
            'l\'écriture. « Quinze » et « une douzaine et trois » désignent la '
            'même quantité de pommes — écrite « 15 » en décimal et « 13 » en '
            'duodécimal. Le « 13 » duodécimal signifie une douzaine et trois, '
            'pas treize. Un nombre ne devient ni '
            'plus grand ni plus petit en changeant de base.',
      ),
      ProseSection(
        'Pourquoi deux nouveaux chiffres sont nécessaires',
        'Le système décimal se contente de dix symboles (0 à 9), car une '
            'nouvelle position commence à chaque dixième unité. Le système '
            'duodécimal n\'avance d\'une position qu\'à la douzième unité. Il a '
            'donc besoin de deux symboles supplémentaires — pour les valeurs '
            'dix et onze, qui occupent déjà deux positions en décimal.\n\n'
            'Cette calculatrice les écrit A (= dix) et B (= onze). Point '
            'essentiel : A et B ne sont pas ici des lettres ni des '
            'variables, mais des chiffres à part entière — exactement comme '
            '7 ou 9, simplement pour dix et onze. On compte donc : 0, 1, 2, '
            '…, 9, A, B, 10, 11, …\n\n'
            'C\'est un vrai piège pour ceux qui ont l\'habitude de l\'algèbre. '
            'Là, « 2B » désigne le produit deux fois B. Ici non. « 2B » est un '
            'nombre à deux chiffres : un 2 à la position des douzaines et un B '
            'à la position des unités, soit deux douzaines et onze unités — '
            '35 en décimal. Le produit deux fois onze serait lui 22, en '
            'duodécimal « 1A », donc quelque chose de tout différent. Des '
            'chiffres côte à côte forment un nombre, ils ne se multiplient pas. '
            'La calculatrice le sait d\'elle-même, car A et B sont pour elle '
            'des chiffres fixes et non des lettres.\n\n'
            'D\'autres notations sont répandues, notamment les chiffres retournés '
            '↊ et ↋ que Isaac Pitman proposa en 1857 et qui ont même eu leur '
            'propre place Unicode depuis 2015. Il n\'existe à ce jour aucun '
            'standard unique universellement reconnu.',
      ),
      ProseSection(
        'L\'avantage : des fractions simples',
        'Le vrai attrait du douze est sa divisibilité. Douze se divise '
            'exactement par 2, 3, 4 et 6 ; dix seulement par 2 et 5. Cela '
            'se voit le plus clairement dans les fractions. En base 10, un tiers '
            '(0,333…) et un sixième (0,1666…) sont des décimales infinies '
            'périodiques. En base 12, ils sont courts et exacts : un tiers vaut '
            '0;4, un sixième vaut 0;2.\n\n'
            'Une règle simple est à l\'œuvre : une fraction 1/n s\'arrête dans '
            'une base si et seulement si le dénominateur n ne contient que des '
            'facteurs premiers de la base. Douze est formé de 2 et de 3 — donc '
            'toutes les fractions dont les dénominateurs ne font intervenir que '
            'des deux et des trois sont exactes.\n\n'
            'Ce n\'est cependant pas un pur gain, mais un échange. Un cinquième, '
            'le simple 0,2 en base 10, devient périodique en base 12 (0;2497…). '
            'Les dixièmes deviennent également périodiques. L\'échange est '
            'profitable au quotidien, car on divise plus souvent par trois et '
            'par quatre que par cinq — mais c\'est honnêtement un échange, '
            'pas un miracle.',
      ),
      ProseSection(
        'Là où le douze existe depuis longtemps',
        'Bien avant toute théorie, le douze s\'était déjà ancré dans les '
            'mesures, le temps et le commerce, précisément parce qu\'il se divise '
            'si bien. Dans le commerce, on compte par douzaines (12 pièces) et '
            'par grosses (144 = 12² pièces) ; le mot « douzaine » remonte, '
            'via le français, au latin duodecim, « douze ».\n\n'
            'Le mot latin uncia signifiait « un douzième » — d\'un pied comme '
            'd\'une livre. De là viennent les mots anglais inch (pouce) et ounce '
            '(once) : 12 pouces font un pied. Le temps est lui aussi divisé par '
            'douze : deux fois douze heures par jour, douze mois par an, et le '
            'cercle complet comporte 360 = 30 × 12 degrés.\n\n'
            'Il existe même une hypothèse sur l\'origine du douze : avec le '
            'pouce, on peut compter les trois phalanges des quatre autres doigts, '
            'ce qui fait 4 × 3 = 12. Cette façon de compter est encore utilisée '
            'dans certaines régions d\'Asie. C\'est une explication plausible de '
            'l\'origine du comptage par douzaines, mais non prouvée — elle reste '
            'une hypothèse.',
      ),
      ProseSection(
        'Le mouvement duodécimal',
        'Exploiter consciemment l\'avantage du douze est une vieille idée qui '
            'prit une petite forme organisée au XXᴱ siècle. En 1935, Frank '
            'Emerson Andrews publia aux États-Unis le premier livre sur le sujet ; '
            'en 1944 fut fondée la Dozenal Society of America, en 1959 la Dozenal '
            'Society of Great Britain. Les deux publient encore aujourd\'hui des '
            'bulletins et utilisent les chiffres de Pitman.\n\n'
            'Ces sociétés ne réclament pas un changement de système mondial. '
            'Elles conçoivent leur travail comme éducation et exploration : elles '
            'veulent montrer que le choix de la base de numération n\'est pas une '
            'nécessité naturelle, mais une habitude. Le mathématicien Alexander '
            'Craig Aitken défendit le douze avec vigueur et estimait le système '
            'décimal nettement moins efficace — une estimation illustrative, '
            'pas une valeur mesurée.',
      ),
      ProseSection(
        'Pourquoi il ne s\'est jamais imposé',
        'Si la base 12 est souvent plus commode pour le calcul, pourquoi le '
            'monde entier calcule-t-il en décimal ? La réponse ne tient pas '
            'aux mathématiques, mais à l\'habitude. Le système décimal est ancré '
            'depuis des millénaires — vraisemblablement parce que l\'être humain '
            'a dix doigts. C\'est une raison anatomique, non mathématique, mais '
            'elle est profondément enracinée.\n\n'
            'Lorsque le monde unifia ses mesures aux XVIIIᴱ et XIXᴱ '
            'siècles, le système métrique décimal l\'emporta ; un changement '
            'de système de numération était déjà considéré comme irréalisable. '
            'Aujourd\'hui, le coût d\'une telle conversion — nouveaux manuels '
            'scolaires, appareils, logiciels, rééducation de toute la population '
            '— équivaudrait à une reconstruction totale. Et les ordinateurs '
            'calculent de toute façon en binaire, où la base 16 est plus proche '
            'que le douze.\n\n'
            'Les traces du douze dans l\'horloge, le mètre ruban et la douzaine '
            'ne sont donc pas un appel au changement. Elles montrent seulement '
            'que le douze n\'a jamais tout à fait disparu — et font du calcul en '
            'base douze un voyage dans un pays des nombres familier et pourtant '
            'étranger.',
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
        'Positional notation — Wikipedia',
        'https://en.wikipedia.org/wiki/Positional_notation',
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
        'Dozen — Wikipedia',
        'https://en.wikipedia.org/wiki/Dozen',
        'R2',
        'A1',
      ),
      Source(
        'Finger-counting — Wikipedia',
        'https://en.wikipedia.org/wiki/Finger-counting',
        'R2',
        'A1',
      ),
      Source(
        'Dozenal Society of America — Foundation and First Generation',
        'https://dozenal.org/drupal/content/foundation-and-first-generation.html',
        'R2',
        'A1',
      ),
      Source(
        'Why ten and not twelve? — Metric Views',
        'https://metricviews.uk/2016/10/10/why-ten-and-not-twelve/',
        'R3',
        'A1',
      ),
    ],
  ),
  ProseChapter(
    'Douze phalanges à la main',
    [
      ProseSection(
        'La méthode : douze phalanges, un pouce',
        'Tenez une main devant vous et regardez les quatre doigts à côté du '
            'pouce. Chacun de ces doigts comporte trois phalanges, séparées par '
            'des articulations visibles : une phalange proximale, une phalange '
            'intermédiaire et une phalange distale. Quatre doigts fois trois '
            'phalanges donnent douze — douze points comptables sur une seule main.\n\n'
            'Le pouce sert de pointeur et n\'est pas lui-même compté. Il touche '
            'successivement chacune des douze phalanges et compte ainsi de un à '
            'douze. L\'ordre le plus souvent décrit commence à la phalange '
            'extrême de l\'auriculaire et remonte doigt par doigt vers la paume. '
            'Il existe cependant des variantes : certains commencent à '
            'l\'index, d\'autres comptent de la pointe vers le bas. Seule la '
            'structure de base est fixe — un pointeur, quatre doigts, trois '
            'phalanges chacun, somme douze.\n\n'
            'Le fait qu\'il y ait exactement trois phalanges n\'est pas un choix '
            'culturel, mais de l\'anatomie : cette forme 2-3-3-3-3 (le pouce '
            'n\'a que deux phalanges) est commune à tous les êtres humains, et '
            'elle est un ancien héritage de la main des mammifères. Les '
            'phalanges se sont développées pour saisir et grimper, non pour '
            'compter — mais elles s\'y prêtent bien.',
      ),
      ProseSection(
        'De douze à soixante',
        'Lorsque le pouce a parcouru les douze phalanges de la première main, '
            'un cycle complet est achevé. La seconde main prend alors en charge '
            'la mémorisation : pour chaque douzaine complète, elle déplie un '
            'doigt. Cinq doigts fois douze phalanges donnent soixante. Avec deux '
            'mains, on peut donc compter silencieusement et sans aucun outil '
            'jusqu\'à 60.\n\n'
            'Cette relation 12 × 5 = 60 est l\'explication la plus simple pour '
            'laquelle le soixante joue un rôle si important dans les systèmes '
            'mésopotamiens — et, par leur intermédiaire, jusqu\'à aujourd\'hui : '
            '60 secondes par minute, 60 minutes par heure, '
            '360 = 6 × 60 degrés dans le cercle complet.\n\n'
            'Il existe aussi une autre convention où les deux mains comptent '
            'des phalanges ; on obtient alors 12 × 12 = 144. Les deux '
            'méthodes sont correctes, mais ce ne sont pas les mêmes systèmes.',
      ),
      ProseSection(
        'Où l\'on compte ainsi',
        'Cette méthode de comptage n\'est pas une invention moderne. '
            'L\'historien des mathématiques Georges Ifrah l\'a fait connaître '
            'dans son « Histoire universelle des chiffres » et la décrit comme '
            'encore en usage — dans une large ceinture allant de l\'Égypte en '
            'passant par la Syrie, la Turquie, l\'Irak, l\'Iran, l\'Afghanistan '
            'et le Pakistan jusqu\'en Inde et en Indochine.\n\n'
            'Il est honnête de faire ici une remarque sur les sources : cette '
            'liste de pays est la citation la plus répandue sur le sujet, mais '
            'elle remonte presque entièrement à cette unique source. Les textes '
            'ultérieurs s\'appuient généralement de nouveau sur Ifrah. Quand et '
            'comment exactement les observations ont été faites n\'est pas '
            'consigné ; une étude systématique plus récente fait défaut.\n\n'
            'Le cas le mieux documenté est celui des Chepang au Népal. Les '
            'linguistes Ross Caughley et Martine Mazaudon ont documenté que les '
            'Chepang comptent le gibier par douzaines en tapant sur les '
            'phalanges ; leur mot pour douze, hale, remonte à une ancienne '
            'racine signifiant « base du comptage ». Quelques langues du Nigeria '
            'central portent également des mots-nombres pour les douzaines. '
            'Dans les deux cas cependant : dans la vie quotidienne, les gens '
            'calculent aujourd\'hui en décimal ; les traces duodécimales '
            'sont plutôt des vestiges qu\'un système pleinement vivant.',
      ),
      ProseSection(
        'La grande thèse — et pourquoi elle reste ouverte',
        'Ifrah a formulé l\'hypothèse que le système duodécimal en général — '
            'et le système sexagésimal babylonien de base 60 — seraient issus '
            'de ce comptage sur les phalanges. La thèse a des points forts : '
            'elle explique à la fois le douze et le soixante, elle est '
            'anatomiquement plausible, et elle montre un geste concret plutôt '
            'qu\'une simple coïncidence numérique.\n\n'
            'Pourtant il s\'agit d\'une hypothèse, pas d\'une histoire établie. '
            'Ifrah lui-même qualifie expressément sa déduction de spéculative. '
            'Aucun texte antique, aucune tablette d\'argile et aucune image '
            'ne décrit cette méthode comme l\'origine du système babylonien. '
            'La méthode est compatible avec l\'origine — mais ce n\'est pas la '
            'même chose qu\'une preuve.\n\n'
            'L\'argument contraire le plus fort est fourni par l\'Égypte : les '
            'Égyptiens comptaient eux aussi sur les phalanges selon Ifrah — et '
            'ont pourtant développé un système de numération décimal. La méthode '
            'des doigts seule n\'impose donc ni le douze ni le soixante.',
      ),
      ProseSection(
        'D\'autres explications à côté',
        'La thèse des phalanges n\'est pas isolée. Pour l\'origine du soixante, '
            'une autre hypothèse est même considérée par les historiens comme la '
            'plus largement acceptée : que deux peuples aux bases de comptage '
            'différentes se rencontrèrent dans le commerce et s\'accordèrent sur '
            '60 comme multiple commun. Là non plus, il n\'existe cependant pas '
            'de témoignage historique direct.\n\n'
            'S\'y ajoutent une explication astronomique (environ douze cycles '
            'lunaires s\'insèrent à peu près dans une année, d\'où douze mois et '
            'douze signes du zodiaque) et une explication arithmétique (le douze '
            'et le soixante ont particulièrement de nombreux diviseurs et sont '
            'donc pratiques). Ces raisons expliquent bien pourquoi ces nombres '
            'se sont maintenus — mais pas nécessairement pourquoi on y a eu '
            'recours à l\'origine.\n\n'
            'Plusieurs forces ont probablement agi ensemble : la main, le ciel, '
            'le commerce et la bonne divisibilité. C\'est précisément ce qui '
            'rend si difficile d\'isoler une cause unique. Ce qui reste, c\'est '
            'un beau constat honnête : la main humaine offre une base naturelle '
            'pour le douze — si elle a façonné le système de numération, on ne '
            'peut pas le dire de façon définitive.',
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
        'Finger-counting — Wikipedia',
        'https://en.wikipedia.org/wiki/Finger-counting',
        'R2',
        'A1',
      ),
      Source(
        'The Universal History of Numbers (Georges Ifrah) — Wikipedia',
        'https://en.wikipedia.org/wiki/The_Universal_History_of_Numbers',
        'R2',
        'A3',
      ),
      Source(
        'Chepang: a Sino-Tibetan language with a duodecimal numeral base? (Caughley) — ANU Repository',
        'https://openresearch-repository.anu.edu.au/handle/1885/145390',
        'R1',
        'A2',
      ),
      Source(
        'Number building in Tibeto-Burman languages (Mazaudon, 2008)',
        'https://www.academia.edu/3253865/',
        'R1',
        'A2',
      ),
      Source(
        'Babylonian numerals — MacTutor, Univ. St Andrews',
        'https://mathshistory.st-andrews.ac.uk/HistTopics/Babylonian_numerals/',
        'R2',
        'A1',
      ),
      Source(
        'Why Did Sumerians Use the Sexagesimal System? — Nagaitoshiya',
        'https://www.nagaitoshiya.com/en/2013/sexagesimal/',
        'R3',
        'A1',
      ),
      Source(
        'Phalanx bone — Wikipedia',
        'https://en.wikipedia.org/wiki/Phalanx_bone',
        'R1',
        'A1',
      ),
    ],
  ),
];
