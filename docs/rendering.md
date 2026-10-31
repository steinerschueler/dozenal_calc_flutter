# Rendering und Keypad

## Rendering

- `glyph_painter.dart` — zwölf benutzerdefinierte Dozenal-Glyphen (kein
  Font: reines `CustomPainter`).
- `token_painter.dart` — Glyphen der Operator-/Funktionstasten. Der
  Text-Fallback skaliert pro Token (`_labelScale`): `.`/`…` 0.55,
  `(`/`)` 0.5, Rest 0.35 — kleine/dünne Glyphen lesbar gross. Die
  Equals-Taste ist seit dem Welt-Farbcode **blau** (Palette-Slot
  `equals` = Op-Blau; Grün gehört der Zehner-Welt). Im Umrechner trägt
  der Gleichbalken zusätzlich einen lokalisierten Hinweis am unteren
  Rand (`equalsHint`-Param, ARB `converterEqualsHint` ×14: „mehrmals
  tippen: nächste Einheit").
- `keypad_parts.dart` — **gemeinsame Bausteine aller drei Keypads** (Haupt,
  Umrechner, Asset-Rechner), damit nichts auseinanderdriftet: `PressableShell`
  (Tasten-Chassis: Press-Flash, Haptik, Rahmen inkl. gold/selected, Langdruck-
  Hooks, 44-dp-Floor), `DigitKeyPainter`/`TokenKeyPainter`, das
  Ziffern-Grid `kDigitGridRows`, die identischen Spalten `kSet1/2/6/7`,
  die Hoch-Höhen-Regime `kKeypadTight-/ScrollThreshold` und — seit dem
  Asset-Rechner — die Tile-Bausteine `LabelButton`/`SystemKey`/
  `showUnitInfoBox` (vorher privat in `converter_keypad.dart`; `SystemKey`
  trägt ein `enabled`-Flag, wird aber seit dem Asset-Keypad-Umbau nur
  noch von den met/imp-Tasten des Umrechners genutzt — der Werterechner
  hat keine System-Tasten mehr). Die Keypads selbst bleiben bewusst
  getrennte Widget-Bäume: gleiche Glyphen, verschiedene
  Semantik/Dispatches.
- `display.dart` — Zwei-Zeilen-Display, Überstrich-Rendering,
  Periode-Markierung. `TwoLineDisplay` skaliert sich adaptiv an seinen
  Container, funktioniert also vom Landscape-Phone (~60 dp) bis zum
  Tablet-Portrait (170 dp). Liest **GlyphStyle** aus dem
  `GlyphStyleScope`-InheritedNotifier (via `Builder` innerhalb des
  `CustomPaint`-Wraps): `custom` = Dozenal-Glyphen via
  `paintDozenalDigitAt`, `conventional` = ASCII `'0'..'9'/'A'/'B'` (Default)
  per TextPainter (Pitman/Dwiggins-Konvention für die Über-9er-Stellen).
  Quell-Datei `lib/logic/glyph_style.dart`: der `GlyphStyleNotifier`
  hält **zwei unabhängige Prefs** — `style` für das Display
  (SharedPreferences-Key `glyph_style_v1`) und `keypadStyle` für die
  Ziffern-Tasten (`keypad_glyph_style_v1`, gelesen via
  `GlyphStyleScope.keypadStyleOf(context)`; ohne Scope Fallback auf
  custom). Beide defaulten auf conventional (die Dozenal-Glyphen sind
  opt-in); Display und Keypad lassen sich getrennt auf die Glyphen umstellen
  (Settings-Zeilen „Glyphen-Stil" bzw. „Ziffern auf Tasten").
  Display-Gesten-Hooks: Tap = Tipp-Cursor (`inputCursorPosForTap` →
  `moveCursorTo`), Langdruck = Resultat-Copy, Swipe-down = History-Tape
  (siehe State-Abschnitt); `showCursor: false` macht das Widget zum
  read-only History-Tile.
- `round_badge.dart` — Bausteine der Listen-Optik von Info-Liste und
  Einstellungen: `RoundIconBadge`/`RoundFlagBadge` (30-dp-Farbscheiben
  statt grauer Icons/Flaggen-Thumbnails; `BadgeHue`-Palette bewusst
  ausserhalb `AppColors`), `kBadgeDiameter`, `kSubItemIndent`.
- `keypad.dart` — orientierungsgesteuertes Dispatch. `Keypad` nimmt
  zusätzlich `keypadMode` (Overlay/Scroll) und `keypadProfile`
  (Alle/Einfach) aus den Einstellungen entgegen (siehe
  Einstellungen-Abschnitt).
  **Set 10 ist [EXP (Sci), DRG, CONV, Close]** —
  die Doz/Dez-Tasten sind vom Keypad entfernt, die Basis-Umschaltung
  läuft nur noch über die Einstellungen-Seite (werterhaltend, gleicher
  `handleClick(Doz()/Dez())`-Pfad). CONV (`ConvAns`-Token) ist die
  Brücken-Taste zu den Zweitrechnern (Tap: Umrechner, mit Fallback auf
  den Werterechner; Langdruck: VAL) — siehe „Resultat-Brücke" im
  Einheitenrechner-Abschnitt; im Profil „Einfach" fehlt sie wie alle
  erweiterten Sets (Ans/Speicher dort ebenfalls nicht erreichbar).
  **Langdruck-Popups:** ausgewählte Host-Tasten bieten bei langem Druck
  ein Akzent-Popup im Smartphone-Tastatur-Stil an. Host-Map ist die
  öffentliche Funktion `longPressOptionsFor(token)`:
  x^□ → {x²}; log_□ → {ln, log₁₂, eˣ}; − → {±}; STO → {M+, M−};
  n! → {nCr, nPr}; CONV → {VAL} (`AssetAns`, die Asset-Brücke — siehe
  Resultat-Brücke). Host-Tasten tragen eine kleine Ecke unten rechts
  (`_CornerMarkPainter`, Dreieck in `textMuted`, 6×6 dp bei
  right:3/bottom:3) und einen a11y-Hint (`a11yHoldMore`). Auswahl per
  **beiden** Gesten: Gleiten+Loslassen (Hit-Test in globalen
  Koordinaten) oder Loslassen+Antippen. Popup-Optionen folgen demselben
  Disabled-Gating wie die Tasten (`isOptionDisabled` = dasselbe
  `_isTokenDisabled`-Prädikat): eine graue Option (z. B. VAL ohne
  Asset-Wert) dispatcht nichts und lässt das Popup offen.
  Die Schliessen-Barrier ist ein
  **`Listener` mit translucent-Hit-Test** (OverlayEntry), KEIN opaker
  GestureDetector: Pointer-down ausserhalb schliesst das Popup UND der
  Tap wirkt normal auf die Taste darunter — die Barrier darf nie
  Eingabe schlucken (Smartphone-Tastatur-Verhalten; gleiche Konvention
  im Unit-Info-Kasten des Umrechner-Keypads). Die
  Popup-Breiten-Mathematik muss den 1-px-Container-Border
  (`_popupBorder`) einrechnen.
  **Zweite Overlay-Seite (Funktionsseite) ist deaktiviert, nicht
  gelöscht:** const-Flag `_kFuncPageEnabled = false` hält den Code
  intakt aber unerreichbar (auch die Breit-Spaltenbreiten-Mathematik
  ist auf das Flag konditioniert). Bei Reaktivierung nur das Flag
  kippen.
  `Keypad.build` liest die `LayoutBuilder`-Constraints und wählt:
  - **`_HochKeypad`** (Portrait): vertikale Flex-`Column` mit
    `AnimatedSwitcher`-Panel-Swap zwischen Sets 1–4 + System-Reihe und
    Sets 6–10. Drei Gap-Regimes nach verfügbarer Höhe: normal (≥560 dp),
    eng (480–559 dp), Scroll-Fallback (<480 dp).
    - **Scroll-Modus** (`KeypadMode.scroll`, nur bei Profil „Alle"):
      statt Panel-Swap eine `SingleChildScrollView` mit allen Sets
      untereinander — Sets 1–4, System-Reihe ohne Expand
      (`_systemRowNoExpand`), „Erweiterungsfeld"-Header,
      `_hochScrollExtendedRows` (Sets 6–9) und EXP/Drg ohne Close
      (`_set10RowNoClose`). Die `=`-Zeile bleibt ausserhalb gepinnt.
    - **Profil „Einfach"** (`KeypadProfile.simple`): nur Ziffern +
      Sets 1–4 + AC/Del/`.` — keine Expand-Taste, kein Erweiterungsfeld,
      keine EXP/DRG-Reihe (Winkelmodus dann über die
      Einstellungen-Seite). Scroll-Modus wird in „Einfach" ignoriert.
  - **`_BreitKeypad`**: Konfigurationen in `_buildBreitContent` —
    Einfach = 8 Spalten ohne dritte Gruppe; „Alle" = 13 Spalten inline.
    Mit dem deaktivierten `_kFuncPageEnabled` gibt es keinen Page-Pfeil
    und keine 17-Spalten-Variante (beides ist auf das Flag
    konditioniert und derzeit unerreichbar); im Scroll-Modus läuft das
    Button-Sizing nur über `rawH` (horizontaler Scroll absorbiert die
    Überbreite).
  - **`_BreitKeypad`** (Landscape / Tablet): Inline-Layout mit allen zehn
    Sets nebeneinander, gegliedert in drei visuelle Blöcke: Zahlengitter,
    Sets 1–5 (Hauptoperationen + System), Sets 6–10 (erweiterte Funktionen).
    Zwischen den drei Blöcken läuft je eine 1-dp-Divider-Linie
    (Palette-Slot `hairline`, gleich wie der horizontale Divider in
    `_HochKeypad`).
    Geometrie (Build 7, mit Build-8-Floor-Anpassung):
    - `buttonSize = min(rawH, rawW).clamp(breitMinTouchTarget, 70)` — beide
      Achsen werden berücksichtigt, damit weder vertikal noch horizontal
      beschnitten wird. `breitMinTouchTarget = 36 dp` (statt der Hoch-Mode-
      `minTouchTarget = 44 dp`): Material 48 / iOS 44 sind Empfehlungen,
      nicht Mauern, und in Landscape wird das Phone zweihändig gehalten —
      36-dp-Targets bleiben treffbar. Mit 44 als Floor klemmten 360-dp-
      hohe, kompakte Phones auf beiden Achsen und
      scrollten redundant; der niedrigere Floor lässt die Tasten der
      Viewport-Form folgen, statt sie hinauszuschieben.
    - Alle inner-Block-Abstände (im Zifferngitter h+v, in opColumns v,
      zwischen Sets innerhalb eines Blocks h) sind identisch =
      `tabletColGap` (8 dp). So „atmet" jeder Block gleichmässig.
    - Horizontaler Slack wird in die zwei Gruppen-Lücken gepumpt
      (`groupGapBase = 18`, Cap `maxGroupGap = 100`). Was über den Cap
      hinausgeht, landet als symmetrischer Aussenrand via `SizedBox(width:
      max(viewport, contentWidth))` + `MainAxisAlignment.center`.
    - Vertikaler Scroll-Fallback engaged, wenn `naturalHeight > h` (z. B.
      Split-Screen, Foldable-Cover-Display).
- Jede Taste ist in `ConstrainedBox(minHeight: 44)` gewrappt, damit der
  Material-44-dp-Touch-Target-Floor deklarativ erzwungen wird.
- `app_layout.dart` — `displayHeightFor(h) = (h * 0.20).clamp(60, 170)`
  für beide Orientierungen, plus die `tablet*`-Referenz-Proportionen für
  `_BreitKeypad`. Die alten `mobile*`-Konstanten und der frühere
  `_DesktopKeypad` / `_MobileKeypad` / `_TabletKeypad`-Dreiklang wurden
  in Build 4 entfernt.
