# Was ist das Dozenalsystem? — Forschungsdossier

*Gattung: Grundlagen · Zielgruppe: Einsteiger · Stand: 2026-06-10*

Dossier für das Grundlagen-Kapitel »Was ist das Dozenalsystem?« — der Einstieg vor den
thematischen Theorie-Blöcken. Vorbild-Struktur: [`nature_pyrit.md`](nature_pyrit.md).
Erzählstimme: neutral, sachlich, ehrlich zu Vorbehalten, keine eigenen Wertungen.

**Scope:** die grundlegende *Idee* des Zwölfersystems — Stellenwert, die beiden neuen
Ziffern, der Teilbarkeits-Vorteil mit ehrlichem Gegenbeispiel, die Spuren der Zwölf im
Alltag, die dozenale Bewegung, und der ehrliche »warum nicht durchgesetzt«-Schluss.

**Abgrenzung:** Die *Bedienung* der App (exakte Rationals, Perioden-Anzeige,
Zwei-Schienen-Auswertung, Funktionen, Modi) gehört in »Bedienung des Rechners«, nicht
hierher. Vertiefte Mathematik (Periodenlängen, hochzusammengesetzte Zahlen im Detail,
Teilbarkeitsregeln) gehört in die Mathematik-Gattung. Dieses Dossier bleibt
Grundlagen-Einstieg.

---

## Das Stellenwertsystem: was eine Basis ist

Ein **Stellenwertsystem** ist ein Zahlensystem, in dem der Wert eines Ziffernzeichens
von seiner *Position* abhängt. In der Zahl 347 steht die 3 für dreihundert, die 4 für
vierzig, die 7 für sieben. Jede Stelle trägt eine Potenz der **Basis** (auch *Radix*
genannt); jede Stelle ist das *b*-fache der Stelle rechts von ihr.

Im **Dezimalsystem** ist die Basis zehn: 347 bedeutet 3 × 10² + 4 × 10¹ + 7 × 10⁰.
Im **Dozenalsystem** (Basis 12, auch *Duodezimal*) ist die Basis zwölf. Die
Stellenwerte sind Potenzen von 12:

- Stelle 0 (ganz rechts): 12⁰ = 1 (Einer)
- Stelle 1: 12¹ = 12 (ein Dutzend)
- Stelle 2: 12² = 144 (ein »Gross«)
- Stelle 3: 12³ = 1728 (ein »Großgross«)

Die dozenale Zahl »100« bedeutet also nicht hundert, sondern 1 × 144 = 144 (dezimal).
Und »10« bedeutet 1 × 12 = 12 (dezimal), also genau ein Dutzend.

Eine wichtige Konsequenz: Die Schreibweise »10« bezeichnet in *jeder* Basis genau die
Basis selbst. In Basis 10 ist »10« zehn, in Basis 12 ist »10« zwölf, in Basis 2 ist
»10« zwei. Nur die *Schreibweise* ändert sich — die Menge dahinter bleibt dieselbe.
Fünfzehn Äpfel bleiben fünfzehn Äpfel, ob man sie als 15 (dezimal) oder 13 (dozenal)
notiert.

---

## Warum zwölf zwei neue Ziffern braucht

Das Dezimalsystem kommt mit zehn Zeichen aus (0–9), weil bei jeder zehnten Einheit eine
neue Stelle beginnt. Das Dozenalsystem geht erst bei jeder *zwölften* Einheit eine
Stelle weiter — es braucht also zwölf verschiedene Ziffernwerte (0 bis 11). Für die
Werte zehn und elf, die im Dezimalen erst durch zwei Stellen geschrieben werden, braucht
man in Basis 12 je *ein einzelnes* Zeichen. Die Dozenal-Gemeinschaft nennt sie
**transdezimale Ziffern** (jenseits der vertrauten Dezimalziffern).

Seit dem 19. Jahrhundert wurden viele Symbole vorgeschlagen; keines hat sich global
durchgesetzt (siehe Vorbehalte). Die wichtigsten:

