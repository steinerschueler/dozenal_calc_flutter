# Dossier: Archimedische Parkettierungen mit Zwölfeck

**Gattung:** Dozenale Mathematik
**Geplantes Kapitel:** »Archimedische Parkettierungen« (mit gemaltem Diagramm)
**Datum:** 2026-06-10
**Verifikation:** Alle Winkel/Zählungen per Python nachgerechnet. Merge aus drei Recherche-
Dossiers (park_a Kern · park_b Diagramm/Basis-12 · park_c Geschichte/Kultur).

> Methodik gemäß `docs/research/README.md`. Maßstab `nature_pyrit.md`. **Diagramm:**
> `ParkettierungPainter` in `lib/info_content.dart`, Hook `imageId 'math/parkettierung'`.

---

## 1. Was eine archimedische Parkettierung ist

Eine **Parkettierung** bedeckt die Ebene lückenlos und überlappungsfrei mit Vielecken. Eine
**archimedische** (uniforme) Parkettierung verwendet nur regelmäßige Vielecke und sieht an
**jeder Ecke gleich** aus (vertex-transitiv). Es gibt **genau 11** uniforme Parkettierungen:
3 reguläre (nur eine Vielecksorte: Dreieck, Quadrat, Sechseck) + 8 semireguläre.

Die **Eckenkonfiguration** zählt die Vielecke um eine Ecke: 4.6.12 = Quadrat + Sechseck +
Zwölfeck. Die Innenwinkel an jeder Ecke müssen exakt **360°** ergeben.

---

## 2. Genau zwei enthalten ein Zwölfeck

Innenwinkel eines regelmäßigen n-Ecks = (n−2)·180/n: Dreieck 60°, Quadrat 90°, Sechseck
120°, **Zwölfeck 150°**. Nach Abzug des Zwölfecks (150°) bleiben 210° für die Nachbarn.
Erschöpfende Suche (n = 3…25, selbst gerechnet): genau **zwei** Paare regelmäßiger Vielecke
ergeben 210° — (Dreieck, Zwölfeck) und (Quadrat, Sechseck). Also:

| Eckenkonfiguration | Name (engl.) | Winkelcheck |
|---|---|---|
| **3.12.12** | truncated hexagonal tiling | 60 + 150 + 150 = 360 ✓ |
| **4.6.12** | truncated trihexagonal tiling | 90 + 120 + 150 = 360 ✓ |

In 3.12.12 grenzt jedes Zwölfeck an 6 Dreiecke und 6 Zwölfecke (alternierende Kanten); in
4.6.12 an 6 Quadrate und 6 Sechsecke (alternierend). Zum Kontrast: 4.8.8 enthält Achtecke,
kein Zwölfeck.

**Das Zwölfeck allein parkettiert nicht:** 360°/150° = 2,4 (keine ganze Zahl). Es braucht
Partner — und nur diese zwei.

---

## 3. Warum nur Drei, Vier, Sechs — die Teilbarkeits-Parallele

Die drei erlaubten Nachbar-Winkel sind 60° = 360°/6, 90° = 360°/4, 120° = 360°/3 — die
Bruchteile des Vollkreises zu den **Teilern 3, 4, 6 von 12**. Dieselbe Teiler-Trias macht in
Basis 12 die Brüche 1/3, 1/4, 1/6 abbrechend (glatt).

Elegante Schreibweise (ägyptische Stammbrüche): treffen sich k Vielecke an einer Ecke, gilt
Σ 1/nᵢ = (k−2)/2; für k=3 also Σ 1/nᵢ = 1/2:
- 3.12.12: 1/3 + 1/12 + 1/12 = 1/2 ✓
- 4.6.12: 1/4 + 1/6 + 1/12 = 1/2 ✓

**Ehrlicher Vorbehalt:** Das ist eine *schöne Parallele, keine Kausalität*. Die Winkel folgen
aus der Vielecksgeometrie, die abbrechenden Brüche aus der Stellenwertarithmetik. Beide
wurzeln in derselben Zahleneigenschaft (12 = 2²·3, Teiler 3/4/6) — aber keines erklärt das
andere.

---

## 4. Geschichte und Kultur

- **Kepler (1619), *Harmonices Mundi*, Buch II:** erste vollständige, systematische
  Aufzählung aller elf uniformen Parkettierungen.
- **Name „archimedisch":** Analogie zu den archimedischen Körpern; es gibt **keine erhaltene
  antike Quelle**, in der Archimedes Parkettierungen behandelt. Der Term für ebene
  Parkettierungen wurde formal von Grünbaum (*Tilings and Patterns*, 1987) geprägt.
- **Islamische Ornamentik:** zwölfzählige Stern-/Girih-Rosetten sind ein Kernmotiv (frühe
  datierte Beispiele: Alâeddin-Moschee Konya 1220, Abbasiden-Palast Bagdad 1230). Angewandte
  Zirkel-und-Lineal-Geometrie, keine Numerologie. (Eigenes Kunst-Kapitel im Welt-Block —
  hier nur streifen.)
- **Quasikristalle:** zwölfzählige (dodekagonale) Quasikristalle existieren als reale
  Materialien — Ein-Satz-Verweis, eigenes Kapitel im Welt-Block.

---

## 5. Diagramm (4.6.12) — Bauanleitung (umgesetzt)

