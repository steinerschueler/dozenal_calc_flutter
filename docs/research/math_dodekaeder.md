# Dossier: Der reguläre Dodekaeder

**Kategorie:** `math_dodekaeder` — Dozenale Mathematik.
**Zweck:** Konsolidiert die zwei Legacy-Kapitel (cases 6–7 in `info_content_de.dart`)
„Der Dodekaeder — zwölf Fünfecke im Raum" und „— φ, Dualität und Symmetrie" zu
**einem** bequellten Mathematik-Kapitel auf dem Standard der neueren
Theorie-Kapitel. Merge aus drei Recherche-Dossiers (A, B, C).

**Abgrenzung zu den Welt-Kapiteln (`world_de.dart`).** Die *Natur*-Erscheinungen
und die *kulturelle* Deutung des Dodekaeders sind dort bereits vollständig
bequellt: römische Bronze-Dodekaeder, Platons Kosmos-Zuordnung, das Pyritoeder
als nicht-platonischer Zwölfflächner, das kristallographische Verbot der
Fünf-Symmetrie und die Quasikristalle. Das Mathematik-Kapitel **wiederholt diese
nicht**, sondern verweist kurz (insbesondere auf „Pyrit: zwölf Flächen aus dem
Würfel" und „Quasikristalle: die verbotene Symmetrie"). Hier steht die *reine
Geometrie und Topologie*.

Zielgruppe: zugänglich, in kleinen Schritten, rigoros bequellt; neutrale Stimme,
keine eigenen Wertungen; einfache, übersetzbare deutsche Sätze.

---

## 1. Grundform und Maße

Der reguläre Dodekaeder (griechisch *dōdeka* = zwölf, *hédra* = Fläche/Sitz) ist
einer der fünf platonischen Körper. Er besteht ausschließlich aus zwölf
kongruenten, regulären Fünfecken (Pentagonen):

- **12 Flächen** — reguläre Fünfecke, alle gleich, Innenwinkel je 108°.
- **30 Kanten** — alle gleich lang.
- **20 Ecken** — an jeder treffen genau drei Fünfecke zusammen.

Das **Schläfli-Symbol** ist {5, 3}: „Fünfecke als Flächen, drei davon an jeder
Ecke." Das ist die kompakteste Beschreibung des Körpers.

Der Dodekaeder ist der **einzige** platonische Körper mit fünfeckigen Flächen.
Die fünf Körper im Überblick (Flächen / Ecken / Kanten / Flächenform):

- Tetraeder — 4 / 4 / 6 — gleichseitige Dreiecke.
- Hexaeder (Würfel) — 6 / 8 / 12 — Quadrate.
- Oktaeder — 8 / 6 / 12 — gleichseitige Dreiecke.
- **Dodekaeder — 12 / 20 / 30 — reguläre Fünfecke.**
- Ikosaeder — 20 / 12 / 30 — gleichseitige Dreiecke.

Der **Diederwinkel** (Winkel zwischen zwei benachbarten Flächen) beträgt
arccos(−√5/5) = 2·arctan(φ) ≈ **116,57°** (dezimal). Zum Vergleich: Würfel 90°,
Ikosaeder ≈ 138,19°.

Quellen: [R2·A1] Regular dodecahedron — Wikipedia (en); [R2·A1] Dodekaeder —
Wikipedia (de); [R2·A1] Platonic solid — Wikipedia (en).

---

## 2. Warum es genau fünf platonische Körper gibt

Ein **platonischer Körper** ist ein konvexer Polyeder, dessen Flächen alle
kongruente reguläre *p*-Ecke sind und an jeder Ecke genau *q* Flächen
zusammentreffen (Schläfli-Symbol {p, q}). Es gibt genau fünf — nicht mehr und
nicht weniger. Der Beweis hat zwei gleichwertige Wege.

### 2.1 Eulerscher Polyedersatz

Für jeden konvexen Polyeder gilt **E − K + F = 2** (Ecken minus Kanten plus
Flächen). Für den Dodekaeder: 20 − 30 + 12 = **2**.