| Variante | Zehn | Elf | Herkunft / Status |
|---|---|---|---|
| **Pitman-Ziffern** | ↊ (gedrehte 2) | ↋ (gedrehte 3) | Isaac Pitman, 1857; seit 2015 in Unicode 8.0 (U+218A / U+218B); offizieller Standard beider Gesellschaften |
| **Andrews-Symbole** | kursives *X* | gerundetes *Ɛ* | F. E. Andrews, *New Numbers*, 1935 |
| **Dwiggins-Symbole** | eigene Glyphe | eigene Glyphe | W. A. Dwiggins, von der DSA 2008–2015 verwendet |
| **A / B** | A | B | Hexadezimal-Konvention; am einfachsten tippbar, ASCII-kompatibel |
| **T / E** | T (ten) | E (eleven) | Initialen-Konvention, informell |

**Pitman 1857.** Isaac Pitman, der Erfinder der Pitman-Kurzschrift, schlug vor, die
Ziffern 2 und 3 um 180° zu drehen. ↊ und ↋ sind seit Unicode 8.0 (2015) die einzigen
dozenalen Sonderziffern mit offiziellem Unicode-Codepoint. Die Font-Unterstützung ist
allerdings bis heute lückenhaft — auf vielen Plattformen erscheinen leere Rechtecke,
wenn kein passender Font geladen ist (siehe Vorbehalte).

**Diese App** zeichnet eigene Glyphen (kein Font), in der Grundform wie Pitman, aber als
`CustomPainter`. Im Display kann zwischen diesen Custom-Glyphen und der A/B-Konvention
umgeschaltet werden. Dieses Kapitel verwendet A (= zehn) und B (= elf). Beispiel: 2B
(dozenal) = 2 × 12 + 11 = 35 (dezimal). Das Zählen geht: 0, 1, …, 9, A, B, 10, 11, …,
1B (= 23 dezimal), dann 20 (= 24 dezimal, zwei Dutzend).

---

## Der Rechenvorteil: Teiler und abbrechende Brüche

Der mathematische Kern des Dozenal-Falls ist **Teilbarkeit**. Zwölf hat sechs Teiler:
1, 2, 3, 4, 6 und 12. Zehn hat nur vier: 1, 2, 5 und 10. Der entscheidende Unterschied
liegt in den Primfaktoren:

- **Zehn** = 2 × 5 → Primfaktoren 2 und 5.
- **Zwölf** = 2² × 3 → Primfaktoren 2 und 3.

Das wirkt sich vor allem beim Bruchrechnen aus. Die Faustregel: Ein gekürzter Bruch
1/n hat in einer Basis b **genau dann** eine endliche (abbrechende) Darstellung, wenn
alle Primfaktoren von n auch Primfaktoren von b sind.

| Bruch | Basis 10 | Basis 12 | Bemerkung |
|---|---|---|---|
| 1/2 | 0,5 | 0;6 | beide endlich |
| 1/3 | 0,333… | **0;4** | nur Basis 12 endlich |
| 1/4 | 0,25 | 0;3 | beide endlich |
| 1/5 | 0,2 | **0;2497…** | nur Basis 10 endlich |
| 1/6 | 0,1666… | **0;2** | nur Basis 12 endlich |
| 1/8 | 0,125 | 0;16 | beide endlich |
| 1/9 | 0,111… | **0;14** | nur Basis 12 endlich |
| 1/12 | 0,0833… | **0;1** | nur Basis 12 endlich |

(Semikolon als Radixpunkt in dozenaler Notation, um Verwechslung mit dem Dezimalkomma
zu vermeiden.)

