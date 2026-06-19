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
  ProseChapter('Was ist Wert?', [
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
          '„Pfund" (£) ist dasselbe Wort wie das Gewicht.\n\n'
          'Woher das Zeichen „£" kommt und wie die alte Stückelung von Pfund, '
          'Schilling und Penny dozenal gebaut ist, steht ausführlich in der '
          'Einheitentheorie unter „Preis". Hier geht es um die Edelmetalle '
          'selbst und um die Frage, ob sie ihren Wert halten.',
    ),
  ]),
  ProseChapter('Edelmetalle als Geld', [
    ProseSection(
      'Warum gerade Metalle',
      'Edelmetalle wurden über Jahrtausende zu Geld, weil sie vier Dinge '
          'zugleich können: Sie verderben nicht, man kann sie teilen und wieder '
          'einschmelzen, sie sind selten genug, um nicht beliebig zu sein, und '
          'man erkennt sie wieder. Gold, Silber, Platin und Palladium sind die '
          'vier, die der Werterechner kennt.',
    ),
    ProseSection(
      'Troy: zwölf Unzen aufs Pfund',
      'Edelmetalle werden bis heute in Troy-Gewichten gewogen, und die sind '
          'echt dozenal: Zwölf Troy-Unzen ergeben ein Troy-Pfund. Alle Stufen '
          'sind ganzzahlige Vielfache des Grains — 1959 festgelegt auf '
          '0,06479891 Gramm: 24 Grain sind ein Pennyweight, 480 Grain eine '
          'Troy-Unze.\n\n'
          'Auch die Feinheit zählt dozenal-nah: Reines Gold hat 24 Karat, und '
          '24 ist zweimal zwölf.',
    ),
    ProseSection(
      'Ein ehrlicher Vorbehalt',
      'Das Troy-Gewicht steht neben dem alltäglichen Avoirdupois-Gewicht, und '
          'das stiftet Verwirrung. Eine Troy-Unze ist rund 9,7 Prozent '
          'schwerer als eine gewöhnliche Unze — aber das Troy-Pfund ist '
          'leichter als das gewöhnliche Pfund, weil es nur zwölf Unzen hat '
          'statt sechzehn.\n\n'
          'Die Zwölf ist hier also echt. Durchgesetzt hat sie sich aber nie '
          'überall: Daneben blieb die Sechzehn des Avoirdupois bestehen.',
    ),
  ], sources: [
    Source('Troy weight — Wikipedia', 'https://en.wikipedia.org/wiki/Troy_weight', 'R2', 'A1'),
  ]),
  ProseChapter('Das Gold-Silber-Verhältnis', [
    ProseSection(
      'Antike Verhältnisse',
      'Wie viel Silber ist eine Einheit Gold wert? In der Antike lag dieses '
          'Verhältnis oft im Bereich von etwa zwölf bis sechzehn zu eins — also '
          'nahe der Zwölf. In Ägypten, Babylon, Griechenland und Rom finden '
          'sich Werte in dieser Größenordnung, auch wenn sie nach Ort und Zeit '
          'schwankten.',
    ),
    ProseSection(
      'Bimetallismus',
      'Später legten Münzgesetze das Verhältnis fest — die USA etwa 1792 auf '
          '15 zu 1, 1834 auf rund 16 zu 1. Wich der Marktpreis davon ab, '
          'verschwand das unterbewertete Metall aus dem Umlauf. Das ist '
          'Greshams Gesetz: schlechtes Geld verdrängt gutes.\n\n'
          '1873 nahmen die USA das Silber aus der Münzordnung; Gegner nannten '
          'es später den „Crime of 1873".',
    ),
    ProseSection(
      'Die moderne Spreizung',
      'Nachdem das Silber entmünzt war und im 20. Jahrhundert kein Metall mehr '
          'das Geld deckte, weitete sich das Verhältnis stark: Heute sind es '
          'oft fünfzig bis neunzig zu eins. Kurzzeitig kann es ausschlagen — am '
          '„Silbernen Donnerstag" 1980 trieben die Brüder Hunt den Silberpreis '
          'auf knapp 50 Dollar je Unze, bevor er einbrach.',
    ),
    ProseSection(
      'Ein ehrlicher Vorbehalt',
      'Dass das Verhältnis „früher immer zwölf" gewesen sei, ist zu glatt. Die '
          'antiken Werte streuten je nach Region und Quelle erheblich, und die '
          'Belege sind lückenhaft. Die Nähe zur Zwölf ist auffällig — ein '
          'Naturgesetz ist sie nicht.',
    ),
  ], sources: [
    Source('Gold and Silver: Relative Values in the Ancient Past (Ross & Bettenay, 2024)', 'https://www.cambridge.org/core/journals/cambridge-archaeological-journal', 'R2', 'A2'),
    Source('Coinage Act of 1873 — Wikipedia', 'https://en.wikipedia.org/wiki/Coinage_Act_of_1873', 'R2', 'A1'),
    Source('U.S. Mint — „Crime of 1873"', 'https://www.usmint.gov/news/inside-the-mint/mint-history-crime-of-1873', 'R1', 'A2'),
    Source('Silver Thursday — Wikipedia', 'https://en.wikipedia.org/wiki/Silver_Thursday', 'R2', 'A1'),
    Source('World Bank — Commodity Markets „Pink Sheet"', 'https://www.worldbank.org/en/research/commodity-markets', 'R1', 'A1'),
  ]),
  ProseChapter('Hält Gold seinen Wert?', [
    ProseSection(
      'Die Frage',
      'Gold gilt als Wertspeicher. Aber hält es seinen Wert wirklich? Um das '
          'zu prüfen, misst man Gold nicht in Geld — das selbst schwankt — '
          'sondern in etwas, das die Menschen immer brauchten: Nahrung, konkret '
          'Getreide.',
    ),
    ProseSection(
      'Über sehr lange Zeit grob stabil',
      'Über sehr lange Zeiträume kauft eine feste Menge Gold ungefähr '
          'vergleichbare Mengen Getreide — vom römischen Ägypten über das '
          'mittelalterliche England bis heute. „Ungefähr" ist dabei das '
          'wichtige Wort: Es geht um Größenordnungen, nicht um feste Zahlen.',
    ),
    ProseSection(
      'Aber nicht von Jahr zu Jahr',
      'Kurzfristig ist Gold alles andere als stabil. Sein Preis in Getreide '
          'schwankt über Jahre und Jahrzehnte deutlich. Gold ist ein '
          'Wertspeicher über Generationen, kein verlässlicher Maßstab von einem '
          'Jahr aufs nächste.',
    ),
    ProseSection(
      'Ein ehrlicher Vorbehalt',
      'Die alten Werte sind grob, regional und oft nur als Größenordnung '
          'überliefert. Wer sagt, Gold sei „ewig stabil", sagt zu viel. Richtig '
          'ist: Über sehr lange Zeit bleibt die Kaufkraft erstaunlich in '
          'derselben Größenordnung — mit großen Ausschlägen dazwischen.',
    ),
  ], sources: [
    Source('Harper, K. — People, Plagues, and Prices in the Roman World (2016)', 'https://www.cambridge.org/core/journals/journal-of-economic-history', 'R2', 'A2'),
    Source('Clark, G. — The Price History of English Agriculture, 1209–1914', 'https://faculty.econ.ucdavis.edu/faculty/gclark/papers/Agprice.pdf', 'R2', 'A2'),
    Source('World Bank — Commodity Markets „Pink Sheet"', 'https://www.worldbank.org/en/research/commodity-markets', 'R1', 'A1'),
  ]),
  ProseChapter('Die Preiskurve lesen', [
    ProseSection(
      'Alles relativ zu Gold',
      'Das Diagramm im Werterechner misst alles an Gold: Silber in Gold, '
          'Getreide in Gold und Gold in Getreide. Jede Reihe ist auf ihren '
          'ältesten bekannten Wert bezogen — dieser liegt als fette Nulllinie '
          'in der Mitte. Über der Linie heißt teurer, darunter billiger, '
          'jeweils gegenüber Gold.',
    ),
    ProseSection(
      'Das Unsicherheitsband',
      'Die antiken Punkte tragen ein geschätztes Band von einem niedrigen bis '
          'zu einem hohen Wert, und sie stehen als einzelne Ringe da, nicht als '
          'Linie. Das ist Absicht: Antike Preise sind unregelmäßig, regional '
          'und nur als Größenordnung bekannt. Über eine Lücke wird keine Linie '
          'gezogen, die es nicht gibt.',
    ),
    ProseSection(
      'Ein kuratierter, belegter Datensatz',
      'Die Kurve ist keine amtliche Zeitreihe, sondern eine bewusst grobe, '
          'belegte Rekonstruktion aus zitierten Quellen — in zwei Durchgängen '
          'von recherchierenden und prüfenden Helfern zusammengetragen. Die '
          'Quellen-Zeile im Diagramm listet sie auf.',
    ),
    ProseSection(
      'Wie man ehrlich liest',
      'Lies die moderne Linie als Daten, die antiken Ringe als grobe Marken. '
          'Genauigkeit hinein-zu-lesen, wo nur Größenordnungen stehen, führt in '
          'die Irre — das gilt gerade für die ältesten Punkte.',
    ),
  ], sources: [
    Source('World Bank — Commodity Markets „Pink Sheet"', 'https://www.worldbank.org/en/research/commodity-markets', 'R1', 'A1'),
    Source('Gold and Silver: Relative Values in the Ancient Past (Ross & Bettenay, 2024)', 'https://www.cambridge.org/core/journals/cambridge-archaeological-journal', 'R2', 'A2'),
    Source('Clark, G. — The Price History of English Agriculture, 1209–1914', 'https://faculty.econ.ucdavis.edu/faculty/gclark/papers/Agprice.pdf', 'R2', 'A2'),
    Source('Babylonische „Astronomical Diaries" (Gerstenpreise in Silber)', 'https://www.academia.edu/10863477/', 'R2', 'A3'),
  ]),
  ProseChapter('Spekulatives (mit Vorsicht)', [
    ProseSection(
      'Sound Money',
      'Manche halten metallgedecktes Geld für das ehrlichste, weil es sich '
          'nicht beliebig vermehren lässt. Andere halten dagegen, dass eine '
          'feste Geldmenge eine Wirtschaft erdrosseln kann. Das ist eine '
          'umstrittene wirtschaftspolitische Frage, kein gesicherter Befund — '
          'beide Seiten haben Argumente.',
    ),
    ProseSection(
      'Innerer Wert',
      'Hat Gold einen „inneren" Wert, oder gilt es nur, weil alle sich darauf '
          'geeinigt haben? Darüber streiten Philosophen und Ökonomen seit '
          'langem. Edelmetalle haben einen Nutzwert in Schmuck und Industrie, '
          'aber ihr Geldwert beruht zu großen Teilen auf Übereinkunft.',
    ),
    ProseSection(
      'Zwölf im Geld',
      'Dass Troy-Gewicht und die alte £sd-Stückelung dozenal gebaut sind, ist '
          'belegt. Der Sprung von dort zu „Zwölf ist die natürliche Geldbasis" '
          'ist es nicht. Die Zwölf half beim Teilen (durch 2, 3, 4 und 6), aber '
          'daneben standen die Zwanzig der Schillinge und die Sechzehn des '
          'Avoirdupois. Zwölf war nützlich, nicht heilig — mehr dazu steht in '
          'den Grundlagen der Theorie.',
    ),
  ]),
];
