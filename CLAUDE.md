# CLAUDE.md

Diese Datei gibt Claude Code (claude.ai/code) Hinweise zur Arbeit mit dem Code in diesem Repository.

## Projekt

Flutter-Port eines Rust + egui Wissenschafts-Taschenrechners, der nativ in
**Basis 12** (dozenal) rechnet. Ursprung: https://github.com/Bawdyness/dozenal_calc.
Viele `.dart`-Dateien nennen explizit die Rust-Datei, von der sie portiert
wurden (z. B. `state.dart` ↔ `src/input.rs` + `src/eval.rs`). Bei
Logikänderungen den Kopfkommentar auf das Rust-Gegenstück prüfen — der Port
ist absichtlich 1:1 für die `logic/`- und Dispatch-Schichten.

## Befehle

```bash
flutter pub get
flutter run                   # aktuelle Plattform
flutter run -d chrome         # Web
flutter analyze               # was CI ausführt
flutter test                  # gesamte Suite (147 Tests)
flutter test test/rational_test.dart           # einzelne Datei
flutter test --plain-name "parses 1/7"         # einzelner Test per Name
```

Test-Routing (für gezielte Edits):
- `state_test.dart` — Orchestrator inkl. Handler-Pfade, mit Abstand die
  größte Datei.
- `rational_test.dart` + `rat_parser_test.dart` — exakte Rational-Schiene.
- `expression_test.dart` — f64-Auswerter inkl. `resolvePostfix`.
- `dozenal_converter_test.dart` — Doz ↔ Dez-Konvertierung.
- `keypad_layout_test.dart` — Orientierungs-Dispatch und Repaint-Verhalten.
- `edge_cases_test.dart` — Grenzfall-Sammler über die Module hinweg.

CI (`.github/workflows/ci.yml`) ist auf Flutter 3.41.8 stable festgenagelt
und führt `analyze` + `test` aus. Das Flutter-SDK selbst pinnt sechs
transitive Abhängigkeiten (`meta`, `vector_math`, `cli_util`, `matcher`,
`test_api`, `xml`) auf Versionen, die `pub outdated` flaggt — das ist
erwartet, kein Bug. Nach jedem Flutter-Minor-Stable-Release erneut prüfen.

### Release-Builds

```bash
flutter build apk --release
JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64 flutter build appbundle --release
flutter build web --release
```

Der Play-Store-Appbundle-Build braucht explizit Java 17 (Java 21 auf dieser
Maschine zerbricht Gradle). Android-Signing liest `android/key.properties` —
fehlt die Datei, fällt der Build still auf Debug-Signing zurück.

Als abschließenden Schritt nach einem Release-Build deutsche
Play-Console-Versionshinweise verfassen und im Console-Format ausgeben:

```
<de-DE>
…End-User-fokussierter Text, ca. 450 Zeichen (Limit 500 pro Locale)…
</de-DE>
```

Inhalt aus den tatsächlichen Build-Änderungen ableiten (nicht aus der
Commit-Message kopieren) und Ton an Tester richten — was sie sehen werden,
nicht die Constraint-Math dahinter. Zeichen mit `wc -m` verifizieren.

### Asset-Regenerierung

`assets/icon.png`, `assets/compass.png` und das Play-Store-Feature-Graphic
werden programmatisch über Golden-Style-Tests in `tool/` erzeugt:

```bash
flutter test tool/generate_icon.dart            # → assets/icon.png
flutter test tool/generate_compass.dart         # → assets/compass.png
flutter test tool/generate_feature_graphic.dart # → store/feature-graphic.png
dart run flutter_launcher_icons                 # → Plattform-Icons
dart run flutter_native_splash:create
```

Die erzeugten PNGs sind versionierte Build-Outputs und gehören mit
committed — sie werden zur Laufzeit aus `assets/` geladen, nicht im Build
neu generiert. Nach `flutter_launcher_icons` / `flutter_native_splash`
auch die jeweils gepatchten Plattform-Resources (`android/app/src/main/res/`,
`ios/Runner/Assets.xcassets/`, …) prüfen und mitnehmen.

## Architektur

### Zwei-Schienen-Auswertung (die Kernidee)

Jeder `=`-Druck startet **beide** Auswerter parallel — den exakten
`Rational` (BigInt-basiert) und den `f64`-Auswerter:

- `lib/logic/dozenal_digit.dart` — reine Datenschicht: Enum 0..11 mit
  `value`/`fromValue` (Port von `DozenalDigit` aus `src/logic.rs`). Keine
  Flutter-Imports, wird von Parser, State und Tastenmap geteilt.
- `lib/logic/rational.dart` — exakte Rationals mit Periodenerkennung
  (`1/7` → `0.186A3` mit Überstrich + Punktmarker für den Periodenstart).
- `lib/logic/rat_parser.dart` — Parser der Rational-Schiene. Kollabiert
  nur bei nicht-rationalen Tokens (sin, log, …) oder Division durch null.
