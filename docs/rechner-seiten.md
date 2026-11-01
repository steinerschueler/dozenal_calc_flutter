# Rechner-Seiten

Verweise wie «oben» oder «siehe …-Abschnitt» meinen die Themenseiten, die
[architektur.md](architektur.md) auflistet.

## Einheitenrechner (zweiter Rechner-Modus)

Vollständiger Umrechner, **Seite 2 eines horizontalen PageView** im
`_CalcScaffold`. Die Taste rechts vom Gleichbalken (`Icons.swap_horiz`, `_showNextCalculator`) führt
zum nächsten Rechner, vom letzten wieder zum ersten; links vom Gleichbalken liegt
die Menütaste (`Icons.menu`). Wischen ist abgeschaltet
(`NeverScrollableScrollPhysics`): Ein leicht bewegter Finger liess sonst die Seite
rutschen und verschluckte den Tipp. Beim Start zeigt die App immer den
Hauptrechner. Einen Listen-Eintrag als Zugang gibt es nicht, das Kapitel „Der
zweite Rechner" im Einheitenrechner-Handbuch erklärt den Wechsel. Der
einbettbare Inhalt ist `ConverterBody`
(`converter_page.dart`); `ConverterPage` bleibt als Route-Wrapper für
Tests/Preview mit eigenem, brückenlosem State. Im Pager besitzt
`_CalcScaffoldState` den langlebigen `ConverterState` — Eingaben überleben
Seitenwechsel.

**Page-Peek-Indikator** (zeigt, auf welcher Seite man steht): ein dezenter
**Punkte-Indikator** unten mittig — drei Punkte (einer pro Seite,
`textMuted`) auf einem durchscheinenden Pill, darüber der Name der
ankommenden Seite (13 pt `textSecondary`; `pagerLabelMain`/
`infoListConverterEntry`/`pagerLabelAsset` ×14). Bewusst ohne Gold und
ohne Karten-Optik. Der Indikator **gleitet live mit dem Pager**: ein
`AnimatedBuilder` am `PageController` zeichnet den aktiven Punkt
(`textPrimary`) an der kontinuierlichen `page`-Position (eine
Seitenbreite = ein Punkt-Pitch), die drei Seitennamen liegen gestapelt
und blenden per Alpha von der verlassenen zur ankommenden Seite über
(stabile Pill-Grösse, keine Layout-Sprünge). Der Puls läuft über einen
Controller-Listener (`_onPagerScroll`): jede Bewegung hält den Peek am
Leben, der Hide-Timer zählt erst ab Stillstand; `_pulsePagePeek` ist
Build-Phasen-sicher (Scroll-Callbacks können während des Layouts
eintreffen → `SchedulerPhase`-Check + Post-Frame-Fallback) und setStatet
nur beim Mounten, nicht pro Scroll-Tick. Puls bei jedem Landen (Boot, Intro-Schluss,
Rückkehr aus dem Menü) und bei jedem Seitenwechsel
(`_pulsePagePeek` in `_CalcScaffoldState`): 160 ms Fade-in, ~1050 ms Halt,
420 ms Fade-out. `IgnorePointer` + `ExcludeSemantics`, und nach dem
Ausblenden wird das Overlay komplett **unmounted** (`_pagePeekMounted`),
damit keine unsichtbaren Flächen für Hit-Tests/Semantics/Test-Finder
zurückbleiben — Widget-Tests, die Listen-Einträge wie „Einheitenrechner"
per `find.text` antippen, müssen den Puls vorher ausklingen lassen
(`flushPagePeek`-Helper in `calc_pager_test.dart`).
Vollständige Spezifikation + Implementierungs-Fortschritt:
[`docs/unit-converter.md`](unit-converter.md).

**Resultat-Brücke (Ans ↔ CONV):** jeder Rechner kann das aktuelle Resultat
des anderen per Taste ziehen. Werte reisen als `double`
(Provider-Callbacks, verdrahtet in `_CalcScaffoldState.initState`); jede
Seite formatiert in ihrer eigenen aktiven Basis:

