Die vier Blöcke decken dasselbe Material aus überlappenden Winkeln ab. Ich synthetisiere sie zu einem konsolidierten Dossier ohne Wiederholungen, in der vorgegebenen Gliederung.

## Die Form und ihre Geometrie (Zwölf-Bezug)

Die **Kusszahl** (englisch *kissing number*, auch *Newton-Zahl* oder Kontaktzahl) beantwortet eine einfache Frage: Wie viele gleich große Kugeln können eine zentrale Kugel gleichzeitig berühren, ohne sich gegenseitig zu durchdringen? Im dreidimensionalen Raum ist die Antwort **genau zwölf**. Man schreibt sie als k(3) = 12.

Zur Einordnung die bewiesenen Kusszahlen in anderen Dimensionen:

| Dimension | Kusszahl | Status |
|---|---|---|
| 1 | 2 | trivial |
| 2 | 6 | bewiesen (sechs Münzen um eine — das Wabenmotiv) |
| 3 | **12** | bewiesen 1953 |
| 4 | 24 | bewiesen 2003 (Oleg Musin) |
| 8 | 240 | über das E8-Gitter |
| 24 | 196 560 | über das Leech-Gitter |

In allen übrigen Dimensionen ist die exakte Kusszahl bis heute unbekannt; man kennt nur obere und untere Schranken.

**Woher kommen die zwölf?** In der dichtesten Packung liegt jede Kugel in einer hexagonalen Ebene. Dort hat sie sechs Nachbarn in der eigenen Schicht, drei in den Mulden der Schicht darüber und drei in den Mulden darunter: 6 + 3 + 3 = 12. Das ist der unmittelbare geometrische Mechanismus.

**Die entscheidende Feinheit — die Anordnung ist nicht starr.** Setzt man die zwölf Außenkugeln symmetrisch auf die Ecken eines regulären **Ikosaeders**, beträgt ihr Winkelabstand vom Zentrum aus etwa 63,43° statt der minimal nötigen 60°. Zwischen je zwei benachbarten Außenkugeln bleibt dann noch etwas mehr als zehn Prozent eines Radius Spielraum. Dieser Platz reicht sogar aus, dass zwei der zwölf Außenkugeln durch eine kontinuierliche Bewegung ihre Plätze tauschen können, ohne den Kontakt zur Mittelkugel zu verlieren. Genau dieser sichtbare Leerraum ist der Grund, warum die Frage „passt vielleicht doch eine dreizehnte hinein?" über Jahrhunderte offenblieb: Der Platz reicht fast, aber eben doch nicht.

(Hinweis zur Geometrie der Berührpunkte: In der dichten fcc-Packung bilden die zwölf Nachbarzentren ein **Kuboktaeder**, in der hcp-Packung ein **Antikuboktaeder** — die ikosaedrische Anordnung mit dem größten Spiel ist eine dritte, noch lockerere Variante.)

### Die Voronoi-Zelle: das Rhombendodekaeder

Teilt man den Raum in Bereiche auf, die je dem nächstgelegenen Kugelmittelpunkt zugeordnet sind — die **Voronoi-Zelle**, in der Festkörperphysik **Wigner-Seitz-Zelle** genannt —, entsteht für die kubisch-flächenzentrierte (fcc) Packung das **Rhombendodekaeder**, ein Körper mit zwölf rautenförmigen Flächen. Jede Fläche entspricht genau einem der zwölf nächsten Nachbarn. Die zwölf Berührpunkte, die zwölf Nachbarn und die zwölf Zellflächen sind dieselbe Tatsache, betrachtet aus drei Blickwinkeln.

Die Geometrie des Rhombendodekaeders im Detail:

- **12 kongruente rhombische (rautenförmige) Flächen** — eine je Kontaktrichtung.
- **24 Kanten.**
- **14 Ecken in zwei Typen:** 6 Ecken vom Grad 4 (vier Kanten treffen sich, an den spitzen Rautenwinkeln) und 8 Ecken vom Grad 3 (drei treffen sich, an den stumpfen Winkeln). 6 + 8 = 14.
- **Rautenform:** Die beiden Diagonalen stehen im Verhältnis 1 : √2; die Innenwinkel betragen etwa 70,53° (spitz) und 109,47° (stumpf) — der „Tetraederwinkel".
- **Diederwinkel:** 120° zwischen je zwei Flächen.
- **Raumfüllend:** Rhombendodekaeder kacheln den Raum lückenlos und überlappungsfrei. Dehnt man die Kugeln einer fcc-Packung aus, bis sie den Raum vollständig füllen, werden sie zu Rhombendodekaedern.