In Basis 12 sind Drittel, Viertel, Sechstel und Neuntel kurz und exakt. **Das ist kein
reiner Gewinn, sondern ein Tausch:** Fünftel (1/5) und Zehntel (1/10) werden in Basis 12
*periodisch* — in Basis 10 sind sie dagegen endlich. 1/5 = 0,2 (dezimal) wird zu
0;2497… (periodisch, Periode der Länge 4). Der Tausch ist für viele Alltagsaufgaben
günstig, weil im Alltag häufiger durch drei und vier geteilt wird als durch fünf; aber
er ist kein unbegrenzter Vorteil. Fünftel und Zehntel sind für Prozentrechnung und
Dezimalgeld zentral.

Zwölf ist außerdem eine **hochzusammengesetzte Zahl** (mehr Teiler als jede kleinere
Zahl) und sogar eine **superior hochzusammengesetzte Zahl** (bestes
Teiler-zu-Größe-Verhältnis in ihrer Klasse). Srinivasa Ramanujan entwickelte 1915 die
erste systematische Theorie dieser Zahlenklasse. Die Folge der superior
hochzusammengesetzten Zahlen beginnt mit 2, 6, **12**, 60, 120, 360 — genau die Zahlen,
die historisch als Basen, Winkel- und Zeiteinheiten auftauchen.

---

## Wo die Zwölf im Alltag schon lebt

Lange bevor es eine organisierte dozenale Bewegung gab, war die Zwölf tief in westliche
Maß-, Zeit- und Handelseinheiten eingegraben — wegen ihrer guten Teilbarkeit.

**Dutzend und Gross.** Das **Dutzend** (englisch *dozen*) stammt vom altfranzösischen
*douzaine* (zu *douze*, »zwölf«, lateinisch *duodecim*) und ist als Handelseinheit
mindestens seit dem Mittelalter belegt. Ein Dutzend lässt sich gleichmäßig in 2, 3, 4
oder 6 Teile teilen — bei zehn geht das nur durch 2 und 5. Das **Gross** (französisch
*grosse douzaine*, »großes Dutzend«) bezeichnet 144 = 12² Stück und ist seit dem frühen
15. Jahrhundert belegt; das Großgross umfasst 1728 = 12³.

**Fuß und Zoll.** Das lateinische Wort *uncia* bedeutet »ein Zwölftel« — sowohl eines
Fußes als auch eines Pfunds. Der römische Fuß war in 12 *unciae* geteilt (daraus der
Zoll), das Pfund (*libra*) ebenfalls in 12 *unciae* (daraus die Unze). Ein einziges
lateinisches Wort für »Zwölftel« prägte damit die englischen Wörter *inch* und *ounce*.
Heute gelten 12 Zoll = 1 Fuß in den USA und Großbritannien fort; 12 Troy-Unzen = 1
Troy-Pfund ebenso.

**Währung.** Karl der Große legte um 780 n. Chr. fest: 12 Denare = 1 Schilling, 20
Schillinge = 1 Pfund. Das Pfund-Schilling-Pence-System galt in Großbritannien bis zur
Dezimalisierung 1971.

**Zeit und Winkel.** Tag und Nacht werden in je zwölf Stunden geteilt — ein Erbe des
alten Ägypten, das das späte Rom übernahm; 2 × 12 = 24 Stunden sind bis heute Standard.
Das Jahr hat zwölf Monate (das Sonnenjahr enthält etwa 12,37 Mondumläufe). Die
Babylonier rechneten in Basis 60 (= 5 × 12) und organisierten ihre Ziffern in Gruppen
von 12; ihr Erbe sind 60 Minuten, 60 Sekunden und 360 = 30 × 12 Grad im Vollkreis.

**Die Fingerglied-Zählung (Hypothese).** Eine verbreitete *Vermutung* zum Ursprung der
Zwölf: Jeder der vier Langfinger hat drei Glieder; mit dem Daumen als Zeiger lassen sich
diese 4 × 3 = 12 Glieder abzählen. Diese Zähltechnik ist in Teilen Asiens und des
Nahen Ostens bis heute in Gebrauch; der Wissenschaftshistoriker Georges Ifrah beschreibt
sie als möglichen Ursprung des duodezimalen Zählens. Die Hypothese ist plausibel und
wird zitiert, aber archäologisch *nicht belegt* (siehe Vorbehalte). Sie sollte als
Vermutung gekennzeichnet bleiben.