- **Umrechner-Ans** (Set 6, vorher inert): `ConverterState.insertCalcAns()`
  ersetzt die Pending-Zahl durch `DozenalCalcState.ansForBridge`
  (= `lastResultF64`, nur bei lebendem fehlerfreiem Resultat non-null) in
  Weltbasis; negative Werte armieren den −-Operator (Vorzeichen leben im
  Umrechner auf den Term-Lücken, nie in den Ziffern). Ausgegraut über
  `calcAnsAvailable`.
- **Hauptrechner-CONV** (`ConvAns`-Token, füllt den freien Set-10-Slot):
  fügt `ConverterState.ansForBridge` (die Zahl der Ergebnis-Zeile in der
  `=`-gezykelten Einheit; in der Breakdown-Ansicht der Gesamtwert in der
  Arbeits-Einheit) als Ziffern-Tokens via `formatF64Result` ein — das
  display-only `Negate` wird beim Einfügen zu unärem `Sub`, damit das
  Literal auf beiden Auswertungs-Schienen exakt bleibt. Im Fehlerzustand
  blockiert (`_isErrorBlocked` wie Ans/Rcl), nach `=` startet es einen
  frischen Ausdruck. Seit der Asset-Brücke ist CONV eine
  **Langdruck-Host-Taste**: Tap zieht den Umrechner und fällt auf den
  Werterechner-Wert zurück, wenn der Umrechner leer ist; die
  Popup-Option **VAL** (`AssetAns`-Token) zieht den Asset-Wert
  explizit. Ausgegraut erst, wenn KEINER der beiden Zweitrechner etwas
  liefert (`_isTokenDisabled` liest `convAnsValue` UND `assetAnsValue`
  — Disabled-Gating allein auf dem Umrechner würde auch den Langdruck
  töten, disabled Tasten hosten kein Popup). Wertlose Brücken-Tasten
  sind komplette No-ops (Guard in `handleClick`), damit ein
  VAL-Tipp ohne Asset-Wert den After-Equals-Zustand nicht konsumiert.
Damit der Brücken-Flow „Ans → Kategorie → Magnitude" funktioniert,
**überlebt die Pending-Zahl in `tapCategory` den Kategorienwechsel**
(sie ist einheitenlos; nur committete Terme werden verworfen).

**Physische Tastatur im Pager:** `_handleKey` routet nach aktiver Seite —
auf Seite 1 mappt `_handleConverterKey`
Ziffern/Punkt/+/−/×/÷/^/=/Del/AC/Pfeile auf die Converter-Handler
(Skalar-Operatoren via `inputScalarOp`, Pfeile via `moveCaretLeft/Right`,
zerstörungsfrei an den Rändern), auf Seite 2 analog `_handleAssetKey`;
alles andere wird geschluckt, damit kein Tastendruck unsichtbar den
verdeckten Hauptrechner editiert.

**Basis ⊗ System:** zwei unabhängige Achsen, alle **vier** Kombinationen
gültig:

- **Einheitensystem** (imperial ↔ metrisch): converter-lokal, über die zwei
  **runden System-Tasten in der Equals-Reihe** — die Reihe lautet
  [Menü · `met` (grün) · `=` · `imp` (violett) · Wechsel]; Kreisform +
  `pagerFill`, die aktive trägt einen 2-dp-Eigenfarb-Ring. Die Doz/Dez-Slots
  des Umrechner-Overlays bleiben leer, Drg/Close behalten ihre Plätze.
  `setWorld` kollabiert Terme werterhaltend zur Partner-Einheit.
- **Zahlbasis** (12 ↔ 10): global — die Settings-Zeile „Zahlensystem" wirkt
  auf BEIDE Rechner. Der Scaffold spiegelt `DozenalCalcState.activeBase` per
  Listener in `ConverterState.setBase` (werterhaltend: Pending-Ziffern
  werden umformatiert, Terme speichern Doubles). A/B-Tasten-Gating folgt
  der Basis, Breakdown-Verfügbarkeit dem System (imperial).
Intern läuft alles über eine **SI-Drehscheibe**; die `{ }`-Klammer zeigt das
Gegen-System (Zeit-Kategorie: die Gegen-Basis).