Euler-Kontrollrechnung: Ecken − Kanten + Flächen = 14 − 24 + 12 = 2. ✓

Für die hcp-Packung ist die Voronoi-Zelle dagegen das **trapezo-rhombische Dodekaeder** (6 Rauten + 6 Trapeze) — ebenfalls zwölf Flächen, aber nicht alle gleich.

Das Rhombendodekaeder tritt als natürliche Kristallform auf, am bekanntesten beim **Granat** (auch beim Fluorit). Dieser Mineralbezug wird hier nur als geometrisches Echo derselben Zwölf-Flächen-Form genannt.

## Die Wissenschaft dahinter (warum die Natur das bildet)

### Zwei dichteste Packungen, beide mit Zwölf

Es gibt nicht nur eine dichteste Packung. Man stapelt identische hexagonale Schichten, und für jede neue Schicht gibt es zwei mögliche Mulden-Positionen (A, B, C bezeichnen die drei Lagen):

- **hcp** (hexagonal-dichteste Packung): Schichtfolge **ABABAB…** — jede dritte Lage wiederholt die erste.
- **fcc / ccp** (kubisch-flächenzentriert / kubisch-dichteste): Schichtfolge **ABCABC…** — die dritte Lage ist gegen beide vorigen versetzt.

In beiden Fällen gilt: Koordinationszahl = 12 und Packungsdichte = **π / √18 = π / (3√2) ≈ 0,7404805 ≈ 74,05 %**, also rund 26 % Leerraum. Die Koordinationszahl 12 ist die Kusszahl im Kristall: jedes Atom hat zwölf nächste Nachbaratome.

**Wichtige Präzisierung — die dichteste Packung ist nicht eindeutig.** Weil bei jeder neuen Schicht zwei Möglichkeiten bestehen, existieren überabzählbar unendlich viele gleich dichte Stapelfolgen, die sogenannten **Barlow-Packungen** (auch ungeordnete, z. B. ABCACB…). Sie alle erreichen exakt 74,05 %. Das Optimum ist also kein einzelnes Muster — ein Umstand, der den mathematischen Beweis erschwerte.

### Warum die Natur dichte Packung wählt

Hier sind zwei verschiedene physikalische Treiber zu unterscheiden. Der Bezug zur Zwölf ist bei beiden vorhanden, aber unterschiedlich exakt.

**(a) Energieminimierung bei Kristallen — die solide Erklärung.** Die metallische Bindung (delokalisierte Elektronen, positive Atomrümpfe) ist weitgehend ungerichtet und bevorzugt möglichst viele nahe Nachbarn. Jeder Kontakt senkt die potentielle Energie. Dichteste Packung maximiert die Zahl anziehender Nachbarkontakte (zwölf) und minimiert so die Gesamtenergie. Thermodynamisch ist die tatsächliche Kristallstruktur das Minimum der freien Energie unter den gegebenen Bedingungen (Atomgröße, Bindungstyp, Elektronenstruktur, Temperatur, Druck). Welche der dichten Varianten konkret gewählt wird (fcc, hcp oder die weniger dichte bcc-Struktur), entscheidet die Elektronenstruktur. Dies ist die gut gesicherte Erklärung für die Zwölf.

**(b) Oberflächenspannung bei Schäumen — verwandt, aber begrifflich getrennt.** Bei Seifenschäumen treibt die Oberflächenspannung die Minimierung der gesamten Grenzfläche. Daraus folgen die **Plateauschen Gesetze** (nach Joseph Plateau): Filme treffen sich stets zu dritt entlang einer Kante unter exakt 120°, und Kanten treffen sich zu viert in einem Knoten unter dem Tetraederwinkel von etwa 109,47°. Dieses Schaum-Problem ist mit dem Kugelpackungsproblem verwandt, aber nicht dasselbe — und gerade hier ist die Zwölf irreführend (siehe Abschnitt Vorbehalte).

## Entdeckung, Forschung & berühmte Beispiele

### Der Newton-Gregory-Streit (1694) und seine Klärung (1953)

Im Mai 1694 (überliefert wird der 4. Mai) diskutierten **Isaac Newton** und der Astronom **David Gregory** in Cambridge die Frage, ob eine Kugel dreizehn andere gleich große berühren könne. Der Anlass war astronomisch: die Verteilung von Fixsternen um eine zentrale Sonne. Newton vertrat (korrekt) die Zahl 12, Gregory hielt 13 für möglich.