Die Formel ist topologisch: Der Wert 2 hängt nur von der Oberflächen-Topologie
ab (Kugel), nicht von der genauen Gestalt. Sie gilt für jeden löcherfreien
konvexen Körper — jedes Prisma, jede Pyramide, alle fünf platonischen Körper.

**Geschichte.** Leonhard Euler formulierte das Ergebnis in zwei Arbeiten
(gelesen 1750/1751, publiziert 1758) und sandte es 1750 brieflich an Christian
Goldbach. Eine verwandte Überlegung hatte Francesco Maurolico schon 1537
notiert, Descartes ein äquivalentes Ergebnis über den Winkeldefekt. Eulers
eigener Beweis war unvollständig; **Adrien-Marie Legendre** gab 1794 den ersten
streng akzeptierten Beweis (sphärische Geometrie), **Augustin-Louis Cauchy**
1811 den eleganten kombinatorischen Beweis über planare Graphen.

### 2.2 Die Winkelbedingung an jeder Ecke

Zählargument: Jede Kante begrenzt zwei Flächen, also p·F = 2K; an jeder Ecke
treffen q Kanten, jede Kante hat zwei Enden, also q·E = 2K. Eingesetzt in
E − K + F = 2 folgt die Ungleichung

> **1/p + 1/q > 1/2**

Mit p ≥ 3 (mindestens Dreiecke) und q ≥ 3 (mindestens drei Flächen je Ecke) hat
sie **genau fünf** Lösungen: {3,3} Tetraeder, {4,3} Würfel, {3,4} Oktaeder,
{5,3} **Dodekaeder**, {3,5} Ikosaeder. Bei {6,3} ist 1/6 + 1/3 = 1/2 — gleich,
nicht größer: das ist die flache Sechseck-Parkettierung der Ebene, kein
geschlossener Körper. Für p ≥ 6 oder q ≥ 6 wird die Summe kleiner als 1/2.

**Winkeldefekt-Sicht (gleicher Inhalt, anschaulicher).** Der Innenwinkel des
regulären p-Ecks ist (p−2)·180°/p; fürs Fünfeck 108°. An einer Dodekaeder-Ecke
treffen drei Fünfecke: 3·108° = 324°. Bleiben 360° − 324° = **36°** Defekt —
positiv, also faltet sich der Raum zu einem konvexen Körper. Vier Fünfecke an
einer Ecke ergäben schon 432° > 360° — unmöglich flach zu schließen. Darum ist
{5,3} die **einzige** mögliche Fünfeck-Konfiguration, und der Dodekaeder der
einzige platonische Körper mit fünfeckigen Flächen.

Euklid bewies die Unmöglichkeit eines sechsten regulären Körpers in den
*Elementen*, Buch XIII, Proposition 18 (um 300 v. Chr.) — mit einem ähnlichen
Winkelargument, allerdings ohne Konvexität explizit vorauszusetzen (siehe
Vorbehalte).

Quellen: [R2·A1] Platonic solid — Wikipedia (en); [R1·A1] Euler's polyhedron
formula — Plus Maths (Cambridge); [R1·A1] Platonic Solids: Why Five? —
MathsIsFun; [R2·A1] Angular defect — Wikipedia (en); [R2·A2] Euler
characteristic — Wikipedia (en).

---

## 3. Der Goldene Schnitt φ im Fünfeck und im Körper

### 3.1 φ im regulären Fünfeck

Der Goldene Schnitt ist φ = (1 + √5)/2 ≈ 1,618. Seine bestimmende Eigenschaft
ist **φ² = φ + 1**: φ ist die positive Lösung von x² − x − 1 = 0. (Im Rechner
nachvollziehbar: `φ² =` liefert `φ + 1`.)

Im regulären Fünfeck verhält sich **jede Diagonale zur Seite wie φ zu 1** — die
Diagonale hat exakt die Länge φ · Seite. Das Fünfeck ist damit der einfachste
ebene Ort, an dem φ als Streckenverhältnis zwingend auftritt. (Mehrfach belegte
Herleitung über ähnliche Dreiecke / das goldene Gnomon, äquivalent über das
Ptolemäos-Theorem.) Schriftlich festgehalten ist diese Proportion bereits in
Euklids *Elementen* als „extremes und mittleres Verhältnis".