Diese Spuren sind kein Argument für einen Systemwechsel. Sie zeigen nur: Die Zwölf wurde
historisch — auch ohne formale Basis-12-Notation — als praktische Teilungsgröße
erkannt. Wer Fuß, Zoll, Dutzend oder Grad in Basis 12 rechnet, rechnet im selben System,
das diese Einheiten ursprünglich strukturiert hat.

---

## Die dozenale Bewegung

Die Idee, statt Basis 10 die Basis 12 zu verwenden, taucht in Europa seit dem 18.
Jahrhundert auf; als *organisierte* Bewegung ist sie ein Phänomen des 20. Jahrhunderts.

**Frühe Befürworter.** Isaac Pitman schlug 1857 die gedrehten Ziffern vor. Herbert
Spencer befürwortete das System 1896. Den Auftakt zur amerikanischen Bewegung gab Frank
Emerson Andrews mit dem Artikel »An Excursion in Numbers« (*Atlantic Monthly*, 1934) und
dem Buch ***New Numbers: How Acceptance of a Duodecimal Base Would Simplify
Mathematics*** (1935) — dem ersten buchlangen Werk zur Basis 12 in den USA. Andrews war
realistisch: Eine kurzfristige Umstellung hielt er für unwahrscheinlich und beschrieb
sein Projekt als intellektuelles Gedankenexperiment.

**Dozenal Society of America (DSA, 1944).** Aus der Resonanz auf Andrews entstand 1944
in New York die *Duodecimal Society of America* (in den 1970ern umbenannt in *Dozenal
Society of America* — *dozenal* trägt nicht wie *duodecimal* die dezimale Wurzel im
Namen). Ralph H. Beard trieb die Gründung voran und wurde erster Herausgeber des
***Duodecimal Bulletin*** (ab 1945). Die DSA versteht sich als gemeinnützige
Bildungskörperschaft für Forschung und öffentliche Bildung zur Basis zwölf.

**Dozenal Society of Great Britain (DSGB, 1959).** Die britische Schwestergesellschaft
entstand 1959. Prominentes Mitglied war der Mathematiker und legendäre Kopfrechner
Alexander Craig Aitken (1895–1967), der 1962 *The Case Against Decimalisation*
veröffentlichte. Ihm wird das Urteil zugeschrieben, die Effizienz des Dezimalsystems
liege gegenüber dem Duodezimalen »bei etwa 65 oder weniger« (auf einer Skala von 100) —
eine illustrative Schätzung, kein gemessenes Maß (siehe Vorbehalte).

Beide Gesellschaften betreiben **keine** politische Kampagne für eine globale
Systemumstellung. Ihr Selbstverständnis ist überwiegend ein didaktisches
Gedankenexperiment: zeigen, dass die Wahl der Zahlenbasis keine Naturnotwendigkeit ist,
und Zahlensinn fördern. Beide nutzen heute die Pitman-Ziffern als Notationsstandard.

---

## Warum hat sich das Dozenalsystem nie durchgesetzt?

Die wichtigste ehrliche Frage — und sie hat eine klare Antwort: nicht wegen
mathematischer Schwächen, sondern wegen **Pfadabhängigkeit und sozialer Trägheit**.

1. **Das Dezimalsystem ist historisch verankert.** Die Verbindung von zehn Fingern und
   Basis 10 ist plausibel und weit verbreitet — ein *anatomischer*, kein *mathematischer*
   Grund. Aber sie sitzt tief.
2. **Das metrische System hat das Dezimale institutionell festgelegt.** Als die
   Französische Revolutionskommission 1790 ein neues Maßsystem debattierte, standen
   Basis 10 und Basis 12 zur Diskussion. Basis 10 setzte sich durch, weil ein globaler
   Wechsel des *Zählsystems* (Voraussetzung für ein echtes Basis-12-Maßsystem) für
   undurchführbar gehalten wurde.