**Farbsystem „eine Farbe pro Welt, ein Träger pro Achse"** (Palette-Slots
`worldTen`/`worldTwelve` in `app_theme.dart`): **Grün = Zehner-Welt**
(metrische Einheiten UND Basis 10), **Violett = Zwölfer-Welt** (imperiale
Einheiten UND Basis 12) — bewusst NICHT das Op-Blau, das den
Funktions-Glyphen gehört. Träger trennen die Achsen: **Einheitensymbole**
tragen die System-Farbe (Eingabe-, Ergebnis- und Breakdown-Zeile, via
`unitRanges`-Char-Ranges in `ConverterLine`/`_InputLayout` — derselbe
Monospace-String, nur Span-Farben, Caret/Tap-Geometrie unverändert);
das **DOZ/DEZ-Badge** trägt die Basis-Farbe (beide Displays); **Ziffern und
Operatoren bleiben neutral weiss**; die **`{ }`-Klammer leuchtet gedimmt
(α 0.85) in der Farbe der Welt, die sie zeigt** (`bracketTenWorld` in
`ConverterLine`; Hauptrechner: Gegen-Basis-Farbe für `{…}`). Das pauschale
Ergebniszeilen-Grün des Umrechners ist gewichen (Wert weiss, `=` neutral) —
Grün-auf-Inhalt heisst jetzt eindeutig Zehner-Welt, Grün-auf-Aktions-Glyph
(=-Taste) bleibt „auswerten". `formatBaseNum` snappt seit diesem Umbau
Near-Integer-f64-Rauschen (SI-Roundtrip `14 ft` → 13.999…) wie
`formatF64Result`, sonst rendert `12 ft` als `11.BBBBBB`.

- `lib/logic/unit_data.dart` — reine Daten: 16 Kategorien (`UnitCategory`),
  je imperiale + metrische Leiter, SI-Faktoren, `breakdown`-Kaskaden (imperial),
  `affine`-Flag (temp). Keine Flutter-Imports.
- `lib/logic/unit_convert.dart` — `convert`, `bracketPartner`/`bracketValue`
  (Klammer), `breakdown` (mixed-radix), `nextInLadder`.
- `lib/logic/base_num.dart` — `parseBaseNum`/`formatBaseNum` (Basis 10/12).
- `lib/converter_state.dart` — `ConverterState extends ChangeNotifier`:
  Compound-Eingabe als Term-Liste, Operatoren (+ implizit / − explizit),
  Gesamtwert, `=`-Zyklus (Einheiten + Breakdown), Welt-Wechsel werterhaltend,
  Edit-Cursor (Caret in der getippten Zahl + Term-Grenzen).
