// French unit-theory prose. part of ../unit_theory.dart.
// Bodies are kept in simple, short sentences (easier to translate). Distilled
// from the research dossiers in docs/research/. `count` has no entry on purpose
// — the dozen/twelve story lives in the app's 12 teaching chapters.

part of '../unit_theory.dart';

List<UnitTheorySection> _converterIntroFr() {
  return const [
    UnitTheorySection(
      'Ce que la calculatrice sait faire',
      'Le convertisseur d’unités convertit entre le monde impérial-dozenal '
          '(base douze) et le monde métrique (base dix) — dans toutes les '
          'catégories : longueur, surface, volume, poids, temps, angle, '
          'monnaie, température et davantage, comme pression, force, énergie, '
          'puissance, cuisine et couple.\n\n'
          'La { }-parenthèse indique toujours la valeur dans l’autre système. '
          'Plusieurs unités peuvent être combinées en une seule valeur — par '
          'exemple 1 ft 6 in ou 2 h 30 min. Appuyer sur = fait défiler les '
          'représentations d’unités et la décomposition étagée ; un appui long '
          'sur une unité affiche une courte définition. Les chiffres apparaissent '
          'sous forme de glyphes dozenaux ou en 0–9/A/B ordinaires, selon le '
          'réglage d’affichage.',
    ),
    UnitTheorySection(
      'Ce qu’elle ne sait pas faire',
      'C’est un convertisseur, pas une calculatrice scientifique : pas de '
          'fonctions comme le sinus ou le logarithme, pas de calcul libre avec '
          '× et ÷, pas de mémoire et pas de mode d’angle. C’est à cela que '
          'sert la calculatrice principale.\n\n'
          'La monnaie (pence/shilling/livre) reflète le rapport historique '
          'britannique — douze pence pour le shilling, vingt shillings pour la '
          'livre —, et non les taux de change actuels. Elle illustre la structure '
          'dozenale de l’ancienne monnaie, pas les valeurs d’aujourd’hui. '
          'L’ensemble des unités est fixe.',
    ),
    UnitTheorySection(
      'Comment l’utiliser',
      'Appuie sur une catégorie (par exemple longueur) — son échelle d’unités '
          's’ouvre dans la colonne opposée. Appuie sur une unité, saisis des '
          'chiffres et combine plusieurs unités en une seule valeur. La touche '
          'DOZ/DEZ bascule entre le monde impérial et le monde métrique ; la '
          '{ }-parenthèse montre l’équivalent. = fait défiler les '
          'représentations, un appui long sur une unité affiche sa signification, '
          'et un appui sur la ligne de saisie déplace le curseur.\n\n'
          'Un exemple — saisir 1 ft 6 in et lire le résultat dans l’autre monde :',
    ),
  ];
}