3. **Die Umstellungskosten wären enorm.** Neue Einmaleins-Tabellen, alle Lehrbücher und
   Geräte umgeschrieben, jahrzehntelange Koexistenz beider Systeme im Übergang. Selbst
   die kleinere Umstellung der USA auf metrische Einheiten scheiterte am
   Beharrungsvermögen.
4. **Das Computerzeitalter rechnet binär.** Relevant ist dort die Basis 16 (= 2⁴); 12
   ist keine Zweierpotenz und hat kein elegantes Binär-Mapping. Das historische Fenster
   für eine Zwölfer-Reform — eher das 18./frühe 19. Jahrhundert — ist geschlossen.
5. **Die Bewegung ist klein und freiwillig.** DSA und DSGB sind kleine ehrenamtliche
   Vereine ohne staatliche Unterstützung; kein Land hat je ernsthaft einen Wechsel
   erwogen.

---

## Vorbehalte & verbreitete Irrtümer

**Irrtum 1 (der wichtigste): »Eine Zahl wird größer oder kleiner, wenn man die Basis
wechselt.«** Falsch. Es ändert sich ausschließlich die *Schreibweise*, nicht die Menge.
Gleichungen bleiben wahr, physikalische Gesetze gültig. Wer sagt, »in Basis 12 ist zwölf
größer als in Basis 10«, verwechselt die Zahl mit ihrer Darstellung.

**Irrtum 2: »In Basis 12 wird alles glatter — auch 1/5, 1/7.«** Nein. Der Vorteil ist
ein *Tausch*. Fünftel und Zehntel sind in Basis 12 periodisch (in Basis 10 endlich).
Basis 12 kauft seine Drittel und Viertel auf Kosten der Fünftel. Die Behauptung,
Fünftel seien »unwichtig«, ist eine rhetorische Abtuung, keine sachliche Antwort.

**Irrtum 3: »Basis 12 ist objektiv besser — man sollte wechseln.«** Mathematisch hat
Basis 12 Vorteile (mehr Teiler, kürzere Bruchdarstellungen für 1/3, 1/4, 1/6). Es gibt
aber keine objektive Metrik, die eine Basis universell »besser« macht — das hängt davon
ab, welche Zahlen und Operationen dominieren. Ob ein gesellschaftlicher Umbau gerechtfertigt
wäre, ist keine rein mathematische Frage. Die Gesellschaften selbst verstehen ihre Arbeit
als Bildung, nicht als politisches Programm.

**Vorbehalt 4: Die Fingerglied-Hypothese ist nicht gesichert.** Dass Basis 12 durch das
Zählen von Fingergliedern entstand, ist plausibel und von Historikern (Ifrah) diskutiert,
aber archäologisch nicht beweisbar. Die geographische Verbreitung der Methode stützt die
Hypothese, beweist sie aber nicht. Sie erklärt *eine mögliche* Herkunft.

**Irrtum 5: »Die Babylonier rechneten in Basis 12.«** Das babylonische Positionssystem
war Basis **60** (Sexagesimal), nicht Basis 12. 60 ist ein Vielfaches von 12, und die
Babylonier gruppierten auch in Zwölfern — aber die Basis des Stellenwertsystems war 60.

**Vorbehalt 6: Die Effizienz-Zahl von Aitken (»65«).** Aitkens Aussage, Dezimal sei nur
etwa 65 % so effizient wie Duodezimal, ist eine illustrative Schätzung eines einzelnen
Mathematikers, kein formal definiertes, allgemein anerkanntes Maß. Sie soll die
Größenordnung des Vorteils veranschaulichen, sollte aber nicht als exakte Messzahl
zitiert werden.

