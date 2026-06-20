// German prose for the "Wertetheorie" block — the theory companion to the
// Werterechner (value & money, precious metals, the gold/silver ratio, gold's
// purchasing power against food, reading the historical price curve). part of
// ../werte_theory.dart. Simple sentences (easier to translate). Facts and
// attributed views; honest caveats; deliberately complementary to the
// unit-theory `price` category (£sd / "money was weight"), which it references
// rather than repeats. Sources mostly reuse the curated kPriceSources of the
// chart (plus a Troy-weight reference).

part of '../werte_theory.dart';

List<ProseChapter> _werteChaptersDe() => const [
  ProseChapter(
    'Was ist Wert?',
    [
      ProseSection(
        'Wert ist nicht Preis',
        'Ein Preis ist, was eine Sache gerade kostet. Wert ist, was sie auf '
            'Dauer wert ist — ihr bleibender Nutzen. Die beiden fallen oft '
            'auseinander: Ein Preis steigt und fällt, während der Wert ungefähr '
            'derselbe bleibt.\n\n'
            'Geld ist dabei vor allem ein Maßstab. Mit ihm misst man Werte, so '
            'wie man mit dem Meter Längen misst. Damit das Messen verlässlich '
            'ist, müsste der Maßstab selbst einen stabilen Wert haben — und genau '
            'das ist die schwierige Stelle.',
      ),
      ProseSection(
        'Geld war Gewicht',
        'Lange war Geld schlicht gewogenes Metall. Eine Münze war ein '
            'Gewichtsstück mit einem Stempel, der Gewicht und Feinheit '
            'verbürgte. Viele Geldnamen sind darum Gewichtsnamen: Das englische '
            '„Pfund" (£) ist dasselbe Wort wie das Gewicht. Und wie auch in der '
            'Einheitentheorie unter „Währung" zu finden ist, ist das Zeichen „£" '
            'ein verziertes L für lateinisch libra, die Waage.\n\n'
            'Wie die alte Stückelung von Pfund, Schilling und Penny dozenal '
            'gebaut ist, steht ausführlich in der Einheitentheorie unter '
            '„Währung". Hier geht es um die Edelmetalle selbst und um die Frage, '
            'ob sie ihren Wert halten.',
      ),
      ProseSection(
        'Was Geld leisten muss',
        'Damit etwas als Geld taugt, muss es drei Dinge zugleich leisten. Es '
            'muss ein Tauschmittel sein: ein Ding, das jeder im Handel annimmt, '
            'damit man nicht Ware gegen Ware tauschen muss. Es muss eine '
            'Recheneinheit sein: ein gemeinsamer Maßstab, in dem sich alle Preise '
            'ausdrücken lassen. Und es muss ein Wertspeicher sein: etwas, das '
            'seinen Wert über die Zeit bewahrt, sodass man heute verdienen und '
            'morgen ausgeben kann.\n\n'
            'Diese drei Aufgaben hängen zusammen, ziehen aber nicht immer in '
            'dieselbe Richtung. Ein gutes Tauschmittel ist handlich und teilbar; '
            'ein guter Wertspeicher ist vor allem beständig. Manches Geld ist im '
            'Alltag bequem, hält aber den Wert schlecht; anderes hält den Wert '
            'gut, ist aber unhandlich.\n\n'
            'Diese Dreiteilung — Tauschmittel, Recheneinheit, Wertspeicher — ist '
            'eine alte und verbreitete Beschreibung dessen, was Geld tut. Sie ist '
            'ein nützliches Ordnungsschema, keine Naturgesetzmäßigkeit; '
            'Fachleute streiten darüber, welche der drei Aufgaben die '
            'wichtigste ist.',
        illustrationId: 'werte/money-functions',
      ),
      ProseSection(
        'Was den Wert hält',
        'Warum behält das eine seinen Wert und das andere nicht? Drei Dinge '
            'spielen zusammen. Das erste ist Knappheit: Was es im Überfluss gibt, '
            'taugt nicht als Wertspeicher, denn jeder kann es sich beschaffen. '
            'Das zweite ist Brauchbarkeit: Was niemand braucht oder begehrt, '
            'verliert seinen Wert, sobald die Mode verfliegt. Das dritte ist '
            'Vertrauen: Wert hält nur, was andere weiter anerkennen werden.\n\n'
            'Fehlt eines dieser drei, wankt der Wert. Etwas sehr Seltenes, das '
            'niemand will, ist wertlos. Etwas sehr Begehrtes, das beliebig '
            'vermehrbar ist, hält keinen Preis. Und selbst Seltenes und '
            'Brauchbares verliert seinen Wert, wenn das Vertrauen schwindet, dass '
            'morgen noch jemand es annimmt.\n\n'
            'Vertrauen ist dabei der heikelste Punkt. Es lässt sich nicht wiegen '
            'und nicht messen, und es kann rasch kippen. Vieles, was lange als '
            'sicherer Wert galt, hat seinen Wert verloren, als das Vertrauen '
            'darin zerbrach — von einst begehrten Waren bis zu staatlichem '
            'Papiergeld in Zeiten der Geldentwertung.',
      ),
      ProseSection(
        'Warum nun die Edelmetalle',
        'Wer einen verlässlichen Wertspeicher sucht, fragt also nach einem Ding, '
            'das knapp ist, das man braucht und dem man über lange Zeit traut. '
            'Wenige Dinge erfüllen alle drei Forderungen so lange wie die '
            'Edelmetalle — und mit ihnen ist auch das alte Geld aus Gewicht '
            'gebaut, von dem dieses Kapitel ausging.\n\n'
            'Darum wendet sich die Wertetheorie von hier an den Edelmetallen zu. '
            'Was diese Stoffe im Einzelnen ausmacht — warum gerade Metalle zu '
            'Geld wurden und welche Eigenschaften sie dazu befähigen —, ist '
            'Sache des nächsten Kapitels. Hier genügt der Übergang: vom Wert im '
            'Allgemeinen zu den Metallen, an denen sich der Wert über '
            'Jahrtausende festgemacht hat.',
      ),
    ],
    sources: [
      Source(
        'Money — Wikipedia',
        'https://en.wikipedia.org/wiki/Money',
        'R2',
        'A1',
      ),
      Source(
        'Britannica — money',
        'https://www.britannica.com/money/money',
        'R2',
        'A2',
      ),
      Source(
        'Value (economics) — Wikipedia',
        'https://en.wikipedia.org/wiki/Value_(economics)',
        'R2',
        'A1',
      ),
    ],
  ),
  ProseChapter(
    'Edelmetalle als Geld',
    [
      ProseSection(
        'Warum gerade Metalle',
        'Edelmetalle wurden über Jahrtausende zu Geld, weil sie vier Dinge '
            'zugleich können: Sie verderben nicht, man kann sie teilen und wieder '
            'einschmelzen, sie sind selten genug, um nicht beliebig zu sein, und '
            'man erkennt sie wieder. Gold, Silber, Platin und Palladium sind die '
            'vier, die der Werterechner kennt.\n\n'
            'Andere Dinge dienten auch schon als Geld — Muscheln, Salz, Vieh, '
            'Tabak. Doch keines hielt alle vier Eigenschaften zugleich. Vieh muss '
            'man füttern, Salz löst sich in Wasser, Muscheln lassen sich am '
            'Strand auflesen. Metall hat diese Schwächen nicht, und so setzte es '
            'sich überall dort durch, wo Handel über Grenzen und Zeiten hinweg '
            'lief.\n\n'
            'Welche Stoffeigenschaften Gold dabei besonders auszeichnen — dass '
            'es nicht anläuft, dicht und formbar ist —, steht eigens im Kapitel '
            '„Was Gold zu Gold macht".',
      ),
      ProseSection(
        'Ein Gramm Gold ist wie jedes andere',
        'Eine fünfte Eigenschaft trägt das Geld besonders: die Gleichartigkeit, '
            'fachlich Fungibilität. Ein Gramm reines Gold ist so gut wie jedes '
            'andere Gramm reines Gold. Es gibt kein „besseres" und kein '
            '„schlechteres" Stück gleicher Feinheit, kein Alter, keine Marke, '
            'keine persönliche Note. Reines Metall ist austauschbar bis aufs '
            'Atom.\n\n'
            'Gerade darin unterscheidet sich Metall von fast allem anderen. Zwei '
            'Häuser, zwei Felder, zwei Bilder sind nie ganz gleich; man muss '
            'jedes einzeln einschätzen. Zwei gleich schwere Stücke Feingold sind '
            'es. Diese Gleichheit macht das Metall zum natürlichen Maßstab: Man '
            'kann mit ihm rechnen wie mit einer Einheit, weil eine Einheit immer '
            'dasselbe bedeutet.',
      ),
      ProseSection(
        'Vom Klumpen zur Münze',
        'Zunächst wog man das Metall bei jedem Geschäft neu. Das war mühsam und '
            'lud zum Betrug ein — wer prüft schon bei jedem Handel Gewicht und '
            'Feinheit? Die Münze löste das Problem: ein genormtes Metallstück mit '
            'einem Stempel, der Gewicht und Feinheit verbürgt. Wer dem Prägeherrn '
            'traute, musste nicht mehr selbst wiegen.\n\n'
            'Die ersten Münzen entstanden im antiken Lydien; wie sich das '
            'Münzwesen für Gold und Silber dann entwickelte, tragen die Kapitel '
            '„Gold durch die Geschichte" und „Silber durch die Geschichte".\n\n'
            'Eine Münze ist also kein neues Geld, sondern altes Geld in '
            'verbürgter Form. Der Stempel ersetzt die Waage, nicht das Metall. '
            'Genau deshalb verlor eine Münze ihren Wert, sobald der Prägeherr '
            'heimlich unedles Metall beimischte — der Stempel log dann über das '
            'Gewicht, das er verbürgen sollte.',
      ),
      ProseSection(
        'Die vier Metalle des Werterechners',
        'Vier Edelmetalle kennt der Werterechner, und jedes hat sein eigenes '
            'Kapitel. Gold ist das Königsmetall: selten, beständig und seit '
            'Jahrtausenden der Inbegriff des Wertspeichers — was es physisch '
            'ausmacht, steht in „Was Gold zu Gold macht".\n\n'
            'Silber ist das Volksmetall, lange das Geld des täglichen Handels und '
            'zugleich ein wichtiger Werkstoff der Technik; sein eigener Weg läuft '
            'durch die Silber-Kapitel. Platin und Palladium schließlich sind die '
            'jüngsten im Bunde: edel, aber vor allem industriell gebraucht, '
            'besonders im Abgaskatalysator — ihr Doppelleben behandelt das '
            'Kapitel „Platin und Palladium: edel, aber industriell".\n\n'
            'Hier geht es nur um das Gemeinsame: dass alle vier die '
            'Geld-Eigenschaften tragen. Das Eigene jedes Metalls — seine '
            'Geschichte, sein Nutzen, sein Preisverhalten — heben die folgenden '
            'Kapitel.',
      ),
      ProseSection(
        'Troy: zwölf Unzen aufs Pfund',
        'Edelmetalle werden bis heute in Troy-Gewichten gewogen, und die sind '
            'echt dozenal: Zwölf Troy-Unzen ergeben ein Troy-Pfund. Alle Stufen '
            'sind ganzzahlige Vielfache des Grains — 1959 festgelegt auf '
            '0,06479891 Gramm: 24 Grain sind ein Pennyweight, 480 Grain eine '
            'Troy-Unze. Selbst die Feinheit zählt dozenal-nah: Die volle '
            'Reinheit misst man in vierundzwanzig Teilen, zweimal zwölf.\n\n'
            'Das Troy-Gewicht steht neben dem alltäglichen Avoirdupois-Gewicht, '
            'und das stiftet eine hübsche Verwirrung: Eine Troy-Unze ist rund '
            '9,7 Prozent schwerer als eine gewöhnliche Unze — aber das '
            'Troy-Pfund ist leichter als das gewöhnliche Pfund, weil es nur '
            'zwölf Unzen hat statt sechzehn. Die Zwölf ist hier also echt; dass '
            'man daraus aber keine „natürliche" Geldbasis ableiten sollte, '
            'steht am Ende dieses Blocks unter „Spekulatives".',
        illustrationId: 'werte/troy-ladder',
      ),
    ],
    sources: [
      Source(
        'Commodity money — Wikipedia',
        'https://en.wikipedia.org/wiki/Commodity_money',
        'R2',
        'A1',
      ),
      Source(
        'Coin — Wikipedia',
        'https://en.wikipedia.org/wiki/Coin',
        'R2',
        'A1',
      ),
      Source(
        'Troy weight — Wikipedia',
        'https://en.wikipedia.org/wiki/Troy_weight',
        'R2',
        'A1',
      ),
    ],
  ),
  ProseChapter(
    'Was Gold zu Gold macht',
    [
      ProseSection(
        'Es läuft nicht an',
        'Andere Metalle rosten oder laufen an. Eisen wird braun, Silber wird '
            'dunkel, Kupfer wird grün. Gold tut das nicht: An Luft und Wasser '
            'oxidiert es nicht, und es läuft auch nach Jahrtausenden nicht an. '
            'Goldschmuck aus alten Gräbern kommt blank ans Licht, als wäre er '
            'eben gefertigt.\n\n'
            'Völlig unangreifbar ist Gold aber nicht. In Königswasser, einer '
            'Mischung aus Salz- und Salpetersäure, löst es sich auf. Man sagt '
            'darum genauer: Gold läuft nicht an und oxidiert nicht — „chemisch '
            'völlig unangreifbar" wäre zu viel gesagt.',
      ),
      ProseSection(
        'Schwer und dicht',
        'Gold ist erstaunlich schwer. Ein kleiner Würfel wiegt viel mehr, als '
            'man ihm ansieht. Die Dichte liegt bei rund 19,3 Gramm je '
            'Kubikzentimeter — fast zwanzigmal so schwer wie Wasser und deutlich '
            'schwerer als Blei.\n\n'
            'Diese Dichte ist praktisch. Man kann Gold leicht von leichteren '
            'Fälschungen unterscheiden, indem man es wiegt und sein Volumen '
            'misst. Echtes Gold verrät sich durch sein Gewicht.',
        illustrationId: 'werte/density',
      ),
      ProseSection(
        'Weich und formbar',
        'Reines Gold ist weich. Man kann es mit dem Fingernagel ritzen und zu '
            'hauchdünnen Blättern hämmern. Aus einem einzigen Gramm lässt sich '
            'Blattgold von ungefähr einem halben Quadratmeter Fläche schlagen — '
            'so dünn, '
            'dass Licht hindurchschimmert.\n\n'
            'Ebenso lässt sich Gold zu feinsten Drähten ziehen. Diese '
            'Formbarkeit macht es zum Traum jedes Goldschmieds. Weil reines Gold '
            'für den täglichen Gebrauch oft zu weich ist, mischt man es mit '
            'anderen Metallen — dazu mehr im Kapitel über den Feingehalt.',
      ),
      ProseSection(
        'Selten, aber nicht zu selten',
        'Gold ist selten, aber nicht so selten, dass es niemand finden könnte. '
            'Diese Mitte ist wichtig. Wäre Gold häufig wie Eisen, taugte es nicht '
            'als Wertspeicher. Wäre es so selten, dass kaum jemand es je zu '
            'Gesicht bekäme, taugte es nicht als Geld.\n\n'
            'Wie viel Gold die Menschheit im Lauf der Geschichte gefördert hat, '
            'lässt sich nur schätzen. Eine oft genannte Schätzung besagt, alles '
            'je geförderte Gold zusammengenommen passe in einen Würfel von gut '
            'zwanzig Metern Kante. Das ist eine grobe Schätzung, keine genaue '
            'Zahl — sie soll nur ein Gefühl für die Größenordnung geben.',
      ),
      ProseSection(
        'Die warme Farbe',
        'Die meisten Metalle sind silbrig-grau. Gold ist eine der wenigen '
            'Ausnahmen: Es leuchtet warm gelb. Nur Kupfer hat ebenfalls eine '
            'eigene Farbe, ein rötliches Braun.\n\n'
            'Diese warme Farbe hat Gold seit jeher mit der Sonne verbunden. Sie '
            'lässt sich nicht nachahmen, ohne wieder Gold zu verwenden, und sie '
            'verblasst nicht. Ein Stück Gold sieht in tausend Jahren noch so aus '
            'wie heute.',
      ),
    ],
    sources: [
      Source(
        'Gold — Wikipedia',
        'https://de.wikipedia.org/wiki/Gold',
        'R2',
        'A1',
      ),
      Source(
        'Royal Society of Chemistry — Gold',
        'https://www.rsc.org/periodic-table/element/79/gold',
        'R2',
        'A2',
      ),
      Source(
        'USGS — Gold Statistics and Information',
        'https://www.usgs.gov/centers/national-minerals-information-center/gold-statistics-and-information',
        'R1',
        'A2',
      ),
    ],
  ),
  ProseChapter(
    'Gold durch die Geschichte',
    [
      ProseSection(
        'Das erste Gold der Menschheit',
        'Gold war eines der ersten Metalle, mit denen Menschen arbeiteten. Es '
            'liegt oft in reiner Form in der Natur, als Klumpen oder Flitter in '
            'Flüssen, und muss nicht erst aus Erz geschmolzen werden. Man konnte '
            'es einfach aufheben und hämmern.\n\n'
            'Das älteste bekannte verarbeitete Gold stammt aus den Gräbern von '
            'Warna am Schwarzen Meer, rund viereinhalbtausend Jahre vor unserer '
            'Zeitrechnung. Dort lagen Menschen mit kunstvollem Goldschmuck — ein '
            'früher Hinweis, dass Gold schon damals Rang und Reichtum bedeutete.',
      ),
      ProseSection(
        'Die ersten Goldmünzen: Lydien und Kroisos',
        'Lange war Gold Schmuck und Barren, kein gemünztes Geld. Das änderte '
            'sich im alten Lydien, in der heutigen Türkei. Dort prägte man zuerst '
            'Münzen aus Elektron, einer natürlichen Mischung aus Gold und '
            'Silber.\n\n'
            'Als erste reine Goldmünzen gelten die des Königs Kroisos von '
            'Lydien, der für seinen Reichtum sprichwörtlich wurde — „reich wie '
            'Krösus" sagt man bis heute. Mit ihm trennte sich das gemünzte Gold '
            'vom gemünzten Silber, und der Wert einer Münze hing nun an einem '
            'reinen Metall.',
      ),
      ProseSection(
        'Byzanz und der lange Solidus',
        'Das Römische Reich prägte Goldmünzen, doch ihr Feingehalt schwankte. '
            'Beständiger war der Solidus, eine Goldmünze, die Kaiser Konstantin '
            'einführte und die das Oströmische Reich von Byzanz aus über viele '
            'Jahrhunderte fast unverändert hielt.\n\n'
            'Ein Geld, das so lange seine Feinheit behielt, war eine seltene '
            'Leistung. Der Solidus wurde im halben Mittelmeerraum als '
            'verlässliches Handelsgeld angenommen. Sein Name lebt im Wort „Sold" '
            'und in der italienischen Münze „soldo" weiter.',
      ),
      ProseSection(
        'Goldrausch und Weltgeld',
        'Im neunzehnten Jahrhundert lösten große Funde wahre Wanderungen aus. '
            'In Kalifornien, in Australien und am Klondike zogen Hunderttausende '
            'los, um Gold aus Flüssen und Bergen zu waschen. Diese Goldräusche '
            'gründeten Städte und veränderten ganze Länder.\n\n'
            'Die Menge an neuem Gold festigte zugleich seine Rolle als Weltgeld. '
            'Immer mehr Staaten banden ihr Geld an Gold, und der Handel zwischen '
            'den Ländern rechnete in einer gemeinsamen, goldgedeckten Größe.',
      ),
      ProseSection(
        'Goldstandard und sein Ende',
        'Im Goldstandard versprach ein Staat, sein Papiergeld jederzeit gegen '
            'eine feste Menge Gold einzutauschen. Das gab dem Geld einen festen '
            'Anker, band aber zugleich die Hände der Regierungen.\n\n'
            'Schritt für Schritt wurde dieser Anker gelöst, und 1971 endete die '
            'Einlösbarkeit des US-Dollars in Gold ganz. Seither ist kein großes '
            'Geld mehr durch Gold gedeckt. Wie der Goldstandard im Einzelnen '
            'funktionierte, gehört in ein eigenes Kapitel über das Geldwesen; '
            'hier zählt nur der lange Faden von der ersten Münze bis zu seinem '
            'Ende.',
      ),
    ],
    sources: [
      Source(
        'Varna Necropolis — Wikipedia',
        'https://en.wikipedia.org/wiki/Varna_Necropolis',
        'R2',
        'A2',
      ),
      Source(
        'Croesus — Wikipedia',
        'https://en.wikipedia.org/wiki/Croesus',
        'R2',
        'A2',
      ),
      Source(
        'Federal Reserve History — Gold Reserve Act of 1934',
        'https://www.federalreservehistory.org/essays/gold-reserve-act',
        'R1',
        'A2',
      ),
      Source(
        'Britannica — Gold standard',
        'https://www.britannica.com/topic/gold-standard',
        'R2',
        'A2',
      ),
    ],
  ),
  ProseChapter(
    'Gold in den Kulturen der Welt',
    [
      ProseSection(
        'Ägypten: Fleisch der Götter',
        'Im alten Ägypten galt Gold als göttlich. Man nannte es das „Fleisch '
            'der Götter", denn es leuchtete wie die Sonne und lief niemals an — '
            'es schien unsterblich. Die Totenmaske des Tutanchamun ist bis heute '
            'das berühmteste Stück dieser Goldkunst.\n\n'
            'Gold gehörte vor allem den Göttern und dem König. Es schmückte '
            'Tempel und Gräber und sollte den Toten ins ewige Leben begleiten. '
            'Solche Bedeutungen sind Glaubensvorstellungen ihrer Zeit, doch sie '
            'prägten, wie die Ägypter Gold gewannen und einsetzten.',
      ),
      ProseSection(
        'Mesopotamien und der Nahe Osten',
        'In den Städten Mesopotamiens — Sumer, Babylon, Assur — war Gold '
            'Tempelschatz und Königsschmuck. Aus den Königsgräbern von Ur kamen '
            'Helme, Becher und Schmuck aus feinem Gold ans Licht.\n\n'
            'Im Nahen Osten lief auch früh die Rechnung mit Gold und Silber '
            'nach Gewicht. Der Handel zwischen den Reichen brauchte ein Metall, '
            'das überall galt — und Gold war über alle Grenzen hinweg '
            'anerkannt.',
      ),
      ProseSection(
        'Anden und Inka: Schweiß der Sonne',
        'In den Anden hatte Gold keinen Geldwert, sondern einen heiligen. Eine '
            'überlieferte Wendung nennt das Gold den „Schweiß der Sonne" und das '
            'Silber die „Tränen des Mondes". Die Inka schmückten damit Tempel und '
            'Herrscher, nicht den Markt.\n\n'
            'Als die spanischen Eroberer kamen, raubten und verschifften sie '
            'große Mengen indianischen Goldes nach Europa und schmolzen vieles '
            'davon ein. Aus jener Zeit stammt auch der Mythos von El Dorado, dem '
            'sagenhaften „vergoldeten" Land — gesucht, aber nie gefunden.',
      ),
      ProseSection(
        'Westafrika und Mali: Mansa Musas Pilgerfahrt',
        'Das mittelalterliche Reich Mali in Westafrika war reich an Gold. Sein '
            'Herrscher Mansa Musa unternahm 1324 eine Pilgerfahrt nach Mekka und '
            'kam durch Kairo. Dass er dort große Mengen Gold ausgab und '
            'verschenkte, ist gut bezeugt.\n\n'
            'Wie viel genau und wie lange, ist von Legenden umrankt — manche '
            'Berichte sagen, sein Gold habe den Wert des Metalls in Kairo für '
            'Jahre gedrückt. Der Kern ist verbürgt, das Ausmaß sagenhaft '
            'übertrieben. Sicher ist: Malis Gold machte das Reich in der ganzen '
            'damaligen Welt berühmt.',
      ),
      ProseSection(
        'China: Maß und Zurückhaltung',
        'In China spielte Gold lange eine andere Rolle als im Westen. Als Geld '
            'dienten vor allem Bronze und Silber, später auch Papiergeld, das '
            'China früh erfand. Gold war eher Schatz und Kunstwerk als '
            'Umlaufmittel.\n\n'
            'In der Gestaltung herrschte oft ein Maß, eine Zurückhaltung. Gold '
            'wurde geschätzt, aber nicht in jeder Form zur Schau gestellt. Erst '
            'in jüngerer Zeit wurde Gold auch in China zu einer breit '
            'verbreiteten Anlage.',
      ),
      ProseSection(
        'Indien: die lebendige Goldkultur',
        'In Indien ist Gold bis heute tief im Leben verankert. Zu Hochzeiten '
            'und Festen wie Diwali wird Gold verschenkt und getragen; es gehört '
            'zur Mitgift und gilt als Segen. Kaum eine Kultur verbindet Gold so '
            'eng mit dem Familienleben.\n\n'
            'Schätzungen zufolge liegt in indischen Haushalten und Tempeln eine '
            'der größten privaten Goldmengen der Welt — vieles davon als Schmuck. '
            'Der World Gold Council, der als Interessenvertretung der '
            'Goldbranche selbst Partei ist, hebt diese Rolle Indiens immer wieder '
            'hervor. Feste Zahlen dazu sind unsicher; sicher ist die '
            'außergewöhnliche kulturelle Bedeutung.',
      ),
    ],
    sources: [
      Source(
        'Mansa Musa — Wikipedia',
        'https://en.wikipedia.org/wiki/Mansa_Musa',
        'R2',
        'A2',
      ),
      Source(
        'Met Museum — Gold in the Ancient Americas',
        'https://www.metmuseum.org/toah/hd/gold/hd_gold.htm',
        'R2',
        'A2',
      ),
      Source(
        'World Gold Council — India and gold (Interessenvertretung)',
        'https://www.gold.org/about-gold/gold-culture/gold-india',
        'R3',
        'A2',
      ),
      Source(
        'El Dorado — Wikipedia',
        'https://en.wikipedia.org/wiki/El_Dorado',
        'R2',
        'A1',
      ),
    ],
  ),
  ProseChapter(
    'Schmuck und Wertspeicher',
    [
      ProseSection(
        'Reichtum, den man trägt',
        'Gold ist seit jeher Reichtum, den man am Körper tragen kann. Ein Ring, '
            'eine Kette, ein Armreif sind zugleich Schmuck und gespartes '
            'Vermögen. Wer Gold trägt, zeigt seinen Wohlstand und führt ihn '
            'zugleich mit sich.\n\n'
            'Diese Doppelnatur macht Gold besonders. Es ist schön und nützlich '
            'zugleich, Zierde und Rücklage in einem Stück. Andere Wertspeicher — '
            'ein Haus, ein Feld — kann man nicht um den Hals tragen.',
      ),
      ProseSection(
        'Mitgift und Notgroschen',
        'In vielen Kulturen ist Goldschmuck die Mitgift, die eine Braut in die '
            'Ehe bringt. Er gehört ihr und ist im Notfall ihre eigene Rücklage. '
            'So verbindet Gold den festlichen Anlass mit nüchterner Vorsorge.\n\n'
            'Auch sonst war Gold oft der letzte Notgroschen. In Kriegen und auf '
            'der Flucht ließ sich kleines, wertvolles Gold mitnehmen und überall '
            'eintauschen, wo Papiergeld nichts mehr galt. Diese Verlässlichkeit '
            'in der Krise gehört zu Golds Ruf.',
      ),
      ProseSection(
        'Feingehalt: Karat lesen',
        'Reines Gold hat 24 Karat. Eine Angabe wie 18 Karat heißt: achtzehn '
            'von vierundzwanzig Teilen sind Gold, der Rest sind andere Metalle. '
            '14 Karat sind entsprechend vierzehn Teile von vierundzwanzig. Warum '
            'gerade vierundzwanzig die volle Reinheit markiert, ist in der '
            'Einheitentheorie unter den Edelmetallen näher betrachtet.\n\n'
            'Wichtig ist, dieses Karat nicht mit dem Karat der Edelsteine zu '
            'verwechseln. Bei Diamanten ist ein Karat ein Gewicht von einem '
            'fünftel Gramm. Beim Gold dagegen ist Karat kein Gewicht, sondern ein '
            'Maß für die Reinheit.',
      ),
      ProseSection(
        'Barren, Münzen, Schmuck',
        'Gold kommt in drei Hauptgestalten zum Anleger: als Barren, als Münze '
            'und als Schmuck. Barren gibt es vom Gramm bis zum schweren Block; '
            'Münzen sind handlich und weithin bekannt; Schmuck verbindet den '
            'Metallwert mit der Arbeit des Goldschmieds.\n\n'
            'Je nach Gestalt steckt im Preis mehr oder weniger über den reinen '
            'Metallwert hinaus. Bei Schmuck zahlt man die Verarbeitung mit, bei '
            'Barren am wenigsten. Welche Form die beste ist, hängt davon ab, ob '
            'man sammeln, sparen oder schmücken will.',
      ),
      ProseSection(
        'Warum Schmuck nie nur Schmuck ist',
        'Mancher hält Gold für die beste aller Anlagen — krisenfest, knapp und '
            'seit Jahrtausenden begehrt. Diese Sicht ist verbreitet, aber sie '
            'hat eine Kehrseite: Gold zahlt keinen Zins und wirft keinen Ertrag '
            'ab, und seine Lagerung sicher zu halten kostet etwas.\n\n'
            'Darum ist Goldschmuck nie nur Schmuck und nie nur Anlage. Er ist '
            'beides zugleich, und gerade darin liegt sein eigener Reiz: Man '
            'trägt etwas Schönes und hält zugleich einen Wert in der Hand, der '
            'über Generationen hinweg etwas gilt.',
      ),
    ],
    sources: [
      Source(
        'Colored gold — Wikipedia',
        'https://en.wikipedia.org/wiki/Colored_gold',
        'R2',
        'A1',
      ),
      Source(
        'The Goldsmiths\' Company — Hallmarking',
        'https://www.thegoldsmiths.co.uk/company/london-assay-office/hallmarking/',
        'R2',
        'A2',
      ),
    ],
  ),
  ProseChapter(
    'Das Gold-Silber-Verhältnis über die Jahrtausende',
    [
      ProseSection(
        'Was die Ratio überhaupt sagt',
        'Das Gold-Silber-Verhältnis sagt, wie viele Einheiten Silber eine Einheit '
            'Gold wert sind — bei gleichem Gewicht. Steht es bei sechzehn zu eins, '
            'so wiegt das Silber, das ein Goldstück aufwiegt, sechzehnmal so viel '
            'wie das Goldstück selbst. Eine größere Zahl heißt also: Silber ist '
            'gegenüber Gold billiger geworden.\n\n'
            'Die Ratio ist kein fester Naturwert. Sie ist ein Preis, und Preise '
            'bewegen sich. Über die Jahrtausende ist diese Zahl von der Nähe der '
            'Zwölf bis weit über die Sechzig gewandert. Diese Wanderung ist es, '
            'die das Diagramm im Werterechner zeigt.',
      ),
      ProseSection(
        'Antike: nahe der Zwölf, aber streuend',
        'In der Antike lag das Verhältnis oft im Bereich von etwa acht bis '
            'dreizehn zu eins — meist nahe der Zwölf, in einzelnen frühen Fällen '
            'aber deutlich darunter. In Ägypten, Babylon, Griechenland und Rom '
            'finden sich Werte in dieser Größenordnung. Alle '
            'diese Zahlen sind gerundete Größenordnungen, keine genauen Messwerte.\n\n'
            'Wichtig ist, was dabei nicht stimmt: Dass die Ratio „früher immer '
            'zwölf" gewesen sei, ist zu glatt. Die antiken Werte streuten je nach '
            'Region und Zeit erheblich, und die Belege sind lückenhaft. Die '
            'Geschichte des Verhältnisses über die Jahrtausende gehört ganz diesem '
            'Kapitel; andere Kapitel verweisen darauf, statt sie zu wiederholen.',
      ),
      ProseSection(
        'Mittelalter und frühe Neuzeit',
        'Im Mittelalter und der frühen Neuzeit blieb das Verhältnis lange in der '
            'Nähe von zehn bis sechzehn zu eins. Münzherren legten es in ihren '
            'Ordnungen fest, doch der Markt hielt sich nicht immer daran.\n\n'
            'Mit den großen Silberfunden in Amerika ab dem sechzehnten Jahrhundert '
            'kam viel Silber nach Europa. Mehr Silber bei gleichbleibendem Gold '
            'drückte den Silberpreis, und das Verhältnis weitete sich langsam. Die '
            'Bewegung war kein Sprung, sondern ein Driften über Generationen.',
      ),
      ProseSection(
        'Die große Spreizung der Moderne',
        'Im neunzehnten und zwanzigsten Jahrhundert spreizte sich das Verhältnis '
            'weit auf. Nachdem das Silber entmünzt war und kein Metall mehr das '
            'Geld deckte, war Silber vor allem ein Industriemetall, Gold blieb '
            'Wertspeicher. In dieser Spanne liegt das Verhältnis seither oft '
            'irgendwo zwischen fünfzig und neunzig zu eins.\n\n'
            'Diese Spanne ist als grobe Größenordnung gemeint, nicht als '
            'tagesgenauer Wert. Kurzzeitig kann die Ratio stark ausschlagen: '
            'Anfang 1980 trieben die Brüder Hunt den Silberpreis auf knapp '
            'fünfzig Dollar je Unze; am „Silbernen Donnerstag", dem 27. März '
            '1980, brach er dann ein. Solch eine Spitze ist ein Ausnahmefall, '
            'kein typischer Stand.',
      ),
      ProseSection(
        'So liest man die Ratio in der Kurve',
        'Das Diagramm im Werterechner zeigt nicht die Ratio selbst, sondern die '
            'Reihe „Silber in Gold". Das ist ihr Kehrwert: eins geteilt durch das '
            'Gold-Silber-Verhältnis. Darum dreht sich die Leserichtung um.\n\n'
            'Steigt das Verhältnis — wird Silber gegenüber Gold also billiger —, so '
            'fällt die Linie „Silber in Gold". Eine fallende Linie unter der '
            'Nulllinie bedeutet hier ein sich weitendes Verhältnis. Man sieht die '
            'Spreizung der Moderne also als langes Absinken, nicht als Anstieg. Die '
            'antiken Punkte stehen als einzelne Ringe nahe der Mitte, weil sie nur '
            'als Größenordnung bekannt sind.',
        illustrationId: 'werte/ratio-curve',
      ),
    ],
    sources: [
      Source(
        'Gold and Silver: Relative Values in the Ancient Past (Ross & Bettenay, 2024)',
        'https://www.cambridge.org/core/journals/cambridge-archaeological-journal',
        'R2',
        'A2',
      ),
      Source(
        'Gold–silver ratio — Wikipedia',
        'https://en.wikipedia.org/wiki/Gold%E2%80%93silver_ratio',
        'R2',
        'A1',
      ),
      Source(
        'World Bank — Commodity Markets „Pink Sheet"',
        'https://www.worldbank.org/en/research/commodity-markets',
        'R1',
        'A1',
      ),
      Source(
        'Silver Thursday — Wikipedia',
        'https://en.wikipedia.org/wiki/Silver_Thursday',
        'R2',
        'A1',
      ),
    ],
  ),
  ProseChapter(
    'Warum sich das Verhältnis verschob',
    [
      ProseSection(
        'Bimetallismus und Greshams Gesetz',
        'Lange standen Gold und Silber zugleich als Geld nebeneinander. Das nennt '
            'man Bimetallismus. Damit beide als Münzen umliefen, legten Staaten ein '
            'festes Verhältnis zwischen ihnen fest — etwa sechzehn zu eins.\n\n'
            'Wich der freie Marktpreis von diesem festen Münzwert ab, geschah '
            'Folgendes: Das Metall, das in der Münze unterbewertet war, war als '
            'Rohmetall mehr wert. Die Leute hielten es zurück oder schmolzen es ein, '
            'und im Umlauf blieb das überbewertete. Das ist Greshams Gesetz — '
            'schlechtes Geld verdrängt gutes. Es gilt als empirische Faustregel '
            'unter festen Münzkursen, nicht als Naturgesetz.',
      ),
      ProseSection(
        'Die Münzgesetze und der „Crime of 1873"',
        'Die USA legten 1792 ein Verhältnis von fünfzehn zu eins fest, 1834 dann '
            'rund sechzehn zu eins. 1873 nahm ein Münzgesetz das Silber aus der '
            'freien Ausprägung — die USA gingen damit faktisch zum Goldstandard '
            'über.\n\n'
            'Dass das Gesetz beschlossen wurde und später von der „Free Silver"-'
            'Bewegung den Namen „Crime of 1873" erhielt, ist belegt. Ob dahinter '
            'eine bewusste Verschwörung gegen das Silber stand, ist dagegen eine '
            'attribuierte politische Meinung, kein gesicherter Befund. Die einen '
            'sahen einen stillen Staatsstreich, die anderen einen technischen '
            'Schritt einer ohnehin laufenden Entwicklung.',
      ),
      ProseSection(
        'Silber wird Industriemetall, Gold bleibt Geld',
        'Im zwanzigsten Jahrhundert trennten sich die Rollen der beiden Metalle. '
            'Silber wurde vor allem in der Industrie gebraucht — in Fotografie, '
            'Elektrik und später Elektronik. Sein Preis hing damit zunehmend an '
            'Angebot und Nachfrage der Technik.\n\n'
            'Gold dagegen blieb in erster Linie Wertspeicher und Reserve der '
            'Notenbanken. Was als Geld gilt und was als Werkstoff, das prägt den '
            'Preis. Diese auseinanderlaufenden Rollen sind einer der Gründe, warum '
            'sich das Verhältnis so weit spreizte.',
      ),
      ProseSection(
        'Förderung und Vorkommen in der Erdkruste',
        'In der Erdkruste ist Silber deutlich häufiger als Gold — grob das '
            'Fünfzehn- bis Zwanzigfache, je nach Schätzung. Auch '
            'gefördert wird Jahr für Jahr mehr Silber als Gold. Diese Zahlen sind '
            'grobe geologische Größenordnungen, keine festen Werte.\n\n'
            'Man könnte meinen, allein die Häufigkeit lege das Geldverhältnis fest. '
            'So einfach ist es nicht. Wie teuer ein Metall ist, hängt auch daran, '
            'wie schwer es zu gewinnen ist, wofür man es braucht und welche Rolle '
            'es im Geldwesen spielt. Die geologische Häufigkeit ist nur eine '
            'Zutat unter mehreren.',
        illustrationId: 'werte/crust-vs-money',
      ),
      ProseSection(
        'Ein ehrlicher Vorbehalt zu den Ursachen',
        'Keine einzelne Ursache erklärt die Verschiebung. Münzgesetze, Greshams '
            'Gesetz, die neue Rolle des Silbers in der Industrie, Funde und '
            'Förderung — alles wirkte zusammen. Wer eine einzige Schuldige sucht, '
            'vereinfacht zu stark.\n\n'
            'Die genannten Zahlen — Münzkurse, Förderung, Häufigkeit — sind als '
            'Größenordnungen zu lesen. Und der „Crime of 1873" bleibt in dem Punkt '
            'umstritten, der über das belegte Gesetz hinausgeht: Die Deutung als '
            'Verschwörung ist Meinung, nicht Tatsache.',
      ),
    ],
    sources: [
      Source(
        'U.S. Mint — „Crime of 1873"',
        'https://www.usmint.gov/news/inside-the-mint/mint-history-crime-of-1873',
        'R1',
        'A2',
      ),
      Source(
        'Coinage Act of 1873 — Wikipedia',
        'https://en.wikipedia.org/wiki/Coinage_Act_of_1873',
        'R2',
        'A1',
      ),
      Source(
        'Bimetallism — Wikipedia',
        'https://en.wikipedia.org/wiki/Bimetallism',
        'R2',
        'A1',
      ),
      Source(
        'Gresham\'s law — Wikipedia',
        'https://en.wikipedia.org/wiki/Gresham%27s_law',
        'R2',
        'A1',
      ),
      Source(
        'USGS — National Minerals Information Center (Gold/Silver)',
        'https://www.usgs.gov/centers/national-minerals-information-center',
        'R1',
        'A2',
      ),
    ],
  ),
  ProseChapter(
    'Die Ratio als Strategie und der Mythos der natürlichen Zahl',
    [
      ProseSection(
        'Mean Reversion: ein Strategie-Glaube',
        'Manche Anleger gehen davon aus, das Gold-Silber-Verhältnis kehre auf Dauer '
            'zu einem Mittelwert zurück. Ist die Ratio hoch, kaufen sie Silber; ist '
            'sie niedrig, kaufen sie Gold. Diese Idee heißt „Mean Reversion", '
            'Rückkehr zum Mittel.\n\n'
            'Das ist eine Anlage-Überzeugung, kein bewiesenes Gesetz. Ein '
            'Verhältnis, das in einem Jahrhundert um zehn schwankte, kann in einem '
            'anderen ganz woanders pendeln. Dieses Kapitel gibt keine Kauf- oder '
            'Verkaufsempfehlung — es beschreibt nur, was Leute glauben.',
      ),
      ProseSection(
        'Die Krustenhäufigkeit gegen das Geldverhältnis',
        'Dass Silber in der Erdkruste viel häufiger ist als Gold, ist im Kapitel '
            '„Warum sich das Verhältnis verschob" erklärt. Daraus folgt aber kein '
            '„natürliches" Geldverhältnis: Die Häufigkeit in der Kruste und der '
            'Preis im Geldwesen sind zwei verschiedene Dinge.\n\n'
            'Der Preis hängt zusätzlich an Förderkosten, Industriebedarf, '
            'Geldordnungen und Vertrauen. Die geologische Häufigkeit und das '
            'Geldverhältnis in einen Topf zu werfen, führt in die Irre.',
      ),
      ProseSection(
        'Ist 16 (oder 12) eine „natürliche" Zahl?',
        'Man hört, das Verhältnis sei „von Natur aus" sechzehn zu eins oder zwölf '
            'zu eins. Das ist Folklore, kein Befund. Die runden Zahlen kamen aus '
            'Münzgesetzen — sie waren politische und praktische Setzungen, keine '
            'Naturkonstanten.\n\n'
            'Dass Troy-Gewicht und alte Münzstückelungen dozenal gebaut sind, ist '
            'belegt und steht in der Einheitentheorie. Die Zwölf war beim Teilen '
            'nützlich. Daraus aber ein „natürliches" Wertverhältnis von Gold zu '
            'Silber abzuleiten, ist ein Sprung, den die Belege nicht tragen.',
      ),
      ProseSection(
        'Was die Ratio bedeutet — und was nicht',
        'Die Ratio ist ein nützliches Maß, um Gold und Silber zu vergleichen, und '
            'ein Stück Wirtschaftsgeschichte. Mehr ist sie nicht. Sie ist kein '
            'verstecktes Naturgesetz und kein sicherer Wegweiser für die Zukunft.\n\n'
            'Behauptungen, der Silbermarkt werde gezielt gedrückt, kursieren — sie '
            'bleiben hier als umstritten und attribuiert markiert, nicht als '
            'Tatsache. Und feste Verhältnisse zwischen Papier und physischem Metall, '
            'wie sie manchmal genannt werden, sind kein gesicherter Wert. Wer die '
            'Ratio liest, liest Geschichte und Gegenwart — keine Prophezeiung.',
      ),
    ],
    sources: [
      Source(
        'Gold–silver ratio — Wikipedia',
        'https://en.wikipedia.org/wiki/Gold%E2%80%93silver_ratio',
        'R2',
        'A1',
      ),
      Source(
        'Abundance of elements in Earth\'s crust — Wikipedia',
        'https://en.wikipedia.org/wiki/Abundance_of_elements_in_Earth%27s_crust',
        'R2',
        'A1',
      ),
      Source(
        'USGS — Mineral Commodity Summaries',
        'https://www.usgs.gov/centers/national-minerals-information-center',
        'R1',
        'A2',
      ),
    ],
  ),
  ProseChapter(
    'Silber durch die Geschichte',
    [
      ProseSection(
        'Das Volksmetall, nicht das Königsmetall',
        'Gold war das Metall der Könige und der Schätze. Silber war das Metall '
            'des täglichen Geldes. Wer im Alltag kaufte und verkaufte, zahlte über '
            'Jahrtausende meist in Silber, nicht in Gold.\n\n'
            'Das hat einen einfachen Grund: Silber ist seltener als gewöhnliche '
            'Metalle, aber häufiger als Gold. Es reichte für viele Hände und viele '
            'Münzen. So wurde es das Metall des Marktes — wertvoll genug, um zu '
            'zählen, und doch verbreitet genug, um zu zirkulieren.',
      ),
      ProseSection(
        'Geld heißt Silber — argent, plata',
        'In mehreren Sprachen ist „Geld" schlicht das Wort für Silber. Im '
            'Französischen heißt argent zugleich Silber und Geld. Im Spanischen '
            'steht plata für beides. Auch in weiteren Sprachen fallen die beiden '
            'Begriffe zusammen.\n\n'
            'Das ist aber kein Gesetz. Das englische „money" geht über das '
            'Lateinische auf moneta, die Münzstätte, zurück; das deutsche „Geld" '
            'stammt vom althochdeutschen „gelt", der Zahlung. Keines von beiden '
            'kommt vom Silber. Die Gleichung „Geld = Silber" ist eine auffällige '
            'sprachliche Häufung, keine Regel, die überall gilt.',
      ),
      ProseSection(
        'Von Lydien zum athenischen Eulen-Tetradrachmon',
        'Die ersten Münzen entstanden um das sechste Jahrhundert vor unserer '
            'Zeitrechnung in Lydien, zunächst aus Elektron, einer Gold-Silber-'
            'Legierung. Bald folgten reine Silbermünzen.\n\n'
            'Berühmt wurde das athenische Tetradrachmon mit der Eule. Es war eine '
            'schwere Silbermünze und galt über das ganze östliche Mittelmeer als '
            'verlässliches Geld. Wer eine Eule annahm, vertraute auf Gewicht und '
            'Feinheit des Silbers.',
      ),
      ProseSection(
        'Laurion, Potosí und die Silberschwemmen',
        'Großes Silber kam immer aus großen Minen. Athen schöpfte sein Silber aus '
            'den Gruben von Laurion und finanzierte damit auch seine Flotte. '
            'Später lieferte das spanische Amerika gewaltige Mengen — vor allem der '
            'Berg von Potosí im heutigen Bolivien.\n\n'
            'Diese Silberschwemmen veränderten die Welt: Das amerikanische Silber '
            'floss über Europa bis nach China und prägte den Handel ganzer '
            'Jahrhunderte. Wie viel genau gefördert wurde, ist nur grob bekannt.',
      ),
      ProseSection(
        'Ein ehrlicher Vorbehalt',
        'Die Fördermengen von Laurion und Potosí sind umstritten. Überliefert '
            'sind sie nur als Schätzungen, und die Quellen weichen stark '
            'voneinander ab. Man kennt die Größenordnung, nicht die genaue Zahl.\n\n'
            'Auch die Gleichung „Geld = Silber" sollte man nicht überdehnen. Sie '
            'gilt für argent und plata, aber nicht für jede Sprache. Es ist ein '
            'verbreitetes Muster, kein Naturgesetz.',
      ),
    ],
    sources: [
      Source(
        'Silver — Wikipedia',
        'https://en.wikipedia.org/wiki/Silver',
        'R2',
        'A1',
      ),
      Source(
        'Silver coin — Wikipedia',
        'https://en.wikipedia.org/wiki/Silver_coin',
        'R2',
        'A1',
      ),
      Source(
        'Mines of Laurion — Wikipedia',
        'https://en.wikipedia.org/wiki/Mines_of_Laurion',
        'R2',
        'A1',
      ),
      Source(
        'Potosí — Wikipedia',
        'https://en.wikipedia.org/wiki/Potos%C3%AD',
        'R2',
        'A1',
      ),
    ],
  ),
  ProseChapter(
    'Silber als Werkstoff',
    [
      ProseSection(
        'Der beste Leiter, den es gibt',
        'Silber ist nicht nur schön. Es ist auch ein außergewöhnlicher Werkstoff. '
            'Unter allen Metallen leitet Silber den elektrischen Strom am besten '
            'und die Wärme am besten. Kein anderes Metall ist hier besser.\n\n'
            'Dazu kommt der höchste Glanz: Frisch poliertes Silber wirft mehr des '
            'sichtbaren Lichts zurück als jedes andere Metall. Darum sitzt es seit '
            'jeher hinter Spiegeln und Reflektoren. Diese Eigenschaften machen es '
            'für die Technik wertvoll, ganz unabhängig vom Schmuck.',
        illustrationId: 'werte/conductivity',
      ),
      ProseSection(
        'Elektronik, Kontakte und Lötverbindungen',
        'Weil Silber so gut leitet, steckt es in vielen elektrischen Bauteilen. '
            'Schalter und Relais tragen Silberkontakte, weil sie auch nach vielen '
            'Schaltvorgängen sauber leiten. Leitpasten und Lötverbindungen nutzen '
            'Silber, um Strom zuverlässig zu führen.\n\n'
            'Oft geht es um kleine Mengen je Bauteil. In Summe aber ist die '
            'Elektronik ein großer Abnehmer. Vieles davon ist fein verteilt und '
            'lässt sich später kaum zurückgewinnen.',
      ),
      ProseSection(
        'Solarzellen und die Energiewende-Nachfrage',
        'Ein wachsender Teil des Silbers geht in Solarzellen. Die feinen Leitbahnen '
            'auf der Vorderseite vieler Zellen bestehen aus Silberpaste; sie führen '
            'den erzeugten Strom ab. Mit dem Ausbau der Photovoltaik wächst dieser '
            'Bedarf.\n\n'
            'Gleichzeit arbeitet die Industrie daran, je Zelle weniger Silber zu '
            'verbrauchen. Dieses „Thrifting" — der sparsamere Einsatz pro Stück — '
            'läuft der steigenden Stückzahl entgegen. Wie sich beides am Ende '
            'verrechnet, ist offen.',
      ),
      ProseSection(
        'Antimikrobiell und in der Medizin',
        'Silber wirkt gegen Keime. Schon früh legte man Silber in Wasser oder '
            'verwendete silberne Gefäße, um es haltbar zu machen. Heute nutzt die '
            'Medizin diese Wirkung gezielt: etwa in Wundauflagen und in '
            'Beschichtungen, die das Wachstum von Bakterien hemmen.\n\n'
            'Die antimikrobielle Wirkung ist gut belegt. Sie ist ein weiterer '
            'Grund, warum Silber nicht nur ein Anlagemetall ist, sondern ein '
            'gebrauchter Werkstoff mit echtem Nutzen.',
      ),
      ProseSection(
        'Elektroautos, Robotik und die Zukunftsnachfrage — mit Vorbehalt',
        'Mehr Elektronik bedeutet meist mehr Silber. Elektroautos enthalten '
            'zahlreiche elektrische Kontakte, und auch Robotik und vernetzte Geräte '
            'brauchen leitfähige Bauteile. Daraus leiten manche eine kräftig '
            'steigende Nachfrage ab.\n\n'
            'Hier ist Vorsicht geboten. Konkrete Mengenprognosen für die kommenden '
            'Jahre stammen oft von interessierten Stellen wie dem Silver Institute, '
            'einer Branchenvertretung. Die Richtung — eher mehr industrielle '
            'Nachfrage — ist plausibel. Feste Tonnagen für die Zukunft sind '
            'Schätzungen, keine gesicherten Zahlen.',
      ),
    ],
    sources: [
      Source(
        'Silver — Wikipedia',
        'https://en.wikipedia.org/wiki/Silver',
        'R2',
        'A1',
      ),
      Source(
        'Electrical resistivity and conductivity — Wikipedia',
        'https://en.wikipedia.org/wiki/Electrical_resistivity_and_conductivity',
        'R2',
        'A1',
      ),
      Source(
        'USGS — Silver',
        'https://www.usgs.gov/centers/national-minerals-information-center/silver-statistics-and-information',
        'R1',
        'A2',
      ),
      Source(
        'The Silver Institute (Interessenvertretung)',
        'https://www.silverinstitute.org/',
        'R3',
        'A2',
      ),
    ],
  ),
  ProseChapter(
    'Angebot und Nachfrage: Industrie gegen Anlage',
    [
      ProseSection(
        'Verbraucht statt gehortet',
        'Silber hat zwei Gesichter. Es ist ein Anlagemetall wie Gold, aber '
            'zugleich ein Industriemetall, das verbraucht wird. Ein großer Teil der '
            'jährlichen Nachfrage geht in die Technik — in Elektronik, Solarzellen '
            'und viele kleine Anwendungen.\n\n'
            'Darin liegt ein Unterschied zu Gold. Gold wird fast nur gehortet und '
            'kaum verbraucht; das meiste je geförderte Gold liegt noch irgendwo. '
            'Silber dagegen wird zu einem guten Teil benutzt — und benutztes '
            'Silber ist oft fein verteilt.',
        illustrationId: 'werte/demand-split',
      ),
      ProseSection(
        'Das meiste Silber ist Beifang',
        'Das meiste Silber fällt als Beifang beim Abbau von Blei, Zink und '
            'Kupfer an — wie das geschieht, steht im Kapitel über Bergbau und '
            'Förderung. Für dieses Kapitel zählt die Folge.\n\n'
            'Das Silberangebot hängt oft mehr am Bedarf nach diesen Hauptmetallen '
            'als am Silberpreis selbst. Ein hoher Silberpreis allein bringt nicht '
            'ohne Weiteres mehr Silber aus dem Boden, wenn die Hauptmetalle nicht '
            'gefragt sind.',
      ),
      ProseSection(
        'Über der Erde, unter der Erde: Bestände und Recycling',
        'Silber liegt an drei Orten: noch im Boden, in Barren und Münzen als '
            'Vorrat über der Erde, und fein verteilt in benutzten Produkten. '
            'Barren und Münzen lassen sich leicht wieder einschmelzen. Das fein '
            'verteilte Silber in Elektronik und Beschichtungen ist schwerer '
            'zurückzugewinnen.\n\n'
            'Recycling deckt darum nur einen Teil der Nachfrage. Wie groß die '
            'oberirdischen Bestände genau sind und welcher Anteil je zurückkehrt, '
            'lässt sich nur schätzen.',
      ),
      ProseSection(
        'Warum die zwei Nachfragen am selben Preis ziehen',
        'Industrie und Anleger kaufen dasselbe Metall am selben Markt. Die '
            'Industrie braucht Silber, weil es leitet und glänzt. Anleger kaufen '
            'es als Wertspeicher. Beide ziehen am gleichen Preis.\n\n'
            'Das macht Silber unruhig. Mal treibt die Technik, mal die Anlage. '
            'Fällt beides zusammen, kann der Preis kräftig ausschlagen — stärker '
            'als bei Gold, das fast nur von der Anlage getragen wird.',
      ),
      ProseSection(
        'Ein ehrlicher Vorbehalt',
        'Die genauen Anteile schwanken von Jahr zu Jahr. Wie viel Silber in die '
            'Industrie geht und wie viel als Beifang anfällt, kennt man nur als '
            'Größenordnung, nicht als feste Zahl.\n\n'
            'Belegt ist, dass fein verteilte Anwendungen schlecht recycelt werden. '
            'Die weitergehende These, das verbrauchte Industriesilber sei „für '
            'immer weg" und über der Erde liege „kaum noch etwas", geht darüber '
            'hinaus. Sie ist eine Knappheitsvermutung, kein gesicherter Befund — '
            'und sollte als solche gelesen werden.',
      ),
    ],
    sources: [
      Source(
        'USGS — Silver',
        'https://www.usgs.gov/centers/national-minerals-information-center/silver-statistics-and-information',
        'R1',
        'A2',
      ),
      Source(
        'Silver — Wikipedia',
        'https://en.wikipedia.org/wiki/Silver',
        'R2',
        'A1',
      ),
      Source(
        'The Silver Institute (Interessenvertretung)',
        'https://www.silverinstitute.org/',
        'R3',
        'A2',
      ),
      Source(
        'World Bank — Commodity Markets „Pink Sheet"',
        'https://www.worldbank.org/en/research/commodity-markets',
        'R1',
        'A1',
      ),
    ],
  ),
  ProseChapter(
    'Silber als Anlage: „Gold des armen Mannes"',
    [
      ProseSection(
        'Billiger pro Stück, wilder im Ausschlag',
        'Silber kostet je Unze viel weniger als Gold. Darum kann man es in '
            'kleinen Schritten kaufen — eine einzelne Münze ist erschwinglich. Das '
            'trug Silber die alte Redensart vom „Gold des armen Mannes" ein.\n\n'
            'Mit dem niedrigen Stückpreis geht ein heftigeres Auf und Ab einher. '
            'Silber schwankt geschichtlich stärker als Gold. Wer Silber hält, muss '
            'größere Ausschläge nach oben wie nach unten aushalten.',
      ),
      ProseSection(
        'Halb Geld, halb Rohstoff',
        'Silber sitzt zwischen zwei Welten. Wie Gold ist es ein altes Geldmetall '
            'und ein Wertspeicher. Wie Kupfer ist es ein Industriemetall, das '
            'verbraucht wird.\n\n'
            'Diese Doppelnatur prägt seinen Preis. In Krisen kaufen ihn manche wie '
            'Gold als sicheren Hafen. Läuft die Wirtschaft heiß, zieht die '
            'industrielle Nachfrage. Silber gehorcht beiden Kräften zugleich.',
      ),
      ProseSection(
        'Warum Silber Gold übertreibt',
        'In vielen Phasen bewegt sich Silber in dieselbe Richtung wie Gold, aber '
            'kräftiger. Steigt Gold, steigt Silber oft stärker; fällt Gold, fällt '
            'Silber oft tiefer. Man sagt, Silber „übertreibt" die Bewegung des '
            'Goldes.\n\n'
            'Ein Grund ist der kleine Markt: Schon mäßige Käufe oder Verkäufe '
            'bewegen den Silberpreis spürbar. Der zusätzliche Zug der Industrie '
            'verstärkt die Ausschläge.',
      ),
      ProseSection(
        'Münzen, Barren und Papier',
        'Silber lässt sich auf mehrere Arten halten. Münzen und Barren sind das '
            'Metall selbst, zum Anfassen. Daneben gibt es Papierformen — Fonds und '
            'Terminkontrakte —, die Silber abbilden, ohne dass man es im Schrank '
            'hat.\n\n'
            'Physisches Silber ist sperriger und im Verhältnis zum Wert teurer zu '
            'lagern als Gold, weil man für denselben Wert ein Vielfaches an Masse '
            'braucht. Papierformen sind handlicher, bringen aber eigene Fragen mit '
            'sich — mehr dazu im Kapitel über Papier und Metall.',
      ),
      ProseSection(
        'Ein ehrlicher Vorbehalt',
        'Dass Silber je Unze billiger ist und stärker schwankt, ist belegt. Was '
            'darüber hinausgeht, ist Meinung. Die Aussage „Silber ist '
            'unterbewertet und muss zu Gold aufholen" ist eine Anlagethese, kein '
            'Fakt.\n\n'
            'Besonders die Idee, das Gold-Silber-Verhältnis müsse zur alten Marke '
            'nahe sechzehn zurückkehren, ist mit Vorsicht zu lesen. Dass dieses '
            'Verhältnis keine natürliche Konstante ist, wird in den Kapiteln zum '
            'Gold-Silber-Verhältnis erklärt; eine Rückkehr ist eine Erwartung, '
            'keine Gewähr.',
      ),
    ],
    sources: [
      Source(
        'Silver as an investment — Wikipedia',
        'https://en.wikipedia.org/wiki/Silver_as_an_investment',
        'R2',
        'A1',
      ),
      Source(
        'Gold–silver ratio — Wikipedia',
        'https://en.wikipedia.org/wiki/Gold%E2%80%93silver_ratio',
        'R2',
        'A1',
      ),
      Source(
        'Coinage Act of 1873 — Wikipedia',
        'https://en.wikipedia.org/wiki/Coinage_Act_of_1873',
        'R2',
        'A1',
      ),
    ],
  ),
  ProseChapter(
    'Papier gegen Metall: das Silber-Rätsel',
    [
      ProseSection(
        'Was ein Terminmarkt eigentlich ist',
        'An einem Terminmarkt handelt man nicht das Metall selbst, sondern '
            'Verträge über künftige Lieferung. Ein Terminkontrakt ist das '
            'Versprechen, eine bestimmte Menge Silber zu einem späteren Termin zu '
            'einem festen Preis zu liefern oder abzunehmen.\n\n'
            'Wichtig ist: Die allermeisten Kontrakte werden vor dem Liefertermin '
            'glattgestellt. Käufer und Verkäufer gleichen ihre Position mit einem '
            'Gegengeschäft aus, und es fließt nie Metall. Der Terminmarkt dient vor '
            'allem der Preissicherung und dem Handel, nicht der Auslieferung.',
      ),
      ProseSection(
        'Die Behauptung: viel Papier, wenig Metall',
        'Aus diesem Bau folgt eine oft gehörte Behauptung: Es gebe viel mehr '
            'Silber „auf Papier" als wirklich lieferbares Metall in den Lagern. Die '
            'offenen Kontrakte überstiegen die sofort verfügbaren Bestände um ein '
            'Vielfaches.\n\n'
            'Daraus wird gefolgert, der Markt sitze auf Versprechen, die er nicht '
            'einlösen könne, und ein Ansturm auf das Metall müsse ihn sprengen. '
            'Diese Erzählung ist verbreitet — sie verdient aber eine genaue '
            'Prüfung.',
      ),
      ProseSection(
        'Was dokumentiert ist — und was nicht',
        'Dokumentiert ist: Die offenen Kontrakte können die sofort lieferbaren '
            'registrierten Bestände übersteigen. Das ist für einen Terminmarkt '
            'normal und kein Beweis für Betrug, weil eben fast alle Kontrakte vor '
            'der Lieferung glattgestellt werden. Es muss nie für alle zugleich '
            'Metall da sein.\n\n'
            'Nicht dokumentiert ist die Schlussfolgerung, daraus folge zwingend ein '
            'Crash oder ein Schwindel. Ein festes Verhältnis von „so-und-so-viel '
            'Papier je Unze Metall garantiert den Kollaps" lässt sich nicht '
            'belegen. Die Mechanik des Marktes und die Verschwörungsdeutung sind '
            'zwei verschiedene Dinge.',
      ),
      ProseSection(
        'Die Hunt-Brüder 1980: ein echter Eckverlauf',
        'Dass der Silbermarkt eng werden kann, zeigt ein dokumentierter Fall. Um '
            '1979 und 1980 kauften die Brüder Hunt riesige Mengen Silber und '
            'Kontrakte und trieben den Preis in die Höhe — bis auf knapp 50 Dollar '
            'je Unze.\n\n'
            'Am „Silbernen Donnerstag", dem 27. März 1980, brach der Preis '
            'zusammen, als die Regeln verschärft wurden und die Hunts ihre Käufe '
            'nicht mehr finanzieren konnten. Das ist ein belegter Eckverlauf — der '
            'Versuch, einen Markt zu beherrschen, und sein Scheitern.',
      ),
      ProseSection(
        'Der „Silver Squeeze" 2021',
        'Anfang 2021 riefen Anleger in sozialen Netzen dazu auf, gemeinsam Silber '
            'zu kaufen und so einen „Squeeze" auszulösen — im Umfeld der '
            'GameStop-Episode. Der Silberpreis stieg kurz an.\n\n'
            'Ein nachhaltiger Engpass entstand daraus nicht. Ob die Aktion '
            'überhaupt einen dauerhaften Effekt hatte, ist umstritten. Sie zeigt '
            'eher, wie schnell sich solche Erzählungen verbreiten, als dass sie die '
            'These vom leeren Lager bestätigt.',
      ),
      ProseSection(
        'Spekulatives (mit Vorsicht): Manipulation und das angebliche Verhältnis',
        'Es gibt belegte Einzelfälle unsauberen Handels. Aufsichtsbehörden wie die '
            'CFTC haben einzelne Banken wegen „Spoofing" — Scheinaufträgen zum '
            'Täuschen — bestraft. Das sind dokumentierte Einzelfälle.\n\n'
            'Daraus folgt aber nicht, dass „der Markt" dauerhaft und planmäßig '
            'gedrückt werde. Die Behauptungen, der Silberpreis sei koordiniert '
            'unterdrückt, ein bestimmtes Papier-zu-Metall-Verhältnis erzwinge den '
            'Crash, oder die Lager seien leer und mehrfach verpfändet, sind '
            'umstritten und spekulativ. Sie sollten als attribuierte Meinung gelesen '
            'werden, nicht als Tatsache.',
      ),
    ],
    sources: [
      Source(
        'Silver Thursday — Wikipedia',
        'https://en.wikipedia.org/wiki/Silver_Thursday',
        'R2',
        'A1',
      ),
      Source(
        'GameStop short squeeze (Silber 2021) — Wikipedia',
        'https://en.wikipedia.org/wiki/GameStop_short_squeeze',
        'R2',
        'A1',
      ),
      Source(
        'Futures contract — Wikipedia',
        'https://en.wikipedia.org/wiki/Futures_contract',
        'R2',
        'A1',
      ),
      Source(
        'CFTC — Pressemitteilungen (Spoofing-Strafen)',
        'https://www.cftc.gov/PressRoom/PressReleases',
        'R1',
        'A3',
      ),
    ],
  ),
  ProseChapter(
    'Hält Gold seinen Wert?',
    [
      ProseSection(
        'Die Frage',
        'Gold gilt als Wertspeicher. Aber hält es seinen Wert wirklich? Die '
            'Frage ist tückisch, denn man kann Gold nicht in Geld messen, ohne '
            'sich im Kreis zu drehen. Geld schwankt selbst — gerade das ist der '
            'Grund, warum man überhaupt nach einem festen Wert sucht.\n\n'
            'Darum braucht es einen Maßstab außerhalb des Geldes. Man misst Gold '
            'in etwas, das die Menschen zu allen Zeiten brauchten und das man '
            'über Jahrtausende vergleichen kann: in Nahrung, konkret in '
            'Getreide. Wie viel Brotkorn kauft eine bestimmte Menge Gold? Das '
            'ist die ehrliche Frage hinter der Behauptung vom Wertspeicher.',
      ),
      ProseSection(
        'Warum gerade Getreide der Maßstab ist',
        'Getreide ist der älteste und gleichmäßigste Bedarf der Menschheit. Wer '
            'lebt, muss essen, und über die meiste Geschichte hieß essen vor '
            'allem Brotkorn — Weizen, Gerste, Reis. Ein Scheffel Getreide war '
            'vor zweitausend Jahren ungefähr dasselbe wie heute: eine Mahlzeit, '
            'eine Tagesration, ein Stück Überleben.\n\n'
            'Diese Beständigkeit macht Getreide zu einem besseren Maßstab als '
            'jede Währung. Münzen wurden entwertet, Reiche vergingen, Papiergeld '
            'kam und ging — der Hunger blieb gleich. Ein Maß, das sich an einem '
            'unveränderlichen menschlichen Bedürfnis festmacht, lügt weniger als '
            'ein Maß, das an einer Regierung hängt.\n\n'
            'Ganz neutral ist auch das Korn nicht: Missernten, neue Anbaumethoden '
            'und der Welthandel haben den Getreidepreis selbst bewegt. Aber diese '
            'Schwankungen sind klein gegen den Zerfall mancher Währungen. Als '
            '„Lineal" für sehr lange Zeiträume ist Getreide darum ehrlicher als '
            'Geld — nicht perfekt, aber das beste verfügbare.',
      ),
      ProseSection(
        'Über sehr lange Zeit grob stabil',
        'Über sehr lange Zeiträume kauft eine feste Menge Gold ungefähr '
            'vergleichbare Mengen Getreide. „Ungefähr" ist dabei das wichtige '
            'Wort: Es geht um Größenordnungen, nicht um feste Zahlen.\n\n'
            'Ein paar Anker geben ein Gefühl für die Spanne, jeweils nur als grobe '
            'Größenordnung. Im römischen Ägypten lassen sich Goldmengen und '
            'Getreidepreise in Papyri vergleichen; im mittelalterlichen England '
            'reichen Clarks lange Preisreihen vom dreizehnten Jahrhundert an '
            'zurück; und auch heute kauft eine Unze Gold wieder eine '
            'Getreidemenge in einer ähnlichen Größenordnung wie damals. Zwischen '
            'diesen Punkten lagen Jahrhunderte mit ganz anderen Verhältnissen.\n\n'
            'Das Erstaunliche ist, dass die Endpunkte einer so langen Strecke so '
            'nah beieinanderliegen. Über zwei Jahrtausende blieb die Kaufkraft '
            'des Goldes in Brotkorn in derselben groben Größenordnung — etwas, '
            'das von kaum einer Währung gesagt werden kann.',
        illustrationId: 'werte/purchasing-power',
      ),
      ProseSection(
        'Aber nicht von Jahr zu Jahr',
        'Kurzfristig ist Gold alles andere als stabil. Sein Preis in Getreide '
            'schwankt über Jahre und Jahrzehnte deutlich. Auf eine Generation '
            'gesehen kann eine feste Menge Gold einmal viel und einmal wenig '
            'Korn kaufen.\n\n'
            'Wer im falschen Jahr kaufte und im falschen verkaufte, verlor real, '
            'obwohl Gold „über die Jahrtausende" stabil ist. Die lange Linie '
            'beruhigt; die kurze kann hart sein. Gold ist ein Wertspeicher über '
            'Generationen, kein verlässlicher Maßstab von einem Jahr aufs '
            'nächste.\n\n'
            'Das ist die andere, modernere Frage: Schützt Gold im Anlegerleben '
            'eines einzelnen Menschen vor Inflation und Krise? Sie wird '
            'gesondert im Kapitel „Gold als Schutz vor Inflation und Krise" '
            'behandelt. Dieses Kapitel hier nimmt bewusst den langen, '
            'jahrtausendelangen Blick gegen das Getreide ein.\n\n'
            'Wie sich diese lange Stabilität im Diagramm niederschlägt — ein '
            'Pendeln in derselben Größenordnung, mit antiken Ringen statt '
            'durchgezogener Linie —, zeigt das Kapitel „Die Preiskurve lesen".',
      ),
      ProseSection(
        'Ein ehrlicher Vorbehalt',
        'Die alten Werte sind grob, regional und oft nur als Größenordnung '
            'überliefert. Antike Getreidepreise schwankten mit der Ernte und der '
            'Gegend; ein Preis aus dem Niltal sagt wenig über denselben Tag in '
            'Britannien. Wer aus solchen Zahlen eine genaue Kurve macht, gibt '
            'eine Sicherheit vor, die die Quellen nicht hergeben.\n\n'
            'Wer sagt, Gold sei „ewig stabil", sagt darum zu viel. Richtig ist '
            'die zweiseitige Aussage: Über sehr lange Zeit bleibt die Kaufkraft '
            'erstaunlich in derselben Größenordnung — mit großen Ausschlägen '
            'dazwischen. Beide Hälften gehören genannt; nur zusammen sind sie '
            'ehrlich.',
      ),
    ],
    sources: [
      Source(
        'Harper, K. — People, Plagues, and Prices in the Roman World (2016)',
        'https://www.cambridge.org/core/journals/journal-of-economic-history',
        'R2',
        'A2',
      ),
      Source(
        'Clark, G. — The Price History of English Agriculture, 1209–1914',
        'https://faculty.econ.ucdavis.edu/faculty/gclark/papers/Agprice.pdf',
        'R2',
        'A2',
      ),
      Source(
        'World Bank — Commodity Markets „Pink Sheet"',
        'https://www.worldbank.org/en/research/commodity-markets',
        'R1',
        'A1',
      ),
      Source(
        'Officer & Williamson — The Price of Gold, 1257–Present (MeasuringWorth)',
        'https://www.measuringworth.com/datasets/gold/',
        'R2',
        'A2',
      ),
    ],
  ),
  ProseChapter(
    'Der Goldstandard und sein Ende',
    [
      ProseSection(
        'Was eine Goldbindung bedeutet',
        'Eine Goldbindung heißt: Das Geld eines Landes ist gesetzlich an eine '
            'feste Menge Gold gebunden. Eine Geldeinheit steht für so und so '
            'viel Gramm Gold, und im Grundsatz kann man Papier gegen Metall '
            'eintauschen. Das soll das Vertrauen sichern, weil der Staat das '
            'Geld nicht beliebig vermehren kann.\n\n'
            'Damit wird Geld zu einem Anspruch auf Gewicht — ganz so, wie Geld '
            'einst schlicht gewogenes Metall war. Wie diese alte Verbindung von '
            'Geld und Gewicht aussah, steht in der Einheitentheorie unter '
            '„Währung".',
      ),
      ProseSection(
        'Der klassische Goldstandard (etwa 1870 bis 1914)',
        'In den Jahrzehnten vor dem Ersten Weltkrieg banden viele Länder ihr '
            'Geld an Gold. Wechselkurse lagen damit weitgehend fest, und der '
            'Handel über Grenzen wurde berechenbarer. Diese Zeit gilt vielen als '
            'goldenes Zeitalter stabilen Geldes.\n\n'
            'Stabil im Sinne von ruhig war sie aber nicht. Es gab Bankenpaniken, '
            'lange Phasen fallender Preise und scharfe Rezessionen. Die feste '
            'Goldbindung nahm den Regierungen ein Werkzeug aus der Hand, mit dem '
            'sie auf Krisen hätten reagieren können — das ist kein Streitpunkt, '
            'sondern eine Tatsache jener Jahre.',
        illustrationId: 'werte/goldstandard-timeline',
      ),
      ProseSection(
        'Bretton Woods: Gold über den Dollar',
        'Nach dem Zweiten Weltkrieg ordnete das Abkommen von Bretton Woods das '
            'Geld neu. Oft heißt es kurz, das sei ein Goldstandard gewesen — das '
            'verkürzt die Sache. Nur der US-Dollar war an Gold gebunden, zu einem '
            'gesetzlichen Wert von 35,00 Dollar je Feinunze, festgelegt mit dem '
            'Gold Reserve Act von 1934 (zuvor 20,67 Dollar).\n\n'
            'Alle anderen Währungen waren nicht an Gold gebunden, sondern an den '
            'Dollar. Über den Dollar hingen sie mittelbar am Gold. Genauer ist es '
            'also ein Gold-Devisen-Standard: Gold im Kern, der Dollar als '
            'Bindeglied.',
      ),
      ProseSection(
        'Der Nixon-Schock 1971',
        'Mit der Zeit gab es im Ausland weit mehr Dollar als Gold in den '
            'amerikanischen Tresoren, und immer mehr Länder wollten ihre Dollar '
            'in Metall eintauschen. 1971 setzte Präsident Nixon die Einlösung '
            'von Dollar in Gold aus. Damit endete die letzte Goldbindung des '
            'Geldes.\n\n'
            'Das ist die eine gesicherte Tatsache an diesem Tag: Der Dollar war '
            'von da an nicht mehr in Gold einlösbar. Gedacht war der Schritt als '
            'vorübergehend — geblieben ist er dauerhaft.',
      ),
      ProseSection(
        'Was danach kam: das reine Papiergeld',
        'Seither steht das Geld der Welt nicht mehr auf Metall. Sein Wert beruht '
            'auf Vertrauen, auf der Stabilität des Staates und auf der Knappheit, '
            'die die Zentralbank wahrt. Fachleute nennen das Fiatgeld — Geld, das '
            'gilt, weil es gelten soll.\n\n'
            'Damit ist der Maßstab selbst beweglich geworden. Genau das ist der '
            'Grund, warum man den Wert von Gold lieber an einer Sache misst, die '
            'die Menschen immer brauchten — etwa an Getreide, wie im Kapitel '
            '„Hält Gold seinen Wert?" erklärt.',
      ),
      ProseSection(
        'Ein ehrlicher Vorbehalt',
        'Der klassische Goldstandard war kein Zeitalter reiner Ruhe — Paniken, '
            'Deflation und Rezessionen gehören untrennbar dazu. Und Bretton Woods '
            'war kein voller Goldstandard, sondern band nur den Dollar ans Gold.\n\n'
            'Die Deutung, 1971 sei ein Wortbruch oder gar ein Diebstahl gewesen, '
            'ist eine Position des Hartgeld-Lagers, keine Tatsache. Gesichert ist '
            'allein das Ende der Dollar-Gold-Einlösung. Die genannten Werte '
            '— 20,67 und 35,00 Dollar je Unze — sind historische Rechtsgrößen, '
            'keine heutigen Preise.',
      ),
    ],
    sources: [
      Source(
        'Federal Reserve History — Gold Reserve Act of 1934',
        'https://www.federalreservehistory.org/essays/gold-reserve-act',
        'R1',
        'A2',
      ),
      Source(
        'Federal Reserve History — Nixon Ends Convertibility (1971)',
        'https://www.federalreservehistory.org/essays/gold-convertibility-ends',
        'R1',
        'A2',
      ),
      Source(
        'IMF — End of the Bretton Woods System',
        'https://www.imf.org/external/about/histend.htm',
        'R1',
        'A2',
      ),
      Source(
        'Nixon shock — Wikipedia',
        'https://en.wikipedia.org/wiki/Nixon_shock',
        'R2',
        'A1',
      ),
    ],
  ),
  ProseChapter(
    'Zentralbanken und ihr Gold',
    [
      ProseSection(
        'Gold ohne Goldstandard: warum noch?',
        'Seit 1971 deckt kein Gold mehr das Geld. Trotzdem halten die '
            'Zentralbanken weiter große Mengen davon. Das wirkt zunächst '
            'widersprüchlich: Wozu Gold horten, wenn es das Geld gar nicht mehr '
            'bindet?\n\n'
            'Der Grund ist nicht mehr gesetzlich, sondern praktisch. Gold ist '
            'eine Reserve, die keiner Gegenpartei gehört und nicht ausfallen '
            'kann. Eine Anleihe ist ein Versprechen eines anderen; ein Barren '
            'ist einfach da.',
      ),
      ProseSection(
        'Reserve und Diversifizierung',
        'Eine Notenbank hält ihre Reserven nicht in einer einzigen Form. Neben '
            'fremden Währungen hält sie Gold, weil es sich anders verhält als '
            'diese und in Krisen oft seinen Wert behält. So verteilt sie das '
            'Risiko über mehrere Körbe.\n\n'
            'Gold hat dabei eine eigene Rolle: Es ist über Grenzen hinweg '
            'anerkannt, es bindet sich an keinen einzelnen Staat, und es bleibt '
            'auch dann etwas wert, wenn das Vertrauen in eine Währung schwindet. '
            'Genau das macht es zur Reserve für den schlimmen Fall.',
      ),
      ProseSection(
        'Wo das Gold liegt: Lagerung und Verwahrung',
        'Das Gold der Notenbanken liegt in schwer gesicherten Tresoren. Vieles '
            'davon ruht bei wenigen großen Verwahrstellen, weil sich Barren dort '
            'rasch und ohne Transport zwischen Besitzern umbuchen lassen. Eine '
            'Notenbank lagert ihr Gold also oft nicht nur daheim, sondern auch '
            'im Ausland.\n\n'
            'Das hat Vorteile beim Handel, wirft aber eine Vertrauensfrage auf: '
            'Wer im Ausland lagert, muss dem Verwahrer trauen. Aus dieser Frage '
            'sind in mehreren Ländern öffentliche Debatten geworden.',
      ),
      ProseSection(
        'Die Repatriierungs-Debatten',
        'Mehrfach haben Länder einen Teil ihres im Ausland gelagerten Goldes '
            'wieder nach Hause geholt. Die Deutsche Bundesbank etwa verlegte '
            'einen Anteil ihrer Bestände zurück nach Frankfurt und legte dazu '
            'öffentlich Rechenschaft ab. Das ist ein belegter, politischer '
            'Vorgang.\n\n'
            'Davon strikt zu trennen ist der unbewiesene Verdacht, das Gold sei '
            '„gar nicht da" oder heimlich mehrfach verliehen. Das eine ist '
            'dokumentierte Politik, das andere eine Vermutung ohne Beleg — beides '
            'darf man nicht in einen Topf werfen.',
      ),
      ProseSection(
        'Ein ehrlicher Vorbehalt',
        'Welches Land wie viel Gold hält und in welcher Rangfolge, steht hier '
            'bewusst nicht — solche Zahlen ändern sich und veralten. Es geht hier '
            'nur um die dauerhaften Gründe: Vertrauen, Krisenreserve, kein '
            'Ausfall einer Gegenpartei.\n\n'
            'Die Deutung, Zentralbanken kauften Gold, um eine Leitwährung zu '
            'stürzen, ist eine geopolitische Auslegung, keine Tatsache. Auch sie '
            'gehört zu den Erzählungen, die man von den belegten Vorgängen '
            'trennen muss.',
      ),
    ],
    sources: [
      Source(
        'Deutsche Bundesbank — Germany\'s gold reserves',
        'https://www.bundesbank.de/en/tasks/topics/germany-s-gold',
        'R1',
        'A2',
      ),
      Source('IMF — reserves data', 'https://www.imf.org/en/Data', 'R1', 'A3'),
      Source(
        'World Gold Council — central bank statistics (interessengeleitet)',
        'https://www.gold.org/goldhub/data/monthly-central-bank-statistics',
        'R3',
        'A2',
      ),
      Source(
        'Gold reserve — Wikipedia',
        'https://en.wikipedia.org/wiki/Gold_reserve',
        'R2',
        'A1',
      ),
    ],
  ),
  ProseChapter(
    'Gold als Schutz vor Inflation und Krise',
    [
      ProseSection(
        'Die Versprechen: Hafen, Hedge, Versicherung',
        'Über Gold heißt es oft dreierlei: Es sei ein sicherer Hafen in der '
            'Krise, ein Schutz gegen Inflation und eine Art Versicherung für das '
            'Vermögen. Diese drei Versprechen klingen ähnlich, meinen aber '
            'Verschiedenes.\n\n'
            'Ein Hafen soll halten, wenn anderes fällt. Ein Inflationsschutz soll '
            'die Kaufkraft wahren, wenn das Geld an Wert verliert. Eine '
            'Versicherung kostet meist etwas und zahlt sich nur im Schadensfall '
            'aus. Ob Gold all das leistet, hängt davon ab, über welchen Zeitraum '
            'man fragt.',
      ),
      ProseSection(
        'Was die lange Frist zeigt',
        'Über sehr lange Zeiträume hat Gold seine Kaufkraft erstaunlich gut '
            'gehalten — das ist im Kapitel „Hält Gold seinen Wert?" am Getreide '
            'gezeigt.\n\n'
            'Daraus folgt aber nicht, dass Gold jeden Geldwertverlust ausgleicht. '
            'Der Schutz greift über sehr lange Horizonte, über die kaum ein '
            'Mensch sein Geld anlegt. „Auf Dauer" und „in meinem Anlegerleben" '
            'sind zwei verschiedene Fristen.',
      ),
      ProseSection(
        'Was die kurze Frist zeigt',
        'Über Jahre und Jahrzehnte kann Gold real an Wert verlieren. Es gab '
            'lange Strecken, in denen Gold die Inflation nicht ausglich, und '
            'andere, in denen es sie weit übertraf. Ein verlässlicher Gleichlauf '
            'mit den Preisen von einem Jahr aufs nächste besteht nicht.\n\n'
            'Auch der „sichere Hafen" ist von der Lage abhängig. In manchen '
            'Krisen stieg Gold, während Aktien fielen. In Panik um Bargeld aber '
            'verkauften viele auch ihr Gold, um an Liquidität zu kommen — dann '
            'fiel es mit. Der Hafen ist also kein Naturgesetz.',
        illustrationId: 'werte/inflation-horizon',
      ),
      ProseSection(
        'Gold im Portfolio: Diversifizierer, nicht Renditemotor',
        'In der Anlagewelt gilt Gold meist als Beimischung, die das Risiko '
            'verteilt, nicht als Quelle hoher Erträge. Es bewegt sich oft anders '
            'als Aktien und Anleihen, und gerade das macht es als Mischung '
            'nützlich.\n\n'
            'Ein Punkt gehört dabei ehrlich gesagt: Gold zahlt keine Zinsen und '
            'keine Dividende. Ein Barren liegt und vermehrt sich nicht von '
            'selbst. Wer Gold hält, setzt auf den Erhalt des Werts, nicht auf '
            'einen laufenden Ertrag.',
      ),
      ProseSection(
        'Ein ehrlicher Vorbehalt',
        'Der Satz „Gold schützt immer vor Inflation" ist zu stark. Richtig ist '
            'nur die schwächere Form: Über sehr lange Zeit bleibt die Kaufkraft '
            'in derselben Größenordnung, über Jahre und Jahrzehnte aber kann Gold '
            'real verlieren. Beide Seiten gehören genannt.\n\n'
            'Feste Renditezahlen, Korrelationen oder ein „richtiger" Goldanteil '
            'im Vermögen stehen hier bewusst nicht — sie hängen von Zeitraum und '
            'Lage ab. Und wer den Goldhandel bewirbt, etwa Branchenverbände, ist '
            'Partei in eigener Sache; deren Zahlen liest man mit Vorsicht.',
      ),
    ],
    sources: [
      Source(
        'Erb & Harvey — The Golden Dilemma (2013)',
        'https://papers.ssrn.com/sol3/papers.cfm?abstract_id=2078535',
        'R2',
        'A3',
      ),
      Source(
        'Baur & Lucey — Is Gold a Hedge or a Safe Haven? (2010)',
        'https://onlinelibrary.wiley.com/doi/10.1111/j.1540-6288.2010.00244.x',
        'R2',
        'A3',
      ),
      Source(
        'World Bank — Commodity Markets „Pink Sheet"',
        'https://www.worldbank.org/en/research/commodity-markets',
        'R1',
        'A1',
      ),
      Source(
        'World Gold Council — gold as a strategic asset (interessengeleitet)',
        'https://www.gold.org/goldhub/research',
        'R3',
        'A2',
      ),
    ],
  ),
  ProseChapter(
    'Papiergold und physisches Gold',
    [
      ProseSection(
        'Metall halten oder Anspruch halten',
        'Es gibt zwei grundverschiedene Arten, in Gold zu sein. Man hält '
            'entweder das Metall selbst — Barren oder Münzen in der Hand oder im '
            'Tresor — oder man hält ein Stück Papier, das einen Anspruch auf Gold '
            'verbrieft. Das eine ist Eigentum am Metall, das andere eine '
            'Forderung gegen jemanden.\n\n'
            'Der Unterschied klingt klein, ist aber der Kern. Beim Metall trägt '
            'man kein Gegenparteirisiko: Der Barren bleibt der eigene, auch wenn '
            'andere ausfallen. Bei der Forderung hängt alles daran, dass der '
            'Schuldner liefern kann.',
      ),
      ProseSection(
        'Gold-ETFs: allokiert und nicht-allokiert',
        'Viele Anleger halten Gold nicht selbst, sondern über einen Fonds, der '
            'es für sie verwahrt. Hier scheidet sich allokiert von '
            'nicht-allokiert. Allokiert heißt: Bestimmte, nummerierte Barren sind '
            'dem Halter zugewiesen; ihm gehört das Metall.\n\n'
            'Nicht-allokiert heißt: Der Halter hat eine Forderung gegen die Bank '
            'auf eine Menge Gold, aber keinen bestimmten Barren. Solange alles '
            'läuft, ist der Unterschied unsichtbar. Fällt der Verwahrer aus, ist '
            'er entscheidend — der allokierte Halter hat sein Metall, der andere '
            'nur einen Anspruch.',
      ),
      ProseSection(
        'Termingeschäfte: COMEX und Lieferung',
        'An Terminbörsen wie der COMEX werden Gold-Kontrakte gehandelt, die '
            'Lieferung zu einem späteren Tag versprechen. Die meisten dieser '
            'Kontrakte enden aber nicht mit Metall, sondern werden vorher in Geld '
            'ausgeglichen oder weitergerollt.\n\n'
            'Dass die meisten Kontrakte in bar abgewickelt werden, ist kein '
            'Missbrauch, sondern so vorgesehen: Die Börse dient vielen zur '
            'Absicherung von Preisen, nicht zur Beschaffung von Barren. Wer '
            'wirklich Metall will, kann die Lieferung verlangen.',
      ),
      ProseSection(
        'Der Londoner Markt (LBMA) und „Loco London"-Gold',
        'Der größte Handel mit physischem Gold läuft außerbörslich über London. '
            'Dort meint „Loco London" Gold, das in den Londoner Tresoren liegt '
            'und durch Umbuchung zwischen den Mitgliedern den Besitzer wechselt, '
            'ohne bewegt zu werden. Die LBMA setzt die Standards für Barren und '
            'Abwicklung.\n\n'
            'Vieles davon ist nicht-allokiert: ein Guthaben in Gold bei einer '
            'Bank, keine bestimmten Barren. Das macht den Handel rasch und '
            'günstig, verlagert aber das Risiko auf das Vertrauen in den '
            'Verwahrer — wieder die alte Trennung von Anspruch und Metall.',
      ),
      ProseSection(
        'Die Hebel- und Deckungs-Frage',
        'Weil so viele Ansprüche auf Gold lauten, fragt man: Steht hinter jedem '
            'Anspruch wirklich ein Barren? Nicht-allokierte Ansprüche können das '
            'physische Metall übersteigen — um wie viel, hängt davon ab, was man '
            'mitzählt; eine feste Zahl ist es nicht, und die genannten Vielfachen '
            'sind umstritten.\n\n'
            'Die Praxis der Wiederverpfändung gibt es: Dieselbe Sicherheit kann '
            'durch mehrere Hände gehen. Daraus folgt aber nicht, dass das '
            'Londoner oder COMEX-Gold massenhaft mehrfach verkauft sei. Das ist '
            'ein Verdacht, kein nachgewiesener Befund.',
        illustrationId: 'werte/allocated',
      ),
      ProseSection(
        'Ein ehrlicher Vorbehalt',
        'Belegt ist der Kern: allokiert bedeutet Eigentum am Metall, '
            'nicht-allokiert eine Forderung mit Gegenparteirisiko. Belegt ist '
            'auch, dass die meisten Terminkontrakte in bar enden — das ist '
            'systemkonform, kein Skandal.\n\n'
            'Nicht belegt ist dagegen das wiederkehrende „Es gibt zu wenig '
            'physisches Gold, der Markt bricht zusammen". Einzelne Strafen wegen '
            '„Spoofing" — vorgetäuschter Orders — sind dokumentiert; daraus folgt '
            'aber nicht, dass der Goldpreis dauerhaft manipuliert wäre. Das eine '
            'ist ein belegter Einzelfall, das andere eine pauschale Behauptung.',
      ),
    ],
    sources: [
      Source(
        'LBMA — A Guide to the London Precious Metals Markets',
        'https://www.lbma.org.uk/',
        'R1',
        'A2',
      ),
      Source(
        'CME Group — COMEX Gold Futures spec',
        'https://www.cmegroup.com/markets/metals/precious/gold.html',
        'R1',
        'A2',
      ),
      Source(
        'Gold exchange-traded product — Wikipedia (allocated vs unallocated)',
        'https://en.wikipedia.org/wiki/Gold_exchange-traded_product',
        'R2',
        'A1',
      ),
      Source(
        'CFTC — PressRoom (spoofing)',
        'https://www.cftc.gov/PressRoom',
        'R1',
        'A3',
      ),
    ],
  ),
  ProseChapter(
    'Woher das Metall kommt: Bergbau und Förderung',
    [
      ProseSection(
        'Seife im Fluss: Seifengold und der erste Goldrausch',
        'Am Anfang stand kein Bergwerk, sondern der Fluss. Gold ist schwer und '
            'rostet nicht, darum sammelt es sich als feine Körner und Flitter im '
            'Sand der Bäche — die sogenannten Seifenlagerstätten. Wer den Sand in '
            'einer Pfanne schwenkt, lässt das leichte Gestein abschwimmen und '
            'behält das schwere Gold zurück.\n\n'
            'So begannen die großen Goldräusche: Kalifornien um 1849, Australien, '
            'der Klondike. Man brauchte kaum Werkzeug, nur eine Pfanne und Geduld. '
            'Das leicht erreichbare Flussgold war jedoch schnell ausgewaschen, und '
            'die Sucher zogen weiter oder gruben tiefer.',
      ),
      ProseSection(
        'Tief im Fels: Hartgesteinsbergbau und das Cyanid-Verfahren',
        'Das meiste Gold steckt fest im Gestein, oft nur in winzigen Mengen je '
            'Tonne. Um es zu gewinnen, wird das Erz gebrochen, fein gemahlen und '
            'chemisch herausgelöst. Seit dem späten 19. Jahrhundert geschieht das '
            'meist mit einer schwachen Cyanid-Lauge, an die sich das Gold bindet '
            'und aus der es dann ausgefällt wird.\n\n'
            'Das Verfahren ist wirksam, aber heikel: Cyanid ist giftig, und die '
            'Rückstände müssen sicher verwahrt werden. Geht ein Absetzbecken zu '
            'Bruch, gelangt die Lauge in Flüsse. Der Hartgesteinsbergbau holt also '
            'mehr Metall aus armem Erz, verlangt dafür aber große Anlagen und '
            'sorgfältige Kontrolle.',
      ),
      ProseSection(
        'Silber als Beifang: das Nebenprodukt der Blei- und Kupferminen',
        'Silber wird selten für sich allein abgebaut. Der größere Teil fällt als '
            'Beiprodukt an — beim Schmelzen von Blei, Zink, Kupfer und Gold. Das '
            'Silber sitzt im selben Erz und wird mitgewonnen, wenn ohnehin nach '
            'einem anderen Metall gegraben wird.\n\n'
            'Das hat eine eigenartige Folge: Wie viel Silber auf den Markt kommt, '
            'hängt oft weniger am Silberpreis als am Bedarf nach Kupfer oder Zink. '
            'Dass der größte Teil des Silbers Beiprodukt ist, gilt als gut belegt. '
            'Der genaue Anteil schwankt aber von Jahr zu Jahr und von Land zu '
            'Land.',
      ),
      ProseSection(
        'Wo gefördert wird: die großen Länder und Lagerstätten',
        'Gold wird auf allen Kontinenten gefördert. Zu den großen Förderländern '
            'zählen über die Jahre China, Australien, Russland, die Vereinigten '
            'Staaten, Kanada und mehrere Länder Afrikas und Südamerikas. Die '
            'Rangfolge wechselt, doch die Liste bleibt erstaunlich beständig.\n\n'
            'Beim Silber stehen Mexiko, Peru, China und einige Anden-Länder weit '
            'vorn — passend dazu, dass es meist im Verbund mit anderen Metallen '
            'gewonnen wird. Genaue Jahresmengen sind hier bewusst nicht genannt: '
            'Sie ändern sich laufend. Es geht um Größenordnungen und Rangfolgen, '
            'nicht um feste Zahlen.',
      ),
      ProseSection(
        'Aufwand und Abraum: Energie, Wasser und der ökologische Preis',
        'Aus armem Erz Gold zu holen, kostet viel. Für ein einziges Gramm müssen '
            'oft Tonnen Gestein bewegt, gemahlen und behandelt werden. Das '
            'verbraucht Energie und Wasser und hinterlässt große Mengen Abraum und '
            'Schlamm.\n\n'
            'Besonders schwierig ist der kleine, oft unregulierte Goldbergbau in '
            'ärmeren Regionen. Dort wird das Gold vielfach mit Quecksilber '
            'gebunden, das anschließend verdampft oder in Flüsse gelangt. Das '
            'Quecksilber schädigt Menschen und Umwelt; das internationale '
            'Minamata-Übereinkommen versucht, seinen Einsatz zurückzudrängen.\n\n'
            'Das ist kein moralisches Urteil über das Metall, sondern eine '
            'sachliche Bilanz: Jede gewonnene Unze hat einen Aufwand und eine '
            'Spur. Wer Gold als Wert begreift, sollte diesen Preis mitdenken.',
      ),
      ProseSection(
        'Ein ehrlicher Vorbehalt: „Peak Gold" und die Grenzen der Förderung',
        'Immer wieder heißt es, die Welt habe den Höhepunkt der Goldförderung '
            'erreicht oder bald überschritten — das sogenannte „Peak Gold". Das '
            'ist eine umstrittene Prognose, keine feststehende Tatsache.\n\n'
            'Denn was als abbauwürdig gilt, ist keine feste Größe. Steigt der '
            'Preis oder verbessert sich die Technik, wird aus unrentablem Gestein '
            'plötzlich eine Lagerstätte. Reichweiten-Angaben für Reserven sind '
            'darum Modellrechnungen unter Annahmen, keine Ablaufdaten.\n\n'
            'Richtig ist: Die leicht erreichbaren Vorkommen sind großteils '
            'gefunden, und neue Funde werden im Schnitt tiefer und ärmer. Ob und '
            'wann die Förderung wirklich dauerhaft sinkt, bleibt offen.',
      ),
    ],
    sources: [
      Source(
        'USGS — Gold & Silver Statistics and Information',
        'https://www.usgs.gov/centers/national-minerals-information-center/gold-statistics-and-information',
        'R1',
        'A2',
      ),
      Source(
        'World Gold Council — How is gold mined? (Interessenvertretung)',
        'https://www.gold.org/about-gold/gold-supply/gold-mining',
        'R3',
        'A2',
      ),
      Source(
        'UNEP — Minamata Convention / Quecksilber im Kleinbergbau',
        'https://www.unep.org/explore-topics/chemicals-waste/what-we-do/mercury',
        'R1',
        'A2',
      ),
      Source(
        'Gold mining — Wikipedia',
        'https://en.wikipedia.org/wiki/Gold_mining',
        'R2',
        'A1',
      ),
    ],
  ),
  ProseChapter(
    'Wieder eingeschmolzen: das Altmetall-Kreislaufgeschäft',
    [
      ProseSection(
        'Das Metall geht nie verloren: warum Gold so gut zirkuliert',
        'Gold rostet nicht, verbrennt nicht und löst sich nicht auf. Was einmal '
            'gefördert wurde, ist fast immer noch da — als Schmuck, als Barren, in '
            'einem Tresor oder in einem Gerät. Man kann es einschmelzen und neu '
            'gießen, ohne dass es schlechter wird.\n\n'
            'Es wird geschätzt, dass beinahe alles je geförderte Gold in irgendeiner '
            'Form weiterexistiert. Diese viel zitierte Schätzung stammt unter '
            'anderem vom World Gold Council, der als Branchenvertretung ein '
            'eigenes Interesse hat. Die Größenordnung gilt aber als plausibel: Gold '
            'verschwindet kaum, es wechselt nur die Gestalt.',
      ),
      ProseSection(
        'Die zweite Mine: Schmuckaltgold und Anlagebarren',
        'Neben den Bergwerken gibt es eine zweite Quelle: das Altgold. Alte '
            'Schmuckstücke, abgelegte Ketten, eingeschmolzene Münzen und Barren '
            'fließen zurück in den Markt und werden wieder zu reinem Metall.\n\n'
            'Diese „zweite Mine" braucht kein Bergwerk und keinen Abraum. In '
            'Ländern mit viel Goldschmuck ist sie ein bedeutender Teil des '
            'Angebots — vor allem dann, wenn ein hoher Preis die Menschen dazu '
            'bewegt, altes Gold herzugeben.',
      ),
      ProseSection(
        'Gold im Handy: Elektronikschrott als Rohstoffquelle',
        'In Handys, Rechnern und Platinen stecken winzige Mengen Gold, Silber und '
            'anderer Metalle, weil sie gut leiten und nicht korrodieren. In Summe '
            'liegt darin ein großer Schatz — das nennt man „Urban Mining", den '
            'Bergbau in der Stadt.\n\n'
            'Doch der Schatz ist verstreut und fest verbaut. Ihn zu heben, '
            'verlangt Sammeln, Zerlegen und aufwendige Trennung. Der weltweite '
            'Elektronikschrott wächst schnell, und nur ein Teil wird ordentlich '
            'verwertet. Urban Mining ist real, aber kein müheloses Geld.',
      ),
      ProseSection(
        'Ein ehrlicher Vorbehalt: Recycling folgt dem Preis, nicht dem Bedarf',
        'Wie viel Altmetall zurückkommt, hängt stark am Preis. Steigt er, geben '
            'mehr Menschen ihr altes Gold her, und das Recycling springt an. '
            'Fällt er, hält man das Stück lieber. Feste Anteile lassen sich darum '
            'nicht angeben — die Werte schwanken erheblich.\n\n'
            'Das Recycling folgt also dem Markt, nicht dem Bedarf der Industrie. '
            'Es ist ein nützlicher Puffer und schont die Umwelt gegenüber dem '
            'Neubergbau, ersetzt ihn aber nicht. Den Großteil des frischen '
            'Angebots liefern weiterhin die Minen.',
      ),
    ],
    sources: [
      Source(
        'World Gold Council — Above-ground stocks / recycled gold (Interessenvertretung)',
        'https://www.gold.org/goldhub/data/above-ground-stocks',
        'R3',
        'A2',
      ),
      Source(
        'UNU/UNITAR — Global E-waste Monitor',
        'https://ewastemonitor.info/',
        'R1',
        'A2',
      ),
      Source(
        'Urban mining — Wikipedia',
        'https://en.wikipedia.org/wiki/Urban_mining',
        'R2',
        'A1',
      ),
    ],
  ),
  ProseChapter(
    'Wo das Gold liegt: Tresore, Banken und Freilager',
    [
      ProseSection(
        'Festungen des Goldes: Fort Knox und der Tresor der New York Fed',
        'Das wohl bekannteste Goldlager ist Fort Knox in Kentucky, das '
            'Bullion-Depot der Vereinigten Staaten. Sein Name steht geradezu '
            'sprichwörtlich für Unangreifbarkeit: ein massiver Tresorbau, schwer '
            'bewacht, auf militärischem Gelände.\n\n'
            'Mindestens so wichtig ist der Tresor der Federal Reserve Bank of New '
            'York. Er liegt tief im Fels unter Manhattan und verwahrt Gold nicht '
            'nur für die USA, sondern für viele Staaten und Institutionen. Die '
            'Barren werden dort nicht verkauft, sondern verschoben — von einem '
            'Fach ins andere, wenn ein Land einem anderen zahlt.',
      ),
      ProseSection(
        'Der Londoner Marktplatz: LBMA, „Good Delivery" und die Tresore',
        'London ist seit langem ein Knotenpunkt des Goldhandels. Dort setzt die '
            'London Bullion Market Association den Maßstab: Nur Barren, die der '
            'Norm „Good Delivery" entsprechen — in Gewicht, Feinheit und Herkunft '
            'geprüft —, sind im großen Handel ohne Weiteres gut. Die Norm macht '
            'das Metall austauschbar: Ein geprüfter Barren ist so gut wie der '
            'andere.\n\n'
            'Hinter dem Markt steht ein Netz von Tresoren, in denen das Metall '
            'lagert. Was es heißt, dort „Loco London"-Gold zu halten, und wie '
            'sich das von eigenem Metall unterscheidet, steht im Kapitel '
            '„Papiergold und physisches Gold".',
      ),
      ProseSection(
        'Die Schweizer Drehscheibe: Raffinerien und Zollfreilager',
        'Ein erstaunlich großer Teil des Weltgoldes läuft durch die Schweiz. Dort '
            'sitzen mehrere der führenden Raffinerien, die Rohgold und Altgold zu '
            'genormten Barren umschmelzen — auch in kleinere Größen, wie sie in '
            'Asien gefragt sind.\n\n'
            'Dazu kommen die Zollfreilager: Lagerhäuser, in denen Waren liegen, '
            'ohne dass sie zollrechtlich „eingeführt" sind. Gold kann dort '
            'verwahrt und gehandelt werden, fast als befände es sich auf neutralem '
            'Boden. Das macht die Schweiz zu einer stillen Drehscheibe des '
            'Metalls.',
      ),
      ProseSection(
        'Wer für andere lagert: Zentralbankgold und ETF-Verwahrung',
        'Ein Tresor verwahrt oft nicht für einen Eigentümer, sondern für viele. '
            'Zentralbanken halten Gold als Reserve, manche im eigenen Land, manche '
            'im Ausland — etwa in New York oder London (mehr dazu, samt der '
            'Rückhol-Debatten, im Kapitel „Zentralbanken und ihr Gold").\n\n'
            'Auch Gold-Fonds (ETFs) lagern Metall für ihre Anleger. Ein Verwahrer '
            'hält die Barren, ein Treuhänder führt die Bücher, und ein Anteil am '
            'Fonds entspricht einem Anteil am gelagerten Gold. So wird aus '
            'physischem Metall ein handelbares Wertpapier — und doch liegt '
            'irgendwo ein realer Barren.',
      ),
      ProseSection(
        'Ein ehrlicher Vorbehalt: Prüfungen, Gerüchte und was wirklich belegt ist',
        'Um die großen Tresore ranken sich Erzählungen. Die bekannteste behauptet, '
            'in Fort Knox liege gar kein Gold mehr und die Bestände würden '
            'verheimlicht. Dafür gibt es keinen Beleg; es bleibt eine '
            'unbewiesene Verschwörungserzählung.\n\n'
            'Auch das Gerücht, dieselben Barren seien mehrfach verpfändet, gehört '
            'in diesen Dunstkreis — eingeordnet ist es im Kapitel „Papiergold und '
            'physisches Gold": Verhältniszahlen dazu sind Vermutung, kein '
            'erwiesener Betrug.\n\n'
            'Ehrlich bleibt darum: Über die großen Bestände gibt es amtliche '
            'Angaben und gelegentliche Prüfungen, aber keine lückenlose '
            'öffentliche Echtzeit-Kontrolle. Wer mehr Gewissheit behauptet — in '
            'die eine wie in die andere Richtung —, behauptet zu viel.',
      ),
    ],
    sources: [
      Source(
        'U.S. Mint — Fort Knox Bullion Depository',
        'https://www.usmint.gov/about/mint-tours-facilities/fort-knox',
        'R1',
        'A2',
      ),
      Source(
        'Federal Reserve Bank of New York — The Key to the Gold Vault',
        'https://www.newyorkfed.org/aboutthefed/goldvault.html',
        'R1',
        'A2',
      ),
      Source(
        'LBMA — London vaulting / Good Delivery',
        'https://www.lbma.org.uk/london-vaulting',
        'R1',
        'A2',
      ),
      Source(
        'Deutsche Bundesbank — Germany\'s gold',
        'https://www.bundesbank.de/en/tasks/topics/germany-s-gold',
        'R1',
        'A2',
      ),
    ],
  ),
  ProseChapter(
    'Platin und Palladium: edel, aber industriell',
    [
      ProseSection(
        'Die Platingruppe: sechs seltene Verwandte',
        'Neben Gold und Silber kennt der Werterechner zwei weitere Edelmetalle: '
            'Platin und Palladium. Beide gehören zur Platingruppe, einer Familie '
            'von sechs chemisch verwandten Metallen. Sie sind sehr selten, sehr '
            'beständig und schwer zu schmelzen.\n\n'
            'In Europa wurde Platin erst im 18. Jahrhundert bekannt. Die Völker '
            'der Anden verarbeiteten es allerdings schon lange vorher. Die '
            'spanischen Eroberer nannten es abschätzig „platina", also „kleines '
            'Silber", weil es sich so schwer bearbeiten ließ und ihnen den '
            'Goldsand verunreinigte.',
      ),
      ProseSection(
        'Das Herz des Katalysators: warum das Auto den Preis macht',
        'Anders als Gold und Silber sind Platin und Palladium vor allem '
            'Industriemetalle. Ihr wichtigster Verwendungszweck ist der '
            'Abgaskatalysator im Auto: Eine dünne Schicht des Metalls wandelt '
            'giftige Abgase in harmlosere Stoffe um.\n\n'
            'Darum bewegt sich ihr Preis weniger mit Anlegern und Schmuck als mit '
            'der Autoindustrie. Verkaufen sich viele Wagen, steigt die Nachfrage; '
            'stockt der Markt, fällt sie. Das macht diese Metalle deutlich '
            'konjunkturabhängiger als Gold.',
        illustrationId: 'werte/catalyst',
      ),
      ProseSection(
        'Diesel gegen Benzin: weshalb Platin und Palladium tauschen können',
        'In Katalysatoren lassen sich Platin und Palladium teilweise gegeneinander '
            'austauschen. Grob gilt: Dieselmotoren brauchen eher Platin, '
            'Benzinmotoren eher Palladium. Verschiebt sich der Markt von der einen '
            'zur anderen Antriebsart, verschiebt sich auch die Nachfrage.\n\n'
            'Deshalb war einmal das eine und einmal das andere Metall teurer. Wer '
            'meint, Platin sei „von Natur aus" wertvoller als Palladium, irrt: Das '
            'Verhältnis hat sich schon mehrfach umgekehrt. Der Austausch hat aber '
            'technische Grenzen — vollständig ersetzbar sind die beiden nicht.',
      ),
      ProseSection(
        'Die Wasserstoff-Wette: Brennstoffzellen und Elektrolyseure',
        'Platin steckt auch in Brennstoffzellen und in Geräten, die Wasser in '
            'Wasserstoff spalten. Wenn der Verkehr eines Tages stärker auf '
            'Wasserstoff setzt, könnte das eine neue, große Nachfrage schaffen.\n\n'
            'Das ist eine Wette auf die Zukunft, kein Fakt. Ob und wie schnell die '
            'Wasserstoffwirtschaft kommt, ist offen. Man sollte solche Aussichten '
            'als Möglichkeit lesen, nicht als sichere Entwicklung.',
      ),
      ProseSection(
        'Ein ehrlicher Vorbehalt: Edelmetall und Rohstoff zugleich',
        'Platin und Palladium sind beides zugleich: edle Wertspeicher und '
            'industrielle Rohstoffe. Das macht sie schwerer einzuschätzen als '
            'Gold. Ihr Preis hängt stärker an Technik, Vorschriften und '
            'Konjunktur.\n\n'
            'Dazu kommt: Ihre Förderung sammelt sich auf wenige Regionen. Das ist '
            'eine belegte Tatsache, kein Anlass für Spekulation über künftige '
            'Ereignisse. Sie erklärt aber, warum diese beiden Metalle stärker '
            'ausschlagen können als das breiter geförderte Gold.',
      ),
    ],
    sources: [
      Source(
        'Platinum — Wikipedia',
        'https://en.wikipedia.org/wiki/Platinum',
        'R2',
        'A1',
      ),
      Source(
        'Palladium — Wikipedia',
        'https://en.wikipedia.org/wiki/Palladium',
        'R2',
        'A1',
      ),
      Source(
        'USGS — Platinum-group metals',
        'https://www.usgs.gov/centers/national-minerals-information-center/platinum-group-metals-statistics-and-information',
        'R1',
        'A2',
      ),
      Source(
        'Johnson Matthey — PGM market (Interessenvertreter)',
        'https://matthey.com/products-and-markets/pgms-and-circularity/pgm-management/pgm-market-reports',
        'R3',
        'A2',
      ),
      Source(
        'IEA — The Role of Critical Minerals in Clean Energy Transitions',
        'https://www.iea.org/reports/the-role-of-critical-minerals-in-clean-energy-transitions',
        'R1',
        'A2',
      ),
    ],
  ),
  ProseChapter(
    'Soll das Geld zurück zum Gold?',
    [
      ProseSection(
        'Das Argument für die Bindung',
        'Wer für eine Goldbindung ist, schätzt vor allem die Disziplin. Ist das '
            'Geld an einen Goldvorrat gebunden, kann der Staat es nicht beliebig '
            'vermehren. Das soll vor Inflation schützen und dem Geld einen festen '
            'Anker geben.\n\n'
            'Auch die lange Stabilität spricht in diesen Augen für Gold: Über sehr '
            'große Zeiträume hat es seine Kaufkraft grob gehalten, wie das Kapitel '
            'über Getreide zeigt. Ein Geld, das so verankert ist, sei ehrlicher '
            'als eines, das sich vermehren lässt.',
      ),
      ProseSection(
        'Das Argument dagegen',
        'Die Gegenseite hält die Bindung für gefährlich starr. Ist die Geldmenge '
            'an Gold gekettet, kann eine Regierung in einer Krise nicht '
            'gegensteuern. Genau das machen viele für die Tiefe der großen '
            'Wirtschaftskrise um 1930 verantwortlich — das Geld blieb knapp, als '
            'es weiter werden musste.\n\n'
            'Dazu neigt ein an Gold gebundenes System zur Deflation: Wächst die '
            'Wirtschaft schneller als der Goldvorrat, müssen die Preise fallen. '
            'Fallende Preise klingen gut, lähmen aber oft Ausgaben und '
            'Beschäftigung.',
      ),
      ProseSection(
        'Warum kein großes Land zurückgekehrt ist',
        'Trotz aller Befürworter ist kein großes Land zum Goldstandard '
            'zurückgekehrt. Befragt man die Mehrheit der Wirtschaftsfachleute, '
            'lehnt sie eine Rückkehr ab. Das ist ein deutlicher Befund, aber kein '
            'Beweis der Unmöglichkeit — Mehrheitsmeinungen können sich irren und '
            'ändern.\n\n'
            'Der praktische Grund ist Flexibilität: Heutige Staaten wollen ihre '
            'Geldmenge steuern können, um Krisen abzufedern. Eine Goldbindung '
            'verengt diesen Spielraum.',
      ),
      ProseSection(
        'Gold als Anker neben dem Geld, nicht als Geld',
        'Zwischen „alles Gold" und „kein Gold" liegt ein Mittelweg, den viele '
            'Staaten tatsächlich gehen: Sie halten große Goldvorräte als Rücklage, '
            'binden ihr Geld aber nicht daran. Gold dient so als Anker neben dem '
            'Geld, nicht als das Geld selbst.\n\n'
            'In dieser Rolle ist Gold heute unbestritten wichtig. Über die '
            'schärfere Frage — Gold als das Geld zurück — streiten die Fachleute '
            'weiter.',
      ),
      ProseSection(
        'Ein ehrlicher Vorbehalt',
        'Dies ist eine offene wirtschaftspolitische Frage, kein gelöstes Problem. '
            'Beide Seiten haben ernste Argumente, und dieser Text fällt kein '
            'Urteil. Wer behauptet, Gold werde das staatliche Geld bald ersetzen, '
            'gibt eine Prognose oder eine Überzeugung wieder, keine Tatsache.\n\n'
            'Und ein Verhältnis wie sechzehn oder zwölf zu eins ist kein '
            'Naturgesetz, das eine Goldbindung „richtig" machte. Solche Zahlen '
            'kamen aus Münzgesetzen, wie im Kapitel über das Gold-Silber-'
            'Verhältnis steht. Dies ist keine Anlageberatung.',
      ),
    ],
    sources: [
      Source(
        'IGM Forum (Chicago Booth) — Gold Standard survey',
        'https://www.igmchicago.org/surveys/gold-standard/',
        'R2',
        'A2',
      ),
      Source(
        'Eichengreen — Golden Fetters (Deflations-Kritik)',
        'https://global.oup.com/academic/product/golden-fetters-9780195101133',
        'R2',
        'A3',
      ),
      Source(
        'Gold standard — Wikipedia (Kritik/Debatte)',
        'https://en.wikipedia.org/wiki/Gold_standard',
        'R2',
        'A1',
      ),
    ],
  ),
  ProseChapter(
    'Gold und Bitcoin: „digitales Gold"?',
    [
      ProseSection(
        'Woher das Bild „digitales Gold" kommt',
        'Bitcoin wird oft „digitales Gold" genannt. Der Vergleich liegt nahe, '
            'weil beide als knappe Wertspeicher gelten sollen, die kein Staat nach '
            'Belieben vermehren kann. Das Bild ist eingängig — und es trägt nur '
            'zum Teil.\n\n'
            'Dieser Text bewertet weder Bitcoin noch Gold als Geldanlage. Er '
            'vergleicht nur, wo die beiden sich ähneln und wo nicht. Das ist eine '
            'Frage des Verstehens, keine Empfehlung.',
      ),
      ProseSection(
        'Wo der Vergleich trägt: Knappheit',
        'Beim Thema Knappheit greift das Bild am ehesten. Gold ist selten, weil '
            'es in der Erde selten ist. Bitcoin ist knapp, weil sein Regelwerk die '
            'Gesamtmenge fest auf einundzwanzig Millionen Stück begrenzt — das ist '
            'eine nachprüfbare Eigenschaft des Protokolls.\n\n'
            'Aber programmierte Knappheit ist nicht dasselbe wie natürliche '
            'Seltenheit. Goldes Grenze setzt die Geologie, die niemand ändern '
            'kann. Bitcoins Grenze setzt eine Regel, die Menschen geschrieben '
            'haben — fest, aber von Menschen gemacht.',
      ),
      ProseSection(
        'Wo er hinkt: Jahrtausende gegen Jahrzehnte',
        'Der größte Unterschied ist die Zeit. Gold ist seit Jahrtausenden Geld '
            'und Wertspeicher; über sehr lange Zeit hielt es grob seine Kaufkraft. '
            'Bitcoin gibt es erst seit wenigen Jahrzehnten — seit 2009.\n\n'
            'Wie sich etwas über drei Jahrtausende geschlagen hat, sagt mehr über '
            'seine Beständigkeit aus als wenige Jahrzehnte. Bitcoin ist zudem als '
            'stark '
            'schwankend und energieintensiv dokumentiert. Ob es seinen Wert über '
            'Generationen hält, ist schlicht noch nicht erprobt.',
      ),
      ProseSection(
        'Greifbar gegen rein digital',
        'Gold ist ein Stoff, den man wiegen, prüfen und in die Hand nehmen kann — '
            'darum eignet es sich für die Troy-Gewichte des Werterechners. Bitcoin '
            'hat keinen Körper; es ist ein Eintrag in einem verteilten Verzeichnis.\n\n'
            'Beides hat zwei Seiten. Gold muss man lagern und sichern, dafür '
            'besteht es ohne Strom und Netz fort. Bitcoin lässt sich mühelos über '
            'die Welt schicken, hängt dafür aber an Rechnern und Stromnetzen.',
      ),
      ProseSection(
        'Eine offene Debatte — kein Urteil',
        'Manche sagen, Gold werde bald vom staatlichen Geld oder von Krypto '
            'verdrängt. Andere halten Bitcoin für eine Blase und Gold für '
            'unersetzlich. Beides sind Meinungen und Spekulationen, keine '
            'Tatsachen — und dieser Text entscheidet den Streit nicht.\n\n'
            'Der Werterechner kennt Gold, Silber, Platin und Palladium, weil das '
            'Stoffe mit langer, belegter Geschichte sind. Ob „digitales Gold" '
            'dieses Erbe einmal teilt, wird die Zukunft zeigen — versprechen kann '
            'es niemand.',
      ),
    ],
    sources: [
      Source(
        'Bitcoin — Wikipedia (Mengenbegrenzung, „digital gold")',
        'https://en.wikipedia.org/wiki/Bitcoin',
        'R2',
        'A1',
      ),
      Source(
        'Investopedia — digital gold (Begriff)',
        'https://www.investopedia.com/terms/d/digital-gold-currency.asp',
        'R2',
        'A1',
      ),
      Source(
        'World Gold Council — gold vs cryptocurrencies (Interessenvertreter, als Standpunkt)',
        'https://www.gold.org/goldhub/research',
        'R3',
        'A2',
      ),
    ],
  ),
  ProseChapter(
    'Die Preiskurve lesen',
    [
      ProseSection(
        'Die drei Reihen',
        'Das Diagramm zeigt drei Reihen, und alle drei messen an Gold. „Silber '
            'in Gold" sagt, was ein Gewicht Silber in Gold wert ist. „Getreide '
            'in Gold" sagt, was eine Menge Getreide in Gold kostet — also, wie '
            'viel Brotkorn man für sein Gold bekommt. „Gold in Getreide" ist '
            'deren Kehrwert, abgeleitet aus derselben Reihe: was ein Stück Gold '
            'an Getreide aufwiegt.\n\n'
            'Jede Reihe erzählt etwas anderes. Silber gegen Gold ist eine Frage '
            'der zwei Geldmetalle zueinander. Getreide gegen Gold ist die '
            'Kaufkraft des Goldes am Grundnahrungsmittel — wie weit dieser Faden '
            'durch die Jahrhunderte trägt, steht im Kapitel „Hält Gold seinen '
            'Wert?". Hier geht es nur darum, wie man die Linien im Bild liest.',
      ),
      ProseSection(
        'Die Nulllinie in der Mitte',
        'Jede Reihe ist auf ihren ältesten bekannten Wert bezogen. Dieser '
            'älteste Wert wird zu eins gesetzt und liegt als fette Nulllinie '
            'quer durch die Mitte. Alles Spätere wird daran gemessen.\n\n'
            'Die Leserichtung ist einfach: Über der Linie heißt teurer '
            'gegenüber Gold, darunter billiger. Steigt eine Linie, ist die Sache '
            'im Verhältnis zu Gold wertvoller geworden; fällt sie, ist sie '
            'gegenüber Gold billiger geworden. Weil die Mitte der Startpunkt '
            'ist, sieht man auf einen Blick, ob sich seither nach oben oder nach '
            'unten etwas bewegt hat.',
      ),
      ProseSection(
        'Die Umkehrung bei „Silber in Gold"',
        'Bei der Silberreihe ist eine Drehung zu beachten. Das Diagramm zeigt '
            'nicht das gewohnte Gold-Silber-Verhältnis, sondern dessen Kehrwert: '
            'Silber gemessen in Gold. Darum steht eine fallende Linie hier für '
            'ein sich weitendes Verhältnis.\n\n'
            'Wird Silber gegenüber Gold billiger, so wächst die übliche '
            'Verhältniszahl — und die Linie „Silber in Gold" sinkt. Die große '
            'Spreizung der Neuzeit erscheint im Bild also als langes Absinken, '
            'nicht als Anstieg. Die lange Geschichte dieses Verhältnisses selbst '
            'gehört in die Kapitel zum Gold-Silber-Verhältnis; hier zählt nur, '
            'wie sie sich in der Kurve niederschlägt.',
      ),
      ProseSection(
        'Antike Ringe und das Unsicherheitsband',
        'Die antiken Punkte sehen anders aus als die moderne Linie. Sie stehen '
            'als einzelne Ringe da, nicht verbunden, und jeder trägt ein '
            'geschätztes Band von einem niedrigen bis zu einem hohen Wert. Das '
            'Band ist breit, weil antike Preise unregelmäßig, regional '
            'verschieden und nur als Größenordnung bekannt sind.\n\n'
            'Dass über die Lücken keine Linie läuft, ist Absicht. Zwischen einem '
            'babylonischen und einem römischen Punkt liegen Jahrhunderte ohne '
            'verlässliche Zahl. Eine durchgezogene Linie würde dort einen '
            'Verlauf vortäuschen, den niemand kennt. Die moderne Reihe dagegen '
            'ist dicht genug, um als Linie geführt zu werden.',
      ),
      ProseSection(
        'Schieben, zoomen, einpassen',
        'Die Kurve öffnet sich über die „Kurve"-Taste, die das Tastenfeld '
            'ersetzt; das ×-Symbol schließt sie wieder. Von Haus aus zeigt das '
            'Bild ungefähr die letzten hundert Jahre — den Abschnitt mit den '
            'dichtesten Daten.\n\n'
            'Mit dem Finger lässt sich die Ansicht verschieben und mit zwei '
            'Fingern zoomen. Wer ganz herauszoomt — über den Fit-Knopf oder '
            'einen Doppeltipp —, sieht die volle Spanne bis in die Antike, mit '
            'dem ältesten Wert links nahe der Nulllinie. Die Werte an der Achse '
            'sind Faktoren gegenüber diesem Startwert und folgen der '
            'eingestellten Zahlbasis, dozenal oder dezimal.',
      ),
      ProseSection(
        'Wie man ehrlich liest',
        'Die Kurve ist keine amtliche Zeitreihe, sondern eine bewusst grobe, '
            'belegte Rekonstruktion aus zitierten Quellen — in zwei Durchgängen '
            'von recherchierenden und prüfenden Helfern zusammengetragen. Die '
            'Quellen-Zeile im Diagramm listet sie auf.\n\n'
            'Darum gilt: Die moderne Linie liest man als Daten, die antiken '
            'Ringe als grobe Marken. Genauigkeit hinein-zu-lesen, wo nur '
            'Größenordnungen stehen, führt in die Irre — das gilt gerade für die '
            'ältesten Punkte. Das Bild zeigt eine lange Bewegung, keine '
            'tagesgenaue Buchführung.',
      ),
    ],
    sources: [
      Source(
        'World Bank — Commodity Markets „Pink Sheet"',
        'https://www.worldbank.org/en/research/commodity-markets',
        'R1',
        'A1',
      ),
      Source(
        'Gold and Silver: Relative Values in the Ancient Past (Ross & Bettenay, 2024)',
        'https://www.cambridge.org/core/journals/cambridge-archaeological-journal',
        'R2',
        'A2',
      ),
      Source(
        'Clark, G. — The Price History of English Agriculture, 1209–1914',
        'https://faculty.econ.ucdavis.edu/faculty/gclark/papers/Agprice.pdf',
        'R2',
        'A2',
      ),
      Source(
        'Babylonische „Astronomical Diaries" (Gerstenpreise in Silber)',
        'https://www.academia.edu/10863477/',
        'R2',
        'A3',
      ),
    ],
  ),
  ProseChapter(
    'Spekulatives (mit Vorsicht)',
    [
      ProseSection(
        'Wo der Boden weich wird',
        'Bis hierher ging es um Belegbares: Gewichte, Stoffe, Geschichte, Kurse. '
            'Dieses Kapitel sammelt das, wo der Boden weich wird — die '
            'umstrittenen, die unbeweisbaren, die geglaubten Behauptungen rund um '
            'Geld und Metall. Sie gehören in einen Text über Wert, aber sie '
            'gehören eigens markiert.\n\n'
            'Die Regel hier ist einfach: Was belegt ist, steht als Tatsache; was '
            'umstritten, attribuiert oder spekulativ ist, wird genau so genannt. '
            'Manche dieser Fäden haben inzwischen ein eigenes Kapitel bekommen — '
            'dort werden sie ausführlich behandelt, hier nur als das verbucht, was '
            'sie sind: offene Fragen, keine Wahrheiten.',
      ),
      ProseSection(
        'Sound Money',
        'Manche halten metallgedecktes Geld für das ehrlichste, weil es sich '
            'nicht beliebig vermehren lässt. Andere halten dagegen, dass eine '
            'feste Geldmenge eine Wirtschaft erdrosseln kann. Das ist eine '
            'umstrittene wirtschaftspolitische Frage, kein gesicherter Befund — '
            'beide Seiten haben Argumente.\n\n'
            'Ob das Geld zum Gold zurückkehren sollte, ist eine eigene große '
            'Streitfrage; sie ist im Kapitel „Soll das Geld zurück zum Gold?" '
            'mit beiden Seiten ausgebreitet und wird hier nicht erneut '
            'verhandelt. Wichtig bleibt nur: Wer „Sound Money" sagt, gibt eine '
            'Überzeugung wieder, keine bewiesene Lehre.',
      ),
      ProseSection(
        'Innerer Wert',
        'Hat Gold einen „inneren" Wert, oder gilt es nur, weil alle sich darauf '
            'geeinigt haben? Darüber streiten Philosophen und Ökonomen seit '
            'langem. Edelmetalle haben einen Nutzwert in Schmuck und Industrie, '
            'aber ihr Geldwert beruht zu großen Teilen auf Übereinkunft.\n\n'
            'Die ältere Vorstellung, ein Ding trage seinen Wert in sich, gilt '
            'heute als überholt; die meisten Ökonomen sehen Wert als etwas, das '
            'erst im Tausch entsteht. Beweisen lässt sich keine der Seiten '
            'endgültig — es ist eine Frage der Sichtweise, nicht der Messung. '
            'Darum steht sie hier, unter Vorbehalt.',
      ),
      ProseSection(
        'Zwölf im Geld',
        'Dass Troy-Gewicht und die alte £sd-Stückelung dozenal gebaut sind, ist '
            'belegt. Der Sprung von dort zu „Zwölf ist die natürliche Geldbasis" '
            'ist es nicht. Die Zwölf half beim Teilen (durch 2, 3, 4 und 6), aber '
            'daneben standen die Zwanzig der Schillinge und die Sechzehn des '
            'Avoirdupois. Zwölf war nützlich, nicht heilig — mehr dazu steht in '
            'den Grundlagen der Theorie.\n\n'
            'Reizvoll ist der Gedanke trotzdem: Ein Maßstab, der sich glatt '
            'dritteln und vierteln lässt, passt gut zu einem Geld, das man '
            'aufteilen muss. Doch aus „nützlich" wird hier gern „naturgegeben", '
            'und das ist der Schritt zu viel. Die Zwölf ist eine kluge Wahl '
            'gewesen, keine im Wesen des Geldes angelegte Notwendigkeit.',
      ),
      ProseSection(
        'Manipulation und das angebliche Verhältnis',
        'Rund um Silber und Gold kreisen hartnäckige Erzählungen: Der Preis '
            'werde planmäßig gedrückt, die Lager seien leer, ein festes '
            'Papier-zu-Metall-Verhältnis erzwinge den Crash. Einzelne Strafen '
            'wegen „Spoofing" — vorgetäuschter Orders — sind dokumentiert; daraus '
            'folgt aber keine dauerhafte, koordinierte Unterdrückung des '
            'Preises.\n\n'
            'Diese Fäden sind ausführlich und mit ihren belegten Kernen in den '
            'Kapiteln „Papier gegen Metall" und „Papiergold und physisches Gold" '
            'eingeordnet; hier zählt nur das Etikett. Die belegten Einzelfälle '
            'sind das eine, die pauschale Verschwörungsdeutung das andere. Wer '
            'beides vermengt, macht aus einem Verdacht eine Tatsache, die er nicht '
            'hat.\n\n'
            'Ebenso umstritten ist die Erwartung, das Gold-Silber-Verhältnis '
            'kehre zu einer alten Marke nahe sechzehn zurück. Dass diese Zahl '
            'kein Naturgesetz ist, steht in den Kapiteln zum Verhältnis; eine '
            'Rückkehr bleibt Anlagethese, nicht Gewähr.',
      ),
      ProseSection(
        'Was offen bleibt',
        'Am Ende steht weniger Gewissheit, als mancher erwartet. Was eine Sache '
            '„wirklich wert" ist, lässt sich nicht messen wie ihr Gewicht. Wert '
            'entsteht zwischen Menschen, in Knappheit, Nutzen und Vertrauen — und '
            'all das wandert mit der Zeit. Ein Rechner kann Mengen umrechnen; ob '
            'sie ihren Wert halten, kann er nicht versprechen.\n\n'
            'Auch das Geld selbst bleibt eine offene Frage. Ob es an Metall '
            'gebunden sein sollte, ob „digitales Gold" das alte Gold beerbt, ob '
            'Silber zu Gold aufholt — diese Debatten sind in den eigenen Kapiteln '
            '(„Soll das Geld zurück zum Gold?", „Gold und Bitcoin") aufgefächert, '
            'und keine ist entschieden. Dieser Text fällt darüber bewusst kein '
            'Urteil.\n\n'
            'Wer den Wert von Gold und Silber versteht, versteht damit auch die '
            'Grenzen dessen, was sich über Wert überhaupt wissen lässt.',
      ),
    ],
    sources: [
      Source(
        'Sound money — Wikipedia',
        'https://en.wikipedia.org/wiki/Sound_money',
        'R2',
        'A1',
      ),
      Source(
        'Theory of value (economics) — Wikipedia',
        'https://en.wikipedia.org/wiki/Theory_of_value_(economics)',
        'R2',
        'A1',
      ),
      Source(
        'Gold standard — Wikipedia',
        'https://en.wikipedia.org/wiki/Gold_standard',
        'R2',
        'A1',
      ),
    ],
  ),
];