Gregorys Argument war eine Flächenabschätzung: Projiziert man die umgebenden Kugeln als „Schatten" auf eine Hüllkugel, scheint rein flächenmäßig Platz für fast 15 Kugeln zu sein. Der Trugschluss: Diese Schatten lassen sich nicht lückenlos kacheln. Zusammen mit dem oben beschriebenen Wackelspielraum schien 13 plausibel.

Newton hatte recht, doch ein strenger Beweis fehlte über zweieinhalb Jahrhunderte:
- **Reinhold Hoppe (1874)** lieferte einen Beweisversuch zugunsten Newtons, der jedoch lückenhaft war.
- Der erste vollständige, korrekte Beweis, dass k(3) = 12 gilt, stammt erst von **Kurt Schütte und Bartel Leendert van der Waerden (1953)** — rund 260 Jahre nach dem Disput. Ihr Kern: 13 Punkte auf einer Kugel mit paarweisem Mindest-Winkelabstand von 60° können nicht koexistieren, während die ikosaedrische 12-Punkt-Anordnung mit ~63,43° Abstand bequem hineinpasst.
- Spätere, einfachere Beweise folgten, u. a. von **John Leech (1956)** und über die moderne Delsarte-Methode (Oleg Musin).

*Historische Vorsicht:* Der Mathematiker Bill Casselman wies darauf hin, dass die übliche Erzählung (Newton = 12, Gregory = 13) historisch nicht in allen Details quellenmäßig belegt ist.

### Die Keplersche Vermutung und ihr Beweis (Thomas Hales)

**Ursprung — die Kanonenkugeln.** Im späten 16. Jahrhundert (Studie um 1591) beauftragte Sir **Walter Raleigh** seinen Berater **Thomas Harriot**, die Zahl der zu einer Pyramide gestapelten Kanonenkugeln zu berechnen — ein praktisches Problem der Schiffsbewaffnung. Harriot löste das Abzählproblem mühelos und stieß auf die tiefere Frage: Welche Anordnung verbraucht am wenigsten Raum? Harriot vertrat zudem eine frühe Atomtheorie und korrespondierte ab 1606 mit **Johannes Kepler** (gemeinsames Interesse: Optik). Aus dieser Korrespondenz erwuchs Keplers Beschäftigung mit Kugelanordnungen.