Zentrales reguläres Zwölfeck (Umkreisradius r, δ = −90°, Konvention wie `Chapter4Painter`).
Kantenlänge s = 2r·sin(15°) ≈ 0,5176 r. An den 12 Kanten abwechselnd Quadrate (gerade Kanten)
und Sechsecke (ungerade Kanten), 6 + 6. **Outward-Normale** an Kante k = Radialrichtung durch
die Kantenmitte (mid − center, normiert) — perpendikulär zur Kante, weil die Mittelsenkrechte
jeder Sehne durch den Mittelpunkt läuft.
- Quadrat an Kante (a,b): Ecken a, b, b+u·s, a+u·s.
- Sechseck an Kante (a,b): Zentrum hc = mid + u·(s·√3/2); sechs Ecken bei Radius s um hc,
  Startwinkel zu a, Schrittrichtung so, dass die zweite Ecke b trifft.

Der Ring schließt **gap-frei**, weil an jeder Zwölfeck-Ecke 90°+120°+150° = 360° ist — Quadrat
und benachbartes Sechseck teilen exakt die nach außen laufende Kante (Python: Abweichung
< 10⁻⁸). Farben wie die bestehenden Diagramme: Zwölfeck helle Outline, Quadrate blau,
Sechsecke lila, weiße Eckpunkte.

---

## Vorbehalte & verbreitete Irrtümer

**Irrtum 1: »Ein Zwölfeck allein pflastert die Ebene.«** Nein, 360/150 = 2,4 — es braucht
Partner (nur 3.12.12 und 4.6.12).

**Irrtum 2: »Die Basis-12-Verbindung ist ein Beweis.«** Parallele, keine Kausalität (s. o.).

**Irrtum 3: »archimedisch = von Archimedes.«** Namens-Analogie; keine antike Quelle für
Parkettierungen. Vollständige Klassifikation: Kepler 1619.

**Irrtum 4: »Es sind 8 Parkettierungen.«** Mehrdeutig: 8 *semireguläre* + 3 reguläre = 11
*uniforme*. Beide Zählungen kursieren; „11 uniforme (3 regulär, 8 semiregulär)" ist präzise.

**Irrtum 5: »[60,60,90,150] gibt eine dritte Zwölfeck-Parkettierung.«** Die Winkel summieren
zwar zu 360°, aber 3.3.4.12 setzt sich nicht vertex-transitiv über die Ebene fort. Es gibt
genau die zwei.

**Vorbehalt 6: vertex-transitiv ≠ kantentransitiv.** In 4.6.12 sind alle Ecken gleich, die
Kanten aber nicht (Quadrat-Sechseck / Quadrat-Zwölfeck / Sechseck-Zwölfeck). Kein Fehler,
sondern Definition.

---

## Abgrenzung zu bestehenden Kapiteln

»Das Zwölfeck (Dodekagon)« behandelt die Geometrie des Zwölfecks selbst (Winkel, Diagonalen,
Fläche) und erwähnt Parkettierungen nur am Rand — dieses Kapitel entfaltet sie. »Kunst« (Welt)
behandelt islamische Muster breiter; »Quasikristalle« (Welt) die dodekagonale Aperiodik —
beide hier nur als Ein-Satz-Verweise.

---

## Quellen (Tier-System)

Zuverlässigkeit **R1**/**R2**/**R3**; Zugang **A1**/**A2**/**A3**.

### Parkettierungen — Klassifikation & Geometrie (R1–R2)
- **[R2·A1]** Euclidean tilings by convex regular polygons — Wikipedia — https://en.wikipedia.org/wiki/Euclidean_tilings_by_convex_regular_polygons — alle 11 uniformen, genau 2 mit Zwölfeck.
- **[R2·A1]** Truncated hexagonal tiling (3.12.12) — Wikipedia — https://en.wikipedia.org/wiki/Truncated_hexagonal_tiling — Konfiguration, Konstruktion, Asanoha.
- **[R2·A1]** Truncated trihexagonal tiling (4.6.12) — Wikipedia — https://en.wikipedia.org/wiki/Truncated_trihexagonal_tiling — Konfiguration, Alternativnamen, tr{3,6}.
- **[R2·A1]** Regular polygon — Wikipedia — https://en.wikipedia.org/wiki/Regular_polygon — Innenwinkel-Formel.
- **[R1·A3]** Grünbaum & Shephard, *Tilings and Patterns* (1987) — Standardwerk; Vollständigkeit der 11, Term „archimedisch" für Parkettierungen.
- **[R3·A1]** John Baez, „Archimedean Tilings and Egyptian Fractions" — https://math.ucr.edu/home/baez/egyptian.html — Reziprokbedingung Σ1/n = 1/2.

### Geschichte & Kultur (R2–R3)
- **[R1·A3]** Kepler, *Harmonices Mundi*, Buch II (1619) — https://archive.org/details/ioanniskepplerih00kepl — Erst-Klassifikation; über Sekundärliteratur.
- **[R2·A1]** Islamic geometric patterns / Girih — Wikipedia — https://en.wikipedia.org/wiki/Islamic_geometric_patterns — 12-zählige Sterne (Konya 1220, Bagdad 1230).
- **[R2·A2]** Johannes Kepler — MacTutor — https://mathshistory.st-andrews.ac.uk/Biographies/Kepler/ — Harmonices Mundi als Parkettierungs-Quelle.

### Eigene Verifikation (R1·A1)
- Python: Innenwinkel 60/90/120/150; erschöpfende 360°-Suche → nur (3,12) und (4,6) mit
  Zwölfeck; Reziprok 1/3+1/12+1/12 = 1/4+1/6+1/12 = 1/2; s = 2r·sin15°; Quadrat-/Sechseck-
  Anschluss bündig (< 10⁻⁸). Reproduzierbar.
</content>