List<UnitTheorySection> _unitTheoryFr(UnitCategory cat) {
  switch (cat) {
    case UnitCategory.count:
      return const [
        UnitTheorySection(
          'Empiler par douzaines',
          'On peut regrouper des quantités par dizaines — ou par douzaines. Une '
              'douzaine représente douze pièces, une grosse douze douzaines (144), '
              'une grande grosse douze grosses (1728). C\'est le même escalier que '
              'les unités, dizaines, centaines et milliers, mais en base douze : '
              'douzaine = 12¹, grosse = 12², grande grosse = 12³. Écrits en base '
              'douze, ces nombres donnent tout ronds 10, 100 et 1000 — la grande '
              'grosse est donc le « millier dozenal ».\n\n'
              'La raison pour laquelle douze se divise si commodément, et comment '
              'on compte jusqu\'à douze sur les trois phalanges des quatre doigts, '
              'est expliquée dans Théorie → Notions de base. Ici, on s\'intéresse '
              'aux unités de comptage elles-mêmes.',
        ),
        UnitTheorySection(
          'D\'où viennent les noms',
          '« Douzaine » vient de l\'ancien français douzaine, lui-même du latin '
              'duodecim, « deux-et-dix » ; le mot signifie exactement douze, pas '
              'approximativement. L\'espagnol docena, l\'italien dozzina et '
              'l\'anglais dozen lui sont apparentés.\n\n'
              '« Grosse » vient de la grosse douzaine, la « grande douzaine », et '
              'est attestée dès le début du 15e siècle. Dans le commerce de gros, '
              'les petits articles — crayons, boutons, aiguilles — se comptaient '
              'et se conditionnaient à la grosse ; certaines boîtes de crayons '
              'portent encore aujourd\'hui l\'inscription « 1 grosse ». La grande '
              'grosse (1728) est la douzaine de grosses — et c\'est aussi, par '
              'coïncidence, le nombre de pouces cubes dans un pied cube '
              '(12 × 12 × 12). Les œufs se vendent encore à la douzaine.',
        ),
        UnitTheorySection(
          'La douzaine du boulanger',
          'Une douzaine du boulanger, c\'est treize — une de plus qu\'une douzaine '
              'ordinaire ; le treizième pain s\'appelle le « vantage loaf ». '
              'L\'explication courante renvoie à l\'ancienne loi anglaise sur le '
              'pain (Assize of Bread, 13e siècle) : vendre du pain en sous-poids '
              'exposait à des sanctions, aussi le boulanger ajoutait-il un pain '
              'par précaution.\n\n'
              'Une réserve honnête s\'impose : cette explication est plausible et '
              'très répandue, mais n\'est pas attestée par des documents. Les plus '
              'anciennes mentions écrites de l\'expression anglaise « baker’s '
              'dozen » ne datent que de la fin du 16e siècle — bien après la loi.',
        ),
      ];
    case UnitCategory.dist:
      return const [
        UnitTheorySection(
          'Des mesures issues du corps',
          'Les plus anciennes mesures de longueur viennent du corps humain. La '
              'largeur du doigt est devenue le pouce, l\'avant-bras la coudée, le '
              'pied le pied, l\'envergure des bras la brasse. C\'était pratique, '
              'car chacun portait sa mesure sur soi. Mais c\'était imprécis, car '
              'aucun corps ne ressemble à un autre.\n\n'
              'Les premiers étalons fixes sont nés en Mésopotamie et en Égypte. '
              'En Égypte régnait la coudée royale, environ 52 centimètres. '
              'C\'était l\'avant-bras du pharaon, fixé dans la pierre comme '
              'mesure étalon. On vérifiait régulièrement les coudées de travail '
              'en bois à l\'aune de celle-ci — ce fut le début de l\'étalonnage.',
        ),
        UnitTheorySection(
          'De Rome au Moyen Âge',
          'Les Romains ont organisé le système. Leur pied (pes) comptait douze '
              '« unciae ». De uncia vient le mot « pouce » (inch en anglais) — et '
              'aussi « once ». Leur mille s\'appelait « mille passus », mille '
              'doubles pas, environ 1480 mètres. C\'est la racine de tous les '
              'milles ultérieurs.\n\n'
              'Au Moyen Âge, presque chaque ville avait ses propres mesures. Un '
              'pouce était défini comme trois grains d\'orge placés bout à bout. '
              'Pour le pied, il existait des procédés curieux : en 1535, Jacob '
              'Köbel décrivait qu\'il fallait, le dimanche, aligner seize hommes '
              'sortant de l\'église, pied derrière pied — un seizième de cela '
              'valait le « pied juste ». On moyennait ainsi les écarts. En '
              'Allemagne, le pied allait pourtant de 235 à 408 millimètres.',
        ),
        UnitTheorySection(
          'Des mesures dans le monde entier',
          'Le même schéma se retrouve partout. En Chine, on mesurait en chi '
              '(pied) et cun (pouce), en Inde en hasta (coudée) et angula '
              '(doigt), dans le monde islamique en diverses coudées. La coudée, '
              'du coude à la pointe des doigts, se trouve sur presque tous les '
              'continents — le corps est l\'origine commune.\n\n'
              'Dans beaucoup de cultures, le corps passait pour une mesure '
              'sacrée, l\'homme pour l\'image de l\'ordre du monde. Les temples '
              'égyptiens, la construction biblique de l\'arche et les temples '
              'hindous furent mesurés en coudées.\n\n'
              'La langue aussi a conservé les mesures. « Donne-leur un pouce, et '
              'ils prendront un mille » signifiait à l\'origine « … et ils '
              'prendront une coudée ». Un « saut de puce » est une courte '
              'distance. L\'appel de sonde du marin « mark twain » (deux brasses '
              'de fond) est devenu le nom d\'artiste de Mark Twain.',
        ),
        UnitTheorySection(
          'Pourquoi douze — et une réserve honnête',
          'Pourquoi le pied compte-t-il justement douze pouces ? À cause de la '
              'divisibilité. Douze se divise proprement par deux, trois, '
              'quatre et six. Dix, seulement par deux et cinq. Un tiers de pied '
              'fait exactement quatre pouces ; en décimal, ce serait 0,333… '
              'mètre. Pour l\'artisanat et le commerce, bien avant la virgule, '
              'c\'était un véritable avantage. Les Romains déjà ont choisi le '
              'douze pour cette raison précise.\n\n'
              'Une réserve honnête s\'impose : le système impérial n\'est pas un '
              'système duodécimal continu. Seuls le pied et le pouce — et les '
              'douze onces troy pour les métaux précieux — sont vraiment '
              'duodécimaux. Le yard compte trois pieds, le mille 1760 yards : '
              'des nombres bancals. Et les pouces se divisent au quotidien en '
              'moitiés, quarts, huitièmes, donc en base deux. Le douze ne se '
              'niche donc qu\'à quelques endroits, pas dans tout le système.',
        ),
        UnitTheorySection(
          'En usage aujourd\'hui',
          'Aujourd\'hui, ce sont surtout les États-Unis et le Royaume-Uni qui '
              'utilisent ces mesures au quotidien. Mais dans le monde entier, '
              'elles valent dans l\'aviation et la navigation : les avions '
              'mesurent leur altitude en pieds, leur vitesse en nœuds et leur '
              'distance en milles marins. Un mille marin est une minute d\'arc '
              'sur le globe terrestre — il suit la division par soixante, pas le '
              'douze. Les écrans, les pneus et les tuyaux se comptent presque '
              'partout en pouces. En Scandinavie, le « mil » vaut dix '
              'kilomètres. Dans les pays métriques, les anciennes mesures ne '
              'survivent plus que dans les expressions.',
        ),
        UnitTheorySection(
          'Spéculatif (avec prudence)',
          'Certaines explications sont séduisantes, mais incertaines. L\'une '
              'prétend que le douze vient du comptage des phalanges avec le '
              'pouce — plausible, mais non prouvé. D\'autres théories, comme le '
              '« pouce pyramidal » ou le « yard mégalithique », affirment qu\'un '
              'savoir caché supérieur se dissimule dans les anciennes '
              'constructions. Elles passent pour réfutées dans le milieu '
              'spécialisé : on y choisit, parmi de nombreuses mesures, seulement '
              'celles qui collent à la thèse.',
        ),
      ];
    case UnitCategory.area:
      return const [
        UnitTheorySection(
          'La terre comme travail',
          'On mesure les surfaces en combinant une longueur avec une longueur. '
              'Pourtant, les anciennes mesures agraires ne sont pas nées de la '
              'géométrie, mais du travail. Un champ était grand comme ce qu\'on '
              'pouvait cultiver en une journée.\n\n'
              'Le « Morgen » allemand porte ce nom parce qu\'on le labourait en '
              'une matinée. L\'« acre » anglais était la surface qu\'un attelage '
              'de huit bœufs pouvait travailler en un jour. Le « iugerum » '
              'romain vient de « iugum », le joug des bœufs. L\'arabe « feddan » '
              'signifie lui aussi joug de bœufs. Partout la même idée : la terre '
              'est travail.\n\n'
              'Dans l\'Égypte ancienne, il fallait remesurer les champs après '
              'chaque crue du Nil, car l\'eau effaçait les limites. Les '
              'arpenteurs tendaient des cordes à nœuds ; les Grecs les '
              'appelèrent plus tard les « tendeurs de corde ». En Mésopotamie, '
              'la mesure de base était le « sar » — un carré de douze sur douze '
              'coudées.',
        ),
        UnitTheorySection(
          'L\'acre et son nombre bancal',
          'L\'acre a une forme inhabituelle : une bande longue et étroite, d\'un '
              'furlong de long et d\'une chain de large (660 sur 66 pieds). Cela '
              'reflète la pratique du labour : sillon long, bande étroite. On '
              'obtient ainsi 43 560 pieds carrés ou 4840 yards carrés.\n\n'
              'Pourquoi ce nombre bancal de 4840 ? C\'est un accident de '
              'l\'histoire. Quand l\'Angleterre raccourcit le pied au XIIIe '
              'siècle, la perche et le furlong restèrent inchangés dans les '
              'limites des parcelles. De ce fait, l\'acre passa de 4000 anciens '
              'à 4840 nouveaux yards carrés. Le nombre bancal n\'est donc pas '
              'une intention, mais le vestige d\'une réforme des mesures.',
        ),
        UnitTheorySection(
          'Des mesures de surface dans le monde entier',
          'Aujourd\'hui, l\'hectare (10 000 mètres carrés) est la mesure '
              'agraire la plus répandue au monde. Pourtant, les anciennes '
              'mesures survivent avec ténacité. En Thaïlande, le rai figure même '
              'au cadastre officiel. En Inde et au Bangladesh, on compte en '
              'bigha dans le commerce foncier. En Corée, le pyeong reste usuel '
              'au quotidien malgré son interdiction. L\'Égypte a gardé le '
              'feddan, la Chine le mu. En Israël, en Turquie et dans les '
              'Balkans, on mesure en dunam. En Allemagne, le Morgen, le Joch et '
              'le Tagwerk vivent encore dans l\'agriculture et dans la langue.\n\n'
              'Les mesures les plus tenaces sont celles qu\'on a fixées sur des '
              'valeurs métriques rondes — un rai vaut exactement 1600, un dunam '
              'exactement 1000 mètres carrés.',
        ),
        UnitTheorySection(
          'Le douze dans la surface — et une réserve',
          'Avec les petites unités, le douze se montre sous son plus beau jour. '
              'Un pied carré fait 144 pouces carrés, car douze fois douze font '
              '144. Écrit en base douze, cela donne un « 100 » net. Un yard '
              'carré fait neuf pieds carrés.\n\n'
              'Avec les grandes mesures agraires, l\'ordre se rompt. L\'acre, '
              'avec ses 4840 yards carrés, n\'entre dans aucune base simple. '
              'Cela tient à ce que les mesures agraires sont nées du travail, '
              'pas du calcul.\n\n'
              'Il reste pourtant un point pratique : un tiers d\'hectare fait '
              '3333,33… mètres carrés — un nombre bancal. Un tiers de feddan, en '
              'revanche, fait huit kirat tout ronds. Là où l\'on divise souvent '
              'par trois, une base divisible par trois est avantageuse. C\'est '
              'exactement ce que fait le douze.',
        ),
        UnitTheorySection(
          'Spéculatif (avec prudence)',
          'D\'où vient le penchant pour le douze ? Une hypothèse connue, mais '
              'non prouvée : du comptage des phalanges. Le pouce égrène les '
              'trois phalanges des quatre autres doigts — cela fait douze par '
              'main. Cette technique de comptage est attestée jusqu\'à '
              'aujourd\'hui dans certaines parties de l\'Asie et du Proche-'
              'Orient. Mais elle ne peut être prouvée comme origine certaine.',
        ),
      ];
    case UnitCategory.space:
      return const [
        UnitTheorySection(
          'D\'abord le récipient, puis le cube',
          'On mesure le volume en combinant trois longueurs — un cube. Mais ce '
              'n\'est presque nulle part que cela a commencé ainsi. Au début, il '
              'y avait le récipient : une cruche pleine, un sac de grain, une '
              'louche d\'huile. On mesurait ce qu\'on pouvait manger, porter ou '
              'commercer, pas ce qu\'on pouvait calculer.\n\n'
              'La référence était le plus souvent une quantité de nourriture. Le '
              '« choinix » grec était la ration quotidienne de grain d\'un '
              'travailleur. Le « koku » japonais valait autant de riz qu\'un '
              'homme en mange en une année — environ 180 litres. Le « Scheffel » '
              'allemand correspondait à peu près à un sac portable.\n\n'
              'Seuls les grands empires dotés d\'une administration ont déduit le '
              'volume de la mesure de longueur. Les Romains firent le premier '
              'pas clair : leur « amphore » contenait exactement un pied cube, '
              'environ 26 litres. Le volume devenait ainsi pour la première fois '
              'un véritable cube issu de la mesure du pied — l\'ancêtre direct '
              'du pied cube, du litre et du mètre cube.',
        ),
        UnitTheorySection(
          'Mesure, rang et richesse',
          'Les mesures de capacité étaient souvent plus que des quantités — '
              'elles ordonnaient des sociétés entières. Au Japon, on évaluait la '
              'richesse d\'un fief en koku de rendement de riz. À partir de dix '
              'mille koku, un seigneur passait pour un « daimyō », un prince. '
              'Même la solde des samouraïs et la taille des navires se '
              'comptaient en koku.\n\n'
              'À Rome, la ration du soldat était attribuée en « modii », une '
              'mesure de matières sèches d\'à peine neuf litres. En Mésopotamie, '
              'en Égypte et en Chine, les souverains contrôlaient les mesures au '
              'moyen de récipients étalonnés. Le plus célèbre est le « jialiang » '
              'chinois, datant d\'environ l\'an zéro : un seul moulage de bronze '
              'qui incarne d\'un coup cinq unités de volume. Il se dressait '
              'devant les salles de l\'empereur comme signe d\'unité et de '
              'justice de son règne.',
        ),
        UnitTheorySection(
          'Le volume dans le monde entier',
          'Peu de domaines de mesure furent aussi fragmentés que le volume. Le '
              'Scheffel allemand allait, selon la ville, d\'environ 5 à 250 '
              'litres. L\'Angleterre, les États-Unis et l\'Empire avaient à eux '
              'seuls trois gallons différents. Le gallon US (3,79 litres) est '
              'encore aujourd\'hui environ un cinquième plus petit que le '
              'britannique (4,55 litres).\n\n'
              'Beaucoup de ces mesures survivent. Le commerce mondial des '
              'céréales compte en « bushels » — les rapports de récolte '
              'américains pour le maïs, le soja et le blé ne paraissent qu\'en '
              'cette unité. Le pétrole se négocie en « barils » de 42 gallons '
              'US, une ancienne mesure anglaise de tonneau à vin. Au Royaume-Uni '
              'et en Irlande, on sert légalement la bière en pinte impériale '
              '(568 millilitres). Au Japon, le gobelet du cuiseur à riz mesure '
              'exactement un « gō ». Le bois de chauffage se négocie en stères, '
              'en mètres cubes pleins ou, en Amérique du Nord, en « cord ».\n\n'
              'Aux États-Unis, les mesures cubiques sont ancrées dans le '
              'quotidien : les moteurs s\'indiquent en pouces cubes (une « 350 »), '
              'le béton et la terre dans le bâtiment en yards cubes, le gaz '
              'naturel en pieds cubes.',
        ),
        UnitTheorySection(
          'Le douze dans l\'espace — et une réserve',
          'C\'est dans le cube que le douze se montre le plus fort. Un pied '
              'cube fait 1728 pouces cubes — et 1728, c\'est douze puissance '
              'trois. Écrit en base douze, cela donne un « 1000 » net. Ce nombre '
              'a particulièrement beaucoup de diviseurs, parce qu\'il est bâti '
              'avec des deux et des trois. Un pied cube se laisse donc diviser '
              'proprement par deux, trois, quatre, six et huit.\n\n'
              'Un mètre cube, en revanche, ne se divise proprement que par deux '
              'et cinq. Un tiers de mètre cube fait 0,333… — un nombre sans fin. '
              'Là où l\'on divise souvent par trois, le douze est avantageux.\n\n'
              'La réserve honnête : ce bel ordre ne vaut que pour les mesures '
              'cubiques déduites des longueurs. Les anciennes mesures de '
              'capacité — bushel, gallon, Scheffel — ne suivent aucune base '
              'pure. Elles ont grandi à partir des sacs et des tonneaux, pas du '
              'calcul, et mêlent des pas par deux, par trois et tout à fait '
              'bancals.',
        ),
        UnitTheorySection(
          'Le cube sacré',
          'Le cube a, dans beaucoup de cultures, une signification particulière, '
              'parce que longueur, largeur et hauteur y sont égales — une image '
              'de la perfection. Le saint des saints, dans le temple et dans le '
              'tabernacle, était cubique. La Kaaba à La Mecque, dont le nom '
              'signifie « cube », est un sanctuaire cubique noir. La « nouvelle '
              'Jérusalem » de la Bible est elle aussi décrite comme un cube '
              'gigantesque.\n\n'
              'À travers de nombreuses religions, la juste mesure passe en outre '
              'pour un devoir sacré. La Bible hébraïque exige un « épha juste » ; '
              'le prophète Amos accuse les marchands qui rognent la mesure. Le '
              'Coran consacre toute une sourate à ceux qui mesurent court. Qui '
              'mesure faux pèche — cette idée se retrouve tout autour du globe.\n\n'
              'Le système métrique porte lui aussi cet esprit, mais de façon '
              'séculière : au lieu de tenir sa mesure d\'un souverain, il la '
              'déduit de la Terre elle-même. Le mètre est une fraction de la '
              'circonférence terrestre, le mètre cube son espace — une mesure '
              'issue de la nature plutôt que du pouvoir.',
        ),
        UnitTheorySection(
          'Spéculatif (avec prudence)',
          'D\'audacieuses théories du volume entourent les anciens monuments. '
              'Certains prétendent que la pyramide de Khéops recèle une « pinte '
              'pyramidale » ou une mesure sacrée d\'origine divine. D\'autres '
              'estiment que les cercles de pierres préhistoriques utilisaient un '
              '« yard mégalithique », d\'où découlerait exactement une pinte '
              'comme cube.\n\n'
              'Le milieu spécialisé tient cela pour réfuté. De telles théories '
              'choisissent, parmi de nombreuses mesures, seulement celles qui '
              'conviennent et interprètent des hasards comme des intentions. '
              'Séduisant à lire, mais sans valeur de preuve.',
        ),
      ];
    case UnitCategory.weight:
      return const [
        UnitTheorySection(
          'Du grain à la charge',
          'Les poids avaient partout deux racines. Les plus petites mesures '
              'venaient des graines et des grains, les grandes de ce qu\'un homme '
              'ou un animal pouvait porter.\n\n'
              'Le « grain » anglais est littéralement un grain d\'orge, environ '
              '65 milligrammes. Le « carat » des joailliers vient de la graine '
              'du caroubier. En Inde, on pesait l\'or en « ratti », la graine '
              'd\'une légumineuse rouge. À l\'autre bout se tenait la charge : le '
              '« talent » grec et le « maund » indien valaient à peu près ce '
              'qu\'un homme pouvait porter. La « tonne » vient du plus grand '
              'tonneau à vin, le « tun », qui, rempli, pesait environ une '
              'tonne.\n\n'
              'Un troisième fil relie poids et argent : le shekel, la drachme, '
              'la livre et le tola étaient à la fois des noms de monnaie et de '
              'poids. L\'argent était à l\'origine du métal pesé — on pesait '
              'l\'argent-métal au lieu de compter des pièces.',
        ),
        UnitTheorySection(
          'Livre, once et l\'héritage romain',
          'Nos mots de poids viennent de Rome. La « libra » romaine était une '
              'balance et un poids d\'environ 329 grammes, divisé en douze '
              '« unciae ». De « libra » vient l\'abréviation « lb » pour la '
              'livre et le signe « £ » pour la livre britannique. De « uncia » — '
              'littéralement « le douzième » — viennent à la fois l\'« once » et '
              'le « pouce ».\n\n'
              'De cette racine ont poussé deux systèmes différents. La livre '
              '« avoirdupois » du quotidien se divise en 16 onces — un nombre '
              'qu\'on peut sans cesse partager en deux. La livre « troy » du '
              'commerce des métaux précieux a gardé les douze onces romaines. '
              'Une once troy (l\'once fine) est donc plus lourde qu\'une once du '
              'quotidien, mais la livre troy plus légère — une confusion '
              'appréciée jusqu\'à aujourd\'hui.',
        ),
        UnitTheorySection(
          'Des poids dans le monde entier',
          'Presque chaque culture avait ses échelons. La Mésopotamie comptait '
              'en shekel, mine et talent selon la base soixante. L\'Égypte '
              'calculait en décimal, en deben et kite. La Chine utilise encore '
              'aujourd\'hui le jin, le liang et le petit mace. Au Japon, le '
              '« momme » (3,75 grammes) est encore, par la loi, l\'unité '
              'mondiale dans le commerce des perles.\n\n'
              'Beaucoup d\'anciens poids survivent. Au Royaume-Uni et en '
              'Irlande, on indique le poids corporel en « stone » de 14 livres '
              '(« onze stone quatre »). La livre allemande désigne aujourd\'hui '
              '500 grammes tout ronds. En Asie du Sud, on négocie l\'or en '
              '« tola » (environ 11,7 grammes). Et le shekel israélien porte le '
              'nom d\'un poids de pesée immémorial.\n\n'
              'Une mesure était particulièrement fragmentée : le stone pesait, '
              'selon la marchandise, tantôt 5, tantôt 8, tantôt 14 livres. Seules '
              'les lois du XIXe siècle ont créé de l\'ordre.',
        ),
        UnitTheorySection(
          'La balance comme symbole',
          'Dans beaucoup de cultures, peser est plus qu\'une technique — c\'est '
              'une image de la justice. Dans l\'Égypte ancienne, on pesait, au '
              'tribunal des morts, le cœur contre la plume de la vérité. Chez '
              'Homère, Zeus tient une balance d\'or au-dessus du destin des '
              'héros. En islam, la « mizan » pèse, au Jour dernier, les actes, '
              'et pas même le poids d\'un grain de moutarde ne se perd.\n\n'
              'Le latin « libra » signifie balance — d\'où aussi le signe '
              'zodiacal de la Balance, le seul qui ne soit pas un être vivant. '
              'Beaucoup de religions exigent la juste mesure : la Bible hébraïque '
              'nomme les faux poids une abomination, le Coran blâme ceux qui '
              'pèsent court. Et le mot « talent » est passé du poids au don — par '
              'la parabole biblique des talents confiés.',
        ),
        UnitTheorySection(
          'Le douze dans le poids — et une réserve',
          'Le douze se niche surtout dans le système troy : douze onces dans la '
              'livre, et le titre de l\'or se compte en 24 carats (deux fois '
              'douze). De tels nombres sont appréciés parce que douze a six '
              'diviseurs — on peut partager proprement par deux, trois et '
              'quatre. Un tiers de douze fait nettement quatre ; un tiers de dix '
              'fait 3,33…\n\n'
              'La réserve honnête : le poids du quotidien ne suit pas le douze. '
              'La livre avoirdupois compte 16 onces — c\'est la base deux, le '
              'partage par deux sans fin. La Mésopotamie comptait en base '
              'soixante. Le monde des poids est donc un patchwork de deux, '
              'trois, douze et soixante — bâti pour la division dans le '
              'commerce, pas pour le calcul par dizaines.',
        ),
        UnitTheorySection(
          'Spéculatif (avec prudence)',
          'D\'où vient le penchant pour le douze ? Une hypothèse connue, mais '
              'non prouvée, le ramène au comptage des phalanges : le pouce '
              'égrène les trois phalanges des quatre doigts — douze par main. Si '
              'l\'on compte cela cinq fois, on arrive à soixante.\n\n'
              'Une seconde histoire est même réfutée : celle selon laquelle le '
              'carat reposerait sur les graines particulièrement régulières du '
              'caroubier. Le nom est exact — mais les graines varient autant en '
              'poids que les autres. La régularité est un mythe.',
        ),
      ];
    case UnitCategory.time:
      return const [
        UnitTheorySection(
          'Deux héritages : Babylone et l\'Égypte',
          'Notre temps provient de deux sources anciennes. L\'heure vient '
              'd\'Égypte, la minute et la seconde de Babylone.\n\n'
              'Les Égyptiens divisaient le jour et la nuit en douze heures '
              'chacun — probablement parce qu\'ils voyaient se lever, la nuit, '
              'douze constellations. Ainsi naquit le jour de 24 heures. Mais '
              'comme le jour et la nuit sont de longueurs différentes, ces '
              'heures étaient inégales en été et en hiver. Seule l\'horloge '
              'mécanique les rendit égales.\n\n'
              'Babylone calculait en base soixante. De là vient que nous avons '
              'soixante minutes dans l\'heure et soixante secondes dans la '
              'minute. « Minute » signifie « part rapetissée », « seconde » la '
              '« deuxième réduction ». La même base soixante se niche dans le '
              'cercle avec ses 360 degrés — temps et angle sont parents.',
        ),
        UnitTheorySection(
          'Lune, soleil et semaine',
          'Le jour vient de la rotation de la Terre, le mois de la Lune, '
              'l\'année du Soleil. Ces trois-là ne s\'emboîtent pas proprement, '
              'et cela explique presque toute complication de calendrier.\n\n'
              'La semaine a sept jours — probablement d\'après les quatre phases '
              'de la Lune d\'environ sept jours chacune. Plus tard, on attribua '
              'à chaque jour l\'un des sept astres visibles. Cette série vit dans '
              'beaucoup de langues : en anglais, « Saturday » est le jour de '
              'Saturne, dans les langues romanes « lundi/lunes » le jour de la '
              'Lune. Les Germains remplacèrent les dieux romains par les leurs — '
              'du jour de Jupiter naquit le jour de Thor, le « Thursday ».\n\n'
              'D\'anciennes façons de compter résonnent aussi : l\'anglais '
              '« fortnight » (quatorze nuits) rappelle que les Germains '
              'comptaient en nuits plutôt qu\'en jours.',
        ),
        UnitTheorySection(
          'Le temps dans le monde entier',
          'L\'horloge ne tournait pas partout de la même façon. La Chine '
              'divisait le jour en douze doubles heures, nommées d\'après des '
              'animaux — l\'heure du Rat se situait vers minuit. Le Japon '
              'divisait le jour et la nuit en six tranches chacun, qui '
              's\'allongeaient et se raccourcissaient avec les saisons ; des '
              'horloges spéciales devaient s\'y ajuster.\n\n'
              'Le calendrier islamique suit purement la Lune et est plus court '
              'de onze jours que l\'année solaire — c\'est pourquoi le ramadan '
              'migre lentement à travers toutes les saisons. Les Mayas '
              'entrelaçaient à la fois plusieurs cycles, dont une ronde sacrée '
              'de 260 jours. En Éthiopie, le jour commence aujourd\'hui encore '
              'au lever du soleil : ce qui est là-bas « six heures » est ailleurs '
              'midi.\n\n'
              'Beaucoup de ces anciens rythmes survivent — dans les fêtes, les '
              'heures de prière et les jours fastes —, tandis que le quotidien '
              'suit partout le calendrier grégorien.',
        ),
        UnitTheorySection(
          'Nombres sacrés du temps',
          'Le temps était presque partout sacré aussi. À Babylone, douze et '
              'soixante passaient pour des nombres parfaits. En Égypte, le dieu '
              'solaire traversait le monde souterrain pendant les douze heures '
              'de la nuit. Le sept de la semaine, dans la tradition juive, '
              'représente la complétude — le septième jour, Dieu se reposa.\n\n'
              'Un contraste est frappant : pour le judaïsme, le christianisme et '
              'l\'islam, le temps va tout droit, vers un but. Dans l\'hindouisme, '
              'il tourne en rond — d\'immenses âges du monde, les « yugas », '
              'viennent et s\'en vont sans cesse, un seul jour du dieu créateur '
              'dure des milliards d\'années. Beaucoup de cultures redoutaient en '
              'outre les jours surnuméraires en fin d\'année comme un dangereux '
              '« entre-temps ».',
        ),
        UnitTheorySection(
          'Pourquoi pas décimal — et le lien avec le douze',
          'Le temps est l\'adversaire le plus tenace du système décimal. '
              'Seconde, minute, heure, jour, semaine, mois, année — aucun de ces '
              'pas n\'est un nombre rond en dix.\n\n'
              'La raison est de nouveau la divisibilité. Un tiers d\'heure fait '
              'vingt minutes tout rondes, un quart en fait quinze. Avec dix, cela '
              'ne tomberait pas juste. Douze et soixante se laissent diviser par '
              'trois, dix non.\n\n'
              'On a tout de même essayé le système décimal. Pendant la Révolution '
              'française, il y eut des jours de dix heures, des heures de cent '
              'minutes. Cela ne tint qu\'environ un an et demi. À la différence '
              'des mesures de longueur et de poids, la conversion n\'apporta '
              'aucun bénéfice — les anciennes horloges marchaient déjà partout de '
              'la même façon. La division par douze et par soixante était tout '
              'simplement plus pratique.',
        ),
        UnitTheorySection(
          'Spéculatif (avec prudence)',
          'Comment les hommes en sont-ils venus au douze et au soixante ? Une '
              'idée élégante, mais indémontrable : on comptait avec le pouce les '
              'trois phalanges des quatre doigts — douze par main —, et cinq '
              'passages de ce genre font soixante.\n\n'
              'Plus loin encore se trouvent des affirmations selon lesquelles '
              'l\'année aurait jadis vraiment compté exactement 360 jours et '
              'aurait été modifiée par des catastrophes cosmiques. Il n\'en '
              'existe aucune preuve scientifique ; le 360 est bien plutôt un '
              'nombre de calcul rond et bien divisible.',
        ),
      ];
    case UnitCategory.angle:
      return const [
        UnitTheorySection(
          'Le cercle venu de Babylone',
          'Nous divisons le cercle entier en 360 degrés, le degré en 60 minutes '
              'd\'arc, la minute en 60 secondes. Cet ordre est très ancien et '
              'vient de Mésopotamie. Les Babyloniens calculaient en base '
              'soixante, un nombre aux diviseurs particulièrement nombreux.\n\n'
              'Pourquoi justement 360 ? Leur année avait environ 360 jours, et '
              'le soleil y parcourt à peine un degré par jour — jour et degré '
              'coïncidaient. Les mots trahissent l\'origine : « minute » vient du '
              'latin « première petite part », « seconde » de la « deuxième '
              'réduction ». Ce sont exactement les mêmes mots que nous utilisons '
              'pour le temps — angle et temps sont frères, issus de la même '
              'racine babylonienne.\n\n'
              'Une remarque honnête : pourquoi ce devint 360 et non 60 n\'est pas '
              'attesté avec certitude. L\'histoire du jour-par-degré est la plus '
              'plausible, mais ce n\'est pas une explication prouvée.',
        ),
        UnitTheorySection(
          'De l\'étoile à l\'heure',
          'Le douze sur le cercle vient d\'Égypte. Là-bas, douze constellations '
              'levantes structuraient la nuit — d\'où naquirent douze heures '
              'nocturnes et finalement le jour de 24 heures et le cadran de '
              'l\'horloge.\n\n'
              'Les Grecs ont organisé le système. Hipparque, puis plus tard '
              'Ptolémée, reprirent la division par 360 et posèrent ainsi le '
              'fondement de la trigonométrie. De là, le savoir migra plus loin : '
              'les savants indiens inventèrent la table des sinus, le monde '
              'islamique l\'affina. Notre mot « sinus » est même une erreur de '
              'traduction — du mot indien pour « corde d\'arc » devint, via '
              'l\'arabe, le mot latin pour « baie ».',
        ),
        UnitTheorySection(
          'Des angles dans le monde entier',
          'Toutes les cultures ne divisaient pas le cercle de la même façon. La '
              'Chine calculait de manière autonome : le cercle y avait 365¼ '
              'parties — une pour chaque jour de l\'année. Seule l\'influence '
              'européenne apporta le 360. La boussole de feng shui chinoise '
              'divise l\'horizon en 24 directions.\n\n'
              'L\'Inde divisait le zodiaque en douze signes et en 27 demeures '
              'lunaires. L\'astronomie islamique nous a offert beaucoup de mots '
              'de direction : « azimut », « zénith » et « nadir » sont tous '
              'arabes — le devoir de trouver la direction de la prière vers La '
              'Mecque a fait progresser l\'art des angles.\n\n'
              'En mer, on divisait la rose des vents : quatre vents principaux, '
              'puis huit, puis 32 quarts de 11¼ degrés chacun. Réciter les 32 '
              'dans le cercle — « boxing the compass » — faisait partie du métier '
              'du timonier. Les noms de vents méditerranéens tramontane, levant, '
              'sirocco vivent jusqu\'à aujourd\'hui dans le langage de la météo.',
        ),
        UnitTheorySection(
          'Directions et nombres sacrés',
          'Le ciel était presque partout divin. Pour les Babyloniens, '
              'l\'astronomie était un message des dieux, le zodiaque leur '
              'écriture. Le douze passait pour beaucoup pour un nombre sacré — '
              'douze signes du zodiaque, douze Olympiens, douze tribus, douze '
              'heures.\n\n'
              'L\'ordre des quatre points cardinaux est particulièrement '
              'répandu. Dans l\'hindouisme, chaque direction est gardée par un '
              'dieu propre, en Chine par une créature animale propre — dragon à '
              'l\'est, tigre à l\'ouest. La roue de médecine des Lakota donne à '
              'chaque direction couleur et signification. Et en islam, la '
              'direction de la prière ordonne le monde entier autour de la '
              'Kaaba.\n\n'
              'Délibérément sans une telle symbolique vinrent les mesures plus '
              'récentes : le radian ne suit que les mathématiques, le grade la '
              'Révolution française, le millième militaire la seule balistique.',
        ),
        UnitTheorySection(
          'Douze et soixante dans le cercle — et une réserve',
          'Le 360 est un miracle de divisibilité : il a 24 diviseurs. Tiers, '
              'quart, sixième d\'un cercle donnent tous des nombres de degrés '
              'ronds. Un cercle de cent parties ne le pourrait pas — un tiers '
              'ferait 33,33…\n\n'
              'On a essayé en décimal. Pendant la Révolution française vint le '
              'cercle de 400 grades. Cela resta une niche d\'arpenteurs, car 400 '
              'a moins de diviseurs que 360. Le temps décimal échoua lui aussi — '
              'entre autres parce qu\'il ne se laissait pas diviser proprement en '
              'quarts.\n\n'
              'La réserve honnête : le 360 n\'est pas obligatoire. La division '
              'chinoise par 365 le prouve. Et dans les mathématiques supérieures, '
              'le radian l\'emporte, parce qu\'il n\'y est pas question de '
              'divisibilité, mais de formules simples. Le monde du douze est donc '
              'puissant, mais non sans alternative.',
        ),
        UnitTheorySection(
          'Spéculatif (avec prudence)',
          'D\'où vient le penchant pour douze et soixante ? L\'hypothèse '
              'connue, mais non prouvée : du comptage des phalanges. Le pouce '
              'égrène les trois phalanges des quatre doigts — douze par main —, '
              'et cinq passages font soixante.\n\n'
              'Un parallèle de nombres est séduisant : la légende nordique '
              'donne au Valhalla 540 portes, par chacune passent 800 guerriers — '
              'ensemble 432 000, le même nombre qu\'un âge du monde indien. Le '
              'milieu spécialisé tient cela pour un hasard, non pour un héritage '
              'commun. Beau à raconter, mais sans valeur de preuve.',
        ),
      ];
    case UnitCategory.price:
      return const [
        UnitTheorySection(
          'L\'argent était poids',
          'Bien avant l\'existence des pièces, l\'argent était du métal pesé. On '
              'pesait de l\'argent-métal ou du grain. C\'est pourquoi les plus '
              'anciens noms de monnaie sont en réalité des noms de poids.\n\n'
              'En Mésopotamie, on comptait en shekel, mine et talent — selon la '
              'base soixante, soixante shekels pour la mine. Le shekel était '
              'd\'abord un poids, étalonné sur le grain d\'orge. La « drachme » '
              'grecque signifie littéralement « une poignée », à savoir six fines '
              'broches de métal.\n\n'
              'Fait notable : on ne frappait le plus souvent que la plus petite '
              'pièce. Les grandes unités comme la mine et le talent étaient de '
              'pures grandeurs de calcul — personne ne tenait un talent dans la '
              'main, on ne faisait qu\'en calculer.',
        ),
        UnitTheorySection(
          'Livre, shilling, penny',
          'L\'argent européen vient de Rome. La pièce « denarius » a donné au '
              'penny l\'abréviation « d » et à beaucoup de langues le mot pour '
              'argent (« dinero » en espagnol, « dinar » en arabe).\n\n'
              'Charlemagne le réorganisa : une livre d\'argent (libra) = 20 '
              'shillings (solidus) = 240 deniers (denarius), donc douze deniers '
              'pour le shilling. Là aussi, seul le denier était une vraie pièce ; '
              'la livre et le shilling servaient au calcul. Ce système tint plus '
              'de mille ans.\n\n'
              'L\'Angleterre le reprit comme livre, shilling, penny — la '
              '« £sd ». Le signe « £ » est un L orné pour « libra », la balance. '
              'Ainsi l\'argent tient au même mot que le signe zodiacal de la '
              'Balance et la livre de poids.',
        ),
        UnitTheorySection(
          'Des monnaies dans le monde entier',
          'Presque chaque région avait ses échelons. Dans l\'espace allemand du '
              'Sud, soixante kreuzers valaient un florin — de nouveau le soixante '
              'babylonien. Le « thaler » du Joachimsthal de Bohême a donné son '
              'nom au « dollar ». Le thaler de Marie-Thérèse fut si apprécié '
              'qu\'il avait encore cours, au XXe siècle, en Arabie et en '
              'Éthiopie.\n\n'
              'Ailleurs, l\'argent avait tout autre allure. En Afrique de '
              'l\'Ouest, on paya durant des siècles avec des cauris. Les Aztèques '
              'utilisaient des fèves de cacao comme petite monnaie et des '
              'manteaux normalisés comme grande monnaie — comptés par vingtaines. '
              'L\'Inde calculait la roupie en 16 annas, la Chine enfilait des '
              'pièces percées en cordons.\n\n'
              'Le dollar espagnol « pièce de huit » se laissait casser en huit '
              'parts. Deux d\'entre elles étaient « two bits » — jusqu\'à '
              'aujourd\'hui le surnom américain de la pièce de quart de dollar.',
        ),
        UnitTheorySection(
          'Argent, foi et symbole',
          'Les pièces étaient souvent plus qu\'un moyen de paiement. Les Grecs '
              'plaçaient une pièce dans la bouche du mort — le prix du passage '
              'pour Charon, qui mène l\'âme par-delà le fleuve des morts. Sans '
              'pièce, elle restait sur la rive.\n\n'
              'Dans le Nouveau Testament, Jésus brandit un denier à l\'effigie de '
              'l\'empereur : « Rendez à César ce qui est à César. » Les trente '
              'pièces d\'argent de Judas étaient probablement des shekels de '
              'Tyr — justement des pièces portant un dieu païen, et en même temps '
              'la monnaie officielle du Temple.\n\n'
              'Et encore et toujours le douze sacré : douze tribus et apôtres '
              'dans le judaïsme et le christianisme, douze dieux solaires dans '
              'l\'hindouisme, douze maillons de la chaîne des causes dans le '
              'bouddhisme, douze imams dans le chiisme, douze branches '
              'terrestres en Chine. Le nombre relie argent, calendrier et foi.',
        ),
        UnitTheorySection(
          'Pourquoi douze et vingt — et une réserve',
          'La raison de tous ces échelons bancals est la divisibilité. Un florin '
              'à soixante kreuzers se laisse diviser proprement par trois : vingt '
              'kreuzers. Un tiers de dollar, en revanche, fait 33,33… cents — un '
              'nombre sans fin. Qui divise souvent dans le commerce est mieux '
              'servi par douze, vingt ou soixante que par dix.\n\n'
              'C\'est pourquoi le douze survit dans le commerce : la douzaine '
              '(12), la grosse (144) et la grande grosse (1728). Une grosse '
              'signifie la même quantité à Londres comme à New York.\n\n'
              'La réserve honnête : l\'ancien argent n\'était pas un pur système '
              'duodécimal. Les vingt shillings de la livre relèvent d\'une '
              'logique de vingt (doigts et orteils). Et en 1971, le Royaume-Uni '
              'passa à cent pence — avec un certain désordre, mais durablement. '
              'Aujourd\'hui, presque le monde entier calcule en décimal.',
        ),
        UnitTheorySection(
          'Spéculatif (avec prudence)',
          'Pourquoi tant de cultures ont-elles choisi le douze ? L\'hypothèse '
              'connue, mais non prouvée, le ramène au comptage des phalanges : '
              'trois phalanges sur quatre doigts, égrenées par le pouce, font '
              'douze.\n\n'
              'D\'autres interprétations vont plus loin : le douze serait '
              '« trois fois quatre », ciel multiplié par terre, un nombre de la '
              'complétude. Certains affirment même qu\'un dieu solaire avec douze '
              'compagnons aurait été le modèle des douze apôtres. De tels '
              'parallèles sont interprétation, non histoire assurée — à consommer '
              'avec prudence.',
        ),
      ];
    case UnitCategory.temp:
      return const [
        UnitTheorySection(
          'Du thermoscope au thermomètre',
          'La température est une invention tardive. Longtemps, on ne pouvait '
              'que sentir la chaleur, pas la mesurer. Le premier pas vint de '
              'l\'observation que l\'air et les liquides se dilatent à la '
              'chaleur.\n\n'
              'Vers 1600, Galileo Galilei construisit un « thermoscope » : une '
              'sphère de verre avec un tube dans lequel un niveau d\'eau montait '
              'et descendait. Il indiquait la chaleur, mais n\'avait pas '
              'd\'échelle. La première échelle chiffrée fut apposée peu après par '
              'le médecin Santorio — un thermomètre est un thermoscope muni '
              'd\'une échelle.\n\n'
              'Pour que les mesures deviennent comparables, il faut des points de '
              'référence fixes. On s\'accorda sur des points naturels : le point '
              'de congélation et le point d\'ébullition de l\'eau. Toutes les '
              'échelles y tiennent jusqu\'à aujourd\'hui.',
        ),
        UnitTheorySection(
          'Trois échelles, trois points zéro',
          'Les échelles connues se distinguent surtout par l\'endroit où elles '
              'placent le zéro.\n\n'
              'Daniel Fahrenheit plaça vers 1724 son zéro au point le plus froid '
              'qu\'il pouvait produire de manière sûre : un mélange de glace, '
              'd\'eau et de sel. Il fixa le point de congélation de l\'eau pure à '
              '32, la température du corps à 96. Ainsi, les hivers normaux ne '
              'descendaient pas sous zéro. Plus tard, on réétalonna l\'échelle '
              'sur le point de congélation (32) et d\'ébullition (212) — '
              'exactement 180 degrés entre les deux.\n\n'
              'Réaumur choisit 0 et 80. Anders Celsius plaça 0 et 100 à la '
              'congélation et à l\'ébullition — et disposa d\'abord l\'échelle à '
              'l\'envers (0 était le point d\'ébullition). Ce n\'est qu\'après sa '
              'mort qu\'on la retourna dans sa forme actuelle. La division ronde '
              'par 100 s\'accordait parfaitement au nouveau système métrique.',
        ),
        UnitTheorySection(
          'Pourquoi le monde mesure différemment',
          'Presque le monde entier utilise aujourd\'hui le Celsius — il est venu '
              'avec le système métrique. Les grandes exceptions sont les '
              'États-Unis et quelques pays étroitement liés à eux, qui sont '
              'restés au Fahrenheit. Une loi de 1975 y rendit la conversion '
              'facultative, et l\'on en resta donc à l\'ancien.\n\n'
              'Les anciennes échelles sont tenaces. Réaumur fut répandu aux '
              'XVIIIe et XIXe siècles en France, en Allemagne et en Russie, et se '
              'maintint particulièrement longtemps en Russie. C\'est pourquoi la '
              'littérature russe — chez Dostoïevski ou Tolstoï, par exemple — '
              'parle de « degrés de gel », au sens de degrés Réaumur.\n\n'
              'Quelle échelle paraît « plus naturelle » est pure habitude. Le '
              'Celsius se lie à l\'eau, le Fahrenheit couvre grossièrement de 0 '
              '(très froid) à 100 (très chaud) la météo humaine. L\'un et l\'autre '
              'sont convention, non avantage objectif.',
        ),
        UnitTheorySection(
          'Feu et glace',
          'La chaleur et le froid portent, dans presque toutes les cultures, une '
              'signification profonde — et, fait frappant, les deux représentent '
              'souvent à la fois la création et le châtiment.\n\n'
              'Dans la légende nordique, le monde naît de la tension entre le '
              'royaume du feu Muspellheim et le royaume de la glace Niflheim — le '
              'froid n\'est pas ici un mal, mais une force créatrice. On se '
              'représente l\'enfer le plus souvent comme du feu, mais dans '
              'l\'Enfer de Dante, le cercle le plus profond est un lac gelé : la '
              'trahison est le refroidissement de toute chaleur humaine. Le '
              'bouddhisme connaît aussi bien des enfers chauds que froids, '
              'gradués selon la faute.\n\n'
              'Le feu est ailleurs sacré et pur : Agni dans l\'hindouisme, le feu '
              'éternel dans le zoroastrisme. Et le mot « nirvana » signifie '
              'littéralement « extinction » — l\'extinction du brûlement '
              'intérieur.',
        ),
        UnitTheorySection(
          'Le vrai point zéro : Kelvin',
          'Qu\'est-ce que la température, au fond ? Elle est une mesure de la '
              'vitesse à laquelle se meuvent les plus petites particules. Chaud '
              'signifie : les particules s\'agitent plus fort.\n\n'
              'Il en découle qu\'il existe une température la plus basse '
              'possible — le point où ce mouvement est le plus petit. C\'est le '
              'zéro absolu, à −273,15 °C. On ne peut pas faire plus froid. Lord '
              'Kelvin posa en 1848 une échelle exactement là : zéro kelvin est le '
              'zéro absolu, un pas de kelvin est aussi grand qu\'un degré '
              'Celsius.\n\n'
              'Seule cette échelle permet de vrais rapports : 200 kelvins sont '
              'vraiment deux fois plus « chauds » que 100. Avec le Celsius ou le '
              'Fahrenheit, cela ne vaut pas — « 20 degrés sont deux fois plus '
              'chauds que 10 degrés » est tout simplement faux. Pour la science, '
              'le kelvin est donc l\'unité de base.',
        ),
        UnitTheorySection(
          'Pourquoi le douze n\'aide guère ici — honnêtement',
          'Pour les autres mesures, le douze est fort, parce qu\'on peut bien '
              'diviser une quantité : un tiers de pied fait quatre pouces tout '
              'ronds. Pour la température, cet argument ne tient pas — et cela '
              'doit être dit honnêtement.\n\n'
              'La raison est le point zéro décalé. Zéro degré Celsius ne signifie '
              'pas « pas de chaleur », mais seulement « l\'eau gèle ». C\'est '
              'pourquoi on ne peut pas diviser sensément les températures par '
              'deux ou par trois — « deux fois moins chaud » n\'existe pas sur '
              'une telle échelle. La belle divisibilité du douze tourne ici à '
              'vide.\n\n'
              'Il n\'y a qu\'à un seul endroit que se niche pourtant une pensée '
              'de divisibilité : dans le découpage de l\'échelle elle-même. Les '
              '96 de Fahrenheit et les 64 pas jusqu\'à la glace se laissent '
              'souvent diviser par deux. Mais qu\'on partage l\'affichage en 10, '
              '12 ou 100 pas est pure cosmétique. La température est le contre-'
              'exemple honnête : ici, le choix de la base est indifférent — la '
              'véritable assertion se niche dans le zéro absolu, pas dans le '
              'découpage de l\'échelle.',
        ),
        UnitTheorySection(
          'Spéculatif (avec prudence)',
          'Des légendes entourent l\'échelle de Fahrenheit. L\'une prétend que '
              'le 96 était la température de fièvre de sa femme malade — il n\'en '
              'existe aucune preuve. Une autre dit que le zéro était l\'hiver le '
              'plus froid de sa ville natale de Dantzig ; plus probable est le '
              'mélange reproductible de glace et de sel.\n\n'
              'Même la propre explication de Fahrenheit sur ses points fixes '
              'passe pour partiellement embellie après coup — il reprit beaucoup '
              'de choses tout simplement à l\'échelle plus ancienne de '
              'l\'astronome Rømer. De belles histoires, mais à lire avec '
              'prudence.',
        ),
      ];
    // Les huit domaines de théorie sont désormais présents en français.
    default:
      return const [];
  }
}