- `lib/logic/expression.dart` — f64-Fallback-Auswerter und
  Ergebnisformatierung. Enthält auch `resolvePostfix`, das vor
  `withImplicitMuls` läuft und postfix-eingegebene Tokens (`n!`, `|x|`,
  `1/x`) in präfix-Funktionsaufrufe umordnet. Standard-Konvention:
  Postfix bindet stärker als unäres Minus, also `−3!` = `−(3!)`. Wenn
  der User `|−3| = 3` will, muss er klammern.

Wenn die Rational-Schiene kollabiert, wird das f64-Resultat als **State B**
mit `≈`-Suffix angezeigt. Wenn beide funktionieren, gewinnt die
Rational-Schiene. `DozenalCalcState.isF64Fallback` steuert diese Anzeige.

### State (`lib/state.dart`)

`DozenalCalcState extends ChangeNotifier` ist der einzige Orchestrator. Er
besitzt die Input/Result-Buffer, den Speicher, die Modi und `infoState`.
`handleClick(token)` ist der einzige Einstiegspunkt — Tastendrücke und
physische Tastatur-Events laufen beide hierdurch (Tastenmap in
`lib/main.dart`).

**Listen-Mutationen erzeugen frische Instanzen**, weil
`CustomPainter.shouldRepaint` per `listEquals` vergleicht; In-Place-Mutation
bricht die Repaint-Erkennung.

`isArmed(token)` ist die Keypad-Query für den „scharf"-Punkt-Indikator:
sie gibt `true` zurück, wenn ein Tap auf `token` den vorhergehenden
Buffer-Token via `_inverseSwap` in seine Inverse umschalten würde
(z. B. Sin ↔ ArcSin nach erstem Sin-Tap). Anzeige-Logik und Toggle-Logik
müssen über diese gemeinsame Quelle laufen, sonst desynchronisieren sie.
Eingabe von `.` wird zusätzlich durch `_hasDecimalInCurrentLiteral`
gefiltert (beidseitiger Walk durch das aktuelle Zahlen-Literal), damit
`1.2.3`-Eingaben gar nicht erst entstehen.

### Tokens (`lib/tokens.dart`)

`sealed class CalcToken` mit const-Singleton-Subklassen für
Payload-freie Varianten. Spiegelt das Rust-Enum und erlaubt erschöpfende
`switch`-Pattern-Matches.

### Rendering

- `glyph_painter.dart` — zwölf benutzerdefinierte Dozenal-Glyphen (kein
  Font: reines `CustomPainter`).
- `token_painter.dart` — Glyphen der Operator-/Funktionstasten.
- `display.dart` — Zwei-Zeilen-Display, Überstrich-Rendering,
  Periode-Markierung. `TwoLineDisplay` skaliert sich adaptiv an seinen
  Container, funktioniert also vom Landscape-Phone (~60 dp) bis zum
  Tablet-Portrait (170 dp).
