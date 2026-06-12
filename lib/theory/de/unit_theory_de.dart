// German unit-theory prose. part of ../unit_theory.dart.
// Bodies are kept in simple, short sentences (easier to translate). Distilled
// from the research dossiers in docs/research/. `count` covers the counting
// units (Dutzend/Gros/Großgros/Bäckerdutzend); it stays complementary to
// Theorie → Grundlagen (the why-twelve / finger-counting story lives there).

part of '../unit_theory.dart';

List<UnitTheorySection> _converterIntroDe() {
  return const [
    UnitTheorySection(
      'Was der Rechner kann',
      'Der Einheitenrechner rechnet zwischen der imperial-dozenalen Welt '
          '(Basis zwölf) und der metrischen Welt (Basis zehn) um — über alle '
          'Kategorien: Länge, Fläche, Volumen, Gewicht, Zeit, Winkel, '
          'Währung, Temperatur und weitere wie Druck, Kraft, Energie, '
          'Leistung, Küche und Drehmoment.\n\n'
          'Die { }-Klammer zeigt stets den Wert im jeweils anderen System. '
          'Mehrere Einheiten lassen sich zu einem Wert zusammensetzen — etwa '
          '1 ft 6 in oder 2 h 30 min. Ein Druck auf = zykelt durch die '
          'Einheiten-Darstellungen und die gestufte Aufschlüsselung; langer '
          'Druck auf eine Einheit zeigt eine Kurzdefinition. Die Ziffern '
          'erscheinen als Dozenal-Glyphen oder als gewöhnliche 0–9/A/B, je '
          'nach Anzeige-Einstellung.',
    ),
    UnitTheorySection(
      'Was er nicht kann',
      'Er ist ein Umrechner, kein wissenschaftlicher Rechner: keine '
          'Funktionen wie Sinus oder Logarithmus, kein freies Rechnen mit '
          '× und ÷, kein Speicher und kein Winkelmodus. Dafür ist der '
          'Hauptrechner da.\n\n'
          'Die Währung (Pence/Schilling/Pfund) bildet das historische '
          'britische Verhältnis ab — zwölf Pence auf den Schilling, zwanzig '
          'Schilling aufs Pfund —, nicht aktuelle Wechselkurse. Sie zeigt die '
          'dozenale Struktur des alten Geldes, keine tagesaktuellen '
          'Geldwerte. Der Satz an Einheiten ist fest vorgegeben.',
    ),
    UnitTheorySection(
      'So wird er bedient',
      'Tippe eine Kategorie an (etwa Länge) — ihre Einheiten-Leiter klappt '
          'in die Gegenspalte auf. Tippe eine Einheit, gib Ziffern ein und '
          'setze mehrere Einheiten zu einem Wert zusammen. Die DOZ/DEZ-Taste '
          'wechselt zwischen der imperialen und der metrischen Welt; die '
          '{ }-Klammer zeigt das Gegenstück. = zykelt die Darstellungen, '
          'langer Druck auf eine Einheit zeigt ihre Bedeutung, und ein Tipp '
          'auf die Eingabezeile setzt den Cursor.\n\n'
          'Ein Beispiel — 1 ft 6 in eingeben und in der Gegenwelt ablesen:',
    ),
  ];
}

