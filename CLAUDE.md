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
flutter test                  # gesamte Suite (144 Tests)
flutter test test/rational_test.dart           # einzelne Datei
flutter test --plain-name "parses 1/7"         # einzelner Test per Name
```

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

### Asset-Regenerierung

`assets/icon.png`, `assets/compass.png` und das Play-Store-Feature-Graphic
werden programmatisch über Golden-Style-Tests in `tool/` erzeugt:

```bash
flutter test tool/generate_icon.dart           # → assets/icon.png
flutter test tool/generate_feature_graphic.dart
dart run flutter_launcher_icons                # → Plattform-Icons
dart run flutter_native_splash:create
```

## Architektur

### Zwei-Schienen-Auswertung (die Kernidee)

Jeder `=`-Druck startet **beide** Auswerter parallel — den exakten
`Rational` (BigInt-basiert) und den `f64`-Auswerter:

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
    Sets nebeneinander, Tastengröße aus verfügbarer Höhe berechnet,
    vertikaler Scroll-Fallback für ungewöhnlich kleine Höhen.
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

### Intro

Onboarding-PageView beim ersten Start, gesperrt über den
`SharedPreferences`-Schlüssel `intro_seen_v2` (aktueller Suffix; Build 5
hat den Crop der Phone-Screenshots auf 576×980 angepasst und das `v1`
gebumpt, damit Bestandstester das überarbeitete Intro sehen). Bei
substanziellen Intro-Änderungen den Versions-Suffix erneut erhöhen.

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

## Umgebungs-Hinweise

- Der `tablet` Android-Emulator ist instabil bei wiederholten
  `flutter install`-Zyklen auf dieser Maschine. Lieber ein physisches
  Gerät verwenden oder den Emulator zwischen Installs neu starten.