### 3.2 φ im Dodekaeder

Weil jede Fläche ein reguläres Fünfeck ist, durchzieht φ den ganzen Körper.

**Eckkoordinaten.** Zentriert man den Dodekaeder im Ursprung (Kantenlänge 2/φ),
liegen seine 20 Ecken an: (±1, ±1, ±1) — acht Ecken, das sind Würfelecken; sowie
(0, ±φ, ±1/φ), (±1/φ, 0, ±φ) und (±φ, ±1/φ, 0) — je vier Ecken. φ erscheint
buchstäblich als Koordinatenwert. Die drei letzten Gruppen bilden je ein
**goldenes Rechteck** (Seitenverhältnis φ:1), und die drei Rechtecke stehen
paarweise senkrecht aufeinander.

**Einbeschriebene Würfel.** Die acht Ecken (±1, ±1, ±1) bilden einen
einbeschriebenen Würfel. Insgesamt lassen sich **fünf** verschiedene Würfel so
in den Dodekaeder einschreiben; das Verhältnis Würfelkante zu Dodekaederkante
ist φ. Daraus folgt eine anschauliche Konstruktion: Setzt man auf jede der sechs
Würfelflächen ein „Satteldach", dessen Firstkante 1/φ der Würfelkante misst,
werden die zwölf Dächer zu zwölf Fünfecken — so entsteht der Dodekaeder aus dem
Würfel.

**Maßformeln** (Kantenlänge a = 1; alle enthalten √5 bzw. φ, also denselben
Zahlbereich ℚ(√5)): Volumen (15 + 7√5)/4 ≈ 7,663; Oberfläche 3√(25 + 10√5) ≈
20,646; Umkugelradius (√3·φ)/2 ≈ 1,401; Mittelkugelradius φ²/2 ≈ 1,309;
Inkugelradius √(25 + 11√5)/(2√10) ≈ 1,114.

Quellen: [R2·A1] Golden ratio — Wikipedia (en); [R2·A1] Regular dodecahedron —
Wikipedia (en); [R2·A1] Ron Knott, *Phi in 3D Geometry* (Univ. Surrey);
[R2·A1] Matematicas Visuales — *Diagonal of a Regular Pentagon*.

---

## 4. Dualität und Symmetrie

### 4.1 Dualität mit dem Ikosaeder

Zu jedem konvexen Polyeder gehört ein **dualer Körper**: Man setzt in den
Mittelpunkt jeder Fläche eine neue Ecke und verbindet die Ecken benachbarter
Flächen. Flächen und Ecken tauschen die Rollen, die Kantenzahl bleibt.

Beim Dodekaeder entsteht so das **Ikosaeder** — und umgekehrt: Dodekaeder 12
Flächen / 30 Kanten / 20 Ecken; Ikosaeder 20 Flächen / 30 Kanten / 12 Ecken. Die
Kantenzahl **30** ist das Invariante (der kombinatorische Kern der Dualität).
Die **Zwölf** erscheint in beiden Körpern: einmal als Flächenzahl (Dodekaeder),
einmal als Eckenzahl (Ikosaeder). Diese gemeinsame Struktur ist der Grund, warum
beide dieselbe Symmetriegruppe teilen. (Zum Vergleich: Würfel ↔ Oktaeder sind
ebenfalls dual, Tetraeder ist zu sich selbst dual.)

### 4.2 Die Symmetriegruppe Iₕ — 120 Elemente

Dodekaeder und Ikosaeder besitzen die **höchste diskrete Punktsymmetrie** aller
konvexen Körper: die volle Ikosaedergruppe **Iₕ** mit **120 Elementen**, je zur
Hälfte 60 Drehungen und 60 Dreh-Spiegelungen. Zum Vergleich: Würfel/Oktaeder 48,
Tetraeder 24.