**Vorbehalt 7: »Elf und zwölf beweisen ein altes Basis-12-Zählsystem.«** Die Etymologie
von *ainlif/twalif* (»eins/zwei übrig« nach zehn) deutet eher auf ein *dezimales*
Grundmuster. Sonderwörter für elf und zwölf, das »lange Hundert« (120) und die
Fingerglied-Zählung sind zusammen *Hinweise* auf duodezimale Strukturen — in der Summe
eine plausible Hypothese, kein Beweis. Renommierte Sprachforscher halten die Sache für
offen.

**Vorbehalt 8: Historischer Gebrauch von Dutzend/Gross beweist kein dozenales Denken.**
Dutzend und Gross sind bequeme *Handelsgruppen*, kein dozenales Positionssystem. Man kann
in Dutzenden zählen und trotzdem dezimal *schreiben*. Die einzigen Sprachen mit nativer
Basis-12-Zählung sind einige nigerianische (Janji, Gbiri-Niragu, Piti, Nimbia) und das
nepalesische Chepang — keine globalen Leitsprachen.

**Vorbehalt 9: Es gibt keinen einheitlichen Notations-Standard.** Seit über 160 Jahren
(Pitman 1857) konkurrieren Vorschläge für transdezimale Ziffern. ↊/↋ sind Unicode-Standard
und offiziell, aber schlecht font-unterstützt; A/B ist am portabelsten, verliert aber das
Wiedererkennungsmerkmal; Dwiggins-Symbole sind schön, aber schriftartabhängig. Beim Lesen
älterer dozenaler Texte muss man die jeweils gültige Notation prüfen.

> **Nicht aufgenommen (unbestätigt):** Die in Draft C genannte »DSA-Umstellung der
> Web-Notation auf A/B im Januar 2026« ließ sich nicht solide belegen (nur als interne
> Annahme/Snippet) und wird daher hier nicht als Faktum geführt. Die *Begründung* dafür
> — lückenhafte Font-Unterstützung der Pitman-Ziffern — ist davon unabhängig gut belegt
> und bleibt als Vorbehalt 9 erhalten.

---

## Quellen (Tier-System)

Bewertung nach **Zuverlässigkeit** (R1 = wissenschaftlich/primär · R2 = etablierte
Referenz · R3 = seriös populär · R4 = schwach · S = spekulativ) und **Zugang** (A1 =
Volltext gelesen · A2 = teilweise/Snippet/Paywall · A3 = nur indirekt). Jede Quelle ist
mit dem annotiert, was sie belegt. (Interne Repo-Dossiers wie `math_basen.md` oder
`society_bewegung.md` sind keine externen Quellen und hier nicht gelistet.)

### Grundlagen des Stellenwertsystems und Basis 12

- **[R2·A1]** Wikipedia (en): *Positional notation* —
  https://en.wikipedia.org/wiki/Positional_notation — Volltext gelesen: Stellenwert-Formel,
  Radixpunkt, »10« bedeutet die Basis selbst, Null als Platzhalter. Belegt: Grundprinzip.

- **[R2·A1]** Wikipedia (en): *Duodecimal* — https://en.wikipedia.org/wiki/Duodecimal —
  Volltext gelesen (mehrfach): Primfaktorisierung 12 = 2² × 3, Terminierungsbedingung,
  Bruch-Vergleich, transdezimale Ziffern, Pitman 1857, Unicode 8.0 (2015), A/B-Notation,
  Andrews 1934/35, Aitken-Zitat, DSA/DSGB, historische Nutzung (Römer, Babylonier,
  Charlemagne), Sprachen mit nativer Basis 12. Haupt-Kreuzreferenz des Dossiers.

- **[R2·A1]** Wikipedia (en): *Repeating decimal* —
  https://en.wikipedia.org/wiki/Repeating_decimal — Volltext gelesen: Fundamentaltheorem
  (»terminiert genau dann, wenn alle Primfaktoren des Nenners auch Primfaktoren der Basis
  sind«), Periodenlänge = multiplikative Ordnung. Belegt: Abbruch-Kriterium.

