//  Prose française pour les chapitres « Société dozénale ». part of
// ../society_theory.dart. Phrases simples (plus faciles à traduire). Faits et
// opinions attribuées ; honnête sur les attributions incertaines (cascades de
// citations), sans verdicts du narrateur. Distillé de docs/research/society_*.md.

part of '../society_theory.dart';

List<ProseChapter> _societyChaptersFr() => const [
  ProseChapter('Un mouvement pour le douze', [
    ProseSection(
      'Des précurseurs isolés',
      'L\'idée de calculer en douze plutôt qu\'en dix est ancienne. Pendant '
          'longtemps, il n\'y eut toutefois que des partisans isolés, pas de '
          'mouvement. Dès le XVIIIe siècle, on cite le naturaliste Buffon — la '
          'source exacte est cependant incertaine et passe d\'un ouvrage de '
          'référence à l\'autre.\n\n'
          'Les choses deviennent plus tangibles au XIXe siècle. L\'inventeur de '
          'la sténographie Isaac Pitman fit la promotion du douze à partir de '
          '1857 et proposa ses propres signes pour dix et onze. Le philosophe '
          'Herbert Spencer s\'en fit le défenseur en 1896, explicitement contre '
          'le système métrique.',
    ),
    ProseSection(
      'Andrews et « New Numbers »',
      'C\'est un Américain qui en fit une cause : Frank Emerson Andrews. En '
          '1934 parut son essai « An Excursion in Numbers » dans l\'Atlantic '
          'Monthly — un magazine qui, de son propre aveu, n\'avait jamais '
          'imprimé de mathématiques auparavant et qui assortit le texte, en '
          'plein milieu, d\'un avertissement pour les lecteurs réfractaires aux '
          'mathématiques.\n\n'
          'En 1935 suivit son livre « New Numbers », le premier du genre aux '
          'États-Unis. Son argument était simple : douze est divisible par 2, '
          '3, 4 et 6, dix seulement par 2 et 5. Andrews restait pourtant '
          'lucide — il jugeait un véritable changement improbable face à la '
          '« force tenace de l\'habitude ».',
    ),
    ProseSection(
      'La naissance des sociétés',
      'Des réactions à l\'article d\'Andrews naquit un cercle de '
          'correspondants, et de là, en 1944, la « Duodecimal Society of '
          'America ». C\'est Ralph « Whiskers » Beard qui lui donna ce nom par '
          'plaisanterie ; le capital de départ fut offert par George Terry. '
          'Elle fut plus tard rebaptisée « Dozenal Society of America » — parce '
          'que le mot « duodecimal » contient le mot « decimal » (décimal).\n\n'
          'En 1959 vint s\'ajouter sa sœur britannique, la Dozenal Society of '
          'Great Britain, avec le mathématicien A. C. Aitken comme membre '
          'éminent. La société américaine publie aujourd\'hui encore le '
          '« Duodecimal Bulletin » ; parmi ses membres d\'honneur figurait '
          'l\'auteur de science-fiction Isaac Asimov.',
    ),
  ], sources: [
    Source('F. Emerson Andrews — Wikipedia', 'https://en.wikipedia.org/wiki/F._Emerson_Andrews', 'R2', 'A1'),
    Source('Duodecimal — Wikipedia', 'https://en.wikipedia.org/wiki/Duodecimal', 'R2', 'A1'),
    Source('Dozenal Society of America', 'https://dozenal.org/', 'R2', 'A1'),
    Source('New Numbers (F. E. Andrews) — Internet Archive', 'https://archive.org/details/newnumbershowacc0000fran', 'R2', 'A1'),
    Source('Honorary Members and Fellows — DSA', 'https://dozenal.org/about-us-honorary-members-and-fellows-society', 'R1', 'A1'),
    Source('Summer Reading: New Numbers — Charles Petzold', 'http://www.charlespetzold.com/blog/2006/08/250954.html', 'R3', 'A1'),
  ]),
  ProseChapter('De nouveaux chiffres pour dix et onze', [
    ProseSection(
      'Le problème des symboles',
      'Qui calcule en douze a besoin de deux chiffres supplémentaires — pour '
          'dix et pour onze. Lesquels devraient-ils être ? La question n\'est '
          'toujours pas tranchée de façon uniforme ; même la société '
          'américaine ne prescrit aucune notation fixe.\n\n'
          'Il existe plusieurs variantes : le deux et le trois retournés de '
          'Pitman (↊ et ↋), le X italique et le E arrondi d\'Andrews, un '
          'sextile et un double croisillon (inspirés des touches du téléphone), '
          'les glyphes du créateur de caractères Dwiggins — et tout simplement '
          'les lettres A et B issues du monde informatique.',
    ),
    ProseSection(
      'Pitman, Unicode et le changement de 2026',
      'La société américaine a changé ses signes à plusieurs reprises : le '
          'sextile et le double croisillon jusque vers 2008, puis les glyphes '
          'de Dwiggins, et depuis 2015 les chiffres de Pitman. En 2015, le '
          'standard Unicode a lui aussi officiellement intégré les signes de '
          'Pitman.\n\n'
          'Début 2026, la société a fait passer ses sites web aux lettres A et '
          'B — non parce qu\'elle abandonnerait Pitman, mais parce que les '
          'caractères spéciaux ne s\'affichent pas encore de façon fiable sur '
          'de nombreux navigateurs et téléphones. Dans le bulletin imprimé, les '
          'chiffres de Pitman restent la norme. (Cette application affiche au '
          'choix, sur son écran, ses propres glyphes ou 0–9 / A, B.)',
    ),
    ProseSection(
      'Little Twelvetoes',
      'L\'élément dozénal le plus connu de la culture populaire est une '
          'chanson : « Little Twelvetoes », tirée de la série éducative '
          'américaine Schoolhouse Rock, écrite et chantée par Bob Dorough, '
          'diffusée pour la première fois en 1973.\n\n'
          'On y voit un sympathique extraterrestre à douze orteils montrer '
          'comment quelqu\'un doté de douze « doigts » aurait inventé deux '
          'nouveaux chiffres — prononcés « dek » pour dix et « el » pour onze. '
          'Jugée trop difficile pour les écoliers du primaire, elle fut diffusée '
          'moins souvent que les autres épisodes, mais marqua durablement bien '
          'des mémoires.',
    ),
  ], sources: [
    Source('Unicode-Proposal L2/15-116: Pitman-Ziffern (PDF)', 'https://www.unicode.org/L2/L2015/15116-pitman.pdf', 'R1', 'A1'),
    Source('Symbols, Symbols … Symbols — DSA', 'https://dozenal.org/drupal/content/symbols-symbols-%C2%A2-symbols.html', 'R1', 'A1'),
    Source('The DSA Symbology Synopsis', 'https://dozenal.org/drupal/content/dsa-symbology-synopsis.html', 'R2', 'A1'),
    Source('The Dozenal Society of America — Wikipedia', 'https://en.wikipedia.org/wiki/The_Dozenal_Society_of_America', 'R2', 'A1'),
    Source('Little Twelvetoes — Schoolhouse Rock Wiki', 'https://schoolhouserock.fandom.com/wiki/Little_Twelvetoes', 'R3', 'A1'),
  ]),
  ProseChapter('Do, gro, mo — parler le dozénal', [
    ProseSection(
      'Douzaine, grosse et grande grosse',
      'En base douze, le nombre douze devient le « 10 ». Pour ses rangs, il '
          'existe depuis longtemps des mots de tous les jours : douze unités '
          'font une douzaine, douze douzaines (144) une grosse, douze grosses '
          '(1728) une grande grosse.\n\n'
          'C\'est remarquable : ces mots commerciaux familiers sont en réalité '
          'déjà des valeurs de position dozénales — une douzaine est le « 10 », '
          'la grosse le « 100 », la grande grosse le « 1000 » du monde du '
          'douze.',
    ),
    ProseSection(
      'Dek, el et la dénomination systématique',
      'Les deux nouveaux chiffres se prononcent le plus souvent « dek » (dix) '
          'et « el » (onze). Pour les rangs, on emploie les formes courtes do, '
          'gro, mo (de dozen, gross, great gross).\n\n'
          'À côté de cela existe une dénomination systématique, développée au '
          'sein de la communauté en ligne : des racines de mots fixes pour les '
          'chiffres (un, bi, tri … dec, lev) plus des terminaisons pour les '
          'puissances de douze — « -qua » vers le haut, « -cia » vers le bas. '
          'Détail charmant : « uncia » désigne exactement un douzième — le même '
          'mot latin dont sont issus le « pouce » (inch) et l\'« once ».',
    ),
  ], sources: [
    Source('Systematic Dozenal Nomenclature (Kurzfassung) — gorpub', 'https://gorpub.freeshell.org/dozenal/sdnbrief.html', 'R2', 'A1'),
    Source('Duodecimal — Wikipedia', 'https://en.wikipedia.org/wiki/Duodecimal', 'R2', 'A1'),
    Source('Base 12 — Numberphile (James Grime)', 'https://www.numberphile.com/videos/base-12', 'R3', 'A1'),
    Source('Engines of Our Ingenuity Nr. 3172: „Dozenels"', 'https://engines.egr.uh.edu/episode/3172', 'R3', 'A1'),
  ]),
  ProseChapter('TGM, sociétés et outils aujourd\'hui', [
    ProseSection(
      'TGM — un système de mesures dozénal',
      'Tom Pendlebury, de la société britannique, conçut un système de '
          'mesures dozénal complet : le TGM, nommé d\'après ses trois unités '
          'fondamentales Tim, Grafut et Maz.\n\n'
          'Contrairement au système métrique, il ne commence pas par la '
          'longueur, mais par le temps, et dérive tout de l\'attraction '
          'terrestre. Le « Grafut » (pied gravitationnel) est juste un peu '
          'inférieur à un pied. En découlent de façon cohérente des unités de '
          'surface, de volume, de vitesse et de force — un pendant en soi '
          'complet au système métrique, entièrement en douze.',
    ),
    ProseSection(
      'Les sociétés aujourd\'hui',
      'Les deux sociétés subsistent, mais elles sont petites et bénévoles ; '
          'il n\'existe pas de chiffres de membres fiables. L\'américaine '
          'continue de publier le Duodecimal Bulletin et met à disposition des '
          'outils d\'apprentissage et de conversion, tandis que la britannique '
          'entretient surtout le matériel relatif au TGM.\n\n'
          'Le lieu le plus vivant est le forum en ligne « Dozensonline ». '
          'C\'est là que naquirent la dénomination systématique des nombres et '
          'le débat jamais tout à fait clos sur les bons chiffres. La '
          'communauté est petite, mais active.',
    ),
    ProseSection(
      'Calculatrices, applis — et cette application',
      'Autour du douze s\'est formée une scène d\'outils étonnamment '
          'animée : calculatrices dozénales, convertisseurs de mesures, et même '
          'une horloge et un calendrier dozénaux, en grande partie open source '
          'et bâtis par des membres des sociétés.\n\n'
          'Cette application s\'inscrit précisément dans cette lignée — une '
          'calculatrice qui compte non pas en dix, mais en douze, avec ses propres '
          'glyphes, des fractions exactes et une partie consacrée aux unités. '
          'Elle est une modeste contribution à une longue et affectueuse '
          'tradition de niche.',
    ),
    ProseSection(
      'Pourquoi le monde reste malgré tout décimal',
      'Si le douze ne s\'impose pas, ce n\'est guère à cause des mathématiques '
          '— celles-ci sont de son côté. C\'est à cause de l\'habitude : le '
          'système décimal est ancré dans la langue, l\'école, le droit et la '
          'technique, et un changement serait d\'une ampleur prodigieuse. Même '
          'le passage bien plus modeste des États-Unis au système métrique y a '
          'échoué.\n\n'
          'C\'est pourquoi la plupart des personnes intéressées voient '
          'aujourd\'hui la chose plutôt comme une séduisante expérience de '
          'pensée que comme un sérieux projet de conversion. Elle montre que le '
          'choix de la base numérique n\'a rien d\'évident — et aiguise le '
          'regard sur les nombres que nous manipulons au quotidien.',
    ),
  ], sources: [
    Source('TGM: A Coherent Dozenal Metrology (Pendlebury/Goodman) — DSA (PDF)', 'http://www.dozenal.org/drupal/sites_bck/default/files/tgm_0.pdf', 'R1', 'A1'),
    Source('TGM — fergusoncreations.co.uk', 'http://www.fergusoncreations.co.uk/home/shaun/metrology/tgm.htm', 'R2', 'A1'),
    Source('The Dozenal Society of America — Wikipedia', 'https://en.wikipedia.org/wiki/The_Dozenal_Society_of_America', 'R2', 'A1'),
    Source('Dozenal Society of America', 'https://dozenal.org/', 'R2', 'A1'),
    Source('Dozenal Suite (Apps) — dozenal.ca', 'https://dozenal.ca/suite/', 'R2', 'A1'),
    Source('Dozenal RPN Calculator — Eddie\'s Math and Calculator Blog', 'http://edspi31415.blogspot.com/2026/02/dozenal-rpn-calculator-app-for-android.html', 'R3', 'A1'),
  ]),
  ProseChapter('Dozecal — une calculatrice douzénale', [
    ProseSection('Une application pour la base douze', 'Dozecal est une calculatrice pour iPhone qui calcule nativement en base douze. Elle a été publiée en 2020 par le développeur indépendant Johan Kovacs ; l\'application est gratuite. Son objectif déclaré est de promouvoir l\'usage de la base douze en mathématiques et en sciences.\n\nLes calculs peuvent s\'effectuer au choix en mode duodécimal ou en mode décimal. Lors du passage de l\'un à l\'autre, la valeur affichée est automatiquement convertie. Les fonctions trigonométriques utilisent le degré comme unité de mesure.'),
    ProseSection('La notation polonaise inverse', 'Une particularité de Dozecal est la saisie en notation polonaise inverse (RPN). Au lieu de « 3 + 4 = », on y tape « 3 4 + » — d\'abord les deux nombres, puis l\'opération. Cela paraît d\'abord déroutant, mais se passe entièrement de parenthèses et a longtemps été répandu sur de nombreuses calculatrices scientifiques (par exemple celles de Hewlett-Packard).'),
    ProseSection('Un élément du paysage des outils douzénaux', 'Dozecal n\'est pas l\'œuvre d\'une société, mais d\'une seule personne ; dans sa description, l\'application renvoie à la Dozenal Society of America pour davantage d\'informations sur la base douze. Elle s\'inscrit ainsi dans le paysage restreint mais vivant des outils douzénaux — aux côtés de cette application, des matériaux TGM et d\'autres calculatrices.'),
  ], sources: [
    Source('Dozecal — App Store (Apple)', 'https://apps.apple.com/app/id1521160089', 'R1', 'A1'),
  ]),
  ProseChapter('Le Dozenal Calculator de Paul Rapoport', [
    ProseSection('Une calculatrice dans le navigateur', 'Le Dozenal Calculator de Paul Rapoport est une calculatrice scientifique qui fonctionne directement dans le navigateur web — gratuitement et sans installation. Elle calcule en base douze et peut à tout moment afficher également en décimal ; la base numérique se change librement, et plusieurs registres indépendants sont disponibles. Un mode d\'emploi détaillé est fourni sous forme de PDF.'),
    ProseSection('Solide en théorie des nombres', 'La théorie des nombres est particulièrement riche — ce qui convient bien à une base précisément appréciée pour sa divisibilité. La calculatrice trouve le plus grand commun diviseur et le plus petit commun multiple, énumère tous les diviseurs d\'un nombre et le décompose en facteurs premiers (au choix avec leur multiplicité). À cela s\'ajoutent la somme des diviseurs, le nombre de diviseurs et la fonction indicatrice d\'Euler (φ) — le nombre d\'entiers plus petits qui lui sont premiers entre eux.'),
    ProseSection('La panoplie scientifique complète', 'Pour le reste aussi, la boîte à outils est complète : le carré et la racine carrée, des puissances et des racines quelconques, la fonction exponentielle et les logarithmes — le logarithme naturel ainsi que les bases deux et dix et un logarithme à base quelconque. S\'y ajoutent les fonctions trigonométriques (angulaires) et hyperboliques avec leurs réciproques, la combinatoire (combinaisons et permutations, y compris avec répétition), la statistique élémentaire (moyenne et écart type), la factorielle, une fonction pourcentage, la fonction Gamma et l\'unité imaginaire i.'),
    ProseSection('De très nombreuses grandeurs', 'Au-delà du simple calcul, le programme couvre des dizaines de grandeurs physiques et les convertit les unes dans les autres : le temps et l\'heure du jour, la fréquence, la vitesse, la longueur, la surface, le volume sec et le volume liquide, la masse, la force, la pression, l\'énergie, la puissance, la température et l\'angle. Les unités de temps duodécimales en font aussi partie.'),
    ProseSection('Jusqu\'à l\'électrotechnique', 'Chose inhabituelle pour une calculatrice duodécimale, elle s\'aventure loin dans la physique appliquée : elle connaît ses propres domaines de grandeurs pour l\'impédance électrique, la quantité électrique (charge), le potentiel électrique (tension) et le courant électrique. On peut ainsi mener jusqu\'au bout des calculs d\'électrotechnique en base douze.'),
  ], sources: [
    Source('Dozenal Calculator (Paul Rapoport)', 'https://doz-calc.mx-dev.com', 'R1', 'A1'),
  ]),
];
