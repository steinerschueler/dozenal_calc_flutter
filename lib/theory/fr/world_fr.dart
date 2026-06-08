part of '../world_theory.dart';

// Prose française pour les chapitres « nature » de Douze et le monde.
// part of ../world_theory.dart. Distillée des docs/research/nature_*.md en
// phrases volontairement simples (plus faciles à traduire). Ton : énoncer
// la science, et rapporter comment des figures et des traditions (Platon,
// les pythagoriciens, des scientifiques, …) la lisent — mais ne tirer
// aucune conclusion interprétative dans la voix du narrateur. Le sujet et
// le lecteur parlent d'eux-mêmes.

List<ProseChapter> _worldChaptersFr() => const [
  ProseChapter('La pyrite : douze faces issues du cube', [
    ProseSection(
      'Une pierre comme un dodécaèdre',
      'La pyrite est le minéral disulfure de fer, populairement appelé « or '
          'des chats » ou « or des fous ». Elle pousse le plus souvent en cube '
          'net, mais peut aussi former une figure étonnante : un corps à douze '
          'faces pentagonales. Les minéralogistes l\'appellent le '
          '« pyritoèdre » — c\'est la signature de cette pierre.\n\n'
          'À première vue, cela ressemble au célèbre dodécaèdre de la '
          'géométrie grecque (dodeka = douze). De fait, la construction '
          'concorde même : douze faces, trente arêtes, vingt sommets. Qu\'une '
          'pierre inerte prenne d\'elle-même une forme aussi pure de douze a '
          'fasciné les humains depuis l\'Antiquité.',
    ),
    ProseSection(
      'Pourquoi ce n\'est pas un dodécaèdre parfait',
      'Et pourtant le pyritoèdre n\'est pas un véritable dodécaèdre régulier. '
          'Ses douze pentagones sont légèrement déformés, pas équilatéraux. '
          'Ses arêtes ont deux longueurs différentes. Et il lui manque la '
          'vraie symétrie d\'ordre cinq du solide platonicien.\n\n'
          'Derrière cela se cache une raison claire. Un cristal ne peut '
          'disposer ses faces que selon des rapports entiers. Or le dodécaèdre '
          'idéal exigerait le nombre d\'or, un nombre infini, non entier, '
          'qu\'un réseau cristallin ne permet pas. Il se forme donc '
          'l\'approximation lisse la plus simple, le rapport deux pour un. Il '
          'en résulte le pyritoèdre : douze faces, mais pas la perfection '
          'platonicienne.',
    ),
    ProseSection(
      'Pourquoi la nature bâtit cette forme',
      'La forme extérieure d\'un cristal reflète ses atomes intérieurs. Dans '
          'la pyrite, le soufre ne se tient pas isolé, mais en petits '
          'haltères de deux atomes chacun. Ces haltères sont orientés et '
          '« brisent » en partie la pleine symétrie cubique. C\'est seulement '
          'ainsi que le dodécaèdre peut apparaître.\n\n'
          'Quelle forme apparaît finalement dépend de la croissance : les '
          'faces qui poussent vite disparaissent, les lentes subsistent. Selon '
          'les conditions, la pyrite devient ainsi cube, octaèdre ou justement '
          'pyritoèdre. Les traces d\'impuretés et le rythme de croissance ont '
          'leur mot à dire.',
    ),
    ProseSection(
      'Pierre à feu et or des fous',
      'Le nom vient du mot grec pour feu : quand on frappe la pyrite contre '
          'de l\'acier, des étincelles jaillissent. La pierre compte ainsi '
          'parmi les plus anciens outils de l\'humanité — même Ötzi, la momie '
          'des glaciers, en portait sur lui pour faire du feu.\n\n'
          'Son éclat doré simulait souvent l\'or véritable, d\'où « or des '
          'fous ». Plus tard, la pyrite fournit la matière première de '
          'l\'acide sulfurique. Les plus beaux cubes du monde — d\'une netteté '
          'de lame et réfléchissants, comme faits à la machine — viennent de '
          'Navajún en Espagne, où ils ont lentement poussé dans une marne '
          'tendre.',
    ),
    ProseSection(
      'Le dodécaèdre comme symbole',
      'Le dodécaèdre a de forts échos culturels. Dans l\'Antiquité, Platon '
          'attribua quatre des cinq solides parfaits aux éléments et donna le '
          'dodécaèdre régulier au cosmos tout entier ; on associait volontiers '
          'ses douze faces aux douze signes du zodiaque.\n\n'
          'Il existe même la conjecture que les pythagoriciens auraient '
          'd\'abord imaginé le dodécaèdre idéal à la vue de cristaux de pyrite '
          '— plausible, mais non établi. La vraie symétrie d\'ordre cinq, que '
          'le pyritoèdre ne fait que suggérer, ne se rencontre dans la nature '
          'que dans les quasi-cristaux, un chapitre bien plus récent.',
    ),
  ], sources: [
    Source('Pyritohedron — Wikipedia', 'https://en.wikipedia.org/wiki/Pyritohedron', 'R2', 'A1'),
    Source('Dodecahedron — Wikipedia', 'https://en.wikipedia.org/wiki/Dodecahedron', 'R2', 'A1'),
    Source('Pyrite — Wikipedia', 'https://en.wikipedia.org/wiki/Pyrite', 'R2', 'A1'),
    Source('Understanding the Surfaces and Crystal Growth of Pyrite FeS₂ — Materials Research (SciELO)', 'http://www.scielo.br/j/mr/a/WCvkdSk35gt6Kxbfw5JVJtH/?lang=en', 'R1', 'A1'),
    Source('Bonding in Pyrite Structures — Chemistry LibreTexts', 'https://chem.libretexts.org/Bookshelves/Inorganic_Chemistry/Introduction_to_Inorganic_Chemistry_(Wikibook)/08:_Ionic_and_Covalent_Solids/8.06', 'R2', 'A1'),
    Source('Roman dodecahedron — Wikipedia', 'https://en.wikipedia.org/wiki/Roman_dodecahedron', 'R2', 'A1'),
  ]),
  ProseChapter('Le grenat : le dodécaèdre fait de losanges', [
    ProseSection(
      'Le dodécaèdre rhombique',
      'Le grenat n\'est pas un minéral unique, mais toute une famille — le '
          'plus souvent rouge, dur et sans clivage. Sa forme préférée dans la '
          'nature est un corps à douze faces, mais cette fois ce ne sont pas '
          'des pentagones, mais douze losanges identiques. Cette forme '
          's\'appelle le dodécaèdre rhombique.\n\n'
          'Peu d\'autres corps sont aussi étroitement liés à un minéral, au '
          'point qu\'on le nomme simplement « grenatoèdre ». Il est en outre '
          'remplisseur d\'espace : une multitude de tels corps remplit '
          'l\'espace sans lacune — c\'est la même forme qui constitue le fond '
          'des alvéoles des abeilles, comme l\'avait déjà remarqué Johannes '
          'Kepler.',
    ),
    ProseSection(
      'Pourquoi douze losanges',
      'Le grenat croît dans le système cristallin cubique, qui permettrait à '
          'vrai dire aussi le cube et l\'octaèdre. Mais chez le grenat, ce '
          'sont précisément ces faces qui poussent trop vite et disparaissent. '
          'Restent les faces lentes — et ce sont exactement les douze qui '
          'forment le dodécaèdre rhombique. C\'est pourquoi un grenat n\'est '
          'presque jamais cubique, mais arrondi et à douze faces comme une '
          'graine.\n\n'
          'La symétrie du cristal permet cette forme, mais ne l\'impose pas ; '
          'laquelle des formes permises apparaît, c\'est seulement la '
          'croissance qui en décide.',
    ),
    ProseSection(
      'De la grenade au papier de verre',
      'Le nom vient du mot latin pour « grenu » — via la grenade, dont les '
          'grains rouges ressemblent aux cristaux. Les grenats rouges étaient '
          'les pierres préférées de l\'Antiquité tardive : des plaquettes de '
          'grenat serties d\'or ornent des pièces d\'apparat comme le trésor '
          'de Sutton Hoo ; les pierres venaient par le commerce lointain du '
          'Sri Lanka et de l\'Inde.\n\n'
          'Économiquement, une propriété plus sobre est aujourd\'hui plus '
          'importante encore : le grenat est très dur et se brise en arêtes '
          'vives. C\'est pourquoi il se trouve dans le papier de verre, dans '
          'l\'abrasif de sablage et même dans le jet d\'eau qui découpe '
          'l\'acier. La belle gemme est en même temps une bête de somme de '
          'l\'industrie.',
    ),
    ProseSection(
      'Trois dodécaèdres différents',
      'Trois corps à douze faces se ressemblent :\n\n'
          '• Le dodécaèdre rhombique du grenat a douze losanges.\n'
          '• Le pyritoèdre de la pyrite a douze pentagones déformés.\n'
          '• Le dodécaèdre régulier de Platon a douze pentagones parfaits.\n\n'
          'Seul le solide platonicien a une vraie symétrie d\'ordre cinq — et '
          'c\'est justement elle qui est impossible dans un cristal, parce que '
          'les pentagones ne s\'emboîtent pas sans lacune. C\'est pourquoi '
          'aucun cristal ordinaire ne forme un dodécaèdre parfait ; le grenat '
          'et la pyrite atteignent le nombre douze, chacun à sa manière.',
    ),
  ], sources: [
    Source('Garnet — Wikipedia', 'https://en.wikipedia.org/wiki/Garnet', 'R2', 'A1'),
    Source('Rhombic Dodecahedron — Wolfram MathWorld', 'https://mathworld.wolfram.com/RhombicDodecahedron.html', 'R1', 'A3'),
    Source('René-Just Haüy and the birth of crystallography — IUCr', 'https://www.iucr.org/news/newsletter/volume-30/number-4/rene-just-hauy-and-the-birth-of-crystallography', 'R1', 'A2'),
    Source('Crystal morphology and the BFDH law — ScienceDirect', 'https://www.sciencedirect.com/science/article/abs/pii/S0022024804007936', 'R1', 'A2'),
    Source('Russian Demantoid: Czar of the Garnet Family — GIA', 'https://www.gia.edu/doc/Russian-Demantoid-Czar-of-the-Garnet-Family.pdf', 'R1', 'A3'),
  ]),
  ProseChapter('Virus et radiolaires : le douze du vivant', [
    ProseSection(
      'Le douze, deux fois',
      'Deux solides parfaits portent le douze en eux. L\'icosaèdre a vingt '
          'faces triangulaires qui se rejoignent en douze sommets. Le '
          'dodécaèdre a douze faces pentagonales. Les deux sont des '
          '« jumeaux » : si l\'on pose les sommets de l\'un sur les centres '
          'des faces de l\'autre, ils se transforment l\'un en l\'autre. Ils '
          'partagent la même symétrie.\n\n'
          'Parmi ces corps, l\'icosaèdre est celui qui se rapproche le plus '
          'd\'une sphère — il enferme le plus grand volume pour la plus petite '
          'surface. Pour une enveloppe protectrice, c\'est la forme la plus '
          'économe. C\'est précisément pourquoi cette géométrie réapparaît '
          'dans le plus infime du vivant.',
    ),
    ProseSection(
      'Pourquoi il en faut exactement douze',
      'Derrière cela se cache une règle simple et contraignante de la '
          'géométrie. On ne peut pas recouvrir une sphère sans lacune avec '
          'seulement des hexagones — un réseau d\'hexagones purs reste plat. '
          'Pour le courber en une sphère fermée, il faut exactement douze '
          'pentagones. Le nombre d\'hexagones est quelconque, celui des '
          'pentagones est toujours douze.\n\n'
          'Le même principe se trouve dans le ballon de football classique '
          '(douze pièces pentagonales), dans les dômes géodésiques et dans la '
          'molécule de carbone C₆₀. Le douze est ici une conséquence '
          'inévitable du fait qu\'une surface se referme en sphère.',
    ),
    ProseSection(
      'Virus : douze pentagones, toujours',
      'Environ sept virus sur dix logent leur patrimoine génétique dans une '
          'enveloppe ayant exactement cette symétrie icosaédrique. La raison '
          'en est l\'économie : un virus n\'a que peu d\'information '
          'héréditaire. Au lieu de construire une grande protéine d\'enveloppe '
          'unique, il bâtit sa coque à partir de nombreuses copies d\'un seul '
          'petit élément. Ces éléments s\'assemblent d\'eux-mêmes, dans l\'état '
          'le plus stable.\n\n'
          'Les chercheurs Caspar et Klug montrèrent en 1962 comment cela '
          'fonctionne aussi pour de plus grandes enveloppes : les éléments '
          'forment des anneaux de cinq et de six. Peu importe la taille du '
          'virus — il y a toujours exactement douze anneaux de cinq aux douze '
          'sommets. De nouveau le douze d\'Euler, exactement comme pour le '
          'ballon de football. Caspar et Klug furent inspirés par les dômes de '
          'l\'architecte Buckminster Fuller. Tous les virus ne sont cependant '
          'pas icosaédriques : certains sont en bâtonnet ou bâtis autrement.',
    ),
    ProseSection(
      'Radiolaires : la géométrie d\'une seule cellule',
      'Les radiolaires sont de minuscules organismes marins unicellulaires '
          'qui bâtissent des squelettes filigranes en silice — du verre, en '
          'quelque sorte. Certaines espèces atteignent avec une précision '
          'stupéfiante les formes platoniciennes. Le naturaliste Ernst Haeckel '
          'dessina vers 1900 une espèce en pur icosaèdre (avec douze épines '
          'aux douze sommets) et une autre en dodécaèdre.\n\n'
          'Pour ses planches artistiques, Haeckel choisit les exemplaires les '
          'plus beaux et les plus symétriques ; beaucoup de radiolaires ne '
          'sont en réalité que platoniciens par approximation. Comment une '
          'cellule sans cerveau bâtit même une telle géométrie n\'est pas '
          'tout à fait élucidé à ce jour — le verre se dépose probablement sur '
          'les parois de bulles de taille égale, comme sur les jonctions '
          'd\'une mousse de savon. Les planches de Haeckel marquèrent plus '
          'tard jusqu\'à l\'Art nouveau.',
    ),
  ], sources: [
    Source('Report on the Radiolaria (Haeckel 1887) — Project Gutenberg', 'https://www.gutenberg.org/files/44525/44525-h/44525-h.htm', 'R1', 'A1'),
    Source('Icosahedral capsids (Caspar–Klug) — ViralZone (SIB)', 'https://viralzone.expasy.org/8577', 'R1', 'A1'),
    Source('Quasisymmetry in Icosahedral Viruses — PDB-101 (RCSB)', 'https://pdb101.rcsb.org/motm/200', 'R1', 'A1'),
    Source('Principles of Virus Structural Organization — NIH (PMC)', 'https://pmc.ncbi.nlm.nih.gov/articles/PMC3767311/', 'R1', 'A1'),
    Source('Virus Structure: From Crick and Watson to a New Conjecture — arXiv', 'https://arxiv.org/pdf/0707.3690', 'R1', 'A1'),
    Source('Haeckel\'s embryos: fraud not proven — R. J. Richards (U Chicago)', 'https://home.uchicago.edu/~rjr6/articles/Haeckel--fraud%20not%20proven.pdf', 'R1', 'A1'),
  ]),
  ProseChapter('Les quasi-cristaux : la symétrie interdite', [
    ProseSection(
      'Le cinq interdit',
      'Un cristal ordinaire est bâti à partir d\'une plus petite unité qui se '
          'répète sans fin par translation. De cette répétition découle une '
          'règle stricte : seules sont permises les symétries de rotation '
          'd\'ordre deux, trois, quatre et six. Un axe d\'ordre cinq est '
          'interdit.\n\n'
          'La raison en est intuitive : on peut paver une surface sans lacune '
          'avec des triangles, des carrés ou des hexagones — mais jamais avec '
          'des pentagones réguliers. Il reste toujours des lacunes. C\'est '
          'pourquoi un cristal normal ne peut porter ni vrai motif de cinq ni '
          'vrai icosaèdre. La pyrite et le grenat avaient certes l\'air d\'avoir '
          'douze faces — mais c\'est justement à eux que manque la vraie '
          'symétrie d\'ordre cinq.',
    ),
    ProseSection(
      'Comment ils contournent l\'interdit',
      'L\'interdit ne vaut que parce que le cristal se répète. Mais que se '
          'passe-t-il si une structure est ordonnée tout en ne se répétant '
          'jamais exactement ? Ce sont précisément les quasi-cristaux. Ils '
          'sont strictement ordonnés, et pourtant aucune translation ne les '
          'fait coïncider avec eux-mêmes.\n\n'
          'Ce qui rend cela possible, c\'est une mesure irrationnelle — de '
          'nouveau le nombre d\'or. Si une structure contient deux longueurs '
          'dont le rapport est le nombre d\'or, elles ne se retrouvent jamais '
          'dans la même cadence. Le célèbre motif de Penrose le montre dans le '
          'plan : deux formes de tuiles qui remplissent le sol sans jamais se '
          'répéter, avec un ordre d\'ordre cinq. C\'est seulement le renoncement '
          'à la répétition qui permet le cinq interdit.',
    ),
    ProseSection(
      'Le vrai pendant de la pyrite et du grenat',
      'Ici la boucle se referme. La pyrite et le grenat « jouent » avec des '
          'dodécaèdres, mais restent des cristaux qui se répètent — leur allure '
          'de dodécaèdre est trompeuse. Le quasi-cristal porte la vraie '
          'symétrie icosaédrique, parce qu\'il renonce à la répétition.\n\n'
          'Le point mathématique derrière cela : la symétrie de la pyrite est '
          'exactement une partie de la pleine symétrie icosaédrique — '
          'justement la partie qui tient encore dans un réseau qui se répète. '
          'Dans le vrai dodécaèdre, le nombre d\'or se cache dans les faces ; '
          'la pyrite le remplace par le nombre lisse deux. C\'est pourquoi la '
          'pyrite a « presque » l\'air d\'un dodécaèdre, mais ne peut jamais '
          'avoir d\'axe d\'ordre cinq.',
    ),
    ProseSection(
      'Shechtman contre le monde',
      'Le 8 avril 1982, le chercheur en matériaux Dan Shechtman vit dans un '
          'alliage aluminium-manganèse une figure de diffraction à symétrie '
          '« interdite » d\'ordre dix. Dans son carnet, il écrivit « 10 '
          'Fold??? ». Des points nets signifient de l\'ordre — mais cette '
          'symétrie passait pour impossible. Les deux ensemble semblaient une '
          'contradiction.\n\n'
          'Shechtman récolta des années de moqueries. Le chef de son '
          'laboratoire lui demanda de partir. Le célèbre chimiste Linus '
          'Pauling raillait : « Il n\'existe pas de quasi-cristaux, seulement '
          'des quasi-scientifiques. » Pourtant les mesures tinrent bon. En '
          '1992, les cristallographes changèrent même la définition de '
          '« cristal ». En 2011, Shechtman reçut le prix Nobel de chimie.',
    ),
    ProseSection(
      'Venus de l\'espace et de l\'Alhambra',
      'Longtemps, les quasi-cristaux passèrent pour purement artificiels. '
          'Puis une équipe de chercheurs trouva le premier naturel — de '
          'minuscules grains dans une météorite de Sibérie orientale, vieille '
          'd\'environ 4,5 milliards d\'années, née d\'une collision dans le '
          'jeune système solaire. Le minéral s\'appelle à propos '
          '« icosaédrite ».\n\n'
          'Et l\'humain avait même devancé la nature sans le savoir : dès le '
          'XIIIᵉ au XVᵉ siècle, des bâtisseurs islamiques en Perse posaient '
          'des motifs de carreaux (girih) qui suivent exactement cet ordre '
          'd\'ordre cinq non répétitif. Ici, dans les quasi-cristaux et les '
          'motifs de Penrose, le nombre d\'or est vraiment à l\'œuvre.',
    ),
  ], sources: [
    Source('The Nobel Prize in Chemistry 2011 — Popular Information', 'https://www.nobelprize.org/prizes/chemistry/2011/popular-information/', 'R1', 'A1'),
    Source('The Nobel Prize in Chemistry 2011 — Facts (Shechtman)', 'https://www.nobelprize.org/prizes/chemistry/2011/shechtman/facts/', 'R1', 'A1'),
    Source('Synchrotron X-ray study of icosahedrite — IUCrJ (PMC)', 'https://pmc.ncbi.nlm.nih.gov/articles/PMC12403171/', 'R1', 'A1'),
    Source('Quasi-Periodic Crystals: The Long Road from Discovery to Acceptance — PMC', 'https://pmc.ncbi.nlm.nih.gov/articles/PMC3678913/', 'R1', 'A2'),
    Source('Fascinating quasicrystals — IUCr Journals', 'https://journals.iucr.org/a/issues/2008/01/00/sc5003/index.html', 'R1', 'A2'),
    Source('Forbidden symmetries, quasicrystals, and Penrose tilings — PNAS (PMC)', 'https://pmc.ncbi.nlm.nih.gov/articles/PMC34472/', 'R1', 'A2'),
  ]),
  ProseChapter('Cellules et mousses : le douze et le quatorze caché', [
    ProseSection(
      'Quand la nature divise l\'espace en cellules',
      'Les mousses de savon, les alvéoles d\'abeilles et les cellules '
          'vivantes doivent toutes résoudre le même problème : diviser '
          'l\'espace en chambres, avec le moins de cloison possible. Le douze '
          'y apparaît — mais il n\'est pas le seul nombre principal.\n\n'
          'La plus belle forme de douze est le dodécaèdre pentagonal : douze '
          'faces pentagonales, presque rondes comme une boule. Il apparaît '
          'comme bulle de mousse isolée et comme cage dans le gaz gelé. Mais '
          'la vedette cachée est un autre corps — un corps à quatorze faces.',
    ),
    ProseSection(
      'Les règles de la pellicule de savon',
      'Une pellicule de savon veut être petite, car chaque paroi coûte de '
          'l\'énergie. Le physicien belge aveugle Joseph Plateau trouva au '
          'XIXᵉ siècle les règles : trois pellicules se rencontrent toujours '
          'sous exactement 120 degrés, quatre arêtes en un point sous environ '
          '109 degrés. Tout autre agencement se défait aussitôt.\n\n'
          'Il en découle pourquoi les pentagones sont si fréquents : leur '
          'angle de 108 degrés est proche des 120 requis. Mais douze '
          'pentagones purs ne remplissent pas l\'espace — le dodécaèdre '
          'pentagonal laisse des lacunes. Pour diviser l\'espace sans lacune, '
          'chaque cellule a besoin en moyenne de plus de douze voisins. Ainsi '
          'naît le quatorze.',
    ),
    ProseSection(
      'Kelvin, Weaire-Phelan et le Water Cube',
      'Lord Kelvin demanda en 1887 : comment divise-t-on l\'espace en '
          'cellules de taille égale avec la plus petite paroi totale ? Sa '
          'réponse fut un corps à quatorze faces. Pendant plus de cent ans, '
          'cela passa pour la meilleure solution.\n\n'
          'En 1994, Denis Weaire et Robert Phelan trouvèrent par ordinateur '
          'une structure meilleure de 0,3 pour cent — faite de deux types de '
          'cellules, en moyenne 13,5 faces. Elle devint visible sur la façade '
          'en forme de bulles du « Water Cube » de Pékin en 2008. Elle non '
          'plus n\'est pas prouvée optimale ; le problème reste ouvert à ce '
          'jour.',
    ),
    ProseSection(
      'Où le douze siège vraiment',
      'Il existe un lieu où la forme de douze est réelle et partout : dans les '
          'hydrates de gaz. Au fond de la mer, des molécules d\'eau enferment '
          'des molécules de gaz dans des cages — et la petite cage est '
          'exactement un dodécaèdre pentagonal de douze pentagones, bâti à '
          'partir de vingt molécules d\'eau.\n\n'
          'Mais même ici, le dodécaèdre ne peut remplir l\'espace seul. Il lui '
          'faut toujours une cage partenaire plus grande à côté. Cette '
          'structure de glace est, dans sa construction, la même que la mousse '
          'de Weaire-Phelan.',
    ),
    ProseSection(
      'Le quatorze caché',
      'On entend souvent que les cellules de mousse seraient des dodécaèdres à '
          'douze faces. En réalité, les vraies mousses ont en moyenne environ '
          'quatorze faces ; des bornes mathématiques excluent même le douze. '
          'Le dodécaèdre pentagonal parfait est rare — fréquentes ne sont que '
          'les faces pentagonales prises isolément.\n\n'
          'Dans le plan, par exemple dans l\'alvéole d\'abeille ou dans une '
          'couche de cellules cutanées, le nombre directeur est le six, non le '
          'douze.',
    ),
  ], sources: [
    Source('The structure of foam cells: Isotropic Plateau polyhedra — Cond. Matter Journal Club', 'https://www.condmatjclub.org/wp-content/uploads/2007/06/jccm_may05_02.pdf', 'R1', 'A1'),
    Source('Cell topology during coarsening of 3D dry foams — RSC (2024)', 'https://pubs.rsc.org/en/content/articlehtml/2024/sm/d4sm00555d', 'R1', 'A1'),
    Source('Topological Progression in Proliferating Epithelia — NIH (PMC)', 'https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3818423/', 'R1', 'A1'),
    Source('Clathrate hydrates — London South Bank University (Water Site)', 'https://water.lsbu.ac.uk/water/clathrate_hydrates.html', 'R1', 'A1'),
    Source('Gas Hydrate Structure — Janda Lab, UC Irvine', 'https://ps.uci.edu/group/kcjanda/research/gas-hydrate-structure', 'R1', 'A1'),
    Source('The Strong Dodecahedral Conjecture (Hales et al.) — arXiv', 'https://arxiv.org/pdf/1110.0402', 'R1', 'A1'),
  ]),
  ProseChapter('L\'empilement de sphères : douze voisins', [
    ProseSection(
      'Douze qui se touchent',
      'Une question simple : combien de sphères de taille égale peuvent '
          'toucher en même temps une sphère centrale ? Dans l\'espace, la '
          'réponse est exactement douze. Ce nombre s\'appelle le nombre de '
          'baisers.\n\n'
          'On le voit à l\'étal de fruits et à la pile de boulets de canon : '
          'chaque sphère, dans l\'arrangement le plus dense, a six voisines '
          'dans sa propre couche, trois dans les creux au-dessus et trois en '
          'dessous — ensemble douze. Un douze exact : pas de « presque », pas '
          'de « en moyenne », mais exactement douze.',
    ),
    ProseSection(
      'Newton contre Gregory',
      'Ce n\'est pas si évident que cela. En 1694, Isaac Newton et '
          'l\'astronome David Gregory se disputèrent : Newton disait douze, '
          'Gregory tenait même treize pour possible. La raison du doute : si '
          'l\'on dispose lâchement les douze sphères extérieures, il reste '
          'entre elles encore du jeu — bien dix pour cent d\'un rayon. Deux '
          'd\'entre elles peuvent même échanger leurs places sans perdre le '
          'contact. On dirait qu\'une treizième devrait pouvoir y entrer.\n\n'
          'Elle n\'y entre pas. Newton avait raison — mais une preuve '
          'rigoureuse ne fut établie qu\'en 1953, près de 260 ans plus tard.',
    ),
    ProseSection(
      'La conjecture de Kepler et les grenades',
      'Derrière cela se tient une question plus grande : comment empile-t-on '
          'les sphères le plus densément ? Dès 1590 environ, Walter Raleigh fit '
          'calculer par son conseiller Thomas Harriot l\'empilement des '
          'boulets de canon. En 1611, Johannes Kepler énonça la conjecture : '
          'l\'empilement le plus dense remplit environ 74 pour cent de '
          'l\'espace, avec douze voisins par sphère. Son image pour cela '
          'étaient des grains de grenade serrés les uns contre les autres.\n\n'
          'Aussi simple que sonne l\'énoncé — sa preuve ne fut établie qu\'en '
          '1998 (Thomas Hales), et c\'est seulement en 2014 qu\'un ordinateur '
          'la vérifia sans lacune. Kepler avait eu raison pendant plus de '
          'quatre cents ans.',
    ),
    ProseSection(
      'Le même douze, trois fois',
      'C\'est toujours le même douze, vu de trois côtés. Douze sphères '
          'touchent la centrale. Chaque atome dans de nombreux métaux — '
          'cuivre, or, argent, aluminium — a douze plus proches voisins. Et si '
          'l\'on divise l\'espace selon « qui est le plus proche ? », chaque '
          'sphère reçoit une cellule à douze faces.\n\n'
          'Cette cellule est le dodécaèdre rhombique — exactement la forme à '
          'douze losanges du grenat du chapitre précédent. Les grains de '
          'grenade sont effectivement pressés dans cette forme en gonflant. '
          'Minéral, fruit et réseau atomique montrent la même géométrie.',
    ),
    ProseSection(
      'Ce que le douze présuppose',
      'Le douze ne vaut que pour des sphères de taille égale. Si l\'on verse '
          'simplement des sphères au hasard, elles se touchent en moyenne '
          'seulement six environ — le douze le plus dense exige l\'empilement '
          'ordonné. Et les douze sphères extérieures ne sont pas rigides : '
          'elles ont un peu de jeu.',
    ),
  ], sources: [
    Source('A formal proof of the Kepler conjecture (Hales et al.) — arXiv', 'https://arxiv.org/abs/1501.02155', 'R1', 'A1'),
    Source('The kissing problem in three dimensions (Musin–Tarasov) — arXiv', 'https://arxiv.org/abs/math/0410324', 'R1', 'A2'),
    Source('A formal proof of the Kepler conjecture — Forum of Mathematics, Pi (2017)', 'https://www.cambridge.org/core/journals/forum-of-mathematics-pi/article/formal-proof-of-the-kepler-conjecture/78FBD5E1A3D1BCCB8E0D5B0C463C9FBC', 'R1', 'A2'),
    Source('The Dodecahedron as a Voronoi Cell — arXiv', 'https://arxiv.org/pdf/1904.06108', 'R1', 'A2'),
    Source('The Honeycomb Conjecture (Hales) — arXiv', 'https://arxiv.org/abs/math/9906042', 'R1', 'A2'),
    Source('Kissing Numbers, Sphere Packings, and Some Unexpected Proofs — Notices of the AMS', 'https://www.ams.org/notices/200408/fea-pfender.pdf', 'R1', 'A3'),
  ]),
  ProseChapter('Le douze dans la musique', [
    ProseSection(
      'Pourquoi l\'octave a douze pas',
      'Deux sons dans le rapport de fréquence 2 pour 1 sonnent comme le même '
          'son, seulement plus haut — c\'est l\'octave. L\'intervalle le plus '
          'pur ensuite est la quinte, dans le rapport 3 pour 2. Mais si l\'on '
          'empile une suite de quintes pures, on ne retombe jamais exactement '
          'sur le son de départ.\n\n'
          'Les mathématiques disent à quel point on s\'en approche : ce n\'est '
          'qu\'après douze quintes que l\'on atteint presque exactement sept '
          'octaves. C\'est pourquoi on divise l\'octave en douze demi-tons '
          'égaux — la quinte en enjambe alors sept. Douze est la plus petite '
          'division qui atteint déjà très bien l\'importante quinte tout en '
          'restant maniable. Ce n\'est donc pas un hasard, mais rien de '
          '« donné par la nature » non plus : d\'autres divisions seraient '
          'possibles.',
    ),
    ProseSection(
      'Le comma pythagoricien',
      'Le calcul ne tombe pas tout à fait juste. Douze quintes pures sont un '
          'petit peu plus grandes que sept octaves — l\'écart s\'appelle le '
          'comma pythagoricien, environ un quart de demi-ton, nettement '
          'audible.\n\n'
          'En accord pur, le cercle des quintes n\'est donc pas du tout un '
          'cercle, mais une spirale qui dépasse de peu. Déjà il y a plus de '
          'deux mille ans, ce comma était connu — chez les Grecs comme dans '
          'la Chine ancienne.',
    ),
    ProseSection(
      'Le tempérament égal',
      'La solution actuelle répartit cet écart uniformément : chacun des '
          'douze demi-tons est exactement de taille égale. Le facteur de pas '
          'est la racine douzième de 2 (environ 1,0595) — appliquée douze fois, '
          'elle donne exactement l\'octave. Ainsi chaque intervalle sauf '
          'l\'octave est un tout petit peu impur, mais égal dans toutes les '
          'tonalités ; on peut passer librement d\'une tonalité à l\'autre.\n\n'
          'Une erreur répandue : « Le Clavier bien tempéré » de Bach ne '
          'désignait pas ce tempérament égal, mais « bien jouable dans toutes '
          'les tonalités » — chaque tonalité gardait encore son propre '
          'caractère. Le premier calcul correct de l\'égalité des pas vient de '
          'Zhu Zaiyu (Chine, 1584) ; en Europe, on y parvint indépendamment.',
    ),
    ProseSection(
      'Schönberg et la musique dodécaphonique',
      'Au début du XXᵉ siècle, Arnold Schönberg fit des douze sons un '
          'programme. Dans sa technique dodécaphonique, les douze demi-tons '
          'sont tous égaux en droits : une composition les ordonne en une '
          'série dans laquelle aucun son n\'est privilégié, et dissout ainsi '
          'consciemment le centre familier majeur-mineur. Elle ne devint '
          'jamais une musique de masse, mais marqua la composition du XXᵉ '
          'siècle jusque dans la musique de film.',
    ),
    ProseSection(
      'D\'autres cultures divisent autrement',
      'Le douze est la solution occidentale, pas la seule. L\'Inde connaît en '
          'théorie 22 fins degrés (shruti), parmi lesquels on choisit en '
          'pratique douze sons. La musique arabe décrit souvent son système '
          'avec 24 quarts de ton, la turque même avec 53 fins commas. Le '
          'gamelan javanais divise l\'octave en cinq ou sept degrés inégaux — '
          'et accorde chaque ensemble de façon propre, souvent sans octave '
          'pure. La Thaïlande utilise sept pas égaux.\n\n'
          'Cette diversité est la meilleure preuve : le douze est un très bon '
          'compromis, pas une loi de la nature. Le fait qu\'il y ait en même '
          'temps douze signes du zodiaque et douze mois a soutenu '
          'culturellement le nombre — mais ce n\'est pas la musique qui l\'a '
          'causé ; c\'était l\'acoustique de la quinte.',
    ),
  ], sources: [
    Source('Why 12 notes to the Octave? — Univ. Waterloo (M. Rubinstein)', 'https://www.math.uwaterloo.ca/~mrubinst/tuning/12.html', 'R2', 'A1'),
    Source('12 equal temperament — Wikipedia', 'https://en.wikipedia.org/wiki/12_equal_temperament', 'R2', 'A1'),
    Source('Pythagorean comma — Wikipedia', 'https://en.wikipedia.org/wiki/Pythagorean_comma', 'R2', 'A1'),
    Source('Circle of fifths — Wikipedia', 'https://en.wikipedia.org/wiki/Circle_of_fifths', 'R2', 'A1'),
    Source('Twelve-tone technique — Wikipedia', 'https://en.wikipedia.org/wiki/Twelve-tone_technique', 'R2', 'A1'),
    Source('Śruti — Encyclopædia Britannica', 'https://www.britannica.com/art/sruti', 'R2', 'A1'),
  ]),
  ProseChapter('Le douze dans la langue', [
    ProseSection(
      'Onze et douze — les deux exceptions',
      'En allemand, les noms de nombres à partir de treize suivent un schéma '
          'clair : « drei-zehn » (trois-dix), « vier-zehn » (quatre-dix). Seuls '
          '« elf » (onze) et « zwölf » (douze) sortent du rang — ce ne sont '
          'pas des « einzehn » ou « zweizehn ».\n\n'
          'La raison tient à leur âge. « Elf » remonte au germanique commun '
          '« ainalif », « zwölf » à « twalif ». Le second membre « -lif- » '
          'signifie « restant ». Onze veut donc dire littéralement « un de '
          'reste » et douze « deux de reste » — au sens : voilà ce qui reste '
          'après les dix doigts. Seul le lituanien a par ailleurs la même '
          'construction, là même de onze à dix-neuf de façon continue.',
    ),
    ProseSection(
      'Douzaine, grosse et grande grosse',
      'Les mots commerciaux familiers pour douze viennent du latin : '
          '« duodecim » (douze) devint, via le français « douzaine », la '
          '« Dutzend » allemande — et cela désigne exactement douze, pas à peu '
          'près douze.\n\n'
          'Au-dessus se tiennent la grosse (douze douzaines = 144) et la '
          'grande grosse (douze grosses = 1728), toutes deux du commerce de '
          'gros (« en gros »). Dans le monde de douze, la grande grosse est '
          'exactement ce qu\'est le mille dans le système décimal — le '
          'troisième échelon de la base.',
    ),
    ProseSection(
      'Qui compte vraiment par douzaines',
      'Malgré « elf » et « zwölf », l\'allemand compte au fond de façon '
          'décimale. Les langues qui comptent vraiment de façon continue par '
          'douzaines sont rares — sont attestées quelques langues du centre du '
          'Nigeria et le chepang au Népal. Du vieux norrois, on connaît en '
          'outre la « grande centaine » de 120.\n\n'
          'Plus fréquentes sont les traces du soixante et du vingt. Le soixante '
          'des Sumériens survit dans les minutes, les heures et les degrés ; le '
          '« Schock » allemand vaut cinq douzaines (60). Et des restes du '
          'français comptent par vingtaines (« quatre-vingts », quatre fois '
          'vingt = 80), ainsi que le danois et le gallois — de même que, '
          'pleinement développé, le système maya.',
    ),
    ProseSection(
      'La main comme racine possible',
      'D\'où viennent le douze et le soixante, on l\'explique souvent par une '
          'technique de comptage de la main : le pouce égrène les trois '
          'phalanges des quatre autres doigts — cela fait douze par main. Si '
          'l\'autre main compte les douzaines pleines, on arrive à soixante. '
          'Cette technique est attestée jusqu\'à aujourd\'hui dans des parties '
          'de l\'Asie et du Proche-Orient.\n\n'
          'Cette origine n\'est cependant pas prouvée avec certitude. Que '
          '« elf » et « zwölf » soient des restes d\'un ancien système de douze '
          'est aussi une erreur — ce ne sont que deux mots restés anciens dans '
          'une langue décimale.',
    ),
  ], sources: [
    Source('Eleven — Etymonline', 'https://www.etymonline.com/word/eleven', 'R2', 'A1'),
    Source('Twelve — Etymonline', 'https://www.etymonline.com/word/twelve', 'R2', 'A1'),
    Source('Dutzend — DWDS', 'https://www.dwds.de/wb/Dutzend', 'R2', 'A1'),
    Source('Dozen — Wikipedia', 'https://en.wikipedia.org/wiki/Dozen', 'R2', 'A1'),
    Source('Duodecimal — Wikipedia', 'https://en.wikipedia.org/wiki/Duodecimal', 'R2', 'A1'),
    Source('Sexagesimal — Wikipedia', 'https://en.wikipedia.org/wiki/Sexagesimal', 'R2', 'A1'),
  ]),
  ProseChapter('Le douze dans l\'architecture', [
    ProseSection(
      'Le douze comme idée de construction',
      'Le douze apparaît dans l\'architecture sous trois figures : comme forme '
          'de plan (le dodécagone régulier pour les tours et les chapelles), '
          'comme ordre figuré (douze apôtres, portes, mois, signes du zodiaque '
          'sur les portails et les fenêtres) et comme idée cosmique (le '
          'dodécaèdre comme « forme du Tout »). Déjà le théoricien de la '
          'Renaissance Alberti citait le dodécagone parmi les formes idéales '
          'de temple.\n\n'
          'Ici, de la rigueur s\'impose : le plan central médiéval le plus '
          'fréquent n\'est pas le dodécagone, mais l\'octogone (les '
          'baptistères, comme signe du « huitième jour »). Qui cherche le '
          'douze doit compter avec précision — beaucoup d\'édifices ronds sont '
          'en vérité à huit ou six côtés.',
    ),
    ProseSection(
      'La Jérusalem céleste',
      'La racine de presque toutes les références chrétiennes au douze est '
          'l\'Apocalypse de Jean : la cité céleste a douze portes (trois vers '
          'chaque point cardinal) portant les noms des douze tribus et repose '
          'sur douze fondations portant les noms des douze apôtres. Les '
          'bâtisseurs médiévaux comprenaient les églises comme l\'image '
          'terrestre de cette cité.\n\n'
          'De vrais édifices à douze côtés existent : l\'église romane de la '
          'Vera Cruz à Ségovie (consacrée en 1208), la rotonde Saint-Maurice '
          'de Constance avec douze figures d\'apôtres aux angles, ou la '
          'couronne de colonnes du Saint-Sépulcre à Jérusalem. (La Vera Cruz '
          'est souvent attribuée aux Templiers — des recherches plus récentes '
          'nomment l\'ordre du Saint-Sépulcre.)',
    ),
    ProseSection(
      'Rosaces, zodiaque et horloges',
      'Sur les cathédrales, le douze apparaît surtout dans le programme '
          'figuré. On dit volontiers que les rosaces gothiques sont à douze '
          'parties — mais souvent elles sont à huit, seize ou vingt-quatre '
          'parties ; la rose des apôtres de Notre-Dame de Paris range le douze '
          'dans ses anneaux.\n\n'
          'Fiablement douze sont les cycles du calendrier : à Chartres et '
          'Amiens, les douze signes du zodiaque côtoient les douze « travaux '
          'des mois » — le cours du ciel à côté de l\'année paysanne. Le même '
          'douze porte le cadran des grandes horloges astronomiques.',
    ),
    ProseSection(
      'Du dodécaèdre à la coupole',
      'La ligne cosmique vient de Platon : le dodécaèdre avec ses douze faces '
          'pentagonales représentait le ciel tout entier, ses faces les douze '
          'signes du zodiaque. Cette idée agit jusque dans la modernité — et '
          'tout sobrement dans la coupole géodésique, qui a impérativement '
          'besoin de douze nœuds pentagonaux pour se refermer.\n\n'
          'L\'honnêteté l\'exige : les énigmatiques dodécaèdres romains en '
          'bronze ont certes douze faces, mais leur fonction est inconnue à ce '
          'jour, et une symbolique des nombres n\'est pas établie. Et certaine '
          '« géométrie sacrée » de l\'architecture est interprétée plus '
          'fortement que ce que les sources autorisent.',
    ),
  ], sources: [
    Source('Iglesia de la Vera Cruz, Segovia — Wikipedia', 'https://en.wikipedia.org/wiki/Iglesia_de_la_Vera_Cruz,_Segovia', 'R2', 'A1'),
    Source('Mauritiusrotunde (Konstanz) — Wikipedia', 'https://de.wikipedia.org/wiki/Mauritiusrotunde', 'R2', 'A1'),
    Source('Dodecagon — Wikipedia', 'https://en.wikipedia.org/wiki/Dodecagon', 'R2', 'A1'),
    Source('Kölner Dom — Wikipedia', 'https://de.wikipedia.org/wiki/K%C3%B6lner_Dom', 'R2', 'A1'),
    Source('Raumbilder der Himmelsstadt (Dissertation, Univ. Heidelberg)', 'https://archiv.ub.uni-heidelberg.de/volltextserver/28704/3/Raumbilder_Text_Konrad-Schineller.pdf', 'R1', 'A1'),
    Source('Islamic Star Patterns (C. S. Kaplan, PhD)', 'https://cs.uwaterloo.ca/~csk/other/phd/kaplan_diss_starpatterns_print.pdf', 'R1', 'A1'),
  ]),
  ProseChapter('Le douze dans l\'art', [
    ProseSection(
      'Le dodécaèdre comme symbole du ciel',
      'Dans l\'art, le douze est avant tout l\'histoire d\'un corps : le '
          'dodécaèdre avec ses douze faces pentagonales. Depuis Platon, il '
          'passait pour le symbole du ciel, pour le « cinquième être » à côté '
          'des quatre éléments.\n\n'
          'Cette interprétation tire une ligne ininterrompue de la Renaissance '
          'jusqu\'à la modernité — via Pacioli et Léonard, Kepler, Escher '
          'jusqu\'à Dalí. Là où le dodécaèdre apparaît, c\'est presque '
          'toujours « le cosmos » qui est visé.',
    ),
    ProseSection(
      'Léonard, Dürer et Escher',
      'Pour le livre de Luca Pacioli sur la « divine proportion » (imprimé en '
          '1509), Léonard de Vinci dessina les cinq solides platoniciens — '
          'dont le dodécaèdre — pour la première fois aussi bien pleins que '
          'comme modèle d\'arêtes transparent. Ce sont les premières images de '
          'polyèdres spatialement convaincantes, précurseurs des modèles '
          'filaires d\'aujourd\'hui.\n\n'
          'Une erreur tenace mérite d\'être corrigée : le célèbre corps de '
          'pierre dans la « Melencolia I » de Dürer n\'est pas un dodécaèdre, '
          'mais un corps propre à huit faces seulement. De vrais dodécaèdres '
          'se trouvent en revanche chez M. C. Escher — par exemple dans '
          '« Gravitation », où de douze pointes d\'un dodécaèdre étoilé '
          'rampent douze tortues.',
    ),
    ProseSection(
      'Dalí et le douze',
      'L\'œuvre du douze la plus explicite de la modernité est « Le Sacrement '
          'de la Cène » de Salvador Dalí (1955). La scène se déroule dans un '
          'dodécaèdre à demi transparent, dont les fenêtres pentagonales '
          'planent au-dessus du Christ.\n\n'
          'Dalí nomma lui-même la raison : la « communion céleste du nombre '
          'douze » — douze heures du jour, douze mois, les douze pentagones du '
          'dodécaèdre, douze signes du zodiaque, douze apôtres. En une seule '
          'image, il rassemble tous les fils de ce thème et se réclame ce '
          'faisant expressément de Platon.',
    ),
    ProseSection(
      'Images de calendrier et ornements',
      'Le plus fréquemment, le douze dans l\'art est tout simplement le '
          'calendrier. Le livre d\'heures « Très Riches Heures » (vers 1415) '
          'montre douze images des mois avec les travaux de l\'année, '
          'surmontées chacune d\'un morceau de ciel avec les signes du '
          'zodiaque — le bord extérieur divise proprement les 360 degrés en '
          'douze champs de trente degrés. De tels « travaux des mois » forment '
          'un genre figuré propre, des mosaïques romaines jusqu\'aux '
          'cathédrales.\n\n'
          'L\'art islamique forme un fil propre : ses ornements girih '
          'connaissent les étoiles à douze branches, de Konya à Ispahan — pure '
          'géométrie au lieu de figures. Et tout à fait sans signification '
          'transmise se tiennent à côté les dodécaèdres romains en bronze à '
          'douze faces, dont la fonction reste une énigme.',
    ),
  ], sources: [
    Source('Mathematical Treasures: De Divina Proportione — MAA', 'https://old.maa.org/press/periodicals/convergence/mathematical-treasures-de-divina-proportione-by-luca-pacioli', 'R1', 'A1'),
    Source('Divina proportione — Wikipedia', 'https://en.wikipedia.org/wiki/Divina_proportione', 'R2', 'A1'),
    Source('Melencolia I — Wikipedia', 'https://en.wikipedia.org/wiki/Melencolia_I', 'R2', 'A1'),
    Source('Dürer\'s solid (Truncated triangular trapezohedron) — Wikipedia', 'https://en.wikipedia.org/wiki/Truncated_triangular_trapezohedron', 'R2', 'A1'),
    Source('Stars (M. C. Escher) — Wikipedia', 'https://en.wikipedia.org/wiki/Stars_(M._C._Escher)', 'R2', 'A1'),
    Source('Decagonal and Quasicrystalline Tilings in Medieval Islamic Architecture — Lu & Steinhardt, Science (2007)', 'https://www.physics.rutgers.edu/~pchandra/physics601/Lu_Steinhardt.pdf', 'R1', 'A1'),
  ]),
  ProseChapter('Le douze dans le calendrier', [
    ProseSection(
      'Pourquoi douze mois',
      'Les douze mois viennent de la lune. Dans une année solaire entrent à '
          'peu près douze cycles lunaires — mais seulement à peu près. Un cycle '
          'lunaire dure environ 29,5 jours ; calculé exactement, cela fait '
          'environ 12,37 mois lunaires par an.\n\n'
          'Douze mois lunaires ne donnent donc qu\'environ 354 jours — environ '
          'onze jours de moins que l\'année solaire. Ce petit écart est la '
          'cause de presque toutes les astuces de calendrier du monde. Correct '
          'est donc « environ douze », pas « exactement douze ».',
    ),
    ProseSection(
      'Le mois intercalaire et le cycle de dix-neuf ans',
      'Qui veut aligner les mois sur la lune et garder malgré tout l\'année '
          'dans les saisons doit de temps en temps intercaler un treizième '
          'mois — en moyenne tous les deux à trois ans.\n\n'
          'La règle élégante pour cela est très ancienne : dix-neuf années '
          'solaires font presque exactement 235 mois lunaires (douze années '
          'ordinaires de douze mois plus sept années de treize). Les '
          'Babyloniens utilisaient déjà ce cycle vers 500 av. J.-C. ; à '
          'Athènes, Méton l\'introduisit en 432 av. J.-C. — appris sans doute '
          'des Babyloniens.',
    ),
    ProseSection(
      'Des calendriers du monde entier',
      'De la même constante — environ 12,37 cycles lunaires — naquirent trois '
          'stratégies qui vivent côte à côte jusqu\'à aujourd\'hui.\n\n'
          'Les calendriers juif, chinois et hindou sont luni-solaires : douze '
          'mois, treize dans l\'année embolismique. Le calendrier islamique '
          'est un pur calendrier lunaire sans mois intercalaire — c\'est '
          'pourquoi le ramadan se déplace lentement à travers toutes les '
          'saisons. Le cycle chinois attribue aux années douze animaux (les '
          'branches terrestres), vaguement liés à la révolution d\'environ '
          'douze ans de Jupiter. Et notre calendrier grégorien est un pur '
          'calendrier solaire : ses douze noms de mois ne sont plus que des '
          'restes de noms de l\'ancien cours lunaire, depuis que César détacha '
          'l\'année du lien lunaire en 46 av. J.-C.',
    ),
    ProseSection(
      'Douze, mais pas obligatoire',
      'Aussi naturel que paraisse le douze — obligatoire, il ne l\'est pas. '
          'Les années luni-solaires ont de toute façon treize mois dans '
          'l\'année embolismique. Et il y eut et il y a de vrais calendriers à '
          'treize mois : le calendrier celtique de Coligny, le calendrier igbo '
          'traditionnel au Nigeria avec treize mois de 28 jours chacun, et des '
          'propositions de réforme modernes à 13 × 28 jours — qui tombent même '
          'plus juste arithmétiquement.\n\n'
          'Le douze est donc avant tout un choix culturel, soutenu par sa bonne '
          'divisibilité et par son rôle de nombre de la complétude (douze '
          'tribus, douze apôtres, douze dieux). Certaine dérivation populaire '
          'reste incertaine : que les douze nuits compensent l\'écart '
          'lune-soleil n\'est attesté que depuis le XVIᵉ siècle, et l\'origine '
          'jupitérienne du cycle chinois est supposée, non prouvée.',
    ),
  ], sources: [
    Source('Lunisolar calendar — Wikipedia', 'https://en.wikipedia.org/wiki/Lunisolar_calendar', 'R2', 'A1'),
    Source('Metonic cycle — Wikipedia', 'https://en.wikipedia.org/wiki/Metonic_cycle', 'R2', 'A1'),
    Source('Lunarkalender — Wikipedia (de)', 'https://de.wikipedia.org/wiki/Lunarkalender', 'R2', 'A1'),
    Source('Der chinesische Sechziger-Zyklus — Universität Wien', 'https://www.univie.ac.at/rel_jap/kami/Sechziger_Zyklus', 'R1', 'A1'),
    Source('Der traditionelle Kalender (Japan/China) — Universität Wien', 'https://religion-in-japan.univie.ac.at/Handbuch/Grundbegriffe/Yin_und_Yang/Kalender', 'R1', 'A1'),
    Source('Lunisolarkalender — Wikipedia (de)', 'https://de.wikipedia.org/wiki/Lunisolarkalender', 'R2', 'A1'),
  ]),
];