Die 60 Drehungen verteilen sich auf drei Achstypen plus Identität:
- **6 fünfzählige Achsen** durch je ein Paar gegenüberliegender Flächenmitten →
  je 4 Drehungen (72°, 144°, 216°, 288°) = 24.
- **10 dreizählige Achsen** durch gegenüberliegende Ecken → je 2 (120°, 240°) =
  20.
- **15 zweizählige Achsen** durch gegenüberliegende Kantenmitten → je 1 (180°) =
  15.
- Identität = 1. Summe 1 + 24 + 20 + 15 = **60**. Plus 60 Dreh-Spiegelungen =
  120.

Die Rotationsuntergruppe I (60 Elemente) ist isomorph zur alternierenden Gruppe
A₅, die volle Gruppe ist Iₕ ≅ A₅ × ℤ₂ (Coxeter-Symbol H₃, [5,3]). Die Ordnung
faktorisiert als 120 = 2³ · 3 · 5 = **5!** — dieselben Primfaktoren 2, 3, 5, die
auch in den Achszähligkeiten und in der Fünfeck-Flächenform auftauchen.

**Kristallographischer Querverweis.** Die fünfzähligen Achsen machen Iₕ
*unverträglich mit Translations-Symmetrie*: Ein periodisches Gitter kann keine
echte Fünf-Achse tragen (nur 1-, 2-, 3-, 4-, 6-zählige sind erlaubt). Darum kann
kein gewöhnlicher Kristall ein echtes platonisches Dodekaeder bilden — die
Konsequenz (Pyritoeder, Quasikristalle) ist in den Welt-Kapiteln ausgeführt.

Quellen: [R2·A1] Icosahedral symmetry — Wikipedia (en); [R2·A1] Regular
dodecahedron — Wikipedia (en); [R2·A1] Platonic solid — Wikipedia (en).

---

## 5. Die Euler-Zwölf: warum immer genau zwölf Fünfecke

Dies ist ein eigenständiges topologisches Ergebnis, das den Dodekaeder mit dem
Fußball, mit Viren und mit geodätischen Kuppeln verbindet.

**Frage:** Kann man eine geschlossene, kugelartige Fläche aus lauter regulären
Sechsecken bauen? **Antwort:** Nein. Ein reines Sechseck-Netz ist flach (es
füllt die Ebene). Um es zur Kugel zu krümmen, müssen **genau zwölf Fünfecke**
eingebaut werden — egal, wie viele Sechsecke sonst verwendet werden.

Das folgt direkt aus Euler: Stoßen an jeder Ecke drei Flächen zusammen und
verwendet man nur Fünf- und Sechsecke (p₅ Fünfecke, p₆ Sechsecke), so liefert
E − K + F = 2 die Bedingung **p₅ = 12** — unabhängig von p₆. Konkret: p₅ = 12,
p₆ = 0 ergibt das **reguläre Dodekaeder**; p₅ = 12, p₆ = 20 das **abgestumpfte
Ikosaeder** (Fußball, Fulleren C₆₀); p₅ = 12, p₆ beliebig die geodätischen
Kuppeln. Das reguläre Dodekaeder ist der reinste Fall: zwölf Fünfecke und kein
einziges Sechseck.

Quellen: [R2·A1] Truncated icosahedron — Wikipedia (en); [R2·A1] Platonic solid
— Wikipedia (en); [R1·A2] The Topology and Combinatorics of Soccer Balls —
American Scientist.

---

## 6. Anschauung und kulturelle Einbettung

**D12-Würfel.** In Tischrollenspielen ist der reguläre Dodekaeder als **D12**
bekannt — der zwölfseitige Würfel. Seine zwölf gleichwertigen Flächen machen ihn
fair (jede Zahl 1/12 ≈ 8,3 %). Von allen fünf platonischen Körpern nähert der
Dodekaeder die Kugelform am stärksten an (das Verhältnis Inkugel- zu
Umkugelradius ist mit ≈ 0,795 das größte), darum rollt der D12 angenehm und
kommt zuverlässig auf einer Fläche zur Ruhe. Zwölfseitige Würfel sind alt:
Beispiele aus dem ptolemäischen Ägypten (ab ca. 150 v. Chr.) sind belegt — aber
ohne nachweisbare durchgehende Tradition bis zur Moderne (siehe Vorbehalte).

