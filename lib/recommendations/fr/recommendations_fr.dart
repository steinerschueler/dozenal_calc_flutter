// French translation of the "Recommendations" chapters. part of
// ../recommendations.dart.
part of '../recommendations.dart';

List<RecChapter> _recChaptersFr() => const [
  // ── Physique ──────────────────────────────────────────────────────────
  RecChapter(
    'Physique',
    intro:
        'L’objectif est un appareil compact, de poche — pas une grosse '
        'calculatrice graphique — qui soit soit programmable, soit doté d’un '
        'moteur de calcul ouvert. Les calculatrices graphiques (NumWorks, '
        'TI-Nspire, Casio fx-CG) sont écartées pour des raisons de facteur de '
        'forme ; la classique HP 35s est discontinuée et ne se trouve plus '
        'qu’en occasion à des prix de collection.',
    calcs: [
      RecCalc(
        'Casio fx-5800P',
        tag: 'Propriétaire · scientifique programmable',
        blurb:
            'Calculatrice de poche programmable avec mémoire de formules et '
            'affichage naturel. Pour les formules récurrentes de charpente '
            '(profondeur d’entaille, géométrie de coupe en biais), on peut '
            'enregistrer des programmes paramétrés.',
        pros: [
          'Compacte et adaptée à la poche',
          'Programmable, avec bibliothèque de formules',
          'Saisie algébrique classique, degrés/minutes/secondes',
          'Excellent rapport qualité-prix',
        ],
        cons: [
          'En Europe, généralement disponible à l’importation seulement',
          'Propriétaire — aucun accès au code',
          'Pas de sortie en base douze',
        ],
        url: 'https://www.casio.com/intl/scientific-calculators/product.FX-5800P/',
      ),
      RecCalc(
        'SwissMicros DM42n',
        tag: 'Moteur Free42 (GPL-2.0) · RPN · premium',
        blurb:
            'Calculatrice RPN de référence et hommage au HP-42S, dans un boîtier '
            'en acier inoxydable fraisé CNC avec USB-C. Son moteur de calcul est '
            'le Free42 open source de Thomas Okken, avec arithmétique decimal-128 '
            '(34 chiffres significatifs).',
        pros: [
          'Moteur de calcul ouvert (Free42, GPL) — comportement analysable',
          'Identique au moteur bureau/mobile, programmes portables',
          'Précision extrême (34 chiffres décimaux)',
          'Finition digne d’un héritage, stockage de masse USB-C',
        ],
        cons: [
          'RPN uniquement — demande une période d’adaptation',
          'Prix premium, parfois difficile à trouver',
          'Fonctions BASE sans base douze',
        ],
        url: 'https://www.swissmicros.com/product/model-dm42n',
      ),
      RecCalc(
        'Casio fx-991CW (ClassWiz)',
        tag: 'Propriétaire · scientifique (entrée de gamme)',
        blurb:
            'Le ClassWiz actuel, non programmable — l’option économique et '
            'disponible partout, pour ceux qui n’ont pas besoin de '
            'programmabilité.',
        pros: [
          'Bon marché et disponible presque partout',
          'Affichage naturel, large éventail de fonctions',
          'Compact, robuste',
        ],
        cons: [
          'Non programmable',
          'Propriétaire',
          'Sensiblement plus lent sur les opérations complexes',
          'Pas de base douze',
        ],
        url: 'https://www.casio.com/us/scientific-calculators/product.FX-991CW/',
      ),
    ],
    verdict:
        'En résumé : le fx-5800P est le choix rationnel — programmable, compact, '
        'saisie familière. Le DM42n est la pièce d’enthousiaste avec un moteur '
        'ouvert (mais RPN obligatoire et prix premium). Conseil : tester le RPN '
        'gratuitement avec Free42/Plus42 avant d’investir dans le matériel.',
  ),

  // ── Android — Play Store ──────────────────────────────────────────────
  RecChapter(
    'Android — Play Store',
    intro:
        'Pour un usage quotidien sur téléphone. Voici les applications les plus '
        'performantes disponibles sur Google Play — les options purement open '
        'source suivent au chapitre suivant (F-Droid).',
    calcs: [
      RecCalc(
        'HiPER Calc Pro',
        tag: 'Propriétaire · CAS & graphes',
        blurb:
            'Calculatrice scientifique avec algèbre symbolique, graphes, '
            'équations, dérivées et intégrales. Très répandue, activement '
            'maintenue, avec des mises en page adaptées aux différentes tailles '
            'd’écran.',
        pros: [
          'Vaste ensemble de fonctions (CAS, graphes, grand nombre de chiffres)',
          'Affichage des fractions et des décimales périodiques',
          'Activement maintenue, mises en page personnalisables',
        ],
        cons: [
          'Propriétaire — sans valeur pédagogique pour vos propres projets',
          'Fonctionnalités complètes payantes',
          'Pas de sortie en base douze',
        ],
        url: 'https://play.google.com/store/apps/details?id=cz.hipercalc.pro',
      ),
      RecCalc(
        'Free42 / Plus42',
        tag: 'GPL-2.0 · RPN (HP-42S)',
        blurb:
            'Réimplémentation complète du HP-42S sans code HP. Plus42 l’étend '
            'avec des équations algébriques et un solveur, réduisant sensiblement '
            'la barrière d’entrée au RPN.',
        pros: [
          'Open source (GPL), code utilisable comme matériau d’apprentissage',
          'Identique sur toutes les plateformes — programmes portables',
          'Précision decimal-128',
          'Plus42 avec équations algébriques',
        ],
        cons: [
          'Logique RPN (Plus42 atténue cela)',
          'Fonctions BASE sans base douze',
          'Payant sur mobile (gratuit sur bureau)',
        ],
        url: 'https://thomasokken.com/plus42/',
      ),
    ],
    verdict:
        'En résumé : HiPER Calc Pro comme outil quotidien le plus complet du '
        'Play Store ; Free42/Plus42 comme filière RPN open source avec '
        'précision decimal-128.',
  ),

  // ── Android — F-Droid ─────────────────────────────────────────────────
  RecChapter(
    'Android — F-Droid',
    intro:
        'Applications entièrement open source provenant du store F-Droid (ou '
        'directement du développeur) : code inspectable, sans traceurs — et donc '
        'matériau d’apprentissage et de référence pour vos propres projets.',
    calcs: [
      RecCalc(
        'Qalculate! (Android)',
        tag: 'GPL-2.0 · CAS & unités',
        blurb:
            'L’interface Android officielle du moteur Qalculate! : une '
            'interface Kotlin/Java par-dessus la bibliothèque C++ native '
            'libqalculate. Calcul symbolique, précision arbitraire, arithmétique '
            'par intervalles, conversion d’unités — le moteur le plus '
            'puissant du domaine.',
        pros: [
          'Open source (GPL), moteur le plus puissant (CAS, unités, précision)',
          'Calcule aussi en base douze (duodécimal) — le seul ici',
          'Architecture instructive : interface Kotlin sur un moteur natif',
          'Sans traceurs',
        ],
        cons: [
          'S’obtient principalement via F-Droid ou une compilation directe',
          'Le projet refuse la vérification développeur de Google — la '
              'disponibilité future sur les canaux habituels est incertaine '
              '(sans incidence via F-Droid)',
          'Barrière d’entrée plus élevée qu’une calculatrice simple',
        ],
        url: 'https://f-droid.org/packages/com.jherkenhoff.qalculate/',
      ),
      RecCalc(
        'OpenCalc',
        tag: 'GPL-3.0 · Kotlin',
        blurb:
            'Calculatrice légère et bien maintenue, entièrement écrite en Kotlin. '
            'Pas un champion des fonctionnalités, mais le code est lisible et '
            'compact — à noter en particulier le passage documenté des nombres '
            'internes de Double à BigDecimal, exactement la question de précision '
            'qu’une calculatrice en base douze doit aussi résoudre.',
        pros: [
          'Open source (GPL-3.0), code Kotlin propre',
          'Objet d’apprentissage et de référence idéal',
          'Historique, interface épurée, sans traceurs',
        ],
        cons: [
          'Pas de CAS, pas de programmabilité',
          'Fonctionnellement sans commune mesure avec HiPER/Qalculate',
          'Pas de base douze',
        ],
        url: 'https://github.com/Darkempire78/OpenCalc',
      ),
    ],
    verdict:
        'En résumé : Qalculate! est le choix open source le plus puissant — et '
        'le seul avec une sortie en base douze. OpenCalc est le « regard sous le '
        'capot » pour les développeurs.',
  ),

  // ── iOS ───────────────────────────────────────────────────────────────
  RecChapter(
    'iOS',
    intro:
        'iOS est la plateforme la plus pauvre en calculatrices open source — '
        'mais elle dispose d’un outil propriétaire exceptionnel. Soyons '
        'honnêtes : la concurrence FOSS sérieuse est absente.',
    calcs: [
      RecCalc(
        'PCalc',
        tag: 'Propriétaire · outil de référence',
        blurb:
            'Considérée comme la référence sur les plateformes Apple depuis les '
            'années 1990 : conversions étendues, saisie RPN de premier ordre, '
            'personnalisation poussée (thèmes, dispositions de touches, ruban '
            'papier). Fonctionne sur iPhone, iPad, Apple Watch et Apple TV.',
        pros: [
          'Outil de premier ordre, très abouti',
          'Mode RPN optionnel, historique modifiable',
          'Nombreuses conversions et constantes',
          'Version Lite gratuite pour commencer',
        ],
        cons: [
          'Propriétaire — sans valeur pédagogique',
          'Payant',
          'La richesse des fonctions peut dérouter au début',
          'Pas de base douze',
        ],
        url: 'https://pcalc.com/',
      ),
      RecCalc(
        'Free42 / Plus42',
        tag: 'GPL-2.0 · RPN (HP-42S)',
        blurb:
            'Comble le vide open source sur iOS : Free42 est gratuit sur l’'
            'App Store et utilise le même moteur que sur toutes les autres '
            'plateformes.',
        pros: [
          'Open source (GPL), Free42 gratuit',
          'Identique sur toutes les plateformes',
          'Précision decimal-128',
          'Plus42 avec équations algébriques',
        ],
        cons: [
          'Logique RPN (Plus42 atténue cela)',
          'Pas de base douze',
          'Plus42 payant',
        ],
        url: 'https://thomasokken.com/free42/',
      ),
    ],
    verdict:
        'En résumé : PCalc comme outil principal (sans concurrence FOSS sérieuse '
        'sur iOS), Free42/Plus42 comme recommandation open source et porte '
        'd’entrée propre vers le RPN.',
  ),

  // ── macOS ─────────────────────────────────────────────────────────────
  RecChapter(
    'macOS',
    intro:
        'Sur Mac, le meilleur outil natif rencontre le moteur ouvert le plus '
        'puissant — une division du travail s’impose : saisie rapide au '
        'clavier d’un côté, travail exact et symbolique de l’autre.',
    calcs: [
      RecCalc(
        'Qalculate!',
        tag: 'GPL-2.0+ · moteur le plus puissant',
        blurb:
            'Le mastodonte de bureau (également pour Windows et Linux) : '
            'symbolique, précision arbitraire, conversion d’unités, tracé de '
            'courbes. Installable via Homebrew ; le CLI « qalc » se comporte '
            'identiquement à Linux.',
        pros: [
          'Open source, moteur le plus puissant (CAS, unités, fractions exactes)',
          'Calcule aussi en base douze (duodécimal)',
          'Extensible avec ses propres fonctions, CLI scriptable',
        ],
        cons: [
          'Moins « natif Mac » et poli que PCalc',
          'Sa puissance demande un certain apprentissage',
        ],
        url: 'https://qalculate.github.io/',
      ),
      RecCalc(
        'PCalc',
        tag: 'Propriétaire · qualité Mac native',
        blurb:
            'Les mêmes atouts que sur iOS, dans une application Mac soignée : '
            'personnalisation poussée et « Magic Variables » pour réutiliser des '
            'expressions, plus Handoff entre les appareils Apple.',
        pros: [
          'Application Mac native et aboutie',
          'RPN, ruban papier, nombreuses conversions',
          'Magic Variables, Handoff iOS/macOS',
        ],
        cons: [
          'Propriétaire, payant',
          'Pas de base douze',
        ],
        url: 'https://pcalc.com/mac/',
      ),
      RecCalc(
        'Free42 / Plus42',
        tag: 'GPL-2.0 · RPN (HP-42S)',
        blurb:
            'Disponible également pour macOS — gratuit sur bureau. Le même moteur '
            'que le cœur de calcul du matériel DM42.',
        pros: [
          'Open source (GPL), gratuit sur bureau',
          'Précision decimal-128',
          'Identique sur toutes les plateformes',
        ],
        cons: [
          'Logique RPN',
          'Pas de base douze',
        ],
        url: 'https://thomasokken.com/free42/',
      ),
    ],
    verdict:
        'En résumé : PCalc pour la saisie rapide au clavier, Qalculate! pour le '
        'travail exact et symbolique (et la base douze). En spécialistes de '
        'niche : Numi (saisie en langage naturel) et Soulver (calcul façon '
        'bloc-notes).',
  ),

  // ── Linux ─────────────────────────────────────────────────────────────
  RecChapter(
    'Linux',
    intro:
        'Sur Linux la situation est limpide — un moteur domine, et la vraie '
        'question est « interface graphique ou terminal ? ». Pour les calculatrices '
        'standard simples, il y a aussi les classiques du bureau.',
    calcs: [
      RecCalc(
        'Qalculate! / qalc',
        tag: 'GPL-2.0+ · sans concurrence',
        blurb:
            'Interfaces GTK et Qt plus le CLI « qalc ». Toute la puissance de '
            'libqalculate : symbolique, précision arbitraire, propagation '
            'd’incertitudes, tracé de courbes. « qalc » est scriptable '
            '(expression en argument ou depuis un fichier) et disponible dans '
            'toutes les grandes distributions.',
        pros: [
          'Open source, disponible dans toutes les distributions',
          'Moteur le plus puissant, calcule aussi en base douze',
          'CLI scriptable — alias, pipes, bibliothèques de fonctions personnelles',
        ],
        cons: [
          'La richesse des fonctions demande un certain apprentissage',
        ],
        url: 'https://qalculate.github.io/',
      ),
      RecCalc(
        'KCalc',
        tag: 'GPL · standard KDE',
        blurb:
            'La calculatrice KDE avec modes scientifique et programmeur ainsi que '
            'dispositions de touches personnalisables — une base solide.',
        pros: [
          'Open source, légère',
          'Mode programmeur (bin/oct/hex)',
          'Bien intégrée dans KDE Plasma',
        ],
        cons: [
          'Pas de CAS',
          'Pas de base douze',
        ],
        url: 'https://apps.kde.org/kcalc/',
      ),
      RecCalc(
        'GNOME Calculator',
        tag: 'GPL · standard GNOME',
        blurb:
            'La calculatrice standard de GNOME avec unités et devises, plus des '
            'modes avancé, financier et programmeur. Fonctionnellement en deçà de '
            'Qalculate, mais solide à tous égards.',
        pros: [
          'Open source, facile à prendre en main',
          'Unités et devises intégrées',
        ],
        cons: [
          'Moins puissante que Qalculate',
          'Pas de base douze',
        ],
        url: 'https://apps.gnome.org/Calculator/',
      ),
      RecCalc(
        'SpeedCrunch',
        tag: 'GPL · développement en sommeil',
        blurb:
            'L’ancien tuyau des initiés : saisie rapide centrée sur le '
            'clavier avec coloration syntaxique et auto-complétion, haute '
            'précision, variables comme dans un tableur. Stable — mais sans '
            'nouvelle version depuis des années.',
        pros: [
          'Open source, saisie clavier très rapide',
          'Haute précision, portable sans installation',
        ],
        cons: [
          'Développement en sommeil — aucune perspective d’avenir',
          'Fonctionnellement dépassé par Qalculate',
          'Pas de base douze',
        ],
        url: 'https://speedcrunch.org/',
      ),
    ],
    verdict:
        'En résumé : Qalculate!/qalc sans concurrence sérieuse — le choix se '
        'résume à interface graphique contre flux de travail en terminal. KCalc '
        'et GNOME Calculator comme calculatrices standard légères ; SpeedCrunch '
        'utilisable, mais sans avenir.',
  ),

  // ── Windows ───────────────────────────────────────────────────────────
  RecChapter(
    'Windows',
    intro:
        'Sur Windows la concurrence est mince — un moteur se distingue, accompagné '
        'du cas rare d’une référence sous licence permissive dont le code '
        'peut être réutilisé (contrairement au GPL) sans complications juridiques.',
    calcs: [
      RecCalc(
        'Qalculate!',
        tag: 'GPL-2.0+ · vainqueur incontesté',
        blurb:
            'Builds Windows officiels (qalculate-qt) avec le même moteur puissant '
            'que sur Mac et Linux : symbolique, précision arbitraire, unités, '
            'tracé de courbes.',
        pros: [
          'Open source, moteur le plus puissant',
          'Calcule aussi en base douze (duodécimal)',
          'Extensible avec ses propres fonctions',
        ],
        cons: [
          'Moins « natif Windows » et poli',
          'Sa puissance demande un certain apprentissage',
        ],
        url: 'https://qalculate.github.io/',
      ),
      RecCalc(
        'Calculatrice Windows (Microsoft)',
        tag: 'MIT · préinstallée',
        blurb:
            'Open source sur GitHub depuis 2019 — et sous licence MIT qui plus '
            'est. C’est le cas rare d’une licence permissive dans ce '
            'domaine, et donc la référence de code juridiquement la plus simple '
            '(C++/C#). Propose un mode programmeur avec bin/oct/hex.',
        pros: [
          'Open source sous MIT — réutilisation du code sans complications juridiques',
          'Préinstallée et familière',
          'Mode programmeur (bin/oct/hex)',
        ],
        cons: [
          'Pas de CAS, pas de programmabilité',
          'Précision limitée',
          'Pas de base douze',
        ],
        url: 'https://github.com/microsoft/calculator',
      ),
      RecCalc(
        'SpeedCrunch',
        tag: 'GPL · développement en sommeil',
        blurb:
            'Saisie rapide centrée sur le clavier avec coloration syntaxique et '
            'auto-complétion, haute précision, portable sans installation — mais '
            'sans nouvelle version depuis des années.',
        pros: [
          'Open source, saisie clavier très rapide',
          'Haute précision, portable',
        ],
        cons: [
          'Développement en sommeil — aucune perspective d’avenir',
          'Fonctionnellement dépassé par Qalculate',
          'Pas de base douze',
        ],
        url: 'https://speedcrunch.org/',
      ),
      RecCalc(
        'Free42 / Plus42',
        tag: 'GPL-2.0 · RPN (HP-42S)',
        blurb:
            'Pour les amateurs de RPN : gratuit sur bureau, le même moteur que '
            'le cœur de calcul du matériel DM42.',
        pros: [
          'Open source (GPL), gratuit sur bureau',
          'Précision decimal-128',
          'Identique sur toutes les plateformes',
        ],
        cons: [
          'Logique RPN (Plus42 atténue cela)',
          'Pas de base douze',
        ],
        url: 'https://thomasokken.com/free42/',
      ),
    ],
    verdict:
        'En résumé : Qalculate! comme choix évident. Garder la Calculatrice '
        'Windows en tête comme référence de code sous licence MIT, SpeedCrunch '
        'seulement avec mise en garde de maintenance, Free42/Plus42 pour les '
        'amateurs de RPN.',
  ),
];