List<UnitTheorySection> _unitTheoryDe(UnitCategory cat) {
  switch (cat) {
    case UnitCategory.count:
      return const [
        UnitTheorySection(
          'Stapeln in Zwölfern',
          'Stückzahlen kann man in Zehnern bündeln — oder in Zwölfern. Ein '
              'Dutzend sind zwölf Stück, ein Gros zwölf Dutzend (144), ein '
              'Großgros zwölf Gros (1728). Das ist dieselbe Treppe wie Einer, '
              'Zehner, Hundert, Tausend, nur in Basis zwölf: Dutzend = 12¹, '
              'Gros = 12², Großgros = 12³. In Basis zwölf geschrieben sind das '
              'glatt 10, 100 und 1000 — das Großgros ist also das „dozenale '
              'Tausend".\n\n'
              'Warum sich die Zwölf so bequem teilen lässt und wie man an den '
              'drei Gliedern der vier Finger bis zwölf zählt, steht in '
              'Theorie → Grundlagen. Hier geht es um die Zähl-Einheiten selbst.',
        ),
        UnitTheorySection(
          'Woher die Namen kommen',
          '„Dutzend" kommt über das altfranzösische douzaine vom lateinischen '
              'duodecim, „zwei-und-zehn"; das Wort meint genau zwölf, nicht '
              'ungefähr. Verwandt sind das spanische docena, das italienische '
              'dozzina und das englische dozen.\n\n'
              '„Gros" stammt von der grosse douzaine, dem „großen Dutzend", und '
              'ist seit dem frühen 15. Jahrhundert belegt. Im Großhandel zählte '
              'und verpackte man Kleinwaren — Bleistifte, Knöpfe, Nadeln — '
              'gros-weise; manche Bleistiftdosen tragen bis heute die Aufschrift '
              '„1 Gros". Das Großgros (1728) ist das Dutzend Gros — und '
              'zufällig auch die Zahl der Kubikzoll in einem Kubikfuß '
              '(12 × 12 × 12). Eier verkauft man bis heute im Dutzend.',
        ),
        UnitTheorySection(
          'Das Bäckerdutzend',
          'Ein Bäckerdutzend sind dreizehn — eines mehr als ein gewöhnliches '
              'Dutzend; der dreizehnte Laib heißt „Vantage-Laib". Die geläufige '
              'Erklärung verweist auf die mittelalterliche englische '
              'Brotverordnung (Assize of Bread, 13. Jahrhundert): Wer '
              'untergewichtiges Brot verkaufte, dem drohten Strafen, also legte '
              'der Bäcker sicherheitshalber einen Laib drauf.\n\n'
              'Ein ehrlicher Vorbehalt gehört dazu: Diese Herleitung ist '
              'plausibel und weit verbreitet, aber nicht urkundlich belegt. Die '
              'ältesten schriftlichen Belege für das englische „baker’s dozen" '
              'stammen erst aus dem späten 16. Jahrhundert — lange nach der '
              'Verordnung.',
        ),
      ];
    case UnitCategory.dist:
      return const [
        UnitTheorySection(
          'Maße vom Körper',
          'Die ältesten Längenmaße kommen vom menschlichen Körper. Die '
              'Fingerbreite wurde zum Zoll, der Unterarm zur Elle, der Fuß zum '
              'Fuß, die Spannweite der Arme zum Klafter. Das war praktisch, denn '
              'jeder trug sein Maß bei sich. Es war aber ungenau, denn kein '
              'Körper gleicht dem anderen.\n\n'
              'Die ersten festen Standards entstanden in Mesopotamien und '
              'Ägypten. In Ägypten galt die Königselle, etwa 52 Zentimeter. Sie '
              'war der Unterarm des Pharaos und wurde als Urmaß in Stein '
              'festgehalten. Arbeits-Ellen aus Holz glich man regelmäßig damit '
              'ab — das war der Anfang der Eichung.',
        ),
        UnitTheorySection(
          'Von Rom bis ins Mittelalter',
          'Die Römer ordneten das System. Ihr Fuß (pes) hatte zwölf „uncia". '
              'Aus uncia wurde das Wort „Zoll" (englisch inch) — und auch '
              '„Unze". Ihre Meile hieß „mille passus", tausend Doppelschritte, '
              'etwa 1480 Meter. Sie ist die Wurzel aller späteren Meilen.\n\n'
              'Im Mittelalter hatte fast jede Stadt eigene Maße. Ein Zoll wurde '
              'als drei hintereinandergelegte Gerstenkörner definiert. Für den '
              'Fuß gab es kuriose Verfahren: 1535 beschrieb Jacob Köbel, man '
              'solle sonntags sechzehn Männer aus der Kirche Fuß hinter Fuß '
              'aufstellen — ein Sechzehntel davon sei der „rechte Fuß". So '
              'mittelte man die Unterschiede heraus. In Deutschland reichte der '
              'Fuß trotzdem von 235 bis 408 Millimetern.',
        ),
        UnitTheorySection(
          'Maße in aller Welt',
          'Dasselbe Muster gibt es überall. In China maß man in chi (Fuß) und '
              'cun (Zoll), in Indien in hasta (Elle) und angula (Finger), in der '
              'islamischen Welt in verschiedenen Ellen. Die Elle vom Ellbogen '
              'bis zur Fingerspitze findet sich auf fast allen Kontinenten — der '
              'Körper ist der gemeinsame Ursprung.\n\n'
              'In vielen Kulturen galt der Körper als heiliges Maß, der Mensch '
              'als Abbild der Weltordnung. Ägyptische Tempel, der biblische Bau '
              'der Arche und hinduistische Tempel wurden in Ellen vermessen.\n\n'
              'Auch die Sprache hat die Maße bewahrt. „Gib ihnen einen Zoll, und '
              'sie nehmen eine Meile" hieß ursprünglich „… und sie nehmen eine '
              'Elle". Ein „Katzensprung" ist eine kurze Strecke. Der '
              'Seemanns-Lotruf „mark twain" (zwei Klafter Tiefe) wurde zum '
              'Künstlernamen von Mark Twain.',
        ),
        UnitTheorySection(
          'Warum Zwölf — und ein ehrlicher Vorbehalt',
          'Warum hat der Fuß ausgerechnet zwölf Zoll? Wegen der Teilbarkeit. '
              'Zwölf lässt sich glatt halbieren, dritteln, vierteln und '
              'sechsteln. Zehn nur halbieren und fünfteln. Ein Drittel Fuß sind '
              'genau vier Zoll; dezimal wären es 0,333… Meter. Für Handwerk und '
              'Handel, lange vor dem Komma, war das ein echter Vorteil. Schon '
              'die Römer wählten die Zwölf aus genau diesem Grund.\n\n'
              'Ein ehrlicher Vorbehalt gehört dazu: Das imperiale System ist '
              'kein durchgehendes Zwölfersystem. Nur Fuß und Zoll — und die '
              'zwölf Troy-Unzen beim Edelmetall — sind wirklich dozenal. Das '
              'Yard hat drei Fuß, die Meile 1760 Yards: krumme Zahlen. Und Zoll '
              'werden im Alltag in Halbe, Viertel, Achtel geteilt, also nach '
              'Basis zwei. Die Zwölf steckt also nur an einzelnen Stellen, nicht '
              'im ganzen System.',
        ),
        UnitTheorySection(
          'Heute im Gebrauch',
          'Heute nutzen vor allem die USA und Großbritannien diese Maße im '
              'Alltag. Weltweit gelten sie aber in der Luft- und Seefahrt: '
              'Flugzeuge messen ihre Höhe in Fuß, ihre Geschwindigkeit in Knoten '
              'und ihre Strecke in Seemeilen. Eine Seemeile ist eine '
              'Bogenminute auf der Erdkugel — sie folgt der Sechziger-Teilung, '
              'nicht der Zwölf. Bildschirme, Reifen und Rohre stehen fast '
              'überall in Zoll. In Skandinavien ist die „mil" gleich zehn '
              'Kilometer. In metrischen Ländern leben die alten Maße nur noch in '
              'Redensarten.',
        ),
        UnitTheorySection(
          'Spekulatives (mit Vorsicht)',
          'Manche Erklärungen sind reizvoll, aber unsicher. Eine besagt, die '
              'Zwölf stamme vom Zählen der Fingerglieder mit dem Daumen — '
              'plausibel, aber nicht bewiesen. Andere Theorien wie der '
              '„Pyramiden-Zoll" oder das „megalithische Yard" behaupten '
              'verborgenes Hochwissen in alten Bauten. Sie gelten in der '
              'Fachwelt als widerlegt: Man wählt dabei aus vielen Maßen nur '
              'jene heraus, die zur These passen.',
        ),
      ];
    case UnitCategory.area:
      return const [
        UnitTheorySection(
          'Land als Arbeit',
          'Flächen misst man, indem man Länge mit Länge verbindet. Doch die '
              'alten Landmaße entstanden nicht aus Geometrie, sondern aus '
              'Arbeit. Ein Feld war so groß wie das, was man an einem Tag '
              'bestellen konnte.\n\n'
              'Der deutsche „Morgen" heißt so, weil man ihn an einem Vormittag '
              'pflügte. Der englische „acre" war die Fläche, die ein Gespann '
              'aus acht Ochsen an einem Tag schaffte. Das römische „iugerum" '
              'kommt von „iugum", dem Joch der Ochsen. Auch das arabische '
              '„feddan" bedeutet Ochsenjoch. Überall dieselbe Idee: Land ist '
              'Arbeit.\n\n'
              'Im alten Ägypten musste man die Felder nach jeder Nilflut neu '
              'vermessen, weil das Wasser die Grenzen verwischte. Die Vermesser '
              'spannten Knotenseile; die Griechen nannten sie später '
              '„Seilspanner". In Mesopotamien war das Grundmaß das „sar" — ein '
              'Quadrat von zwölf mal zwölf Ellen.',
        ),
        UnitTheorySection(
          'Der Acre und seine krumme Zahl',
          'Der Acre hat eine ungewöhnliche Form: ein langer, schmaler Streifen, '
              'ein Furlong lang und eine Chain breit (660 mal 66 Fuß). Das '
              'spiegelt die Pflugpraxis: lange Furche, schmale Bahn. So ergeben '
              'sich 43 560 Quadratfuß oder 4840 Quadratyard.\n\n'
              'Warum diese krumme Zahl 4840? Sie ist ein Unfall der Geschichte. '
              'Als England im 13. Jahrhundert den Fuß verkürzte, blieben Rute '
              'und Furlong in den Grundstücksgrenzen unverändert. Dadurch sprang '
              'der Acre von 4000 alten auf 4840 neue Quadratyard. Die krumme '
              'Zahl ist also keine Absicht, sondern das Überbleibsel einer '
              'Maß-Reform.',
        ),
        UnitTheorySection(
          'Flächenmaße in aller Welt',
          'Heute ist der Hektar (10 000 Quadratmeter) das weltweit '
              'verbreitetste Landmaß. Doch alte Maße leben zäh weiter. In '
              'Thailand steht das Rai sogar im amtlichen Grundbuch. In Indien '
              'und Bangladesch rechnet man im Landhandel in Bigha. In Korea ist '
              'das Pyeong trotz Verbots im Alltag üblich. Ägypten behielt das '
              'Feddan, China das Mu. In Israel, der Türkei und auf dem Balkan '
              'misst man in Dunam. In Deutschland leben Morgen, Joch und '
              'Tagwerk noch in der Landwirtschaft und in der Sprache.\n\n'
              'Am hartnäckigsten halten sich Maße, die man auf glatte metrische '
              'Werte festgelegt hat — ein Rai sind genau 1600, ein Dunam genau '
              '1000 Quadratmeter.',
        ),
        UnitTheorySection(
          'Zwölf in der Fläche — und ein Vorbehalt',
          'Bei den kleinen Einheiten zeigt sich die Zwölf am schönsten. Ein '
              'Quadratfuß sind 144 Quadratzoll, denn zwölf mal zwölf ist 144. '
              'In Basis Zwölf geschrieben ist das glatt „100". Ein Quadratyard '
              'sind neun Quadratfuß.\n\n'
              'Bei den großen Landmaßen bricht die Ordnung auf. Der Acre mit '
              'seinen 4840 Quadratyard passt in keine einfache Basis. Das liegt '
              'daran, dass die Landmaße aus der Arbeit entstanden, nicht aus dem '
              'Rechnen.\n\n'
              'Trotzdem bleibt ein praktischer Punkt: Ein Drittel Hektar sind '
              '3333,33… Quadratmeter — eine krumme Zahl. Ein Drittel Feddan '
              'dagegen sind glatt acht Kirat. Wo man oft drittelt, ist eine '
              'durch drei teilbare Basis im Vorteil. Genau das leistet die '
              'Zwölf.',
        ),
        UnitTheorySection(
          'Spekulatives (mit Vorsicht)',
          'Woher kommt die Vorliebe für die Zwölf? Eine bekannte, aber '
              'unbewiesene Vermutung: vom Zählen der Fingerglieder. Der Daumen '
              'tippt die drei Glieder der vier anderen Finger ab — das ergibt '
              'zwölf pro Hand. Diese Zähltechnik ist bis heute in Teilen Asiens '
              'und des Nahen Ostens belegt. Als sicherer Ursprung beweisen lässt '
              'sie sich aber nicht.',
        ),
      ];
    case UnitCategory.space:
      return const [
        UnitTheorySection(
          'Erst das Gefäß, dann der Würfel',
          'Volumen misst man, indem man drei Längen verbindet — einen Würfel. '
              'Doch so begann es fast nirgends. Am Anfang stand das Gefäß: ein '
              'gefüllter Krug, ein Sack Getreide, eine Schöpfkelle Öl. Man maß, '
              'was man essen, tragen oder handeln konnte, nicht, was man '
              'ausrechnen konnte.\n\n'
              'Der Bezug war meist eine Nahrungsmenge. Das griechische '
              '„choinix" war die Tagesration Getreide für einen Arbeiter. Das '
              'japanische „Koku" war so viel Reis, wie ein Mensch in einem Jahr '
              'isst — etwa 180 Liter. Der deutsche „Scheffel" war ungefähr ein '
              'tragbarer Sack.\n\n'
              'Erst große Reiche mit Verwaltung leiteten das Volumen aus dem '
              'Längenmaß ab. Die Römer machten den ersten klaren Schritt: Ihre '
              '„Amphora" fasste genau einen Kubikfuß, etwa 26 Liter. Damit war '
              'das Volumen zum ersten Mal ein echter Würfel aus dem Fußmaß — der '
              'direkte Vorfahr von Kubikfuß, Liter und Kubikmeter.',
        ),
        UnitTheorySection(
          'Maß, Rang und Reichtum',
          'Hohlmaße waren oft mehr als Mengen — sie ordneten ganze '
              'Gesellschaften. In Japan bemaß man den Reichtum eines Lehens in '
              'Koku Reisertrag. Ab zehntausend Koku galt ein Herr als „Daimyō", '
              'als Fürst. Sogar der Sold der Samurai und die Größe von Schiffen '
              'wurden in Koku gezählt.\n\n'
              'In Rom wurde die Soldatenration in „modii" zugeteilt, einem '
              'Trockenmaß von knapp neun Litern. In Mesopotamien, Ägypten und '
              'China kontrollierten Herrscher die Maße über geeichte Normgefäße. '
              'Das berühmteste ist das chinesische „Jialiang" aus der Zeit um '
              'das Jahr null: ein einziger Bronzeguss, der gleich fünf '
              'Volumeneinheiten verkörpert. Es stand vor den Hallen des Kaisers '
              'als Zeichen für Einheit und Gerechtigkeit seiner Herrschaft.',
        ),
        UnitTheorySection(
          'Volumen in aller Welt',
          'Kaum ein Maßbereich war so zersplittert wie das Volumen. Der '
              'deutsche Scheffel reichte je nach Stadt von etwa 5 bis 250 Liter. '
              'England, die USA und das Empire hatten allein drei verschiedene '
              'Gallonen. Die US-Gallone (3,79 Liter) ist bis heute rund ein '
              'Fünftel kleiner als die britische (4,55 Liter).\n\n'
              'Viele dieser Maße leben weiter. Der weltweite Getreidehandel '
              'rechnet in „Bushels" — die US-Ernteberichte für Mais, Soja und '
              'Weizen erscheinen nur darin. Erdöl wird in „Barrel" zu 42 '
              'US-Gallonen gehandelt, einem alten englischen Weinfass-Maß. In '
              'Großbritannien und Irland schenkt man Bier gesetzlich im '
              'Imperial-Pint aus (568 Milliliter). In Japan misst der Becher im '
              'Reiskocher genau ein „Gō". Brennholz handelt man in Raummetern, '
              'Festmetern oder, in Nordamerika, im „Cord".\n\n'
              'In den USA stecken die Würfelmaße im Alltag: Motoren werden in '
              'Kubikzoll angegeben (ein „350er"), Beton und Erde im Bauwesen in '
              'Kubikyard, Erdgas in Kubikfuß.',
        ),
        UnitTheorySection(
          'Zwölf im Raum — und ein Vorbehalt',
          'Im Würfel zeigt sich die Zwölf am stärksten. Ein Kubikfuß sind 1728 '
              'Kubikzoll — und 1728 ist zwölf hoch drei. In Basis Zwölf '
              'geschrieben ist das die glatte „1000". Diese Zahl hat besonders '
              'viele Teiler, weil sie aus Zweien und Dreien gebaut ist. Ein '
              'Kubikfuß lässt sich darum sauber halbieren, dritteln, vierteln, '
              'sechsteln und achteln.\n\n'
              'Ein Kubikmeter dagegen teilt sich glatt nur durch zwei und fünf. '
              'Ein Drittel Kubikmeter sind 0,333… — eine endlose Zahl. Wo man '
              'oft in Drittel teilt, ist die Zwölf im Vorteil.\n\n'
              'Der ehrliche Vorbehalt: Diese schöne Ordnung gilt nur für die '
              'aus Längen abgeleiteten Würfelmaße. Die alten Hohlmaße — Bushel, '
              'Gallone, Scheffel — folgen keiner reinen Basis. Sie wuchsen aus '
              'Säcken und Fässern, nicht aus dem Rechnen, und mischen Zweier-, '
              'Dreier- und ganz krumme Schritte.',
        ),
        UnitTheorySection(
          'Der heilige Würfel',
          'Der Würfel hat in vielen Kulturen eine besondere Bedeutung, weil '
              'Länge, Breite und Höhe gleich sind — ein Bild der Vollkommenheit. '
              'Das Allerheiligste in Tempel und Stiftshütte war würfelförmig. '
              'Die Kaaba in Mekka, deren Name „Würfel" bedeutet, ist ein '
              'schwarzes kubisches Heiligtum. Auch das „neue Jerusalem" der '
              'Bibel wird als riesiger Würfel beschrieben.\n\n'
              'Über viele Religionen hinweg gilt zudem das gerechte Maß als '
              'heilige Pflicht. Die hebräische Bibel fordert ein „gerechtes '
              'Epha"; der Prophet Amos klagt Händler an, die das Maß verkürzen. '
              'Der Koran widmet eine ganze Sure denen, die knapp ausmessen. Wer '
              'falsch misst, sündigt — diese Idee findet sich rund um den '
              'Globus.\n\n'
              'Auch das metrische System trägt diesen Geist, nur weltlich: Statt '
              'von einem Herrscher leitet es sein Maß von der Erde selbst ab. '
              'Der Meter ist ein Bruchteil des Erdumfangs, der Kubikmeter sein '
              'Raum — Maß aus der Natur statt aus der Macht.',
        ),
        UnitTheorySection(
          'Spekulatives (mit Vorsicht)',
          'Um alte Bauwerke ranken sich kühne Volumen-Theorien. Manche '
              'behaupten, die Cheops-Pyramide verberge ein „Pyramiden-Pint" oder '
              'ein heiliges Maß von göttlichem Ursprung. Andere meinen, '
              'steinzeitliche Steinkreise nutzten ein „megalithisches Yard", aus '
              'dem sich genau ein Pint als Würfel ergebe.\n\n'
              'Die Fachwelt hält das für widerlegt. Solche Theorien wählen aus '
              'vielen Maßen nur die passenden heraus und deuten Zufälle als '
              'Absicht. Reizvoll zu lesen, aber kein Beleg.',
        ),
      ];
    case UnitCategory.weight:
      return const [
        UnitTheorySection(
          'Vom Korn zur Last',
          'Gewichte hatten überall zwei Wurzeln. Die kleinsten Maße kamen von '
              'Samen und Körnern, die großen von dem, was ein Mensch oder ein '
              'Tier tragen konnte.\n\n'
              'Das englische „grain" ist wörtlich ein Gerstenkorn, etwa 65 '
              'Milligramm. Das „Karat" der Juweliere kommt vom Samen des '
              'Johannisbrotbaums. In Indien wog man Gold in „Ratti", den Samen '
              'einer roten Hülsenfrucht. Am anderen Ende stand die Last: Das '
              'griechische „Talent" und der indische „Maund" waren ungefähr so '
              'viel, wie ein Mann tragen konnte. Die „Tonne" kommt vom größten '
              'Weinfass, dem „Tun", das gefüllt etwa eine Tonne wog.\n\n'
              'Ein dritter Faden verbindet Gewicht und Geld: Schekel, Drachme, '
              'Pfund und Tola waren zugleich Münz- und Gewichtsnamen. Geld war '
              'ursprünglich gewogenes Metall — man wog Silber ab, statt Münzen '
              'zu zählen.',
        ),
        UnitTheorySection(
          'Pfund, Unze und das römische Erbe',
          'Unsere Gewichtswörter stammen aus Rom. Die römische „libra" war eine '
              'Waage und ein Gewicht von rund 329 Gramm, geteilt in zwölf '
              '„unciae". Aus „libra" wurde das Kürzel „lb" für Pfund und das '
              'Zeichen „£" für das britische Pfund. Aus „uncia" — wörtlich „der '
              'Zwölftel" — wurde sowohl die „Unze" als auch der „Zoll".\n\n'
              'Aus dieser Wurzel wuchsen zwei verschiedene Systeme. Das '
              '„Avoirdupois"-Pfund des Alltags teilt sich in 16 Unzen — eine '
              'Zahl, die sich immer wieder halbieren lässt. Das „Troy"-Pfund des '
              'Edelmetallhandels behielt die römischen zwölf Unzen. Eine '
              'Troy-Unze (die Feinunze) ist darum schwerer als eine '
              'Alltags-Unze, das Troy-Pfund aber leichter — eine bis heute '
              'beliebte Verwechslung.',
        ),
        UnitTheorySection(
          'Gewichte in aller Welt',
          'Fast jede Kultur hatte ihre Stufen. Mesopotamien zählte in Schekel, '
              'Mine und Talent nach Basis sechzig. Ägypten rechnete dezimal in '
              'Deben und Kite. China nutzt bis heute Jin, Liang und das kleine '
              'Mace. In Japan ist das „Momme" (3,75 Gramm) per Gesetz noch immer '
              'die weltweite Einheit im Perlenhandel.\n\n'
              'Viele alte Gewichte leben weiter. In Großbritannien und Irland '
              'wird das Körpergewicht in „Stone" zu 14 Pfund angegeben („elf '
              'Stone vier"). Das deutsche Pfund meint heute glatt 500 Gramm. In '
              'Südasien handelt man Gold in „Tola" (etwa 11,7 Gramm). Und der '
              'israelische Schekel trägt den Namen eines uralten Wäge-Gewichts.\n\n'
              'Ein Maß war besonders zersplittert: der Stone wog je nach Ware '
              'einmal 5, einmal 8, einmal 14 Pfund. Erst Gesetze des 19. '
              'Jahrhunderts schufen Ordnung.',
        ),
        UnitTheorySection(
          'Die Waage als Sinnbild',
          'In vielen Kulturen ist das Wiegen mehr als Technik — es ist ein Bild '
              'für Gerechtigkeit. Im alten Ägypten wog man im Totengericht das '
              'Herz gegen die Feder der Wahrheit. Bei Homer hält Zeus eine '
              'goldene Waage über das Schicksal der Helden. Im Islam wägt die '
              '„Mizan" am Jüngsten Tag die Taten, und nicht einmal das Gewicht '
              'eines Senfkorns geht verloren.\n\n'
              'Das lateinische „libra" heißt Waage — daher auch das Sternzeichen '
              'Waage, das einzige, das kein Lebewesen ist. Viele Religionen '
              'fordern das ehrliche Maß: Die hebräische Bibel nennt falsche '
              'Gewichte einen Gräuel, der Koran rügt jene, die knapp wiegen. Und '
              'das Wort „Talent" wandelte sich vom Gewicht zur Begabung — über '
              'das biblische Gleichnis von den anvertrauten Talenten.',
        ),
        UnitTheorySection(
          'Zwölf im Gewicht — und ein Vorbehalt',
          'Die Zwölf steckt vor allem im Troy-System: zwölf Unzen im Pfund, und '
              'die Goldfeinheit zählt in 24 Karat (zweimal zwölf). Solche Zahlen '
              'sind beliebt, weil zwölf sechs Teiler hat — man kann glatt '
              'halbieren, dritteln und vierteln. Ein Drittel von zwölf ist '
              'sauber vier; ein Drittel von zehn ist 3,33…\n\n'
              'Der ehrliche Vorbehalt: Das Alltagsgewicht folgt nicht der Zwölf. '
              'Das Avoirdupois-Pfund hat 16 Unzen — das ist Basis zwei, das '
              'fortwährende Halbieren. Mesopotamien zählte in Basis sechzig. Die '
              'Gewichtswelt ist also ein Flickenteppich aus Zwei, Drei, Zwölf '
              'und Sechzig — gebaut fürs Teilen im Handel, nicht fürs Rechnen in '
              'Zehnern.',
        ),
        UnitTheorySection(
          'Spekulatives (mit Vorsicht)',
          'Woher kommt die Vorliebe für die Zwölf? Eine bekannte, aber '
              'unbewiesene Vermutung führt sie auf das Zählen der Fingerglieder '
              'zurück: Der Daumen tippt die drei Glieder der vier Finger ab — '
              'zwölf pro Hand. Zählt man das fünfmal, kommt man auf sechzig.\n\n'
              'Eine zweite Geschichte ist sogar widerlegt: dass das Karat auf '
              'den besonders gleichmäßigen Samen des Johannisbrotbaums beruhe. '
              'Der Name stimmt — die Samen schwanken im Gewicht aber so stark '
              'wie andere auch. Die Gleichmäßigkeit ist ein Mythos.',
        ),
      ];
    case UnitCategory.time:
      return const [
        UnitTheorySection(
          'Zwei Erbschaften: Babylon und Ägypten',
          'Unsere Zeit stammt aus zwei alten Quellen. Die Stunde kommt aus '
              'Ägypten, Minute und Sekunde aus Babylon.\n\n'
              'Die Ägypter teilten Tag und Nacht in je zwölf Stunden — '
              'wahrscheinlich, weil sie nachts zwölf Sternbilder aufgehen sahen. '
              'So entstand der 24-Stunden-Tag. Weil Tag und Nacht aber '
              'verschieden lang sind, waren diese Stunden im Sommer und Winter '
              'ungleich lang. Erst die mechanische Uhr machte sie gleich.\n\n'
              'Babylon rechnete in Basis sechzig. Daher haben wir sechzig '
              'Minuten in der Stunde und sechzig Sekunden in der Minute. „Minute" '
              'heißt „verkleinerter Teil", „Sekunde" die „zweite Verkleinerung". '
              'Dieselbe Basis sechzig steckt im Kreis mit seinen 360 Grad — '
              'Zeit und Winkel sind verwandt.',
        ),
        UnitTheorySection(
          'Mond, Sonne und Woche',
          'Der Tag kommt von der Erddrehung, der Monat vom Mond, das Jahr von '
              'der Sonne. Diese drei passen nicht glatt zusammen, und das '
              'erklärt fast jede Kalender-Verwicklung.\n\n'
              'Die Woche hat sieben Tage — vermutlich nach den vier Mondphasen '
              'zu je rund sieben Tagen. Später ordnete man jedem Tag einen der '
              'sieben sichtbaren Himmelskörper zu. Diese Reihe lebt in vielen '
              'Sprachen: Im Englischen ist „Saturday" der Saturn-Tag, im '
              'Romanischen „lundi/lunes" der Mond-Tag. Die Germanen ersetzten '
              'die römischen Götter durch eigene — aus dem Tag des Jupiter wurde '
              'Thors Tag, der „Thursday".\n\n'
              'Auch alte Zählweisen klingen nach: Das englische „fortnight" '
              '(vierzehn Nächte) erinnert daran, dass die Germanen in Nächten '
              'statt Tagen rechneten.',
        ),
        UnitTheorySection(
          'Zeit in aller Welt',
          'Nicht überall lief die Uhr gleich. China teilte den Tag in zwölf '
              'Doppelstunden, benannt nach Tieren — die Stunde der Ratte lag um '
              'Mitternacht. Japan teilte Tag und Nacht in je sechs Abschnitte, '
              'die mit den Jahreszeiten länger und kürzer wurden; eigene Uhren '
              'mussten das nachstellen.\n\n'
              'Der islamische Kalender folgt rein dem Mond und ist elf Tage '
              'kürzer als das Sonnenjahr — darum wandert der Ramadan langsam '
              'durch alle Jahreszeiten. Die Maya verschränkten gleich mehrere '
              'Zyklen, darunter eine heilige Runde von 260 Tagen. In Äthiopien '
              'beginnt der Tag bis heute bei Sonnenaufgang: Was dort „sechs Uhr" '
              'ist, ist anderswo Mittag.\n\n'
              'Viele dieser alten Rhythmen leben fort — in Festen, Gebetszeiten '
              'und Glückstagen —, während der Alltag überall dem gregorianischen '
              'Kalender folgt.',
        ),
        UnitTheorySection(
          'Heilige Zahlen der Zeit',
          'Zeit war fast überall auch heilig. In Babylon galten zwölf und '
              'sechzig als vollkommene Zahlen. In Ägypten durchfuhr der '
              'Sonnengott in den zwölf Nachtstunden die Unterwelt. Die Sieben '
              'der Woche steht in der jüdischen Tradition für Vollständigkeit — '
              'am siebten Tag ruhte Gott.\n\n'
              'Auffällig ist ein Gegensatz: Für Judentum, Christentum und Islam '
              'läuft die Zeit geradeaus, auf ein Ziel zu. Im Hinduismus dreht '
              'sie sich im Kreis — gewaltige Weltzeitalter, die „Yugas", kommen '
              'und vergehen immer wieder, ein einziger Tag des Schöpfergottes '
              'dauert Milliarden Jahre. Viele Kulturen fürchteten zudem die '
              'überzähligen Tage am Jahresende als gefährliche „Zwischenzeit".',
        ),
        UnitTheorySection(
          'Warum nicht dezimal — und der Zwölf-Bezug',
          'Die Zeit ist der hartnäckigste Gegner des Zehnersystems. Sekunde, '
              'Minute, Stunde, Tag, Woche, Monat, Jahr — keiner dieser Schritte '
              'ist eine glatte Zehnerzahl.\n\n'
              'Der Grund ist wieder die Teilbarkeit. Ein Drittel einer Stunde '
              'sind glatte zwanzig Minuten, ein Viertel sind fünfzehn. Mit '
              'zehn ginge das nicht auf. Zwölf und sechzig lassen sich durch '
              'drei teilen, zehn nicht.\n\n'
              'Man hat das Dezimalsystem trotzdem versucht. In der Französischen '
              'Revolution gab es Tage zu zehn Stunden, Stunden zu hundert '
              'Minuten. Es hielt nur etwa anderthalb Jahre. Anders als bei den '
              'Längen- und Gewichtsmaßen brachte die Umstellung keinen Nutzen — '
              'die alten Uhren liefen ja schon überall gleich. Die Zwölfer- und '
              'Sechziger-Teilung war einfach praktischer.',
        ),
        UnitTheorySection(
          'Spekulatives (mit Vorsicht)',
          'Wie kamen die Menschen auf zwölf und sechzig? Eine elegante, aber '
              'unbeweisbare Idee: Man zählte mit dem Daumen die drei Glieder der '
              'vier Finger — zwölf pro Hand —, und fünf solcher Durchgänge '
              'ergeben sechzig.\n\n'
              'Weiter draußen liegen Behauptungen, das Jahr habe früher wirklich '
              'genau 360 Tage gehabt und sei durch kosmische Katastrophen '
              'verändert worden. Dafür gibt es keinen wissenschaftlichen Beleg; '
              'die 360 ist viel eher eine runde, gut teilbare Rechenzahl.',
        ),
      ];
    case UnitCategory.angle:
      return const [
        UnitTheorySection(
          'Der Kreis aus Babylon',
          'Wir teilen den Vollkreis in 360 Grad, das Grad in 60 Bogenminuten, '
              'die Minute in 60 Sekunden. Diese Ordnung ist uralt und kommt aus '
              'Mesopotamien. Die Babylonier rechneten in Basis sechzig, einer '
              'Zahl mit besonders vielen Teilern.\n\n'
              'Warum gerade 360? Ihr Jahr hatte rund 360 Tage, und die Sonne '
              'wandert dabei knapp ein Grad pro Tag — Tag und Grad fielen '
              'zusammen. Die Wörter verraten den Ursprung: „Minute" kommt vom '
              'lateinischen „erster kleiner Teil", „Sekunde" von der „zweiten '
              'Verkleinerung". Genau dieselben Wörter nutzen wir für die Zeit — '
              'Winkel und Zeit sind Geschwister aus derselben babylonischen '
              'Wurzel.\n\n'
              'Ein ehrlicher Hinweis: Warum es 360 wurde und nicht 60, ist nicht '
              'sicher belegt. Die Tag-pro-Grad-Geschichte ist die plausibelste, '
              'aber keine bewiesene Erklärung.',
        ),
        UnitTheorySection(
          'Vom Stern zur Stunde',
          'Die Zwölf am Kreis kommt aus Ägypten. Dort gliederten zwölf '
              'aufgehende Sternbilder die Nacht — daraus wurden zwölf '
              'Nachtstunden und schließlich der Tag zu 24 Stunden und das '
              'Zifferblatt der Uhr.\n\n'
              'Die Griechen ordneten das System. Hipparch und später Ptolemäus '
              'übernahmen die 360-Teilung und legten damit die Grundlage der '
              'Trigonometrie. Von dort wanderte das Wissen weiter: Indische '
              'Gelehrte erfanden die Sinus-Tafel, die islamische Welt verfeinerte '
              'sie. Unser Wort „Sinus" ist sogar ein Übersetzungsfehler — aus '
              'dem indischen Wort für „Bogensehne" wurde über das Arabische das '
              'lateinische Wort für „Bucht".',
        ),
        UnitTheorySection(
          'Winkel in aller Welt',
          'Nicht jede Kultur teilte den Kreis gleich. China rechnete '
              'eigenständig: Der Kreis hatte dort 365¼ Teile — einen für jeden '
              'Tag des Jahres. Erst europäischer Einfluss brachte die 360. Der '
              'chinesische Feng-Shui-Kompass teilt den Horizont in 24 '
              'Richtungen.\n\n'
              'Indien teilte den Tierkreis in zwölf Zeichen und in 27 '
              'Mondhäuser. Die islamische Astronomie schenkte uns viele '
              'Richtungswörter: „Azimut", „Zenit" und „Nadir" sind alle '
              'arabisch — die Pflicht, die Gebetsrichtung nach Mekka zu finden, '
              'trieb die Winkelkunst voran.\n\n'
              'Auf See teilte man die Windrose: vier Hauptwinde, dann acht, dann '
              '32 Punkte zu je 11¼ Grad. Alle 32 im Kreis aufzusagen — „boxing '
              'the compass" — gehörte zum Handwerk des Steuermanns. Die '
              'mediterranen Windnamen Tramontana, Levante, Scirocco leben bis '
              'heute in der Wettersprache.',
        ),
        UnitTheorySection(
          'Heilige Richtungen und Zahlen',
          'Der Himmel war fast überall göttlich. Für die Babylonier war die '
              'Astronomie eine Götterbotschaft, der Tierkreis ihre Schrift. Die '
              'Zwölf galt vielen als heilige Zahl — zwölf Tierkreiszeichen, '
              'zwölf Olympier, zwölf Stämme, zwölf Stunden.\n\n'
              'Besonders breit ist die Ordnung der vier Himmelsrichtungen. Im '
              'Hinduismus bewacht jede Richtung ein eigener Gott, in China ein '
              'eigenes Tierwesen — Drache im Osten, Tiger im Westen. Das '
              'Medizinrad der Lakota gibt jeder Richtung Farbe und Bedeutung. '
              'Und im Islam ordnet die Gebetsrichtung die ganze Welt um die '
              'Kaaba.\n\n'
              'Bewusst ohne solche Symbolik kamen die jüngeren Maße: Das '
              'Bogenmaß (Radiant) folgt nur der Mathematik, das Gon der '
              'Französischen Revolution, der militärische Strich allein der '
              'Ballistik.',
        ),
        UnitTheorySection(
          'Zwölf und Sechzig im Kreis — und ein Vorbehalt',
          'Die 360 ist ein Teilbarkeits-Wunder: Sie hat 24 Teiler. Drittel, '
              'Viertel, Sechstel eines Kreises ergeben alle glatte Gradzahlen. '
              'Ein hundertteiliger Kreis könnte das nicht — ein Drittel wären '
              '33,33…\n\n'
              'Man hat es dezimal versucht. In der Französischen Revolution kam '
              'der Kreis zu 400 Gon. Es blieb eine Nische der Vermesser, denn '
              '400 hat weniger Teiler als 360. Auch die Dezimalzeit scheiterte — '
              'unter anderem, weil sie sich nicht glatt vierteln ließ.\n\n'
              'Der ehrliche Vorbehalt: Die 360 ist nicht zwingend. Chinas '
              '365-Teilung beweist es. Und in der höheren Mathematik gewinnt das '
              'Bogenmaß, weil es dort nicht auf Teilbarkeit ankommt, sondern auf '
              'einfache Formeln. Die Zwölfer-Welt ist also stark, aber nicht '
              'alternativlos.',
        ),
        UnitTheorySection(
          'Spekulatives (mit Vorsicht)',
          'Woher die Vorliebe für zwölf und sechzig? Die bekannte, aber '
              'unbewiesene Vermutung: vom Zählen der Fingerglieder. Der Daumen '
              'tippt die drei Glieder der vier Finger ab — zwölf pro Hand —, und '
              'fünf Durchgänge ergeben sechzig.\n\n'
              'Reizvoll ist eine Zahlen-Parallele: Die nordische Sage gibt '
              'Walhall 540 Türen, durch jede ziehen 800 Krieger — zusammen '
              '432 000, dieselbe Zahl wie ein indisches Weltzeitalter. Die '
              'Fachwelt hält das für Zufall, nicht für ein gemeinsames Erbe. '
              'Schön zu erzählen, aber kein Beleg.',
        ),
      ];
    case UnitCategory.price:
      return const [
        UnitTheorySection(
          'Geld war Gewicht',
          'Lange bevor es Münzen gab, war Geld abgewogenes Metall. Man wog '
              'Silber oder Getreide ab. Darum sind die ältesten Geldnamen '
              'eigentlich Gewichtsnamen.\n\n'
              'In Mesopotamien zählte man in Schekel, Mine und Talent — nach '
              'Basis sechzig, sechzig Schekel auf die Mine. Der Schekel war '
              'zuerst ein Gewicht, geeicht am Gerstenkorn. Die griechische '
              '„Drachme" bedeutet wörtlich „eine Handvoll", nämlich sechs dünne '
              'Metallspieße.\n\n'
              'Auffällig: Geprägt wurde meist nur die kleinste Münze. Die großen '
              'Einheiten wie Mine und Talent waren reine Rechengrößen — niemand '
              'hielt ein Talent in der Hand, man rechnete nur damit.',
        ),
        UnitTheorySection(
          'Pfund, Schilling, Penny',
          'Das europäische Geld stammt aus Rom. Die Münze „Denarius" gab dem '
              'Penny das Kürzel „d" und vielen Sprachen das Wort für Geld '
              '(spanisch „dinero", arabisch „Dinar").\n\n'
              'Karl der Große ordnete es neu: ein Pfund Silber (libra) = 20 '
              'Schilling (solidus) = 240 Pfennig (denarius), also zwölf Pfennig '
              'auf den Schilling. Auch hier war nur der Pfennig eine echte '
              'Münze; Pfund und Schilling dienten zum Rechnen. Dieses System '
              'hielt über tausend Jahre.\n\n'
              'England übernahm es als Pfund, Schilling, Penny — die „£sd". Das '
              'Zeichen „£" ist ein verziertes L für „libra", die Waage. So '
              'hängt das Geld am selben Wort wie das Sternzeichen Waage und das '
              'Gewichts-Pfund.',
        ),
        UnitTheorySection(
          'Münzen in aller Welt',
          'Fast jede Region hatte ihre Stufen. Im süddeutschen Raum galten '
              'sechzig Kreuzer auf einen Gulden — wieder die babylonische '
              'Sechzig. Der „Taler" aus dem böhmischen Joachimsthal gab dem '
              '„Dollar" den Namen. Der Maria-Theresien-Taler war so beliebt, '
              'dass er noch im 20. Jahrhundert in Arabien und Äthiopien als Geld '
              'galt.\n\n'
              'Anderswo sah Geld ganz anders aus. In Westafrika zahlte man '
              'jahrhundertelang mit Kaurimuscheln. Die Azteken nutzten '
              'Kakaobohnen als Kleingeld und genormte Mäntel als großes Geld — '
              'gezählt in Zwanzigern. Indien rechnete die Rupie in 16 Annas, '
              'China fädelte Münzen mit Loch zu Strängen.\n\n'
              'Der spanische „Stück-zu-acht"-Dollar ließ sich in acht Teile '
              'brechen. Zwei davon waren „two bits" — bis heute der '
              'amerikanische Spitzname für das Vierteldollarstück.',
        ),
        UnitTheorySection(
          'Geld, Glaube und Symbol',
          'Münzen waren oft mehr als Zahlmittel. Die Griechen legten dem Toten '
              'eine Münze in den Mund — den Fährlohn für Charon, der die Seele '
              'über den Totenfluss bringt. Ohne Münze blieb sie am Ufer.\n\n'
              'Im Neuen Testament hält Jesus einen Denar mit dem Kaiserbild hoch: '
              '„Gebt dem Kaiser, was des Kaisers ist." Die dreißig Silberlinge '
              'des Judas waren vermutlich Schekel aus Tyros — ausgerechnet '
              'Münzen mit einem heidnischen Gott darauf, zugleich die offizielle '
              'Tempelwährung.\n\n'
              'Und immer wieder die heilige Zwölf: zwölf Stämme und Apostel im '
              'Judentum und Christentum, zwölf Sonnengötter im Hinduismus, zwölf '
              'Glieder der Ursachenkette im Buddhismus, zwölf Imame in der '
              'Schia, zwölf Erdzweige in China. Die Zahl verbindet Geld, '
              'Kalender und Glauben.',
        ),
        UnitTheorySection(
          'Warum Zwölf und Zwanzig — und ein Vorbehalt',
          'Der Grund für all die krummen Stufen ist die Teilbarkeit. Ein Gulden '
              'zu sechzig Kreuzern lässt sich glatt dritteln: zwanzig Kreuzer. '
              'Ein Drittel Dollar dagegen sind 33,33… Cent — eine endlose Zahl. '
              'Wer im Handel oft teilt, ist mit zwölf, zwanzig oder sechzig '
              'besser bedient als mit zehn.\n\n'
              'Darum lebt die Zwölf im Handel weiter: das Dutzend (12), das Gros '
              '(144) und das Großgros (1728). Ein Gros bedeutet in London wie in '
              'New York dieselbe Menge.\n\n'
              'Der ehrliche Vorbehalt: Das alte Geld war kein reines '
              'Zwölfersystem. Die zwanzig Schilling im Pfund sind eine '
              'Zwanziger-Logik (Finger und Zehen). Und 1971 stellte '
              'Großbritannien auf hundert Pence um — mit einigem Durcheinander, '
              'aber dauerhaft. Heute rechnet fast die ganze Welt dezimal.',
        ),
        UnitTheorySection(
          'Spekulatives (mit Vorsicht)',
          'Warum wählten so viele Kulturen die Zwölf? Die bekannte, aber '
              'unbewiesene Vermutung führt sie auf das Zählen der Fingerglieder '
              'zurück: drei Glieder an vier Fingern, vom Daumen abgetippt, '
              'ergeben zwölf.\n\n'
              'Andere Deutungen gehen weiter: Die Zwölf sei „drei mal vier", '
              'Himmel mal Erde, eine Zahl der Vollständigkeit. Manche behaupten '
              'sogar, ein Sonnengott mit zwölf Gefährten sei das Vorbild der '
              'zwölf Apostel gewesen. Solche Parallelen sind Deutung, nicht '
              'gesicherte Geschichte — mit Vorsicht zu genießen.',
        ),
      ];
    case UnitCategory.temp:
      return const [
        UnitTheorySection(
          'Vom Thermoskop zum Thermometer',
          'Die Temperatur ist eine späte Erfindung. Lange konnte man Wärme nur '
              'fühlen, nicht messen. Den ersten Schritt machte die Beobachtung, '
              'dass sich Luft und Flüssigkeiten bei Wärme ausdehnen.\n\n'
              'Um 1600 baute Galileo Galilei ein „Thermoskop": eine Glaskugel '
              'mit Rohr, in der ein Wasserstand stieg und fiel. Es zeigte '
              'Wärme an, hatte aber keine Skala. Die erste Zahlenskala brachte '
              'kurz darauf der Arzt Santorio an — ein Thermometer ist ein '
              'Thermoskop mit Skala.\n\n'
              'Damit Messungen vergleichbar werden, braucht es feste Bezugspunkte. '
              'Man einigte sich auf Naturpunkte: den Gefrierpunkt und den '
              'Siedepunkt des Wassers. Daran hängen bis heute alle Skalen.',
        ),
        UnitTheorySection(
          'Drei Skalen, drei Nullpunkte',
          'Die bekannten Skalen unterscheiden sich vor allem darin, wohin sie '
              'die Null legen.\n\n'
              'Daniel Fahrenheit setzte um 1724 seine Null an den kältesten '
              'Punkt, den er sicher herstellen konnte: eine Mischung aus Eis, '
              'Wasser und Salz. Den Gefrierpunkt des reinen Wassers legte er auf '
              '32, die Körpertemperatur auf 96. So fielen normale Winter nicht '
              'unter null. Später eichte man die Skala neu auf Gefrier- (32) und '
              'Siedepunkt (212) — genau 180 Grad dazwischen.\n\n'
              'Réaumur wählte 0 und 80. Anders Celsius setzte 0 und 100 an '
              'Gefrieren und Sieden — und legte die Skala zuerst sogar '
              'verkehrt herum an (0 war der Siedepunkt). Erst nach seinem Tod '
              'drehte man sie in die heutige Form. Die runde 100er-Teilung '
              'passte perfekt zum neuen metrischen System.',
        ),
        UnitTheorySection(
          'Warum die Welt verschieden misst',
          'Fast die ganze Welt nutzt heute Celsius — es kam mit dem metrischen '
              'System. Die großen Ausnahmen sind die USA und einige eng mit '
              'ihnen verbundene Länder, die bei Fahrenheit blieben. Ein Gesetz '
              'von 1975 machte die Umstellung dort freiwillig, und so blieb es '
              'beim Alten.\n\n'
              'Alte Skalen sind zäh. Réaumur war im 18. und 19. Jahrhundert in '
              'Frankreich, Deutschland und Russland verbreitet und hielt sich in '
              'Russland besonders lange. Darum spricht die russische Literatur — '
              'etwa bei Dostojewski oder Tolstoi — von „Grad Frost", gemeint '
              'sind Réaumur-Grade.\n\n'
              'Welche Skala sich „natürlicher" anfühlt, ist reine Gewohnheit. '
              'Celsius bindet sich ans Wasser, Fahrenheit spannt grob von 0 '
              '(sehr kalt) bis 100 (sehr heiß) das menschliche Wetter ab. Beides '
              'ist Konvention, kein objektiver Vorzug.',
        ),
        UnitTheorySection(
          'Feuer und Eis',
          'Hitze und Kälte tragen in fast allen Kulturen eine tiefe Bedeutung — '
              'und auffällig oft steht beides zugleich für Schöpfung und für '
              'Strafe.\n\n'
              'In der nordischen Sage entsteht die Welt aus der Spannung '
              'zwischen dem Feuerreich Muspelheim und dem Eisreich Niflheim — '
              'Kälte ist hier kein Übel, sondern eine Schöpfungskraft. Die '
              'Hölle stellt man sich meist als Feuer vor, doch in Dantes '
              'Inferno ist der tiefste Kreis ein gefrorener See: Verrat ist das '
              'Erkalten aller menschlichen Wärme. Der Buddhismus kennt sowohl '
              'heiße als auch kalte Höllen, abgestuft nach der Schuld.\n\n'
              'Feuer ist anderswo heilig und rein: Agni im Hinduismus, das '
              'ewige Feuer im Zoroastrismus. Und das Wort „Nirvana" bedeutet '
              'wörtlich „Verlöschen" — das Auslöschen des inneren Brennens.',
        ),
        UnitTheorySection(
          'Der echte Nullpunkt: Kelvin',
          'Was ist Temperatur eigentlich? Sie ist ein Maß dafür, wie schnell '
              'sich die kleinsten Teilchen bewegen. Heiß heißt: Die Teilchen '
              'zappeln stärker.\n\n'
              'Daraus folgt, dass es eine tiefste mögliche Temperatur gibt — den '
              'Punkt, an dem diese Bewegung am kleinsten ist. Das ist der '
              'absolute Nullpunkt bei −273,15 °C. Kälter geht nicht. Lord Kelvin '
              'legte 1848 eine Skala genau dorthin: Null Kelvin ist der absolute '
              'Nullpunkt, ein Kelvin-Schritt ist so groß wie ein Celsius-Grad.\n\n'
              'Erst diese Skala erlaubt echte Verhältnisse: 200 Kelvin sind '
              'wirklich doppelt so „warm" wie 100. Bei Celsius oder Fahrenheit '
              'gilt das nicht — „20 Grad sind doppelt so warm wie 10 Grad" ist '
              'schlicht falsch. Für die Wissenschaft ist Kelvin deshalb die '
              'Grundeinheit.',
        ),
        UnitTheorySection(
          'Warum Zwölf hier kaum hilft — ehrlich',
          'Bei den anderen Maßen ist die Zwölf stark, weil man eine Menge gut '
              'teilen kann: ein Drittel Fuß sind glatte vier Zoll. Bei der '
              'Temperatur greift dieses Argument nicht — und das gehört ehrlich '
              'gesagt.\n\n'
              'Der Grund ist der verschobene Nullpunkt. Null Grad Celsius '
              'bedeutet nicht „keine Wärme", sondern nur „Wasser gefriert". '
              'Darum kann man Temperaturen nicht sinnvoll halbieren oder '
              'dritteln — „halb so warm" gibt es auf so einer Skala nicht. Die '
              'schöne Teilbarkeit der Zwölf läuft hier ins Leere.\n\n'
              'Nur an einer Stelle steckt doch Teilbarkeits-Denken: in der '
              'Einteilung der Skala selbst. Fahrenheits 96 und die 64 Schritte '
              'bis zum Eis lassen sich oft halbieren. Aber ob man die Anzeige '
              'in 10, 12 oder 100 Schritte teilt, ist reine Kosmetik. Die '
              'Temperatur ist das ehrliche Gegenbeispiel: Hier ist die Wahl der '
              'Basis gleichgültig — die echte Aussage steckt im absoluten '
              'Nullpunkt, nicht in der Teilung der Skala.',
        ),
        UnitTheorySection(
          'Spekulatives (mit Vorsicht)',
          'Um Fahrenheits Skala ranken sich Legenden. Eine besagt, die 96 sei '
              'die Fiebertemperatur seiner kranken Frau gewesen — dafür gibt es '
              'keinen Beleg. Eine andere sagt, die Null sei der kälteste Winter '
              'seiner Heimatstadt Danzig gewesen; wahrscheinlicher ist die '
              'reproduzierbare Eis-Salz-Mischung.\n\n'
              'Sogar Fahrenheits eigene Erklärung seiner Fixpunkte gilt als '
              'teilweise nachträglich geschönt — vieles übernahm er schlicht von '
              'der älteren Skala des Astronomen Rømer. Schöne Geschichten, aber '
              'mit Vorsicht zu lesen.',
        ),
      ];
    // Alle acht Theorie-Bereiche sind nun auf Deutsch vorhanden.
    default:
      return const [];
  }
}

// Curated key sources per area (A1/full-text first), from the dossiers in
// docs/research/unit_<area>.md. The complete tiered lists live there.
List<Source> _unitSourcesDe(UnitCategory cat) {
  switch (cat) {
    case UnitCategory.count:
      return const [
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