**Kulturelle Deutung — Verweis.** Platons Zuordnung des Dodekaeders zum Kosmos
(*Timaios*, um 360 v. Chr.), die römischen Bronze-Dodekaeder und die mögliche
Anregung durch Pyritkristalle sind eine *historisch-philosophische* Schicht und
werden in den Welt-Kapiteln behandelt (u. a. „Pyrit: zwölf Flächen aus dem
Würfel"). Sie sind Deutung, kein mathematisches Resultat — hier nur als
Querverweis.

Quellen: [R3·A2] D12 — RPG Museum (Fandom); [R3·A2] d12 dice — DiceEnvy;
[R2·A1] Truncated icosahedron — Wikipedia (en).

---

## 7. Vorbehalte und verbreitete Irrtümer

**Irrtum 1: „Der Fußball ist ein Dodekaeder."** Der klassische Fußball
(Telstar-Muster, WM 1970) ist ein **abgestumpftes Ikosaeder**: 12 Fünfecke + 20
Sechsecke = 32 Flächen, 60 Ecken, 90 Kanten. Er ist ein *archimedischer*, kein
platonischer Körper. Gemeinsam mit dem Dodekaeder hat er nur die zwölf Fünfecke
(die Euler-Zwölf) — aber zusätzlich 20 Sechsecke. Ein Dodekaeder hat genau 12
Flächen, alle Fünfecke, keine Sechsecke.

**Irrtum 2: Dodekagon (2D) ≠ Dodekaeder (3D).** Beide Namen tragen „dodeka-"
(zwölf). Das **Dodekagon** (Zwölfeck) ist ein flaches Polygon mit zwölf Seiten
und zwölf Ecken. Der **Dodekaeder** ist ein räumlicher Körper mit zwölf Flächen,
dreißig Kanten, zwanzig Ecken. Im Griechischen trennt *-gon* (Ecke/Winkel, 2D)
von *-hédra* (Fläche, 3D).

**Irrtum 3: Reguläres Dodekaeder ≠ Pyritoeder.** Pyrit bildet einen
Zwölfflächner mit fünfeckigen Flächen (Pyritoeder {210}), der aber
*unregelmäßig* ist: Winkel ≈ 121,6°/106,6°/102,6° statt überall 108°, zwei
verschiedene Kantenlängen, Symmetriegruppe Tₕ (Ordnung 24) **ohne echte
fünfzählige Achse**. Das reguläre Dodekaeder hat gleiche Flächen, gleiche Kanten
und echte Fünf-Achsen (Iₕ, Ordnung 120). Ausführliche Herleitung im Pyrit-Kapitel.

**Irrtum 4: „φ macht den Dodekaeder mystisch/harmonisch."** φ erscheint im
Dodekaeder als geometrische Notwendigkeit, weil reguläre Fünfecke nun einmal φ
enthalten — eine mathematische Tatsache. Weitergehende Deutungen („göttliche
Proportion", „kosmische Harmonie") sind menschliche Zuschreibungen, keine
Eigenschaften der Geometrie.

**Irrtum 5: „Platons Kosmos-Zuordnung ist Mathematik."** Platon ordnete den
Dodekaeder dem Kosmos zu — das ist eine philosophische Deutung, kein Resultat.
Die Geometrie (zwölf Flächen, φ, Symmetriegruppe) ist davon unabhängig prüfbar.

**Vorbehalt 6: Euklids Eindeutigkeitsbeweis.** *Elemente* XIII.18 beweist, dass
kein weiterer *regulärer* Körper möglich ist, setzt aber Konvexität implizit
voraus, ohne sie zu nennen — nach modernem Standard formal unvollständig. Der
vollständige Beweis folgt aus Euler und 1/p + 1/q > 1/2.

**Vorbehalt 7: Zuschreibung Pythagoreer vs. Theaitetos.** Ein Scholion (antike
Randnotiz) in Euklid XIII schreibt Würfel, Tetraeder, Dodekaeder den
Pythagoreern, Oktaeder und Ikosaeder Theaitetos zu. Scholia sind keine
zeitgenössischen Berichte; die Zuschreibungen sind plausibel, aber nicht
gesichert.

**Vorbehalt 8: 120 = 5!.** Mathematisch korrekt (5! = 120) und in Sekundärquellen
geläufig, aber in den abgerufenen Primärartikeln nicht zentral hervorgehoben —
als illustratives Faktum verwenden, nicht tragend.

**Vorbehalt 9: A₅ ↔ Quintik.** Dass A₅ keine auflösbare Erweiterung hat, ist der
gruppentheoretische Kern dafür, dass allgemeine Gleichungen fünften Grades nicht
durch Radikale lösbar sind (Abel-Ruffini). Korrekt, aber für die Zielgruppe eine
Fußnote — nicht den Fließtext überfrachten.

**Vorbehalt 10: Ptolemäisches Alter der D12.** Antike zwölfseitige Würfel
existieren (gut belegt), belegen aber keine *kontinuierliche* Tradition bis zu
den modernen Rollenspielen.

---

## Quellen (Tier-System)

Bewertung: Zuverlässigkeit R1 (wissenschaftlich/primär) · R2 (etablierte
Referenz) · R3 (seriös populär) · R4 (schwach) · S (spekulativ); Zugang A1
(Volltext gelesen) · A2 (teilweise/Snippet) · A3 (nur indirekt).

### Geometrie, Topologie, Maße (R1–R2)

- **[R2·A1]** Regular dodecahedron — Wikipedia (en) —
  https://en.wikipedia.org/wiki/Regular_dodecahedron —
  Flächen/Kanten/Ecken, Schläfli {5,3}, Diederwinkel 2·arctan(φ), exakte
  Maßformeln und Radien, Eckkoordinaten mit φ, fünf einbeschriebene Würfel,
  Dualität, Symmetriegruppe Iₕ. Primärquelle.
- **[R2·A1]** Dodekaeder — Wikipedia (de) —
  https://de.wikipedia.org/wiki/Dodekaeder —
  Deutsche Maßangaben (Volumen ≈ 7,663·a³, Oberfläche ≈ 20,646·a²,
  Umkugel ≈ 1,401·a, Inkugel ≈ 1,114·a, Diederwinkel ≈ 116,56°).
- **[R2·A1]** Platonic solid — Wikipedia (en) —
  https://en.wikipedia.org/wiki/Platonic_solid —
  Vollständige Klassifikation (1/p+1/q>1/2), Tabelle aller fünf Körper,
  Dualität, Symmetriegruppen-Ordnungen, historische Attributionen, Timaios.
- **[R1·A1]** Euler's polyhedron formula — Plus Maths (Cambridge) —
  https://plus.maths.org/content/eulers-polyhedron-formula —
  Cauchys Beweis Schritt für Schritt; 200 Jahre Beweisgeschichte.
- **[R2·A2]** Euler characteristic — Wikipedia (en) —
  https://en.wikipedia.org/wiki/Euler_characteristic —
  Maurolico 1537, Legendre 1794, Cauchy 1811, Descartes' Winkeldefekt.
- **[R1·A1]** Platonic Solids: Why Five? — MathsIsFun —
  https://www.mathsisfun.com/geometry/platonic-solids-why-five.html —
  Volltext-Ableitung pF=2K, qE=2K, kombiniert mit Euler; alle fünf Lösungen.
- **[R2·A1]** Angular defect — Wikipedia (en) —
  https://en.wikipedia.org/wiki/Angular_defect —
  Winkeldefekt des Dodekaeders 360°−3·108° = 36°.

### Goldener Schnitt im Fünfeck und Körper (R2)

- **[R2·A1]** Golden ratio — Wikipedia (en) —
  https://en.wikipedia.org/wiki/Golden_ratio —
  φ = (1+√5)/2, φ² = φ+1, φ = 2cos(36°), Diagonale/Seite = φ im Fünfeck.
- **[R2·A1]** Ron Knott — *The Golden Geometry of Solids (Phi in 3D)*,
  University of Surrey —
  https://r-knott.surrey.ac.uk/Fibonacci/phi3DGeom.html —
  Eckkoordinaten via φ, fünf einbeschriebene Würfel, drei goldene Rechtecke.
- **[R2·A1]** Matematicas Visuales — *The Diagonal of a Regular Pentagon and the
  Golden Ratio* —
  http://www.matematicasvisuales.com/english/html/geometry/goldenratio/pentagondiagonal.html —
  Beweis über ähnliche Dreiecke (goldene Gnomone), φ² = φ+1.

### Symmetrie und Gruppenstruktur (R2)

- **[R2·A1]** Icosahedral symmetry — Wikipedia (en) —
  https://en.wikipedia.org/wiki/Icosahedral_symmetry —
  Iₕ Ordnung 120, Zerlegung der 60 Drehungen (6/10/15 Achsen), I ≅ A₅,
  Iₕ ≅ A₅×ℤ₂, Coxeter H₃ [5,3], Inkompatibilität mit Translationssymmetrie.

### Fußball / Euler-Zwölf (R1–R2)

- **[R2·A1]** Truncated icosahedron — Wikipedia (en) —
  https://en.wikipedia.org/wiki/Truncated_icosahedron —
  12 Fünfecke + 20 Sechsecke, 32/60/90, archimedisch (nicht platonisch),
  Telstar 1970, C₆₀.
- **[R1·A2]** The Topology and Combinatorics of Soccer Balls — American
  Scientist —
  https://www.americanscientist.org/article/the-topology-and-combinatorics-of-soccer-balls —
  Euler-Beweis für genau 12 Fünfecke, unabhängig von der Sechseck-Zahl.

### D12 / Anschauung (R3)

- **[R3·A2]** D12 — RPG Museum (Fandom) —
  https://rpgmuseum.fandom.com/wiki/D12 —
  Standardform regulärer Dodekaeder, 1/12-Wahrscheinlichkeit, Einsatz in D&D.
- **[R3·A2]** d12 dice — DiceEnvy —
  https://diceenvy.com/pages/d12-dice —
  Haptische Qualitäten, Rollverhalten, kugelnahe Gestalt.

### Geschichte (R1–R2)

- **[R1·A2]** Euler's Polyhedral Formula — AMS Feature Column —
  https://www.ams.org/publicoutreach/feature-column/fcarc-eulers-formula —
  Zeitleiste (Brief an Goldbach 1750, Arbeiten 1758, Legendre 1794, Cauchy
  1811), Maurolico 1537; Zugriff teils 403, Kernaussagen via Snippets.
- **[R2·A2]** Euclid's Elements, Book XIII, Prop. 18 — D. Joyce, Clark
  University —
  http://aleph0.clarku.edu/~djoyce/elements/bookXIII/propXIII18.html —
  Winkelargument, „keine weiteren Körper"; Abruf TLS-Fehler, anderweitig gestützt.

### Terminologie 2D vs. 3D (R2)

- **[R2·A1]** Zwölfeck — Wikipedia (de) —
  https://de.wikipedia.org/wiki/Zw%C3%B6lfeck —
  Dodekagon = 2D-Polygon mit 12 Seiten; Abgrenzung zum Dodekaeder.

### Nicht zitiert / redundant abgesichert

- **[R1·A3]** Regular Dodecahedron — Wolfram MathWorld —
  https://mathworld.wolfram.com/RegularDodecahedron.html —
  HTTP 403; Maßformeln/Koordinaten via Wikipedia redundant abgesichert.
- **[R2·A2]** CALCETRA / redcrab-software / SmartConversion —
  Volumen (15+7√5)/4·a³ und Oberfläche 3√(25+10√5)·a² numerisch gegengeprüft.
</content>
</invoke>