- `keypad.dart` — orientierungsgesteuertes Dispatch. `Keypad.build` liest
  die `LayoutBuilder`-Constraints und wählt:
  - **`_HochKeypad`** (Portrait): vertikale Flex-`Column` mit
    `AnimatedSwitcher`-Panel-Swap zwischen Sets 1–4 + System-Reihe und
    Sets 6–10. Drei Gap-Regimes nach verfügbarer Höhe: normal (≥560 dp),
    eng (480–559 dp), Scroll-Fallback (<480 dp).
  - **`_BreitKeypad`** (Landscape / Tablet): Inline-Layout mit allen zehn
    Sets nebeneinander, gegliedert in drei visuelle Blöcke: Zahlengitter,
    Sets 1–5 (Hauptoperationen + System), Sets 6–10 (erweiterte Funktionen).
    Zwischen den drei Blöcken läuft je eine 1-dp-Divider-Linie (`Color
    0xFF333333`, gleich wie der horizontale Divider in `_HochKeypad`).
    Geometrie (Build 7, mit Build-8-Floor-Anpassung):
    - `buttonSize = min(rawH, rawW).clamp(breitMinTouchTarget, 70)` — beide
      Achsen werden berücksichtigt, damit weder vertikal noch horizontal
      beschnitten wird. `breitMinTouchTarget = 36 dp` (statt der Hoch-Mode-
      `minTouchTarget = 44 dp`): Material 48 / iOS 44 sind Empfehlungen,
      nicht Mauern, und in Landscape wird das Phone zweihändig gehalten —
      36-dp-Targets bleiben treffbar. Mit 44 als Floor klemmten 360-dp-
      hohe Phones (kompakte Phones, kompakte Phones) auf beiden Achsen und
      scrollten redundant; der niedrigere Floor lässt die Tasten der
      Viewport-Form folgen, statt sie hinauszuschieben.
    - Alle inner-Block-Abstände (im Zifferngitter h+v, in opColumns v,
      zwischen Sets innerhalb eines Blocks h) sind identisch =
      `tabletColGap` (8 dp). So „atmet" jeder Block gleichmäßig.
    - Horizontaler Slack wird in die zwei Gruppen-Lücken gepumpt
      (`groupGapBase = 18`, Cap `maxGroupGap = 100`). Was über den Cap
      hinausgeht, landet als symmetrischer Außenrand via `SizedBox(width:
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

### Info-Modal

`info_pages.dart` (Navigator-Routen) + `info_content.dart` (zwölf
Lehr-Kapitel als Prosa + custom-painted Illustrationen für die
Geometrie-Kapitel). Wenn `handleClick` `state.infoState` auf `InfoList`
setzt, pusht der State-Listener in `main.dart` die Route und resettet
`infoState` auf `Closed` — der Navigator steuert ab dann alle
Listen-/Detail-/Zurück-Übergänge.

Sekundärseiten, die aus `info_pages.dart` heraus gepusht werden:
`privacy_page.dart` (rendert `legal/privacy-policy.de.md` via dem
generischen `markdown_page.dart`), `license_page.dart` (App-Lizenz +
delegiert auf das Flutter-eigene `showLicensePage`) und
`feedback_dialog.dart` (`mailto:`-Composer, kein Netzwerk). Alle vier
folgen der gleichen Push-Konvention — keine direkten Routen aus
`main.dart`, alles geht über die Info-Liste.

### Intro

Onboarding-PageView beim ersten Start, gesperrt über einen
`SharedPreferences`-Schlüssel der Form `intro_seen_v<N>` (aktuell `v2`,
definiert als `_kIntroSeenFlag` in `lib/main.dart`). Bei substanziellen
Intro-Änderungen den Suffix erhöhen, damit Bestandstester das
überarbeitete Intro erneut sehen.

### App-Bootstrap (`lib/main.dart`)

Wickelt die vorgenannten Bausteine zusammen — wenn etwas „in main.dart"
liegt, dann hier:

- **Edge-to-edge + Overlay-Style** (siehe nächster Abschnitt) wird in
  `main()` vor `runApp` gesetzt.
- **Physische Tastatur:** `_charKeyMap` (zeichen-basiert, inkl. `,` als
  Dezimaltrenner für deutsche Layouts) und `_logicalKeyMap` (Enter,
  Backspace, Pfeiltasten, kompletter Numpad inkl. Fallback-Digits, weil
  Linux bei manchen Layouts `event.character` leerlässt). Beides
  Portierungen aus `src/input.rs::handle_keyboard` und mündet in
  `_state.handleClick(token)` — derselbe Pfad wie ein Tastendruck.
- **Intro-Gate:** `_maybeShowIntro` liest `_kIntroSeenFlag` (aktuell
  `intro_seen_v2`) aus `SharedPreferences` und pusht beim ersten Start
  `IntroPage`; danach wird das Flag gesetzt.
- **Info-Routing:** `_onStateChanged` lauscht auf `state.infoState`,
  resettet es auf `InfoClosed` und pusht `InfoListPage`. Nach
  Navigator-Pop wird der Keyboard-Focus wieder angefordert.
- **Layout-Wurzel:** `_CalcScaffold` rendert `TwoLineDisplay` über
  `Keypad`, mit `displayHeightFor(bodyH)` aus `app_layout.dart` als
  einzige Größenrechnung. Splash-Feedback ist global via
  `NoSplash.splashFactory` aus, weil die Tasten ihre eigene
  Press-Color-Animation haben.

### Edge-to-edge (Android 15)

Ab `targetSdk 35` ist edge-to-edge der Default. Die alten XML-Attribute
`windowDrawsSystemBarBackgrounds` und `windowFullscreen` sind deprecated
und wurden aus allen vier `android/app/src/main/res/values*/styles.xml`
entfernt — nur `windowLayoutInDisplayCutoutMode=shortEdges` und der
Material-Light/Black-NoTitleBar-Parent bleiben. `main.dart` setzt
`SystemUiOverlayStyle` mit transparenten System-Bars + hellen Icons
(passt zum dunklen App-Hintergrund) und ruft `setEnabledSystemUIMode(
edgeToEdge)` auf. Jede Scaffold-Page wickelt den Body in `SafeArea(top:
false, …)` — die AppBar handhabt oben, aber sonst würden Listen unter
der System-Navigationsleiste verschwinden. Bei neuen Pages diese
Konvention beibehalten.

## Konventionen

- **Lizenz-Hinweis:** Dieses Projekt steht unter CC BY-NC-SA 4.0
  (nicht-kommerziell).
- **Keine Analytics, kein Netzwerk, keine Plattform-Berechtigungen.** Die
  Datenschutzerklärung ist im App-Bundle (`legal/privacy-policy.de.md`,
  gerendert via `privacy_page.dart`), die App ist deutsch-zuerst.
- Beim Portieren aus Rust die Rust-Funktions-/Struct-Namen in Kommentaren
  beibehalten — sie sind der Lookup-Schlüssel für Verhaltens-Querverweise.
- **Lints:** `analysis_options.yaml` aktiviert nur das
  `package:flutter_lints/flutter.yaml`-Standardset, keine projekt-spezifischen
  Zusatzregeln. `flutter analyze` muss aber sauber bleiben — CI fängt
  Verstöße.

## Umgebungs-Hinweise

- Der `tablet` Android-Emulator ist instabil bei wiederholten
  `flutter install`-Zyklen auf dieser Maschine. Lieber ein physisches
  Gerät verwenden oder den Emulator zwischen Installs neu starten.
