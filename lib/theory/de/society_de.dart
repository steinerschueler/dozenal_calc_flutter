// German prose for the "Dozenale Gesellschaft" chapters. part of
// ../society_theory.dart. Simple sentences (easier to translate). Facts and
// attributed views; honest about uncertain attributions (citation cascades),
// no narrator verdicts. Distilled from docs/research/society_*.md.

part of '../society_theory.dart';

List<ProseChapter> _societyChaptersDe() => const [
  ProseChapter('Eine Bewegung für die Zwölf', [
    ProseSection(
      'Einzelne Vordenker',
      'Die Idee, lieber in Zwölf als in Zehn zu rechnen, ist alt. Lange gab '
          'es aber nur einzelne Fürsprecher, keine Bewegung. Schon im 18. '
          'Jahrhundert wird der Naturforscher Buffon genannt — die genaue '
          'Quelle dazu ist allerdings unsicher und wandert von Nachschlagewerk '
          'zu Nachschlagewerk.\n\n'
          'Greifbarer wird es im 19. Jahrhundert. Der Kurzschrift-Erfinder '
          'Isaac Pitman warb ab 1857 für die Zwölf und schlug eigene Zeichen '
          'für Zehn und Elf vor. Der Philosoph Herbert Spencer trat 1896 '
          'dafür ein, ausdrücklich gegen das metrische System.',
    ),
    ProseSection(
      'Andrews und „New Numbers"',
      'Zur Sache machte es ein Amerikaner: Frank Emerson Andrews. 1934 '
          'erschien sein Aufsatz „An Excursion in Numbers" im Atlantic '
          'Monthly — ein Magazin, das nach eigener Aussage nie zuvor '
          'Mathematik gedruckt hatte und den Text mitten drin mit einem '
          'Warnhinweis für mathematik-scheue Leser versah.\n\n'
          '1935 folgte sein Buch „New Numbers", das erste seiner Art in den '
          'USA. Sein Argument war schlicht: Zwölf ist durch 2, 3, 4 und 6 '
          'teilbar, Zehn nur durch 2 und 5. Andrews war dabei nüchtern — eine '
          'echte Umstellung hielt er gegen die „zähe Macht der Gewohnheit" für '
          'unwahrscheinlich.',
    ),
    ProseSection(
      'Die Gesellschaften entstehen',
      'Aus den Zuschriften zu Andrews\' Artikel wuchs ein Briefkreis und '
          'daraus 1944 die „Duodecimal Society of America". Den Namen gab ihr '
          'scherzhaft Ralph „Whiskers" Beard; das Startkapital stiftete George '
          'Terry. Später wurde sie zur „Dozenal Society of America" umbenannt '
          '— weil im Wort „duodecimal" das dezimale „decimal" steckt.\n\n'
          '1959 kam die britische Schwester dazu, die Dozenal Society of Great '
          'Britain, mit dem Mathematiker A. C. Aitken als prominentem '
          'Mitglied. Die amerikanische Gesellschaft gibt bis heute das '
          '„Duodecimal Bulletin" heraus; zu ihren Ehrenmitgliedern zählte der '
          'Science-Fiction-Autor Isaac Asimov.',
    ),
  ], sources: [
    Source('F. Emerson Andrews — Wikipedia', 'https://en.wikipedia.org/wiki/F._Emerson_Andrews', 'R2', 'A1'),
    Source('Duodecimal — Wikipedia', 'https://en.wikipedia.org/wiki/Duodecimal', 'R2', 'A1'),
    Source('Dozenal Society of America', 'https://dozenal.org/', 'R2', 'A1'),
    Source('New Numbers (F. E. Andrews) — Internet Archive', 'https://archive.org/details/newnumbershowacc0000fran', 'R2', 'A1'),
    Source('Honorary Members and Fellows — DSA', 'https://dozenal.org/about-us-honorary-members-and-fellows-society', 'R1', 'A1'),
    Source('Summer Reading: New Numbers — Charles Petzold', 'http://www.charlespetzold.com/blog/2006/08/250954.html', 'R3', 'A1'),
  ]),
  ProseChapter('Neue Ziffern für Zehn und Elf', [
    ProseSection(
      'Das Symbol-Problem',
      'Wer in Zwölf rechnet, braucht zwei zusätzliche Ziffern — für Zehn und '
          'für Elf. Welche das sein sollen, ist bis heute nicht einheitlich '
          'geklärt; selbst die amerikanische Gesellschaft schreibt keine feste '
          'Notation vor.\n\n'
          'Es gibt mehrere Varianten: Pitmans gedrehte Zwei und Drei (↊ und '
          '↋), Andrews\' kursives X und gerundetes E, ein Sextil und ein '
          'Doppelkreuz (von den Telefontasten inspiriert), die Glyphen des '
          'Schriftgestalters Dwiggins — und schlicht die Buchstaben A und B '
          'aus der Computerwelt.',
    ),
    ProseSection(
      'Pitman, Unicode und die Umstellung 2026',
      'Die amerikanische Gesellschaft wechselte ihre Zeichen mehrmals: '
          'Sextil und Doppelkreuz bis etwa 2008, dann die Dwiggins-Glyphen, '
          'seit 2015 die Pitman-Ziffern. 2015 nahm auch der Unicode-Standard '
          'die Pitman-Zeichen offiziell auf.\n\n'
          'Anfang 2026 stellte die Gesellschaft ihre Webseiten auf die '
          'Buchstaben A und B um — nicht, weil sie Pitman aufgäbe, sondern '
          'weil die Sonderzeichen auf vielen Browsern und Handys noch nicht '
          'zuverlässig dargestellt werden. Im gedruckten Bulletin bleiben die '
          'Pitman-Ziffern der Standard. (Diese App zeigt im Display wahlweise '
          'eigene Glyphen oder 0–9 / A, B.)',
    ),
    ProseSection(
      'Little Twelvetoes',
      'Das bekannteste Stück Dozenal in der Popkultur ist ein Lied: „Little '
          'Twelvetoes" aus der US-Lehrserie Schoolhouse Rock, geschrieben und '
          'gesungen von Bob Dorough, erstmals 1973 ausgestrahlt.\n\n'
          'Darin zeigt ein freundlicher Außerirdischer mit zwölf Zehen, wie '
          'jemand mit zwölf „Fingern" zwei neue Ziffern erfunden hätte — '
          'gesprochen „dek" für Zehn und „el" für Elf. Es galt als zu schwer '
          'für Grundschulkinder und lief seltener als die übrigen Folgen, '
          'blieb vielen aber im Gedächtnis.',
    ),
  ], sources: [
    Source('Unicode-Proposal L2/15-116: Pitman-Ziffern (PDF)', 'https://www.unicode.org/L2/L2015/15116-pitman.pdf', 'R1', 'A1'),
    Source('Symbols, Symbols … Symbols — DSA', 'https://dozenal.org/drupal/content/symbols-symbols-%C2%A2-symbols.html', 'R1', 'A1'),
    Source('The DSA Symbology Synopsis', 'https://dozenal.org/drupal/content/dsa-symbology-synopsis.html', 'R2', 'A1'),
    Source('The Dozenal Society of America — Wikipedia', 'https://en.wikipedia.org/wiki/The_Dozenal_Society_of_America', 'R2', 'A1'),
    Source('Little Twelvetoes — Schoolhouse Rock Wiki', 'https://schoolhouserock.fandom.com/wiki/Little_Twelvetoes', 'R3', 'A1'),
  ]),
  ProseChapter('Do, Gro, Mo — dozenal sprechen', [
    ProseSection(
      'Dutzend, Gros und Großgros',
      'Die Zwölf wird in Basis Zwölf zur „10". Für ihre Stellen gibt es '
          'längst alltägliche Wörter: zwölf Stück sind ein Dutzend, zwölf '
          'Dutzend (144) ein Gros, zwölf Gros (1728) ein Großgros.\n\n'
          'Das ist bemerkenswert: Diese vertrauten Handelswörter sind in '
          'Wahrheit schon dozenale Stellenwerte — ein Dutzend ist die „10", '
          'das Gros die „100", das Großgros die „1000" der Zwölferwelt.',
    ),
    ProseSection(
      'Dek, el und die systematische Benennung',
      'Die zwei neuen Ziffern spricht man meist „dek" (Zehn) und „el" (Elf). '
          'Für die Stellen nutzt man kurz do, gro, mo (von dozen, gross, great '
          'gross).\n\n'
          'Daneben gibt es eine systematische Benennung, in der Online-'
          'Gemeinschaft entwickelt: feste Wortwurzeln für die Ziffern (un, '
          'bi, tri … dec, lev) plus Endungen für die Zwölferpotenzen — „-qua" '
          'nach oben, „-cia" nach unten. Schön dabei: „uncia" ist genau ein '
          'Zwölftel — dasselbe lateinische Wort, aus dem „Zoll" (inch) und '
          '„Unze" entstanden sind.',
    ),
  ], sources: [
    Source('Systematic Dozenal Nomenclature (Kurzfassung) — gorpub', 'https://gorpub.freeshell.org/dozenal/sdnbrief.html', 'R2', 'A1'),
    Source('Duodecimal — Wikipedia', 'https://en.wikipedia.org/wiki/Duodecimal', 'R2', 'A1'),
    Source('Base 12 — Numberphile (James Grime)', 'https://www.numberphile.com/videos/base-12', 'R3', 'A1'),
    Source('Engines of Our Ingenuity Nr. 3172: „Dozenels"', 'https://engines.egr.uh.edu/episode/3172', 'R3', 'A1'),
  ]),
  ProseChapter('TGM, Gesellschaften und Werkzeuge heute', [
    ProseSection(
      'TGM — ein dozenales Maßsystem',
      'Tom Pendlebury von der britischen Gesellschaft entwarf ein '
          'vollständiges dozenales Maßsystem: TGM, benannt nach seinen drei '
          'Grundeinheiten Tim, Grafut und Maz.\n\n'
          'Anders als das metrische System beginnt es nicht bei der Länge, '
          'sondern bei der Zeit und leitet alles über die Erdanziehung ab. Der '
          '„Grafut" (Gravitations-Fuß) liegt knapp unter einem Fuß. Daraus '
          'folgen kohärent Einheiten für Fläche, Volumen, Geschwindigkeit und '
          'Kraft — ein in sich geschlossenes Gegenstück zum Metrischen, ganz '
          'in Zwölf.',
    ),
    ProseSection(
      'Die Gesellschaften heute',
      'Beide Gesellschaften bestehen fort, sind aber klein und ehrenamtlich; '
          'verlässliche Mitgliederzahlen gibt es nicht. Die amerikanische '
          'gibt weiter das Duodecimal Bulletin heraus und stellt Lern- und '
          'Umrechnungs-Werkzeuge bereit, die britische pflegt vor allem das '
          'TGM-Material.\n\n'
          'Der lebendigste Ort ist das Online-Forum „Dozensonline". Dort '
          'entstanden die systematische Zahlen-Benennung und die nie ganz '
          'beendete Debatte um die richtigen Ziffern. Die Gemeinschaft ist '
          'klein, aber aktiv.',
    ),
    ProseSection(
      'Rechner, Apps — und diese App',
      'Rund um die Zwölf ist eine überraschend rege Werkzeug-Szene '
          'entstanden: dozenale Taschenrechner, Maß-Umrechner, sogar eine '
          'dozenale Uhr und ein Kalender, vieles davon quelloffen und von '
          'Mitgliedern der Gesellschaften gebaut.\n\n'
          'Diese App reiht sich genau dort ein — ein Rechner, der nativ in '
          'Basis Zwölf rechnet, mit eigenen Glyphen, exakten Brüchen und '
          'einem Einheitenteil. Sie ist ein kleiner Beitrag zu einer langen, '
          'liebevollen Nischen-Tradition.',
    ),
    ProseSection(
      'Warum die Welt trotzdem dezimal bleibt',
      'Dass sich die Zwölf nicht durchsetzt, liegt kaum an der Mathematik — '
          'die ist auf ihrer Seite. Es liegt an der Gewohnheit: Das '
          'Zehnersystem steckt in Sprache, Schule, Recht und Technik, und '
          'eine Umstellung wäre ungeheuer aufwendig. Selbst der viel kleinere '
          'Wechsel der USA aufs Metrische scheiterte daran.\n\n'
          'Entsprechend verstehen die meisten Beteiligten die Sache heute eher '
          'als reizvolles Gedankenexperiment denn als ernsten Umstellungsplan. '
          'Es zeigt, dass die Wahl der Zahlenbasis nicht selbstverständlich '
          'ist — und schärft den Blick für die Zahlen, mit denen wir täglich '
          'umgehen.',
    ),
  ], sources: [
    Source('TGM: A Coherent Dozenal Metrology (Pendlebury/Goodman) — DSA (PDF)', 'http://www.dozenal.org/drupal/sites_bck/default/files/tgm_0.pdf', 'R1', 'A1'),
    Source('TGM — fergusoncreations.co.uk', 'http://www.fergusoncreations.co.uk/home/shaun/metrology/tgm.htm', 'R2', 'A1'),
    Source('The Dozenal Society of America — Wikipedia', 'https://en.wikipedia.org/wiki/The_Dozenal_Society_of_America', 'R2', 'A1'),
    Source('Dozenal Society of America', 'https://dozenal.org/', 'R2', 'A1'),
    Source('Dozenal Suite (Apps) — dozenal.ca', 'https://dozenal.ca/suite/', 'R2', 'A1'),
    Source('Dozenal RPN Calculator — Eddie\'s Math and Calculator Blog', 'http://edspi31415.blogspot.com/2026/02/dozenal-rpn-calculator-app-for-android.html', 'R3', 'A1'),
  ]),
  ProseChapter('Dozecal — ein dozenaler Taschenrechner', [
    ProseSection(
      'Eine App für die Basis Zwölf',
      'Dozecal ist ein Taschenrechner für das iPhone, der nativ in Basis '
          'Zwölf rechnet. Veröffentlicht wurde er 2020 vom unabhängigen '
          'Entwickler Johan Kovacs; die App ist kostenlos. Ihr erklärtes Ziel '
          'ist es, den Gebrauch der Basis Zwölf in Mathematik und Wissenschaft '
          'zu fördern.\n\n'
          'Gerechnet wird wahlweise im Duodezimal- oder im Dezimalmodus. Beim '
          'Umschalten zwischen beiden wird der angezeigte Wert automatisch '
          'umgerechnet. Die trigonometrischen Funktionen arbeiten mit Grad als '
          'Maßeinheit.',
    ),
    ProseSection(
      'Umgekehrte polnische Notation',
      'Eine Besonderheit von Dozecal ist die Eingabe in umgekehrter '
          'polnischer Notation (UPN, englisch RPN). Statt „3 + 4 =" tippt man '
          'dort „3 4 +" — erst die beiden Zahlen, dann die Rechenoperation. '
          'Das wirkt zunächst ungewohnt, kommt aber ganz ohne Klammern aus und '
          'war auf vielen wissenschaftlichen Taschenrechnern (etwa von '
          'Hewlett-Packard) lange verbreitet.',
    ),
    ProseSection(
      'Teil der dozenalen Werkzeuglandschaft',
      'Dozecal ist nicht von einer Gesellschaft gebaut, sondern von einer '
          'einzelnen Person; in seiner Beschreibung verweist es für weitere '
          'Informationen zur Basis Zwölf auf die Dozenal Society of America. '
          'So gehört es zur kleinen, aber lebendigen Landschaft dozenaler '
          'Werkzeuge — neben dieser App, den TGM-Materialien und weiteren '
          'Rechnern.',
    ),
  ], sources: [
    Source('Dozecal — App Store (Apple)', 'https://apps.apple.com/app/id1521160089', 'R1', 'A1'),
  ]),
  ProseChapter('Paul Rapoports Dozenal Calculator', [
    ProseSection(
      'Ein Rechner im Browser',
      'Der Dozenal Calculator von Paul Rapoport ist ein wissenschaftlicher '
          'Taschenrechner, der direkt im Webbrowser läuft — kostenlos und ohne '
          'Installation. Er rechnet in Basis Zwölf und kann jederzeit auch '
          'dezimal anzeigen; die Zahlenbasis lässt sich frei wechseln, und '
          'mehrere unabhängige Register stehen bereit. Eine ausführliche '
          'Anleitung liegt als PDF bei.',
    ),
    ProseSection(
      'Stark in der Zahlentheorie',
      'Besonders reich ist die Zahlentheorie — was gut zu einer Basis passt, '
          'die gerade für ihre Teilbarkeit geschätzt wird. Der Rechner findet '
          'den größten gemeinsamen Teiler und das kleinste gemeinsame '
          'Vielfache, listet alle Teiler einer Zahl auf und zerlegt sie in '
          'Primfaktoren (wahlweise mit Vielfachheit). Dazu kommen die '
          'Teilersumme, die Anzahl der Teiler und die eulersche '
          'φ-Funktion — die Anzahl der kleineren Zahlen, die zu ihr teilerfremd '
          'sind.',
    ),
    ProseSection(
      'Der volle wissenschaftliche Werkzeugkasten',
      'Auch sonst ist der Werkzeugkasten vollständig: Quadrat und '
          'Quadratwurzel, beliebige Potenzen und Wurzeln, die '
          'Exponentialfunktion und Logarithmen — der natürliche Logarithmus '
          'sowie die Basen Zwei und Zehn und ein Logarithmus zu beliebiger '
          'Basis. Hinzu kommen die Winkel- und Hyperbelfunktionen mit ihren '
          'Umkehrungen, Kombinatorik (Kombinationen und Permutationen, auch mit '
          'Wiederholung), einfache Statistik (Mittelwert und '
          'Standardabweichung), die Fakultät, eine Prozentfunktion, die '
          'Gamma-Funktion und die imaginäre Einheit i.',
    ),
    ProseSection(
      'Sehr viele Größen',
      'Über das reine Rechnen hinaus deckt das Programm Dutzende physikalische '
          'Größen ab und rechnet sie ineinander um: Zeit und Tageszeit, '
          'Frequenz, Geschwindigkeit, Länge, Fläche, Trocken- und '
          'Flüssigvolumen, Masse, Kraft, Druck, Energie, Leistung, Temperatur '
          'und Winkel. Auch dozenale Zeiteinheiten sind dabei.',
    ),
    ProseSection(
      'Bis in die Elektrotechnik',
      'Ungewöhnlich für einen dozenalen Rechner ist, wie weit er in die '
          'angewandte Physik reicht: Er kennt eigene Größenbereiche für '
          'elektrische Impedanz, elektrische Quantität (Ladung), elektrisches '
          'Potential (Spannung) und elektrischen Strom. Damit lässt sich auch '
          'die Elektrotechnik in Basis Zwölf durchrechnen.',
    ),
  ], sources: [
    Source('Dozenal Calculator (Paul Rapoport)', 'https://doz-calc.mx-dev.com', 'R1', 'A1'),
  ]),
];