### Mathematik der Teilbarkeit (hochzusammengesetzte Zahlen)

- **[R1·A2]** Ramanujan, S.: *Highly Composite Numbers*, Proc. London Math. Soc. 14
  (1915) — https://link.springer.com/article/10.1023/A:1009764017495 — Abstract/Snippet
  (Paywall): Definition hochzusammengesetzter und superior hochzusammengesetzter Zahlen.
  Belegt: wissenschaftliche Grundlage des Begriffs.

- **[R2·A1]** Wikipedia (en): *Highly composite number* —
  https://en.wikipedia.org/wiki/Highly_composite_number — Volltext gelesen: Definition,
  12 hat 6 Teiler, Folge der HCN, Verbindung zu Maßsystemen. Belegt: 12 als HCN.

- **[R2·A1]** Wikipedia (en): *Superior highly composite number* —
  https://en.wikipedia.org/wiki/Superior_highly_composite_number — Volltext gelesen:
  Folge 2, 6, 12, 60, 120, 360 mit Primfaktorisierungen. Belegt: 12 und 60 superior HCN.

### Notation / transdezimale Ziffern / Unicode

- **[R3·A2]** Numerals Wiki (Fandom): *List of numeral proposals for different number
  bases* — https://numerals.fandom.com/wiki/List_of_numeral_proposals_for_different_number_bases —
  Snippet: vollständige Liste der historischen Notationsvorschläge (Pitman, Andrews,
  Dwiggins, A/B, T/E). Belegt: Breite des Notations-Ökosystems.

- **[R3·A2]** Dozensonline-Forum: *Pitman Glyphs Are Now In Unicode* —
  https://www.tapatalk.com/groups/dozensonline/viewtopic.php?t=1324 — Snippet: Aufnahme in
  Unicode 8.0 (2015); Font-Unterstützung anfangs lückenhaft (leere Rechtecke). Belegt:
  Vorbehalt 9 (Unicode-Aufnahme vs. reale Font-Unterstützung).

### Dozenale Gesellschaften (DSA / DSGB)

- **[R2·A1]** Dozenal Society of America — *Foundation and First Generation* —
  https://dozenal.org/drupal/content/foundation-and-first-generation.html — Volltext
  gelesen: Gründung 1944, Ralph Beard, Bulletin-Start 1945, Terminus »transdecimal«.
  Belegt: Gründungsdetails der DSA.

- **[R2·A1]** Dozenal Society of America — *About Us* —
  https://dozenal.org/drupal/content/about-us.html — Volltext gelesen: Selbstbeschreibung
  als »voluntary nonprofit educational corporation«. Belegt: Mission der DSA.

- **[R2·A2]** Zirkel, Gene: *A History of the DSA* (Duodecimal Bulletin WN 97) —
  https://dozenal.org/article-zirkel-history-of-dsa.pdf — Teilweise (Snippet): Gründer,
  DSGB-Gründung 1959, Aitken, Brian Bishop. Belegt: Gründungschronologie.

- **[R3·A2]** Dozenal Society of Great Britain — *About Us* —
  http://www.dozenalsociety.org.uk/pdfs/AboutUs.pdf — Teilweise: Gründung 1959, Ziel
  »Aufmerksamkeit auf die Vorteile von Basis 12«. Belegt: DSGB-Gründungsdatum.

- **[R2·A2]** Aitken, A. C.: *The Case Against Decimalisation* (1962) — zitiert via
  Wikipedia (Duodecimal, A1): »efficiency of the decimal system might be rated at about
  65 or less, if we assign 100 to the duodecimal«. Belegt: prominente Advocacy,
  Effizienz-Metapher (illustrativ).

- **[R3·A2]** Andrews, F. E.: *New Numbers* (1935) — zitiert via Wikipedia (Duodecimal):
  buchlanger Fall für Duodezimal, prägte die US-Bewegung. Belegt: historischer Hintergrund.