- `lib/converter_keypad.dart` — Portrait (`_buildColumn`, drei Höhen-Regime
  wie `_HochKeypad`) + Breit (`_buildBreit`, alle Sets inline). Set 3/4 + 8/9
  sind Kategorien; Tipp expandiert die Magnituden-Leiter in die Gegenspalte
  (+ frei werdende Slots). Der Keypad ist **voll verdrahtet** bis auf Drg
  (inert — keine Winkelfunktionen im Umrechner):
  - **Skalar-Operatoren × ÷ ⊕ ^ √ ㏒** (Set 1 + Set 2, **immer aktiv** —
    Grau liest sich als „nicht verdrahtet"; auf komplett leerer Eingabe
    sind sie ein stiller No-op): erweitern die Pending-Eingabe zu einem
    links-nach-rechts-Ausdruck (`3×2`, KEIN Vorrang — laufende Eingabe),
    ausgewertet beim Magnituden-Commit via `parseScalarEntry` in
    `base_num.dart`. Binär-Konventionen wie im Hauptrechner: linker
    Operand = Wurzelgrad/Log-Basis (`2√9`=3, `2㏒8`=3), ⊕ = a·b/(a+b).
    Ein Zeichen pro Tastendruck (㏒ = U+33D2), damit Caret/Del
    zeichenweise stimmen. Auf einem committeten Compound kollabiert der
    erste Operator-Druck das Ganze in editierbare Ziffern (Gesamtwert in
    der Arbeits-Einheit — gleiches Idiom wie der Welt-Wechsel), sodass
    `3 ft × 2` und `3 × 2 ft` beide funktionieren. Dezimal-Guard pro
    Segment; `setBase` reformatiert segmentweise (`reformatScalarEntry`).
  - **Wert-Tasten** (Konstanten π/e/φ/√2 aus Set 7, dazu RCL und **Ans** aus Set 6 =
    Resultat-Brücke): **ersetzen das Skalar-Segment am Caret** durch ihre
    Ziffern (`insertValueEntry`; leeres Segment = einfaches Einfügen, nie
    Splicing in halbgetippte Zahlen). Dadurch praktisch immer aktiv —
    Konstanten bedingungslos, Ans sobald drüben ein Resultat liegt, RCL
    sobald das Register gefüllt ist. Negative Werte nur, wenn die
    Ersetzung die GANZE Eingabe abdeckt (Vorzeichen lebt auf der
    Term-Lücke, durch ^/√/㏒ nicht faktorisierbar; sonst No-op).
  - **Speicher** (Set 6): STO speichert den Ergebniszeilen-Wert
    (`ansForBridge`) — ohne committete Terme den Wert der **getippten
    Eingabe** („speichere, was ich getippt habe"); MC löscht. Register ist
    in-memory, überlebt AC und Kategorienwechsel (wie der
    Hauptrechner-Speicher). Feedback über die dynamischen Aktiv-Zustände
    (RCL/MC grau = Register leer) statt eines M-Badges.
- `lib/converter_display.dart` — zweizeilig, Ausdruck + `{ }`-Klammer, plus
  custom-paint **Caret** (rote Linie) mit Tap-Hit-Testing auf der Eingabezeile.
  Ziffern folgen dem **geteilten** „Ziffern im Display"-Pref
  (`GlyphStyleScope.styleOf`, dieselbe Quelle wie das Hauptdisplay): custom =
  Dozenal-Glyphen, gezeichnet als Overlay über unsichtbar gesetzte
  Ziffernzellen (die Monospace-`TextPainter`-Geometrie bleibt erhalten, damit
  Caret + Tap exakt bleiben), conventional = ASCII (`A`/`B` für 10/11).
  Einheiten-Symbole, Operatoren, Punkt und `{ }`-Klammer bleiben immer Text.
- Kategorie-Labels lokalisiert (`unitCat*`, 14 Sprachen); Einheiten-Symbole
  (`ft`, `kg`, …) bleiben international.

**Glyphen-Stil geteilt, Basis auch:** Display (`styleOf`) und Keypad
(`keypadStyleOf`) des Umrechners teilen die beiden Settings-Glyphen-Prefs mit
dem Hauptrechner, und seit der Basis/System-Entkopplung gilt auch die
Settings-**Zahlensystem**-Zeile für beide Rechner (Sync siehe oben). Nur das
**Einheitensystem** bleibt converter-lokal (met/imp-Tasten).

`conversions_page.dart` ist die **Einheitentheorie**-Seite (siehe
Sekundärseiten im Info-Modal-Abschnitt), erreichbar über die Theorie-Expansion.

**Tipp-Cursor (beide Rechner):** Tippen auf die Eingabezeile positioniert den
Bearbeitungs-Cursor (die rote Linie). Hauptrechner: `TwoLineDisplay`
(`inputCursorPosForTap` + `GestureDetector`) → `DozenalCalcState.moveCursorTo`.
Umrechner: `converter_display` Caret-Hit-Test → `ConverterState.handleInputTapAtChar`.

## Werterechner (dritter Rechner-Modus): Edelmetalle & Währungen

Nutzer-sichtbarer Name **„Werterechner"** (`pagerLabelAsset`); interner Code-/
Dateinamensraum bleibt `asset`. **Seite 3 des Pagers** (zweimal die Wechseltaste vom Hauptrechner),
im Design des Einheitenrechners,
aber mit **drei** Hierarchien: **Klasse → Gattung → Einheit** (Edelmetall →
Gold → gr/dwt/oz t/lb t bzw. g/kg; Währung → GBP → £/sh/d). **Phase 1** =
exakte Umrechnung (Troy-Gewichte metallunabhängig — die
avoirdupois-Einheiten oz/lb wurden bewusst gestrichen, Gold kauft man
nicht im avdp-Pfund; Währungs-Stückelungen wie £sd).
**Phase 2 (Werte/Kurse)** ist umgesetzt (Wertmodus + Zielwährungs-Picker, grober
datierter Snapshot + Kurs-Editor) und **Phase 3 (historische Preiskurve)**
ebenso („Kurve"-Taste ersetzt das Keypad durch einen Pan/Zoom-Custom-Paint-
Chart — Gold/Silber/Weizen, Antike→heute, kuratierter belegter Datensatz).
Dazu zwei Doku-Deliverables im Info-Modal: das Werterechner-Handbuch
(`assetManualChapters`, 6 Kapitel) und der Wertetheorie-Block
(`werteTheoryBlock`, 27 Kapitel) — beide ×14 Sprachen.
Vollständige Spezifikation + Roadmap:
[`docs/asset-converter.md`](asset-converter.md).

- `lib/logic/asset_data.dart` — reine Daten, **wiederverwendet `Unit`/`UnitWorld`**
  (jeder v1-Faktor ist „Tier 1", exaktes Vielfaches; Anker grain = 0,06479891 g →
  1 troy oz = 31,1034768 g, 12 troy oz = 1 troy lb). Vier Metalle teilen **eine**
  Gewichtsleiter; sieben Währungen mit eigenen Stückelungen (`singleWorld`).
- `lib/logic/asset_convert.dart` — `assetNextInLadder`/`assetBracketPartner`/
  `assetBreakdown` (Floor-Epsilon gegen f64-Undershoot), `convert` reexportiert.
- `lib/asset_state.dart` — `AssetState`, eng an `ConverterState` (Compound-Terme,
  Skalar-Ops, Cursor, `=`-Zyklus, `setBase`); zusätzlich `drillLevel`
  (`tapClass`/`tapGenus`/`tapMagnitude`, Tipp auf aktiven Header = zurück;
  die Pending-Zahl überlebt `tapClass`, nur Terme werden verworfen).
  **Kein `setWorld` mehr:** die Arbeits-Welt folgt der committeten Einheit
  (`tapMagnitude` setzt `_world = unit.world`); `worldToggleEnabled`
  steuert nur noch den Farbton der Einheitensymbole im Display
  (Währungen pinnen auf Zwölfer-Violett). Eigenes **Speicherregister**
  `memStore`/`memRecall`/`memClear` (in-memory, überlebt AC).
  Liefert `topLine`/`resultLine` als **`ConverterLine`** → `ConverterDisplay`
  unverändert wiederverwendet. Bridge-Felder (`calcAnsProvider`/
  `ansForBridge`) sind seit der Brücken-Verdrahtung live — siehe unten.
- `lib/asset_keypad.dart` — eigener Widget-Baum aus den geteilten
  `keypad_parts.dart`-Bausteinen, **ohne Overlay** (jede Taste liegt auf
  einer Fläche): die zwei rechten Tile-Spalten (8 Zellen) sind der
  3-Ebenen-Navigator, auf der Einheiten-Ebene liegen **beide
  Einheitensysteme gleichzeitig** nebeneinander (imperial/Troy Spalte A,
  metrisch Spalte B — keine met/imp-Tasten). Auf der Klassen-Ebene
  füllt der Speicher (STO/RCL/MC/Ans) das Set 3 und weicht nach
  Klassenwahl den Gattungen. System-Reihe ist [AC · Del · `.` · Wert];
  die Equals-Reihe lautet [Menü · „Kurve" · `=` · „Kurse" · Wechsel], „Kurve"
  und „Kurse" sind runde `_RoundKey`-Tasten. `lib/asset_page.dart` (`AssetBody`/`AssetPage`),
  Labels in `lib/asset_labels.dart` (Währungs-Tiles = ISO-Code).
- Verdrahtung in `main.dart`: `_assetState` + `_rateStore` im
  `_CalcScaffoldState`, drittes PageView-Kind, `_pagerProgress` clampt `[0,2]`,
  `_PagePeekOverlay` mit drei Punkten, `_handleAssetKey` für physische
  Tasten auf Seite 2, Basis-Sync via `_assetState.setBase`. Die **Asset↔Hauptrechner-Brücke ist
  verdrahtet**: die Ans-Taste im Drill zieht das Rechner-Resultat
  (`_assetState.calcAnsProvider`), der Hauptrechner erreicht den
  Asset-Wert über CONV (Tap-Fallback bei leerem Umrechner) bzw. dessen
  Langdruck-Option VAL (`_state.assetAnsProvider`) — Details im
  Resultat-Brücke-Abschnitt des Einheitenrechners.
- **Phase 2 (Werte/Kurse):** `lib/logic/rate_data.dart` (grober datierter
  Snapshot, Pivot USD), `lib/rate_store.dart` (`RateStore`, SharedPreferences-
  Overrides, pivot-geroutete Konversion), Wertmodus in `asset_state.dart`
  (`drillLevel == valueTargets`, `valueLine` mit „≈"; jede Editier-Aktion
  verlässt den Wertmodus), Kurs-Editor `lib/rates_page.dart`
  (Overrides gold markiert, Reset pro Zeile/global), `resultPrefix` („≈ ") im
  geteilten `converter_display.dart`. **Opt-in-API nur als Doku**
  (`docs/asset-rates-api.md`) — ausgeliefertes Binary netzwerkfrei,
  `legal/privacy-*` unverändert.
- **Kurve:** Der Chart zeigt echte Mengen statt des Index: eine Zeile über dem Plot nennt für den gewählten Punkt
  etwa «2024 · 1 g Gold = 290 L Getreide» samt geschätzter Spanne. Epochen-Chips (Antike, Mittelalter, Neuzeit, Heute,
  Alles) springen zum Zeitraum, Verschieben endet bei den Daten. Unsicherheit steht als Balken am Punkt, nicht mehr als
  Fläche. Der folgende Abschnitt beschreibt die ursprüngliche Index-Fassung, die Theorie-Abbildungen nutzen sie weiter.
- **Phase 3 (historische Preiskurve, gold-bezogene Index-Darstellung):**
  „Kurve"-Taste ersetzt das Keypad per AnimatedSwitcher
  (`AssetState.chartOpen`/`toggleChart`, Schliessen über × im Chart). **Alles
  relativ zu Gold, auf den ältesten Wert indexiert (fette 0-Linie, zentriert):**
  Silber in Gold · Getreide in Gold · Gold in Getreide (= Kehrwert, abgeleitet).
  `lib/logic/price_history.dart` (Modell mit Unsicherheitsband `valueLow/High`,
  `baselineOf`, log10-Index-Viewport, `default`/`fitViewport` 0-zentriert, LTTB,
  Ticks), `lib/logic/price_history_data.dart` (kompilierter belegter Datensatz
  aus zwei Subagenten+Prüfer-Läufen; `kPriceSources`), `lib/price_chart.dart`
  (Custom-Paint + Scale-Recognizer-Pan/Zoom + Fit-Knopf, Faktor-Achsen via
  `formatBaseNum`, Unsicherheitsband um die Antike; Antike = diskrete Ringe,
  Linie nur modern, nie über Lücken), `lib/price_sources_page.dart` (Quellen &
  Methodik). **Kein Netz, keine neue Dependency.**
- ARB (`pagerLabelAsset`, `assetClass*`, `assetGenus*`, `assetValueHint` plus die
  Phase-2-Keys `assetValueKey`/`assetRatesKey`/`assetRates*`/`assetValueNote`):
  **alle 14 Sprachen vollständig übersetzt** (Subagenten-Pipeline).

## Ankunft im Einheiten- und Werterechner

Beim Ankommen übernehmen beide Rechner ein neues Ergebnis des Hauptrechners in die oberste Reihe und ersetzen damit
einen alten Eintrag, die gewählte Kategorie (im Werterechner Klasse und Gattung) bleibt. Dasselbe Ergebnis kommt nie ein zweites Mal: AC bleibt leer,
ein hier getippter Wert überlebt den Blick auf den Hauptrechner. Ist einer der beiden leer, erklärt das Display, dass die
Gleichtaste durch die Magnituden schaltet.