**Die Vermutung.** Kepler formulierte sie 1611 in seiner Schrift *Strena seu de nive sexangula* („Vom sechseckigen Schnee"). Aussage: Keine Anordnung gleich großer Kugeln erreicht eine höhere mittlere Dichte als fcc bzw. hcp, also π/√18 ≈ 74,05 %. Kepler beschrieb die Zwölfer-Nachbarschaft bereits direkt. Die Anschauung lieferten ihm eng gepackte Granatapfelkerne; im Alltag bilden gestapeltes Obst und Kanonenkugel-Pyramiden spontan dieselbe Anordnung.

**Der Weg zum Beweis:**
- **1831 – Carl Friedrich Gauß:** Beweis für den Spezialfall der regulären Gitterpackungen (nicht für unregelmäßige Anordnungen).
- **1900 – David Hilbert:** Aufnahme in sein 18. Problem.
- **1953 – László Fejes Tóth:** zeigte, dass das Problem prinzipiell durch endliche (sehr umfangreiche) Fallprüfung lösbar ist — die konzeptionelle Grundlage für einen Computerbeweis.
- **1998 – Thomas C. Hales** (mit seinem Doktoranden **Samuel P. Ferguson**): Ankündigung des Beweises, ein Beweis durch Fallunterscheidung (proof by exhaustion) mit umfangreichen Computer-Rechnungen.
- **2005 – *Annals of Mathematics*:** Veröffentlichung. Ein Gutachtergremium prüfte rund vier Jahre und erklärte sich zu „99 % sicher", konnte aber nicht jede Computer-Rechnung manuell verifizieren — ein in der Mathematik ungewöhnlicher Vorbehalt.

**Flyspeck — der formale Computerbeweis.** Um diese Restzweifel auszuräumen, startete Hales 2003 das **Flyspeck-Projekt** („Formal Proof of Kepler") mit den Beweisassistenten **HOL Light** und **Isabelle**. Es wurde am 10. August 2014 abgeschlossen; die formale Fassung erschien 2017 in *Forum of Mathematics, Pi*. Seither gilt die Keplersche Vermutung als vollständig gesichert.

(Begriffliche Trennung: Die Kusszahl 12 betrifft eine einzelne Kugel und ihre Nachbarn; die Keplersche Vermutung betrifft die Dichte einer unendlichen Packung. Beides hängt zusammen, ist aber nicht dasselbe.)

### Anwendungen bei Atomen und Metallen

Viele Metalle kristallisieren in einer der beiden dichtesten Packungen, jeweils mit Koordinationszahl 12 und ~74 % Packungsdichte:
- **fcc / ccp:** Kupfer, Aluminium, Gold, Silber, Nickel, Platin, Blei, Iridium.
- **hcp:** Magnesium, Zink, Titan, Beryllium, Cadmium, Zirconium.
- Zum Kontrast die kubisch-raumzentrierte **bcc**-Struktur: Koordinationszahl nur 8, Packungsdichte ~68 % — also keine dichteste Packung.

Die Geometrie hat reale Folgen: fcc-Metalle (Kupfer, Gold) sind in der Regel duktiler (verformbarer) als hcp-Metalle (Zink, Magnesium), weil fcc zwölf Gleitsysteme besitzt, hcp typischerweise nur drei primäre.

### Verwandte Schaum- und Wabengeometrie

Begrifflich getrennt vom Kugelpackungsproblem, aber eng verwandt, ist das Problem der minimalen Trennfläche bei gegebenem Volumen:

- **Bienenwaben-Satz (2D):** Die Vermutung, dass das regelmäßige Sechseckraster unter allen flächengleichen Parkettierungen der Ebene den geringsten Gesamtumfang hat, wurde **1999 von Thomas Hales** bewiesen (publiziert 2001). Schon Varro (36 v. Chr.) und Pappos von Alexandria hatten die Sechseck-Effizienz thematisiert.
- **Kelvin-Problem (3D, 1887):** Lord **Kelvin** (William Thomson) fragte nach der raumfüllenden Zerlegung in Zellen gleichen Volumens mit minimaler Gesamtfläche und schlug den abgestumpften Oktaeder (Tetrakaidekaeder, 14 Flächen) mit leicht gekrümmten Kanten vor.
- **Weaire-Phelan-Struktur (1993):** **Denis Weaire und Robert Phelan** (Trinity College Dublin) fanden per Simulation eine um etwa 0,3 % flächenärmere Lösung aus zwei gleich-volumigen Zelltypen — einem unregelmäßigen Pentagondodekaeder (12 Fünfecke, „Pyritoeder") und einem 14-Flächner (12 Fünfecke + 2 Sechsecke), im Verhältnis 1 : 3.
- **Beijing „Water Cube" (2008):** Der Architekt **Tristram Carfrae** (Arup) nutzte die Weaire-Phelan-Struktur für die Fassade des Nationalen Schwimmzentrums Peking der Olympischen Spiele 2008 (rund 4000 ETFE-Kissen).

## Bedeutung & kulturelle Echos

Die Zahl Zwölf erscheint in diesem Themenkreis dreifach und kausal verkettet — es ist stets dieselbe Zwölf aus drei Blickwinkeln:
1. **Kusszahl 12** — maximale Zahl gleich großer Kugeln, die eine berühren können.
2. **Koordinationszahl 12** in fcc und hcp — jedes Atom hat zwölf nächste Nachbarn.
3. **12 Flächen** des Rhombendodekaeders, der Voronoi-Zelle des fcc-Gitters — eine Fläche je Kontaktnachbar.

Natürliche und gebaute Echos dieser Geometrie:
- **Granatapfelkerne** pressen sich beim Wachstum im engen Fruchtinneren gegenseitig und entwickeln rhombische Flächen — ein natürliches Abbild des Rhombendodekaeders. Kepler selbst nutzte dieses Bild.
- **Bienenwaben:** Die sechseckigen Prismenzellen haben Böden aus drei Rauten — dieselbe Rhombus-Geometrie.
- **Obststapel** im Marktstand (Orangen, Äpfel) und **Kanonenkugel-Pyramiden** realisieren makroskopisch die fcc-Packung.
- Der **Granat** als Mineral kristallisiert oft direkt in Rhombendodekaeder-Form — der knappe Querverweis auf dieselbe Zwölf-Flächen-Geometrie.

Zur Einordnung in die größere Mathematikgeschichte: Außer in den Dimensionen 1, 2, 3, 8 und 24 ist die dichteste Kugelpackung bis heute unbekannt. **Maryna Viazovska** löste 2016 die Dimensionen 8 (E8-Gitter) und — mit Mitautoren — 24 (Leech-Gitter) und erhielt dafür 2022 die Fields-Medaille.

## Vorbehalte & verbreitete Irrtümer (was man NICHT überdeuten darf)

Dies ist der kritische Teil. Mehrere populäre „Zwölf-überall"-Erzählungen halten der Prüfung nicht stand.

**1. Schäume haben im Mittel ~14 Flächen, NICHT 12.** Reale Seifenschäume sind kein Beleg für eine „magische Zwölf". Die klassischen experimentellen Messungen von **Edwin Matzke (1946)** an rund 600 zentralen Blasen ergaben eine mittlere Flächenzahl von etwa 13 bis 13,8 (nahe an Kelvins 14-Flächner), nicht 12. Matzke fand keine einzige Kelvin-Zelle und überhaupt kein geordnetes Muster. Die Weaire-Phelan-Struktur hat im Mittel 13,4 Flächen, die Kelvin-Zelle 14. Das reguläre Pentagondodekaeder (12 Fünfecke) erfüllt die Plateau-Gesetze fast, kann aber den Raum nicht lückenlos füllen. Wer „12 Flächen pro Schaumzelle" behauptet, verwechselt die idealisierte Modellzelle mit der statistischen Realität.

**2. Ungeordnete (zufällige) Kugelpackungen haben ~6 Kontakte, NICHT 12.** Schüttet man Kugeln zufällig zusammen („random close packing"), erreicht man eine Packungsdichte von nur etwa 0,64 (nicht 0,74) und eine mittlere Kontaktzahl von z ≈ 6, nicht 12. Diese Sechs folgt aus dem mechanischen Stabilitätskriterium (Isostatik) z = 2·d, in 3D also 6. Die Zwölf gilt nur für die geordnete, kristalline dichteste Packung.

**3. Die Kusszahl 12 gilt NUR für gleich große Kugeln.** Bei unterschiedlichen Radien können sehr viele kleine Kugeln eine große berühren — die Zahl ist dann nicht 12. Die gesamte Kepler- und Kusszahl-Theorie setzt identische Kugeln (Monodispersität) voraus.

**4. Kelvins Lösung ist nicht optimal — und Weaire-Phelan ist nicht bewiesen optimal.** Kelvins Tetrakaidekaeder galt über ein Jahrhundert als beste Lösung, ist es aber nicht (Weaire-Phelan ist um 0,3 % besser). Aber auch die Weaire-Phelan-Struktur ist nicht bewiesen optimal — numerische Experimente legen es nahe, ein Beweis fehlt. Das Kelvin-Problem ist offen.

**5. Die Bienenwabe ist in 3D nicht optimal.** Die 2D-Wabe ist optimal (bewiesen). Das dreidimensionale Analogon ist es nicht: Die von Bienen verwendete Rhombendodekaeder-Bodenform ist nachweislich nicht die flächenminimale Lösung; László Fejes Tóth zeigte, dass eine andere Geometrie weniger Material braucht. Die populäre Aussage „Bienen lösen ein Optimierungsproblem perfekt" ist in 3D falsch bzw. unbewiesen.

**6. Kein „heilige Geometrie", kein Goldener Schnitt.** *(Als spekulativ/pseudowissenschaftlich klar zurückzuweisen.)* Es gibt keinen seriösen Befund, der die dichteste Kugelpackung, die Kusszahl 12 oder das Rhombendodekaeder mit dem Goldenen Schnitt, „heiliger Geometrie" oder einer „kosmischen Bedeutung der Zahl 12" verknüpft. Das Ikosaeder, das in der lockereren 12er-Anordnung auftaucht, enthält zwar Goldener-Schnitt-Verhältnisse in seinen Koordinaten — das ist aber eine elementare Folge seiner Symmetrie und trägt keine mystische Bedeutung. Diese Verbindungen sind numerologische Überdeutung.

**7. „99 % sicher" war ein Zwischenstand, kein Endurteil.** Die oft zitierte 99-%-Sicherheit der Gutachter betraf Hales' ursprünglichen Beweis von 1998/2005. Seit dem Flyspeck-Abschluss 2014 ist die Keplersche Vermutung vollständig (maschinen-verifiziert) bewiesen. Wer heute noch „nur 99 % sicher" zitiert, ist nicht auf Stand.

**8. fcc und hcp sind nicht die einzigen dichtesten Packungen.** Wie oben ausgeführt, gibt es überabzählbar viele gleich dichte Barlow-Packungen. „Die dichteste Packung" im Singular ist eine Vereinfachung — eindeutig ist nur die Dichte (74,05 %), nicht das Muster.

## Quellen (Tier-System)

Bewertung nach Zuverlässigkeit (R1 primär/wissenschaftlich, R2 etablierte Referenz, R3 seriös populär, R4 schwach, S spekulativ) und Zugang (A1 Volltext, A2 teilweise, A3 indirekt).

### Kusszahl, Newton-Gregory, Beweis 1953
- [R2·A1] Kissing number — Wikipedia — https://en.wikipedia.org/wiki/Kissing_number — Kernquelle, mehrfach im Volltext ausgewertet: k(3)=12, Werte je Dimension, Ikosaeder/~10 %-Spiel und Vertauschbarkeit, Newton-Gregory 1694, Hoppe 1874 unvollständig, Beweis 1953.
- [R3·A1] Newton and the kissing problem — plus.maths.org — https://plus.maths.org/content/newton-and-kissing-problem — Newton/Gregory-Gespräch, Gregorys Flächenabschätzung, anschauliche Erklärung des Trugschlusses.
- [R1·A2] The kissing problem in three dimensions (Musin/Tarasov) — arXiv math/0410324 — https://arxiv.org/abs/math/0410324 — moderner Beweisansatz, Schütte/van der Waerden; nur Abstract/Snippet gelesen.
- [R1·A2] A short solution of the kissing number problem in dimension three — arXiv 2012.15058 — https://arxiv.org/pdf/2012.15058 — kürzerer Beweis, bestätigt k(3)=12.
- [R1·A3] Kissing Numbers, Sphere Packings, and Some Unexpected Proofs (Pfender/Ziegler, Notices of the AMS, 2004) — https://www.ams.org/notices/200408/fea-pfender.pdf — Ikosaeder-Konfiguration, Schütte/van der Waerden 1953; PDF-Direktzugriff teils 403, nur über Snippet.
- [R3·A3] The Difficulties of Kissing in Three Dimensions (Casselman, Notices of the AMS, 2004) — historische Vorsicht zur Newton/Gregory-Erzählung; nur sekundär referenziert.

### Keplersche Vermutung, Hales, Flyspeck
- [R2·A1] Kepler conjecture — Wikipedia — https://en.wikipedia.org/wiki/Kepler_conjecture — π/√18 ≈ 0,74048, Kepler 1611, Harriot/Raleigh, Gauß 1831, Hilbert 18, Hales 1998, Fejes Tóth 1953, „99 %", Flyspeck 2014, Publikation 2017.
- [R2·A1] Kepler Conjecture — Wolfram MathWorld — https://mathworld.wolfram.com/KeplerConjecture.html — Bestätigung Dichte/Daten.
- [R3·A1] Mathematical mysteries: Kepler's conjecture — plus.maths.org — https://plus.maths.org/content/mathematical-mysteries-keplers-conjecture — Harriot-Geschichte, Stapelproblem.
- [R3·A1] The Flyspeck project is complete — The Aperiodical — https://aperiodical.com/2014/09/the-flyspeck-project-is-complete-we-know-how-to-stack-balls/ — Abschluss 10.8.2014, HOL Light/Isabelle, 21 Mitarbeiter.
- [R1·A1] A formal proof of the Kepler conjecture (Hales et al.) — arXiv 1501.02155 — https://arxiv.org/abs/1501.02155 — Flyspeck-Volltext-PDF verfügbar.
- [R1·A2] A formal proof of the Kepler conjecture — Forum of Mathematics, Pi (Cambridge Core, 2017) — https://www.cambridge.org/core/journals/forum-of-mathematics-pi/article/formal-proof-of-the-kepler-conjecture/78FBD5E1A3D1BCCB8E0D5B0C463C9FBC — formale Publikation; Abstract gelesen, Volltext open access.
- [R3·A2] Team announces … formal computer-verified proof of the Kepler conjecture — phys.org — https://phys.org/news/2014-08-team-formal-computer-verified-proof-kepler.html — „99 %"-Gremium, Flyspeck-Abschluss.
- [R1·A3] A computer verification of the Kepler conjecture (Hales) — arXiv math/0305012 — https://arxiv.org/pdf/math/0305012 — ursprünglicher Computerbeweis; indirekt.
- [R3·A1] Kepler's Sphere-Packing Conjecture Is Finally Proved — Encyclopedia.com — https://www.encyclopedia.com/science/encyclopedias-almanacs-transcripts-and-maps/keplers-sphere-packing-conjecture-finally-proved — Überblick.
- [R3·A3] Stack 'em Tight — Scientific American — https://www.scientificamerican.com/article/stack-em-tight/ — Kepler-Zwölfer-Zitat; indirekt.

### fcc / hcp / Packungsdichte / Voronoi-Zelle
- [R2·A1] Close-packing of equal spheres — Wikipedia — https://en.wikipedia.org/wiki/Close-packing_of_equal_spheres — 6+3+3=12, ABAB/ABCABC, 0,7405, Kuboktaeder/Antikuboktaeder, Rhombendodekaeder, Barlow-Packungen.
- [R2·A1] Rhombic dodecahedron — Wikipedia — https://en.wikipedia.org/wiki/Rhombic_dodecahedron — 12/24/14 (6 Grad-4 + 8 Grad-3), Diagonalen 1:√2, Winkel 70,53°/109,47°, Diederwinkel 120°, fcc-Voronoi, raumfüllend, Granat.
- [R2·A1] Cubic Close Packing — Wolfram MathWorld — https://mathworld.wolfram.com/CubicClosePacking.html — fcc-Geometrie.
- [R2·A2] Hexagonal Close Packing — Wolfram MathWorld — https://mathworld.wolfram.com/HexagonalClosePacking.html — hcp-Geometrie.
- [R3·A1] Closest Packed Structures — Chemistry LibreTexts — https://chem.libretexts.org/.../Closest_Pack_Structures — ABAB=hcp, ABCABC=fcc, KZ 12, 74 %/26 %.
- [R3·A1] Let's pack up our spheres and go! — Heidelberg STRUCTURES Blog — https://structures.uni-heidelberg.de/blog/posts/sphere_packing/index.php — Barlow-Packungen, Schichtfolgen.
- [R1·A2] The Dodecahedron as a Voronoi Cell — arXiv 1904.06108 — https://arxiv.org/pdf/1904.06108 — Voronoi-Zelle; PDF verfügbar, nur referenziert.
- [R3·A2] Hexagonal Close-Packed (HCP) Unit Cell — msestudent.com — https://msestudent.com/hexagonal-close-packed-hcp-unit-cell/ — c/a=1,633, KZ 12, APF 74 %.
- [R4·A3] Rhombic dodecahedron / Wigner–Seitz cell — Grokipedia — https://grokipedia.com/page/Rhombic_dodecahedron — Bestätigung 12 Rhombenflächen; schwache Quelle, nur indirekt.

### Metalle / Kristallstrukturen
- [R3·A2] Metallic Structures — NDE-Ed.org — https://www.nde-ed.org/Physics/Materials/Structure/metallic_structures.xhtml — KZ 12 = 6+3+3, fcc/hcp/bcc.
- [R3·A2] Face-Centered Cubic (FCC) Unit Cell — msestudent.com — https://msestudent.com/face-centered-cubic-fcc-unit-cell/ — Duktilität, Gleitsysteme.
- [R4·A2] Crystal Structure Types: FCC, BCC, HCP — SAMaterials — https://www.samaterials.com/blog/crystal-structure-types-fcc-bcc-and-hcp-explained.html — bcc KZ 8 / 68 %; Hersteller-Blog.
- [R3·A2] Crystal Structures of Metals — Chemistry LibreTexts — https://chem.libretexts.org/.../3.03:_Crystal_Structures_of_Metals — Metalllisten.
- [R3·A3] Bonding in Crystalline Solids — Physics LibreTexts (OpenStax) — https://phys.libretexts.org/.../9.04:_Bonding_in_Crystalline_Solids — Energieminimierung.

### Kanonenkugeln / Harriot / Früchte
- [R3·A1] Kepler and the Rhombic Dodecahedron: Stacking Cannonballs — MAA Convergence — https://old.maa.org/press/periodicals/convergence/kepler-and-the-rhombic-dodecahedron-stacking-cannonballs — Raleigh/Harriot 1591, Kanonenkugeln, Granatapfel.
- [R3·A2] Johannes Kepler – the first scientific crystallographer — IUCr — https://www.iucr.org/news/newsletter/volume-32/number-1/johannes-kepler-the-first-scientific-crystallographer — Kepler 1611, Granatapfelkerne.
- [R3·A2] Sphere Packing — Brilliant — https://brilliant.org/wiki/sphere-packing/ — gestapelte Orangen, fcc.
- [R3·A3] Cannonball Problem Overview — Univ. of Pittsburgh Math — http://www.math.pitt.edu/articles/cannonOverview.html — Kanonenkugel-Hintergrund; indirekt.

### Schaum / Kelvin / Weaire-Phelan / Wabensatz
- [R2·A1] Weaire–Phelan structure — Wikipedia — https://en.wikipedia.org/wiki/Weaire%E2%80%93Phelan_structure — Kelvin 1887, Plateau, −0,3 %, zwei Zelltypen, 13,4 mittlere Flächen, „unproven optimal", Water Cube.
- [R2·A1] Honeycomb theorem — Wikipedia — https://en.wikipedia.org/wiki/Honeycomb_theorem — Hales 1999, 2D-Optimalität, Varro/Pappos.
- [R1·A2] The Honeycomb Conjecture (Hales) — arXiv math/9906042 — https://arxiv.org/abs/math/9906042 — Originalbeweis 2D.
- [R1·A3] On the honeycomb conjecture and the Kepler problem — arXiv 0906.1249 — https://arxiv.org/pdf/0906.1249 — 3D-Bienenwabe nicht optimal; indirekt.
- [R3·A1] HALES PROVES HEXAGONAL HONEYCOMB CONJECTURE — Frank Morgan's Math Chat — https://web.williams.edu/mathchat/mathchat_6_17_99.html — Beweis Juni 1999.
- [R3·A1] Throwing Shapes — Trinity College Dublin — https://www.tcd.ie/physics/300/history/exhibition-gallery/throwing-shapes/ — Weaire-Phelan-Entstehung.
- [R3·A3] Foams and Honeycombs — American Scientist — https://www.americanscientist.org/article/foams-and-honeycombs — Matzke 13–13,8 Flächen, Plateau; indirekt.
- [R1·A3] The structure of foam cells: Isotropic Plateau polyhedra — condmatjclub — https://www.condmatjclub.org/wp-content/uploads/2007/06/jccm_may05_02.pdf — Schaum-Statistik; indirekt.
- [R3·A3] Structural Design of the Water Cube — ASCE Metropolitan Section — https://www.ascemetsection.org/.../372-structural-design-of-the-water-cube — Carfrae/Arup; indirekt.
- [R3·A3] Kelvin's bubble burst again — plus.maths.org — https://plus.maths.org/content/kelvins-bubble-burst-again — Kelvin-Problem offen; indirekt.

### Random Close Packing (Vorbehalt z ≈ 6)
- [R1·A3] A first-order phase transition at the random close packing of hard spheres — arXiv 1001.5287 — https://arxiv.org/pdf/1001.5287 — φ_RCP ≈ 0,64, z ≈ 6; indirekt.
- [R3·A3] Random close packing or jamming of spheres in a container — phys.org — https://phys.org/news/2021-05-random-spheres.html — Isostatik z = 6; indirekt.

### Höhere Dimensionen (Einordnung Viazovska)
- [R3·A2] Ukrainian Mathematician Maryna Viazovska Wins Fields Medal — Quanta Magazine — https://www.quantamagazine.org/ukrainian-mathematician-maryna-viazovska-wins-fields-medal-20220705/ — Dim. 8 und 24.
- [R1·A2] Fields Medal 2022 Citation: Maryna Viazovska — IMU — https://www.mathunion.org/fileadmin/IMU/Prizes/Fields/2022/IMU_Fields22_Viazovska_citation.pdf — offizielles Zitat.
- [R3·A2] The Fields Medals 2022: Maryna Viazovska — plus.maths.org — https://plus.maths.org/content/mv — Einordnung.

### Anmerkungen zur Belastbarkeit
- Gut gesichert (mehrfach unabhängig bestätigt): k(3)=12; Newton vs. Gregory 1694; Beweis 1953 (Schütte/van der Waerden); Kepler 1611; Dichte π/√18 ≈ 74,05 %; KZ 12 = 6+3+3; Rhombendodekaeder 12/24/14 mit 1:√2-Diagonalen, 70,53°/109,47°, Diederwinkel 120°; Hales 1998 / Flyspeck 2014 / Forum of Math Pi 2017; Weaire-Phelan 1993, −0,3 %, Water Cube 2008; Wabensatz 2D bewiesen 1999/2001. Euler-Relation 14−24+12=2 ist eigene Kontrollrechnung.
- Schwächer belegt (nur Snippet/indirekt): exakte Matzke-Statistik (~13,7 Flächen) und die genaue Harriot-1591-Zuschreibung — beide plausibel und in der Standardliteratur etabliert.
- Offene Unschärfe: Weaire-Phelan-Jahr wird als 1993 (Simulation) oder 1994 (Publikation) angegeben — beides je nach Bezugspunkt korrekt.
- Als pseudowissenschaftlich (S) zurückzuweisen: jede Verknüpfung mit Goldenem Schnitt, „heiliger Geometrie" oder kosmischer Zwölf-Symbolik — keine seriöse Quelle stützt sie.