### Historische Spuren (Handel, Maß, Zeit)

- **[R2·A1]** Wikipedia (en): *Dozen* — https://en.wikipedia.org/wiki/Dozen — Volltext
  gelesen: Etymologie (frz. *douzaine* < lat. *duodecim*), Teilbarkeit als Grund, ≈ 12
  Mondmonate. Belegt: Herkunft und Begründung des Dutzends.

- **[R2·A1]** Wikipedia (en): *Gross (unit)* — https://en.wikipedia.org/wiki/Gross_(unit) —
  Volltext gelesen: 144 = 12², »grosse douzaine«, Herkunft 15. Jh., Großgross 1728 = 12³.
  Belegt: Gross / Großgross.

- **[R2·A1]** Wikipedia (en): *Ancient Roman units of measurement* —
  https://en.wikipedia.org/wiki/Ancient_Roman_units_of_measurement — Volltext gelesen:
  *uncia* = »ein Zwölftel« (Fuß und Pfund), Ableitung von *inch* und *ounce*. Belegt:
  römisches Duodezimal-Brucherbe.

- **[R2·A1]** Wikipedia (en): *12-hour clock* — https://en.wikipedia.org/wiki/12-hour_clock —
  Volltext gelesen: ägyptische Sonnenuhren, Dekane als Nacht-Zwölfteilung, römische
  Übernahme. Belegt: Herkunft der 12-Stunden-Teilung.

- **[R2·A1]** Wikipedia (en): *Sexagesimal* — https://en.wikipedia.org/wiki/Sexagesimal —
  Volltext gelesen: Ursprung bei den Sumerern, 60 als superior HCN, Erbe in
  Stunden/Minuten/Grad. Belegt: babylonische Basis 60 (nicht 12), Vorbehalt 5.

### Ursprungs-Hypothese (Fingerglied-Zählung)

- **[R2·A2]** Ifrah, Georges: *The Universal History of Numbers* (2000), S. 48 — via
  https://en.wikipedia.org/wiki/Finger-counting — Belegt: Fingerglied-Methode (Daumen
  tippt drei Glieder je Finger = 12) und ihr Fortleben in Asien. Hypothesen-Quelle, nicht
  per Volltext verifiziert.

- **[R2·A1]** Wikipedia (en): *Finger-counting* —
  https://en.wikipedia.org/wiki/Finger-counting — Volltext gelesen: mechanische
  Beschreibung der phalangischen Methode, geographische Verbreitung. Belegt: Existenz und
  Verbreitung der Methode (als Hypothese zum Ursprung).

### Historischer Kontext (Metrik-Entscheidung 1790)

- **[R3·A1]** Metric Views: *Why ten and not twelve?* —
  https://metricviews.uk/2016/10/10/why-ten-and-not-twelve/ — Volltext gelesen:
  französischer Revolutionsausschuss 1790, Kaufleute für Basis 12, Geodäten für Basis 10,
  Argument »globaler Wechsel des Zählsystems undurchführbar«. Belegt: Entscheidung 1790.

### Argument-Literatur (pro und contra)

- **[R3·A1]** eev.ee (fuzzy notepad): *The case for base twelve* (2016) —
  https://eev.ee/blog/2016/04/26/the-case-for-base-twelve/ — Volltext gelesen:
  Pro-Argumente, ehrliche Selbst-Relativierung, »who cares about fifths?«-Passage (Beleg
  für abtuende Rhetorik), Kompaktheits-Hinweis. Belegt: Vorbehalt 2.

- **[R3·A1]** Hexnet: *An Argument For Dozenalism* —
  https://hexnet.org/content/argument-dozenalism — Volltext gelesen: Teiler-Argument,
  historische Maßspuren, ehrliches Einräumen von 1/5 als periodisch, soziale
  Adoptionsbarriere. Belegt: Pro-Contra-Bilanz.