// Curated key sources per area (A1/full-text first), from the dossiers in
// docs/research/unit_<area>.md. The complete tiered lists live there.
List<Source> _unitSourcesFr(UnitCategory cat) {
  switch (cat) {
    case UnitCategory.count:
      return [
        Source('Dozen — Wikipedia', 'https://en.wikipedia.org/wiki/Dozen', 'R2', 'A1'),
        Source('Gross (unit) — Wikipedia', 'https://en.wikipedia.org/wiki/Gross_(unit)', 'R2', 'A1'),
        Source('Great gross — Wikipedia', 'https://en.wikipedia.org/wiki/Great_gross', 'R2', 'A1'),
        Source('Baker’s dozen — Wikipedia', 'https://en.wikipedia.org/wiki/Baker%27s_dozen', 'R2', 'A1'),
        Source('Assize of Bread and Ale — Wikipedia', 'https://en.wikipedia.org/wiki/Assize_of_Bread_and_Ale', 'R2', 'A1'),
        Source('dozen — Online Etymology Dictionary', 'https://www.etymonline.com/word/dozen', 'R2', 'A1'),
        Source('gross — Online Etymology Dictionary', 'https://www.etymonline.com/word/gross', 'R2', 'A1'),
      ];
    case UnitCategory.dist:
      return [
        Source('Measurement — MacTutor History of Mathematics', 'https://mathshistory.st-andrews.ac.uk/HistTopics/Measurement/', 'R1', 'A1'),
        Source('Proportionate measurements (Vastu-Shastra) — wisdomlib.org', 'https://www.wisdomlib.org/hinduism/book/vastu-shastra-indian-architecture/d/doc1085304.html', 'R1', 'A1'),
        Source('Cubit — Wikipedia', 'https://en.wikipedia.org/wiki/Cubit', 'R2', 'A1'),
        Source('Ancient Mesopotamian units of measurement — Wikipedia', 'https://en.wikipedia.org/wiki/Ancient_Mesopotamian_units_of_measurement', 'R2', 'A1'),
        Source('Ancient Roman units of measurement — Wikipedia', 'https://en.wikipedia.org/wiki/Ancient_Roman_units_of_measurement', 'R2', 'A1'),
        Source('The nautical mile — IHO', 'https://ihr.iho.int/articles/the-nautical-mile/', 'R1', 'A2'),
      ];
    case UnitCategory.area:
      return [
        Source('Babylonian numerals — MacTutor (St Andrews)', 'https://mathshistory.st-andrews.ac.uk/HistTopics/Babylonian_numerals/', 'R1', 'A1'),
        Source('Acre — Wikipedia', 'https://en.wikipedia.org/wiki/Acre', 'R2', 'A1'),
        Source('Hectare — Wikipedia', 'https://en.wikipedia.org/wiki/Hectare', 'R2', 'A1'),
        Source('Jugerum — Wikipedia', 'https://en.wikipedia.org/wiki/Jugerum', 'R2', 'A1'),
        Source('Mathematical accuracy of Aztec land surveys (Codex Vergara) — PNAS', 'https://www.pnas.org/doi/10.1073/pnas.1107737108', 'R1', 'A2'),
        Source('Before the Melting Pot: Pre-Columbian Weights and Measures — NIST', 'https://www.nist.gov/blogs/taking-measure/melting-pot-pre-columbian-weights-and-measures', 'R1', 'A2'),
      ];
    case UnitCategory.space:
      return [
        Source('Before the Melting Pot: Pre-Columbian Weights and Measures — NIST', 'https://www.nist.gov/blogs/taking-measure/melting-pot-pre-columbian-weights-and-measures', 'R1', 'A1'),
        Source('Ancient Mesopotamian units of measurement — Wikipedia', 'https://en.wikipedia.org/wiki/Ancient_Mesopotamian_units_of_measurement', 'R2', 'A1'),
        Source('Hekat — Wikipedia', 'https://en.wikipedia.org/wiki/Hekat', 'R2', 'A1'),
        Source('Medimnos — Wikipedia', 'https://en.wikipedia.org/wiki/Medimnos', 'R2', 'A1'),
        Source('Ancient Roman units of measurement — Wikipedia', 'https://en.wikipedia.org/wiki/Ancient_Roman_units_of_measurement', 'R2', 'A1'),
        Source('Jialiang — Wikipedia', 'https://en.wikipedia.org/wiki/Jialiang', 'R2', 'A1'),
      ];
    case UnitCategory.weight:
      return [
        Source('Hanging in the Balance: Precision Weighing in Antiquity — Penn Museum', 'https://www.penn.museum/sites/expedition/hanging-in-the-balance-2/', 'R1', 'A1'),
        Source('Avoirdupois — Wikipedia', 'https://en.wikipedia.org/wiki/Avoirdupois', 'R2', 'A1'),
        Source('Troy weight — Wikipedia', 'https://en.wikipedia.org/wiki/Troy_weight', 'R2', 'A1'),
        Source('Mina (unit) — Wikipedia', 'https://en.wikipedia.org/wiki/Mina_(unit)', 'R2', 'A1'),
        Source('Cubical Weights — Harappa.com', 'https://www.harappa.com/blog/cubical-weights', 'R1', 'A2'),
        Source('Legume Seeds for Weighing Gold in India — ResearchGate', 'https://www.researchgate.net/publication/344088688', 'R1', 'A2'),
      ];
    case UnitCategory.time:
      return [
        Source('Sexagesimal — Wikipedia', 'https://en.wikipedia.org/wiki/Sexagesimal', 'R2', 'A1'),
        Source('Hour — Wikipedia', 'https://en.wikipedia.org/wiki/Hour', 'R2', 'A1'),
        Source('Minute — Wikipedia', 'https://en.wikipedia.org/wiki/Minute', 'R2', 'A1'),
        Source('Decimal time — Wikipedia', 'https://en.wikipedia.org/wiki/Decimal_time', 'R2', 'A1'),
        Source('Babylonian numerals — MacTutor (St Andrews)', 'https://mathshistory.st-andrews.ac.uk/HistTopics/Babylonian_numerals/', 'R1', 'A3'),
        Source('Telling Time in Ancient Egypt — Metropolitan Museum of Art', 'https://www.metmuseum.org/essays/telling-time-in-ancient-egypt', 'R1', 'A3'),
      ];
    case UnitCategory.angle:
      return [
        Source('Babylonian mathematics — MacTutor (St Andrews)', 'https://mathshistory.st-andrews.ac.uk/HistTopics/Babylonian_mathematics/', 'R1', 'A1'),
        Source('Why did the Babylonians use 360 degrees? — UNLV', 'https://www.physics.unlv.edu/~jeffery/astro/babylon/babylonian_360_degrees.html', 'R1', 'A1'),
        Source('Hipparchus — MacTutor', 'https://mathshistory.st-andrews.ac.uk/Biographies/Hipparchus/', 'R1', 'A1'),
        Source('Angles in the SI: the radian as an independent unit — arXiv', 'https://arxiv.org/pdf/2101.01578', 'R1', 'A1'),
        Source('Decimal time — MacTutor', 'https://mathshistory.st-andrews.ac.uk/HistTopics/Decimal_time/', 'R1', 'A1'),
      ];
    case UnitCategory.price:
      return [
        Source('£sd — Wikipedia', 'https://en.wikipedia.org/wiki/%C2%A3sd', 'R2', 'A1'),
        Source('Denarius — Wikipedia', 'https://en.wikipedia.org/wiki/Denarius', 'R2', 'A1'),
        Source('Shekel — Wikipedia', 'https://en.wikipedia.org/wiki/Shekel', 'R2', 'A1'),
        Source('Non-decimal currency — Wikipedia', 'https://en.wikipedia.org/wiki/Non-decimal_currency', 'R2', 'A1'),
        Source('Charon\'s obol — Wikipedia', 'https://en.wikipedia.org/wiki/Charon\'s_obol', 'R2', 'A1'),
        Source('Babylonian numerals — MacTutor (St Andrews)', 'https://mathshistory.st-andrews.ac.uk/HistTopics/Babylonian_numerals/', 'R1', 'A2'),
      ];
    case UnitCategory.temp:
      return [
        Source('Kelvin: History — NIST', 'https://www.nist.gov/si-redefinition/kelvin/kelvin-history', 'R1', 'A1'),
        Source('Fahrenheit — Wikipedia', 'https://en.wikipedia.org/wiki/Fahrenheit', 'R2', 'A1'),
        Source('Daniel Gabriel Fahrenheit — Wikipedia', 'https://en.wikipedia.org/wiki/Daniel_Gabriel_Fahrenheit', 'R2', 'A1'),
        Source('Réaumur scale — Wikipedia', 'https://en.wikipedia.org/wiki/R%C3%A9aumur_scale', 'R2', 'A1'),
        Source('Thermodynamic temperature — Wikipedia', 'https://en.wikipedia.org/wiki/Thermodynamic_temperature', 'R2', 'A1'),
        Source('Rankine scale — Wikipedia', 'https://en.wikipedia.org/wiki/Rankine_scale', 'R2', 'A1'),
      ];
    default:
      return const [];
  }
}
