# Einheitenrechner (Unit Converter) — Spezifikation & Umbauplan

> **Status: UMGESETZT.** Ursprünglich der Entwurf zur Abnahme; inzwischen
> ist alles implementiert (offene Ideen in
> §8). Die Datei bleibt als Spezifikation/Referenz — bei Widersprüchen
> gewinnt der Code bzw. docs/rechner-seiten.md.

## 1. Zweck & Einordnung

Ein **zweiter Rechner-Modus** — ein vollwertiger Einheitenrechner. Er ist
Seite 2 des horizontalen Pagers (Taste rechts vom Gleichbalken) und
**wiederverwendet die Bausteine** des Hauptrechners
(Tasten-Shells, Painter, Layout-Logik), ist aber ein **eigener Screen**. Das
normale Keypad bleibt unangetastet — die Store-Screenshots bleiben gültig.

Leitidee (seit dem Farb-Umbau **entkoppelt**): zwei unabhängige Achsen statt
einer Welt-Kopplung — alle vier Kombinationen sind gültig.

- **Einheitensystem** (imperial ↔ metrisch): converter-lokal über die
  met/imp-Tasten in der Equals-Reihe. Imperiale Masse bleiben die
  12-freundlichen (12 in = 1 ft = „10" dozenal).
- **Zahlbasis** (12 ↔ 10): global über die Settings-Zeile „Zahlensystem"
  (gilt für beide Rechner; `ConverterState.setBase` synct werterhaltend).
- **Farbcode** („eine Farbe pro Welt, ein Träger pro Achse"): Grün =
  Zehner-Welt (metrisch, dezimal), Violett = Zwölfer-Welt (imperial,
  dozenal). Einheitensymbole tragen die System-Farbe, das DOZ/DEZ-Badge die
  Basis-Farbe, Ziffern bleiben neutral, die `{ }`-Klammer leuchtet in der
  Farbe der Welt, die sie zeigt. Blau bleibt exklusiv den Funktions-Glyphen.

> **Inzwischen umgesetzt:** der separate Edelmetall-/Währungsrechner
> existiert als **Werterechner** (Pager-Seite 3, `docs/asset-converter.md`),
> und `conversions_page.dart` ist zur **Einheitentheorie**-Seite ausgebaut
> (Tab-Layout, Prosa aus `lib/theory/unit_theory.dart`).

## 2. Zugang

Der Umrechner ist **Seite 2 des Rechner-PageView**: Die Taste rechts vom Gleichbalken
führt zum nächsten Rechner, vom letzten wieder zum ersten, Wischen ist
abgeschaltet. Die Menütaste liegt auf allen Rechnern links vom Gleichbalken.
Beim App-Start zeigt das Display immer den Hauptrechner. Einen Listen-Eintrag als
Zugang gibt es nicht, das Handbuch „Bedienung des Einheitenrechners"
(sechs Kapitel, `converterManualChapters` in `lib/manual/`) erklärt
Wechsel und Bedienung. Der `ConverterState` lebt im Calc-Scaffold,
Eingaben überleben also Seitenwechsel in beide Richtungen.

### Resultat-Brücke (Ans ↔ CONV)

Werte wandern per Taste zwischen den Rechnern (immer als Zahl, formatiert
in der Basis der Zielseite):

- **Ans** (Umrechner, Set 6): zieht das letzte Resultat des Hauptrechners
  als Pending-Zahl (negativ → −-Operator armiert). Grau, solange drüben
  kein lebendes Resultat liegt.
- **CONV** (Hauptrechner, Set-10-Slot): fügt die Zahl der
  Umrechner-Ergebniszeile (in der `=`-gezykelten Einheit; Breakdown →
  Arbeits-Einheit) als Ziffern an der Cursor-Position ein. Grau erst, wenn
  Umrechner und Werterechner beide nichts liefern.
Damit „Ans → Kategorie → Magnitude" funktioniert, überlebt die
Pending-Zahl den Kategorienwechsel (nur Terme werden verworfen).

## 3. Tastenbelegung

Nur die markierten Spalten ändern sich gegenüber dem Hauptrechner; alles
andere (Ziffern, Set 1/2, System-Reihe, Set 6/7, Set 10) bleibt identisch.

### Hauptansicht

```text
Set1    Set2     Set3 (Kategorien)   Set4 (Kategorien)
 +      a⊕b      count               weight
 −      xⁿ       dist                time
 ×      ⁿ√       area                angle
 ÷      log      space               price
```

### Overlay (Expand)

```text
Set6    Set7     Set8 (Kategorien)   Set9 (Kategorien)
 STO    π        temp                power
 RCL    e        press               cook
 MC     φ        force               liquid
 ANS    √2       work                moment
```

- **Set 6 (STO/RCL/MC/ANS)** und **Set 7 (π/e/φ/√2)**: **alle verdrahtet** —
  ANS = Resultat-Brücke zum Hauptrechner (siehe §2); STO speichert den
  Ergebniszeilen-Wert — ohne Terme die getippte Eingabe — ins
  converter-lokale Register (überlebt AC), RCL und die Konstanten
  ERSETZEN das Skalar-Segment am Caret durch ihren Wert (nie Splicing in
  halbgetippte Zahlen). Nur Drg bleibt inert (keine Winkelfunktionen).
- **Set 2 (⊕/xⁿ/ⁿ√/log)**: verdrahtet als Skalar-Entry-Operatoren
  (siehe §4a).
- **Set 10:** Doz/Dez sind **entfernt** (Basis = globale Einstellung, System
  = met/imp-Tasten in der Equals-Reihe, siehe §7); die Slots bleiben leer,
  Drg (inert) und Close behalten ihre Plätze.
- **Equals-Reihe:** Menü | `met` (grün) | `=` | `imp` (violett) | Wechsel — die
  System-Tasten flankieren die Gleichtaste, die aktive trägt einen Eigenfarb-Rahmen.
- **Beschriftung:** Text-Labels (`dist`, `area`, …), keine custom-Glyphen.

## 4. Interaktionsmodell

**Zustand A — Kategorie-Auswahl (Ruhe).** Alle 8 Kategorietasten sichtbar.

**Zustand B — Einheit aktiv.** Tipp auf eine Kategorie (z. B. `dist`):

- die anderen 7 Kategorietasten verschwinden, `dist` bleibt auf seinem Platz
  (**goldig umrandet** = aktiv),
- die **Magnitudentasten** der Kategorie erscheinen — im aktiven
  Einheitensystem (imp → imperiale Leiter, met → metrische Leiter): zuerst
  die Gegenspalte (4 Slots), bei Überlauf zusätzlich die frei gewordenen
  Slots rund um die aktive Taste (bis zu 3) → **max. 7 Magnituden**,
- oben im Display erscheint die aktive Einheit + Klammer.

**Zurück zu A.** Erneuter Tipp auf `dist`: Magnituden weg, Einheit aus dem
Display weg, die 7 Kategorietasten wieder da. `dist` bleibt **goldig umrandet**
(aktive Kategorie gemerkt; `=` funktioniert weiter).

### Eingabe-Einheit & `=`

- **Magnitudentaste** setzt die **Eingabe-Einheit** (was die getippte Zahl
  bedeutet).
- **`=`** schickt das Ergebnis **durch die Magnituden** der aktuellen Welt —
  jeder Druck zeigt dieselbe Grösse in der nächsten Einheit (wrappt am Ende).

### Metrische/imperiale Klammer `{ }`

- Zeigt die gleiche Grösse im **Gegen-System**, **wechselnd** zur gerade
  gezeigten Einheit (Doz: ft → `{m}`, mi → `{km}`; Dez: m → `{ft}`, km → `{mi}`).
- Erscheint in **beiden** Display-Zeilen — Eingabe **und** Ausgabe.

### Beispiel (Doz-Welt)

```text
tippe 144            oben: 144
tippe dist           Set4→[in][ft][yd][mi], Set3-frei→[fathom][nmi][league]
tippe ft             oben: 144 ft {43.89 m}     unten: = 48 yd {43.89 m}
tippe =              unten: = 1728 in {4389 cm}
tippe =              unten: = 0.0273 mi {43.89 m}
```

### Beispiel (Dez-Welt, nach Doz→Dez)

```text
Set4→[mm][cm][m][km]
tippe 100  tippe m   oben: 100 m {109.4 yd}     unten: = 0.1 km {0.0621 mi}
```

## 4a. Compound-Eingabe, Operatoren & Breakdown

**Mehrere Magnituden-Terme.** Innerhalb einer aktiven Kategorie baut man eine
Kette: Zahl tippen → Magnitude tippen (committet einen Term „5 ft") → Zahl →
Magnitude („3 in") → … Die Summe ist der laufende Gesamtwert (intern SI).

**Term-Operatoren (+ und −):**

- Intern hat jede Lücke einen Operator, Default **+**.
- **+ wird nicht angezeigt, wenn die benachbarten Magnituden verschieden sind**
  (`5 ft 3 in`).
- Bei **gleicher** Magnitude nebeneinander wird der Operator angezeigt, sonst
  mehrdeutig (`3 h + 2 h` / `3 h − 2 h`).
- **−** wird immer angezeigt (auch zwischen verschiedenen Magnituden:
  `5 ft − 3 in`).

**Skalar-Operatoren (× und ÷, nachgerüstet):** Eine Grösse mal/geteilt durch
eine **einheitslose Zahl** bleibt in ihrer Kategorie — deshalb leben × ÷ in
der Pending-Eingabe, nicht auf Term-Ebene:

- `3 × 2` → `ft` committet 6 ft; Auswertung strikt links-nach-rechts beim
  Magnituden-Tipp (`parseScalarEntry`), hängender Operator wird toleriert.
- Auf einem committeten Compound kollabiert der erste ×/÷-Druck das Ganze
  in editierbare Ziffern (Gesamtwert in der Arbeits-Einheit, gleiches Idiom
  wie der Welt-Wechsel): `5 ft 3 in` → `×` → `53×` (doz) → `2` → `in`.
- Dezimalpunkt-Guard pro Segment (`1.6×0.6` ist gültig); Basis-Wechsel
  reformatiert segmentweise; die Operator-Tasten sind **immer aktiv**
  (auf leerer Eingabe stiller No-op — das frühere `canScalarOp`-Gating
  wurde verworfen, Grau liest sich als „nicht verdrahtet").
- Damit ist **ganz Set 1** aktiv.

**`=`-Ausgaben.** `=` durchläuft die Ergebnis-Ansichten und wrappt:

1. der Gesamtwert in **je einer Einheit** der Leiter (wie bisher), dann
2. (nur imperiale/Doz-Welt, nur Kategorien mit Kaskade) der **Breakdown**:
   höchste volle Zahl je Magnitude, grösste zuerst, Rest kaskadiert
   (`1 yd 2 ft 5 in`). Metrische Welt: kein Breakdown (Dezimalzahl).

**Breakdown-Kaskaden (imperial):**

| Kategorie | gross → klein |
|---|---|
| dist | mi, yd, ft, in |
| weight | ton, cwt, st, lb, oz |
| liquid | gallon, quart, pint, gill, fl oz |
| count | ggr, gr, dz, items |
| time | week, d, h, min, s |
| angle | °, ′, ″ |
| price | £, sh, d |
| area | sq mi, acre, sq yd, sq ft, sq in |
| space | cu yd, cu ft, cu in |
| temp · press · force · work · power · moment | kein Breakdown |

**Sonderfall temp (affin).** Temperaturen darf man nicht summieren → temp
bleibt **einterm** (jede Magnitude ersetzt den Term), kein Breakdown.

> `space` ist damit rein kubisch (cu in/ft/yd · cm³/m³); die Flüssigmasse leben
> in `liquid`. (Vorher hatte `space` auch fl oz/pint/… — entfernt.)

## 5. Architektur (SI als Drehscheibe)

Jede Eingabe wird in eine **SI-Grösse** umgerechnet und gespeichert. Jede
Magnitude trägt einen **Faktor zu SI**. Umrechnung innerhalb der Leiter =
durch Ziel-Faktor teilen. Klammer = SI-Wert, gerendert in der **Partner-
Einheit** des Gegen-Systems. Damit ist die Logik für 15 der 16 Kategorien
rein multiplikativ; Sonderfall: **temp** (affin, Offset). `count` ist dimensionslos (Sonder-„Welt", siehe unten).

Jede Kategorie definiert also: eine **imperiale Leiter** (Doz) und eine
**metrische Leiter** (Dez), beide über SI gekoppelt; pro Einheit eine
**Partner-Einheit** für die Klammer.

## 6. Die 16 Kategorien

**Einheiten = US-Varianten.** Reihenfolge = Anzeige-Reihenfolge.
Faktoren bei der Umsetzung per Test verifiziert. ⚠️ = noch offene
Design-Entscheidung.

### Hauptansicht

**count** — Zählen *(dimensionslos; Dutzend- ↔ Dezimal-Gruppierung)*

- Doz: items·1, dz·12, gr·144, ggr·1728  (in Basis-12-Ziffern)
- Dez: ones·1, ten·10, hundred·100, thousand·1000  (in Basis-10-Ziffern)
- Klammer zeigt denselben Gesamt-Count im Gegen-System → macht „10 doz = 12 dez"
  sichtbar (`1 dz {12}`, `1 gr {144}`).

**dist** — Länge (SI: m)

- Doz: in·0.0254 {cm}, ft·0.3048 {m}, yd·0.9144 {m}, mi·1609.344 {km},
  fathom·1.8288 {m}, nmi·1852 {km}, league·4828.032 {km}
- Dez: mm·0.001 {in}, cm·0.01 {in}, m·1 {ft}, km·1000 {mi}

**area** — Fläche (SI: m²)

- Doz: sq in·0.00064516 {cm²}, sq ft·0.09290304 {m²}, sq yd·0.83612736 {m²},
  acre·4046.8564 {ha}, sq mi·2589988.11 {km²}
- Dez: cm²·0.0001 {sq in}, m²·1 {sq ft}, ha·10000 {acre}, km²·1e6 {sq mi}

**space** — Kubikvolumen (SI: L) — rein geometrisch (Flüssigmasse: siehe `liquid`)

- Doz: cu in·0.016387064, cu ft·28.316846592, cu yd·764.554857984
- Dez: cm³·0.001, m³·1000

**weight** — Masse (SI: kg) — US + Troy

- Doz: oz·0.0283495 {g}, lb·0.45359237 {kg}, st·6.35029 {kg},
  cwt·45.359237 {kg} (US short), ton·907.18474 {t} (US short),
  oz t (Feinunze)·0.0311035 {g}
- Dez: g·0.001 {oz}, kg·1 {lb}, t·1000 {ton}

**time** — Zeit (SI: s) *(einsystemig; demonstriert die Ziffernbasis)*

- Leiter (beide Welten gleich): s·1, min·60, h·3600, d·86400, week·604800
- Keine imperial/metrisch-Trennung. Doz/Dez wechselt nur die **Ziffernbasis**;
  die `{ }`-Klammer zeigt denselben Wert in der *anderen* Basis — so wird
  sichtbar, dass `A h {10 h}` und `B h {11 h}` (10/11 Uhr) dozenal nur **ein**
  Zeichen brauchen.

**angle** — Winkel (SI: rad)

- Doz: °·(π/180) {gon}, ′·(π/10800) {gon}, ″·(π/648000) {gon},
  sign·(π/6) {gon}, turn·2π {gon}
- Dez: gon·(π/200) {°}, rad·1 {°}

**price** — Währung (historisch £sd ↔ dezimal)

- Doz: d·1 {£dez}, sh·12 {£dez}, £·240 {£dez}, guinea·252 {£dez} (Basis: Pence)
- Dez: p (Dezimalpenny)·1 {£sd}, £·100 {£sd} (Basis: Dezimalpenny)
- Klammer rechnet £sd ↔ dezimales £ um.

### Overlay

**temp** — Temperatur (SI: K) — *affin*

- Doz: °F (K=(°F+459.67)·5/9) {°C}, °R (K=°R·5/9) {°C}
- Dez: °C (K=°C+273.15) {°F}, K {°F}

**press** — Druck (SI: Pa)

- Doz: psi·6894.757 {bar}, inHg·3386.39 {bar}
- Dez: Pa·1 {psi}, kPa·1000 {psi}, bar·100000 {psi}, atm·101325 {psi},
  mmHg·133.322 {psi}

**force** — Kraft (SI: N)

- Doz: lbf·4.448222 {N}, pdl (poundal)·0.138255 {N}
- Dez: N·1 {lbf}, kN·1000 {lbf}, kgf·9.80665 {lbf}, dyn·1e-5 {lbf}

**work** — Energie (SI: J)

- Doz: BTU·1055.056 {kJ}, ft·lbf·1.355818 {J}
- Dez: J·1 {ft·lbf}, kJ·1000 {BTU}, Wh·3600 {BTU}, kWh·3.6e6 {BTU},
  cal·4.184 {ft·lbf}, kcal·4184 {BTU}

**power** — Leistung (SI: W)

- Doz: hp·745.6999 {kW}, BTU/h·0.2930711 {W}
- Dez: W·1 {hp}, kW·1000 {hp}, PS·735.49875 {hp}

**cook** — Küchenmasse (SI: mL) — US customary

- Doz: tsp·4.92892 {mL}, tbsp·14.7868 {mL}, fl oz·29.5735 {mL},
  cup·236.588 {mL}, pint·473.176 {mL}
- Dez: mL·1 {tsp}, L·1000 {cup}

**liquid** — Flüssigvolumen (SI: L) — US-Flüssigmasse (getrennt von `space`
Kubik-Volumen und `cook` Rezeptmassen)

- Doz: fl oz·0.0295735 {mL}, gill·0.118294 {mL}, pint·0.473176 {mL},
  quart·0.946353 {L}, gallon·3.785412 {L}
- Dez: mL·0.001 {fl oz}, L·1 {quart}

**moment** — Drehmoment (SI: N·m)

- Doz: lbf·ft·1.355818 {N·m}, lbf·in·0.1129848 {N·m}
- Dez: N·m·1 {lbf·ft}, kN·m·1000 {lbf·ft}, kgf·m·9.80665 {lbf·ft}

## 7. Doz/Dez-Verhalten (Welt-Umschalter)

> **Überholt durch die Basis/System-Entkopplung** (siehe §1/§2): Die feste
> Kopplung „ein Toggle für beides" erwies sich als zu grosser Einschnitt —
> wer dozenal rechnen will, war auf imperiale Einheiten festgelegt.

Heutiges Verhalten, zwei getrennte Schalter:

1. **met/imp (Equals-Reihe)** schaltet NUR das Einheitensystem: imperiale ↔
   metrische Leiter (Magnitudentasten wechseln), Klammer-Richtung dreht
   mit. Der gezeigte Wert wird **physikalisch erhalten** und in die
   Partner-Einheit überführt (`144 ft` → `43.89 m`), nicht die Ziffer
   reinterpretiert.
2. **Einstellungen → Zahlensystem** schaltet NUR die Ziffernbasis (12 ↔ 10,
   beide Rechner, inkl. Klammer-Zahlen); `setBase` formatiert die
   Pending-Eingabe werterhaltend um. A/B-Ziffern folgen der Basis, der
   Breakdown dem System.

**Klammer-Partner (lineare Kategorien):** die magnitudennächste Einheit des Gegen-Systems (kleinste
`|ln(faktor) − ln(faktor_gezeigt)|`). Sonderfälle: temp °F↔°C, price £sd↔£dez, count Basis↔Basis, time Basis-Swap.

## 8. Offene Ideen (TODO)

Gesammelte Verbesserungswünsche, noch nicht umgesetzt:

- [ ] **`=`-Zyklus über beide Welten.** Die Gleichtaste soll die Ausgabe
      nicht nur durch die Einheiten der aktiven Welt (+ Breakdown) schicken,
      sondern welt-übergreifend durch die **imperialen UND metrischen**
      Einheiten zyklen. **Wichtig: unabhängig davon, ob gerade Doz oder Dez
      ausgewählt ist** — die Welt-Auswahl (Doz/Dez) beeinflusst den
      `=`-Zyklus nicht; in beiden Fällen werden beide Einheitenleitern
      durchlaufen. (Aktuell: nur aktive Welt + Breakdown; vgl. Abschnitt
      „Eingabe-Einheit & `=`".)
- [x] **Sanftere Einzel-Einheit-Umrandung.** Die volle Gold-Umrandung der
      aktiven **Kategorie** (Überbegriff) bleibt; die ausgewählte **Einzel-
      Einheit** (Magnitude) bekommt jetzt einen schwächeren Rahmen — gleiches
      Gold, geringere Deckkraft (`_kGoldSoft = 0x66FFD700`) und 1.5 statt 2 px.
      Umgesetzt in `converter_keypad.dart` (`_magnitudeCell` → `softGold`).
