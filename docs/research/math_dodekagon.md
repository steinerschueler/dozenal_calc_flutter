# Forschungs-Dossier: Das regelmäßige Zwölfeck (Dodekagon)

**Gattung:** Dozenale Mathematik · Thema „Dodekagon".
**Zweck:** Konsolidiert die drei Legacy-Kapitel (cases 3–5 in `info_content_de.dart`):
„Was ist ein regelmäßiges Zwölfeck?", „Winkel & Diagonalen", „Fläche & Verhältnisse"
zu einem bequellten Mathematik-Kapitel auf dem Standard der neueren Theorie-Kapitel.

**Abgrenzung zu „Die Zwölf im Bauen" / „Die Zwölf in der Kunst" (Welt-Block):** Dort
geht es um die kulturell-religiöse Verbreitung der Zahl Zwölf im Bauwesen (himmlisches
Jerusalem, Apostel, Tierkreis, Dodekaeder als „Form des Alls") und die symbolische
Deutung. Dieses Mathematik-Kapitel behandelt die **Geometrie der Form** und nur einen
**knappen** Anwendungsabschnitt zum Zwölfeck als physische Form (Münze, Zifferblatt-
Geometrie, Parkettierung), bewusst ohne die Architektur-Beispiele zu wiederholen.

Index-Konvention: Diagonalen heißen d₂…d₆, wobei der Index k die Zahl der
**Verbindungsschritte** entlang des Umkreises zählt (k = 1 ist die Seite, k = 6 der
Durchmesser); „d₂ überspringt eine Ecke" usw. Seitenlänge durchweg s, Umkreisradius R,
Inkreisradius (Apothema) r.

---

## 1. Definition, Winkel und Symmetrie

Ein regelmäßiges Zwölfeck (Dodekagon; griechisch *dōdeka* = zwölf, *gōnía* =
Winkel/Ecke) ist ein konvexes Vieleck mit zwölf gleich langen Seiten und zwölf gleich
großen Innenwinkeln. Alle zwölf Ecken liegen gleichmäßig verteilt auf einem
gemeinsamen Umkreis, je 360°/12 = 30° voneinander entfernt.

**Innenwinkel = 150°.** Aus der allgemeinen Formel (n−2)·180°/n folgt für n = 12:
10·180°/12 = 150°. Gleichwertig über den Außenwinkel: zwölf gleiche Außenwinkel
ergeben zusammen 360°, also 30° je Ecke; Innen- plus Außenwinkel sind 180°, somit
150°. Die Summe aller Innenwinkel beträgt 12·150° = 1800°.

Dozenal: 150° = 106°doz (1·144 + 0·12 + 6), der Außenwinkel 30° = 26°doz. Alle im
Zwölfeck auftretenden Winkel sind ganzzahlige Vielfache von 15° = 13°doz.

**Symmetrie.** Das Zwölfeck hat 24 Symmetrien: 12 Drehungen (0°, 30°, …, 330°) und
12 Spiegelungen (6 Achsen durch gegenüberliegende Ecken, 6 durch gegenüberliegende
Seitenmitten). Sie bilden die Diedergruppe D₁₂ (Ordnung 2·12 = 24). Jedes regelmäßige
n-Eck hat genau 2n Symmetrien.

---

## 2. Konstruierbarkeit mit Zirkel und Lineal

Das Zwölfeck ist mit Zirkel und Lineal exakt konstruierbar. Praktisch:

1. Kreis zeichnen.
2. In sechs gleiche Teile teilen (das gleichseitige Sechseck ist mit dem Zirkel allein
   konstruierbar, weil seine Seite gleich dem Radius ist).
3. Jeden der sechs Bögen halbieren.
4. Die zwölf so erzeugten Punkte sind die Ecken des Zwölfecks.

**Theoretische Grundlage (Satz von Gauß–Wantzel):** Ein regelmäßiges n-Eck ist genau
dann konstruierbar, wenn n = 2ᵏ · p₁ · … · pₜ ist, mit k ≥ 0 und paarweise
verschiedenen Fermat-Primzahlen p₁…pₜ. Die fünf bekannten Fermat-Primzahlen sind 3,
5, 17, 257, 65537. Für das Zwölfeck gilt 12 = 2² × 3; da 3 eine Fermat-Primzahl ist
(F₀ = 3), ist es konstruierbar. Gauß bewies 1796 die Hinlänglichkeit (veröffentlicht
1801 in den *Disquisitiones Arithmeticae*); den Beweis der Notwendigkeit lieferte
Pierre Wantzel 1837.

---

## 3. Drei Vielecke teilen sich die Ecken — kgV(3,4,6) = 12

Verbindet man von den zwölf Ecken nur jede zweite, dritte oder vierte, entstehen
weitere reguläre Vielecke auf **demselben Umkreis**:

| Verbinde jede … Ecke | Ergebnis               | Ecken |
|----------------------|------------------------|-------|
| 2.                   | regelmäßiges Sechseck  | 6     |
| 3.                   | Quadrat                | 4     |
| 4.                   | gleichseitiges Dreieck | 3     |

**Allgemeines Prinzip:** In ein regelmäßiges n-Eck lässt sich genau dann ein
regelmäßiges m-Eck mit denselben Umkreis-Punkten einbeschreiben, wenn m ein Teiler von
n ist; man verbindet dann jede (n/m)-te Ecke. (Die Aussage betrifft Eck-Teilmengen auf
gemeinsamem Umkreis, nicht beliebige Einbettungen.)

**Warum gerade 12.** 12 ist durch 2, 3, 4 und 6 teilbar. Das kleinste n, das zugleich
durch 3, **und** 4 **und** 6 teilbar ist, ist 12 — denn kgV(3, 4, 6) = 12. Damit ist
das Zwölfeck das kleinste reguläre Vieleck, das Dreieck, Quadrat und Sechseck
gleichzeitig als exakte Teilfiguren enthält; kein Fünfeck, Achteck oder Zehneck kann
das.

**Brücke zum Dozenalsystem.** Dass 12 durch 2, 3, 4 und 6 teilbar ist, ist dieselbe
Tatsache, die in Basis 12 die Brüche 1/2, 1/3, 1/4 und 1/6 abbrechend (glatt) macht.
Die geometrische Eigenschaft des Zwölfecks und der arithmetische Vorteil der Basis 12
haben dieselbe Wurzel: die Teilbarkeitsstruktur der Zwölf.

*Präzisierung:* „Jede zweite Ecke ergibt ein Sechseck" liefert je nach Start-Ecke
*eines von zwei* ineinandergeschachtelten Sechsecken (Ecken 0/2/4/… bzw. 1/3/5/…);
jedes für sich ist regulär.

---

## 4. Diagonalen — 54 Stück, sechs Längen

Anzahl der Diagonalen: n(n−3)/2 = 12·9/2 = **54**. Wegen der Symmetrie haben alle
Diagonalen, die gleich viele Schritte überbrücken, dieselbe Länge. Es gibt fünf echte
Diagonal-Sprungweiten plus den Durchmesser, also **sechs Längentypen**.

Allgemeine Sehnenformel im Umkreis mit Radius R: chord(k) = 2R·sin(k·π/12). Mit
R = (√6+√2)/2·s und den exakten Sinuswerten der Vielfachen von 15°:

| Typ    | k | Überspringt | Exakte Länge (s = 1) | Näherung |
|--------|---|-------------|----------------------|----------|
| s      | 1 | —           | 1                    | 1,000    |
| d₂     | 2 | 1 Ecke      | √(2+√3) = (√6+√2)/2  | 1,932    |
| d₃     | 3 | 2 Ecken     | 1+√3                 | 2,732    |
| d₄     | 4 | 3 Ecken     | (3√2+√6)/2           | 3,346    |
| d₅     | 5 | 4 Ecken     | 2+√3                 | 3,732    |
| d₆ (⌀) | 6 | 5 Ecken     | √6+√2 = 2R           | 3,864    |

Alle Werte numerisch geprüft (10⁻¹⁰). Herleitung der Einzelwerte über
2R·sin(k·15°) mit sin(15°)=(√6−√2)/4, sin(30°)=½, sin(45°)=√2/2, sin(60°)=√3/2,
sin(75°)=(√6+√2)/4, sin(90°)=1.

**Strukturmuster:**

- **d₅ − d₃ = s:** (2+√3) − (1+√3) = 1. Die fünfte Diagonale übertrifft die dritte
  genau um die Seitenlänge — eine ganzzahlige Differenz aus Wurzelausdrücken.
- **d₆ = 2·d₂:** √6+√2 = 2·(√6+√2)/2. Durchmesser und kürzeste Diagonale stehen im
  Verhältnis 2:1 (wie die Oktave in der Musik).
- **d₂ = R:** Beim Zwölfeck ist die kürzeste Diagonale gleich dem Umkreisradius (nicht
  die Seite wie beim Sechseck), weil R/s = 1/(2·sin15°) ≠ 1.

**15°-Raster.** Da die zwölf Ecken den Vollkreis in 30°-Sektoren teilen, sind alle
Winkel zwischen Seiten und Diagonalen Vielfache von 15° = 30°/2. 15° = 1/24 des
Vollkreises ist zugleich der kleinste mit Zirkel und Lineal aus dem Kreis teilbare
Winkel dieser Reihe. Dozenal: 13°doz-Raster.

---

## 5. Fläche und Kreisbezug — die „runde Drei"

Zerlegt man das Zwölfeck vom Mittelpunkt in 12 gleichschenklige Dreiecke (zwei Seiten R,
Öffnungswinkel 30°):

> A = 12 · ½ · R² · sin(30°) = 12 · ½ · R² · ½ = **3R²**

**Fläche nach Umkreisradius: A = 3R².** Das ist die eleganteste Form. Der Koeffizient
ist eine glatte ganze Zahl 3 — ganz ohne Wurzel. Das gelingt, weil sin(30°) = ½ ist und
30° der Zentralwinkel des Zwölfecks (360°/12). Niven (1956) zeigte, dass sin eines
ganzzahligen Gradwerts nur bei 0°, 30°, 90°, 150°, 180° rational ist; unter den
konstruierbaren Vielecken mit n > 4 trifft genau das Zwölfeck (über sin 30°) diesen
rationalen Wert (das Sechseck nutzt sin 60° = √3/2, irrational). Eine anschauliche
Dissektion (Umlegen der 12 Dreiecke) beweist A = 3R² auch ohne Trigonometrie.

**Fläche nach Seitenlänge: A = 3(2+√3)s² ≈ 11,196·s².** Aus R = (√6+√2)/2·s und A = 3R²
durch Einsetzen.

**Verhältnis zur Kreisfläche.** Der Umkreis hat Fläche πR², also

> A / (πR²) = 3R²/(πR²) = **3/π ≈ 0,9549**

Das Zwölfeck füllt seinen Umkreis zu **95,5 %**. Vergleich (gleicher Umkreis,
A = (n/2)·R²·sin(2π/n)):

| Figur    | Anteil | Formel    |
|----------|--------|-----------|
| Dreieck  | 41,3 % | 3√3/(4π)  |
| Quadrat  | 63,7 % | 2/π       |
| Sechseck | 82,7 % | 3√3/(2π)  |
| Zwölfeck | 95,5 % | **3/π**   |

Nur das Zwölfeck hat hier einen Anteil ohne Wurzel im Zähler — wieder wegen sin 30° = ½.
Bei R = 1 ist die Zwölfeckfläche exakt 3, knapp unter π ≈ 3,1416.

**Archimedes.** Archimedes berechnete π über ein- und umbeschriebene Vielecke. Er begann
beim Sechseck (trivial konstruierbar) und verdoppelte die Eckenzahl: 6 → 12 → 24 → 48 →
96. Das Zwölfeck war sein erster Verdoppelungsschritt. Das 96-Eck lieferte
3 + 10/71 < π < 3 + 1/7. Es füllt 99,93 % des Kreises; von den 95,5 % des Zwölfecks
genügen drei Verdoppelungen. Dozenaler Rahmen: 96 = 12 × 2³.

---

## 6. Wo das Zwölfeck als Form auftritt (knapp)

*(Kontext; abgegrenzt vom Welt-Kapitel „Die Zwölf im Bauen", das Architektur und
Symbolik behandelt. Hier nur das Zwölfeck als geometrische Form.)*

**Münzen.** Mehrere Staaten prägten zwölfseitige Münzen, vor allem, damit sie sich durch
Tasten und Form von runden Münzen unterscheiden lassen. Der britische *Brass Threepence*
(ab 1937) war das erste nicht-runde Umlaufstück des Landes; das neue zwölfseitige
britische Ein-Pfund-Stück (ab 2017) wurde zur Fälschungsabwehr eingeführt und bewusst
nach dem Vorbild des Threepence gestaltet. Wichtig: Zwölfecke sind **keine** Kurven
konstanter Breite — das sind die siebenseitigen Reuleaux-Formen (britische 20p/50p).
Zwölfeckige Münzen werden über Gewicht, Durchmesser und Leitfähigkeit erkannt.

**Zifferblatt.** Die zwölf Stundenmarken einer Analoguhr bilden ein regelmäßiges
Zwölfeck: 30° pro Schritt (= 26°doz), zwölffache Drehsymmetrie. Die Einteilung des
Kreises in 360° = 12 × 30° und die zwölf Stunden hängen geometrisch zusammen;
Kompassrosen nutzen denselben 30°-Raster.

**Parkettierung.** Ein regelmäßiges Zwölfeck **parkettiert die Ebene nicht allein**:
150° geht nicht ganzzahlig in 360° auf (150°·2 = 300°, 150°·3 = 450°). Mit Partnern
schon — in zwei der elf archimedischen (halbregelmäßigen) Parkettierungen: 3.12.12
(Dreieck + zwei Zwölfecke: 60°+150°+150° = 360°) und 4.6.12 (Quadrat + Sechseck +
Zwölfeck: 90°+120°+150° = 360°). Solche 12-zähligen Muster sind eine Grundlage
islamischer Geometrie-Ornamentik; ihre genauere kultur- und baugeschichtliche
Einordnung steht im Welt-Block.

---

## Vorbehalte & verbreitete Irrtümer

**1. d₄ ist nicht trivial.** Die vierte Diagonale (3 Ecken überspringen) hat die Länge
(3√2+√6)/2 ≈ 3,346, hergeleitet aus chord(4) = 2R·sin(60°). Die verschachtelte Form
√(2+√3) gilt für d₂, **nicht** für d₄. Eines der drei Recherche-Blöcke gab abweichend
d₄ = √6 ≈ 2,449 und d₆ = 2 an — diese Werte waren dort selbst als „zu verifizieren"
markiert und sind falsch; verworfen. Maßgeblich sind die in zwei unabhängigen Blöcken
und mehreren Rechner-Quellen (RedCrab, CalculatorAtoz) übereinstimmenden Werte oben.

**2. „d₂ = √(2+√3)" vs. „d₂ = (√6+√2)/2".** Beide Schreibweisen bezeichnen denselben
Wert: ((√6+√2)/2)² = (8+4√3)/4 = 2+√3. Beide sind korrekt; die zweite Form zeigt die
√2-/√3-Herkunft explizit.

**3. „Fläche = 3" gilt nur für R = 1.** Allgemein ist A = 3R². Bei Seitenlänge s = 1 ist
A = 3(2+√3) ≈ 11,196, nicht 3.

**4. Sprachkonvention bei Diagonalen.** „d₂ überspringt eine Ecke" (Eckenzählung) und
der Index k in chord(k) (Schrittzählung) müssen konsistent gehalten werden, nie
gemischt. In Prosa und Tabelle wird „überspringt … Ecken" benutzt; k bleibt rein
formal.

**5. 3/π ist kein Zufall und keine Mystik.** Das Verhältnis folgt algebraisch zwingend
aus sin 30° = ½ (bzw. sin²15° = (2−√3)/4, wobei sich (2+√3)(2−√3) = 1 kürzt). Es zeigt
nur, dass das Zwölfeck den Kreis gut annähert — keine geheime Verbindung zwischen 3 und
π.

**6. Archimedes begann beim Sechseck.** Das Zwölfeck war sein **erster
Verdoppelungsschritt** (6 → 12), nicht der Ausgangspunkt. „Das Zwölfeck war der
Startpunkt" ist vereinfachend.

**7. Konstruierbarkeit ≠ Vorkommen.** Dass das Zwölfeck mit Zirkel und Lineal leicht
erzeugbar ist, erklärt sein häufiges Vorkommen in Handwerk und Ornament — sagt aber
nichts darüber, warum zwölf Stunden auf der Uhr stehen (kalendarische Tradition) oder
welche kosmische Bedeutung ihm zugeschrieben wird. Das Zwölfeck ist hier ein
geometrisches Werkzeug, keine Aussage über die Welt.

**8. Dodekagon ≠ Dodekaeder.** *Dodekagon* (gōnía = Winkel) ist die zweidimensionale
Figur (12-Eck), *Dodekaeder* (hédra = Fläche) der dreidimensionale Körper mit zwölf
Fünfeck-Flächen. Im Deutschen ist „Zwölfeck" eindeutig zweidimensional.

---

## Quellen (Tier-System)

Bewertung: R1 (wissenschaftlich/primär) · R2 (etablierte Referenz) · R3 (seriös populär)
· R4 (schwach) · S (spekulativ). Zugang: A1 (Volltext gelesen) · A2 (teilweise/Snippet/
Paywall) · A3 (nur indirekt).

### Geometrie, Winkel, Symmetrie

- **[R2·A1]** Dodecagon — Wikipedia (en) — https://en.wikipedia.org/wiki/Dodecagon —
  Innenwinkel 150°, Schläfli {12}, A = 3(2+√3)s² und 3R², R = (√6+√2)/2·s,
  Subpolygone (2{6}, 3{4}, 4{3}), archimedische Parkettierungen 3.12.12 und 4.6.12,
  Zerlegung in 15 Rhomben, Münz- und Architekturbeispiele.
- **[R2·A1]** Constructible polygon — Wikipedia (en) —
  https://en.wikipedia.org/wiki/Constructible_polygon — Satz von Gauß–Wantzel,
  Fermat-Primzahlen 3/5/17/257/65537, 12 = 2²×3, Gauß 1796 / Wantzel 1837.
- **[R2·A1]** Dihedral group — Wikipedia (en) —
  https://en.wikipedia.org/wiki/Dihedral_group — Dih_n Ordnung 2n, 12 Drehungen + 12
  Spiegelungen für das Zwölfeck.
- **[R3·A1]** Dodecagon — Math.net — https://www.math.net/dodecagon — Innenwinkel,
  Symmetrien, 54 Diagonalen, Anwendungen.

### Diagonalen und exakte Formeln

- **[R2·A1]** Dodecagon (12-gon) calculator and formulas — RedCrab Software —
  https://www.redcrab-software.com/en/Calculator/Geometry/Dodecagon — vollständige
  Formelsammlung R, r, d₂…d₆, A = 3(2+√3)s²; bestätigt d₄ = (3√2+√6)/2·s.
- **[R2·A1]** Diagonal of Dodecagon across Two Sides — CalculatorAtoz —
  https://www.calculatoratoz.com/en/diagonal-of-dodecagon-across-two-siden-calculator/calc-10221 —
  d₂ = (√6+√2)/2·s mit numerischem Beispiel.

### Fläche, Kreisbezug, sin(30°) = ½

- **[R3·A1]** Area of a Dodecagon — Alison Kiddle —
  https://alisonkiddle.co.uk/area-of-a-dodecagon/ — geometrischer Beweis A = 3R²
  (12 Dreiecke, sin 30° = ½) per Dissektion.
- **[R3·A1]** Getting Closer to π: Inscribing and Circumscribing Polygons — Univ.
  Alberta —
  https://sites.ualberta.ca/~esimmt/think/main/richMathTasks/evan/files/InscribingAndCircumscribingPolygons.pdf —
  Flächenanteil-Tabelle (41,3 % / 63,7 % / 82,7 % / 95,5 %).
- **[R1·A2]** Niven, I. (1956), *Irrational Numbers*, Carus Mathematical Monographs —
  rationale Sinuswerte ganzzahliger Grade nur bei 0°/30°/90°; indirekt über
  Standardliteratur abgesichert.

### Archimedes und π-Approximation

- **[R2·A1]** Archimedes on the Circumference and Area of a Circle — AMS Feature Column
  — https://www.ams.org/publicoutreach/feature-column/fc-2012-02 — Sechseck als
  Ausgangspunkt, Verdoppelung 6→…→96, Ergebnis 223/71 < π < 22/7.

### Einbeschriebene Vielecke / Teilbarkeit

- **[R3·A1]** Polygons and Divisibility — Prof. Tiz —
  https://professortiz.wordpress.com/2013/03/05/489/ — Prinzip „m | n ⟺ reguläres
  m-Eck in regulärem n-Eck einbeschreibbar"; Dreieck/Quadrat/Sechseck im Zwölfeck.

### Anwendung als Form (knapp)

- **[R2·A1]** Brass threepence — Wikipedia (en) —
  https://en.wikipedia.org/wiki/Brass_threepence — zwölfseitig ab 1937, Tast-
  Erkennbarkeit, erstes nicht-rundes Umlaufstück Großbritanniens.
- **[R2·A2]** Royal Mint — The 12-Sided £1 Coin — https://www.royalmint.com/new-pound-coin/
  — zwölfseitiges Pfund ab 2017, Fälschungsabwehr, Vorbild Threepence.
- **[R2·A1]** Dodecagonal coin — Wikipedia (en) —
  https://en.wikipedia.org/wiki/Dodecagonal_coin — Liste zwölfseitiger Münzen; keine
  konstante Breite bei gerader Seitenzahl.
- **[R3·A1]** DataGenetics — Tessellating Regular Polygons —
  http://datagenetics.com/blog/september22019/index.html — welche Vielecke allein
  parkettieren; Zwölfeck nur mit Partnern (3.12.12 / 4.6.12).
