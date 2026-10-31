# Dozenal Calc

## Zweck

Ein wissenschaftlicher Taschenrechner, der nativ in **Basis 12** (dozenal) rechnet, mit eigens gezeichneten
Ziffernsymbolen, exakter Rational-Arithmetik mit Periodenerkennung und einem integrierten didaktischen Kapitelwerk zum
Dozenalsystem.

Flutter-Port der ursprünglichen Rust- und egui-Implementierung unter
[Bawdyness/dozenal_calc](https://github.com/Bawdyness/dozenal_calc). Dieses Repository:
[steinerschueler/dozenal_calc_flutter](https://github.com/steinerschueler/dozenal_calc_flutter).

### Funktionsumfang

- **Rechner:** zwölf eigene Ziffern-Glyphen, Addition, Subtraktion, Multiplikation, Division, Exponentiation,
  Paralleladdition (⊕), Quadrat- und n-te Wurzel, Logarithmus, trigonometrische und hyperbolische Funktionen. Der
  Ausdrucksparser läuft auf zwei Schienen: eine exakte `Rational`-Schiene auf `BigInt`-Basis, die Periodizität bewahrt
  (`1/7` erscheint als `0.186A35` mit Überstrich und Punktmarker), und eine `f64`-Schiene für die irrationalen Fälle.
- **Einheitenrechner und Werterechner:** Einheiten, Edelmetalle und Währungen als weitere Pager-Seiten, per Wischen
  erreichbar. Ergebnisse wandern per Taste zwischen den Rechnern.
- **Speicher:** ein Slot, `STO`, `RCL`, `MC`, mit exaktem Rational-Round-Trip, wenn möglich.
- **Modi:** Winkel (`RAD`, `DEG`, `GRD`), Anzeige-Basis (Dozenal oder Dezimal), Inversen-Umschaltung beim zweiten Tippen
  einer Trig- oder Hyperbolik-Taste.
- **Info-Bereich:** Theorie-Kapitel mit Hintergrund: wie das Symbolsystem funktioniert, warum die Basis 12 schönere
  Brüche als Basis 10 ergibt, das regelmässige Zwölfeck, der platonische Dodekaeder, Zodiak-Astronomie, Fingerzählen,
  imperiale Einheiten, TGM, dazu Handbücher und Empfehlungen, teils mit eigenen Illustrationen.

## Benutzung

```bash
flutter pub get
flutter run                   # aktuelle Plattform
flutter run -d chrome         # Web
```

Konfiguration: Der Android-Release-Build liest `android/key.properties` mit dem Pfad zum Keystore (siehe Kommentare in
`android/app/build.gradle.kts`). Ohne diese Datei fällt der Build auf Debug-Signing zurück, was für lokales Testen
reicht, aber nicht für die Store-Ausgabe.

Release-Builds:

```bash
flutter build apk --release       # Android (signiert via android/key.properties)
flutter build appbundle --release # Android Play-Store-Bundle
flutter build ios --release       # iOS (benötigt Xcode und Apple Developer)
flutter build web --release       # statische Seite unter build/web
```

## Entwicklung

- Prüfbefehl: `flutter analyze`
- Tests: `flutter test`
- Secrets-Prüfung: `pre-commit run --all-files`
- Flutter-Version: dieselbe wie in `.github/workflows/ci.yml`, weil das SDK transitive Pakete pinnt.

`flutter pub get` meldet transitive Abhängigkeiten (`meta`, `vector_math`, `cli_util`, `matcher`, `test_api`, `xml`) mit
neueren Versionen, die mit den aktuellen Constraints inkompatibel sind. Diese Pins kommen vom Flutter-SDK, nicht von
`pubspec.yaml`, weshalb weder `flutter pub upgrade` noch `flutter pub upgrade --major-versions` sie auf dem
Stable-Channel anhebt. Nach jedem Flutter-Minor-Stable-Release den Upgrade erneut versuchen und Prüfbefehl und Tests
laufen lassen. Bis dahin ist die Warnung nur informativ.

Weiter: [Architektur](docs/architektur.md), [Entwicklung](docs/entwicklung.md), [Änderungen](CHANGELOG.md).

### Repo-Aufbau

```text
lib/
  state.dart              — DozenalCalcState (ChangeNotifier)
  display.dart            — TwoLineDisplay (adaptive Höhe, State A/B/C)
  keypad.dart             — Orientierungs-Dispatch: _HochKeypad (Panel-Swap)
                            und _BreitKeypad (alle zehn Sets inline)
  glyph_painter.dart      — zwölf Dozenal-Ziffer-Glyphen
  token_painter.dart      — Operator-/Funktionstasten-Glyphen
  app_layout.dart         — Display-Höhen-Formel + Tablet-Proportionen
  info_pages.dart         — Info-Modal-Navigation (Routing)
  theory/                 — Theorie-Kapitel (Prosa + Illustrationen)
  manual/                 — Bedienhandbuch (Haupt-, Umrechner, Werterechner)
  privacy_page.dart       — gebündelte Datenschutzerklärung
  license_page.dart       — gebündelte Lizenz (MIT)
  markdown_page.dart      — geteilte Markdown-Asset-Rendering-Komponente
  intro_pages.dart        — Onboarding-PageView beim ersten Start
  feedback_dialog.dart    — Tester-Feedback per mailto
  logic/
    rational.dart         — exakter Rational + periodische Dezimaldarstellung
    rat_parser.dart       — Parser der Rational-Schiene
    expression.dart       — f64-Auswerter, resolvePostfix-Pipeline,
                            Ergebnisformatierung
    dozenal_converter.dart
    dozenal_digit.dart
test/                     — Tests über Logik, State und Layout
tool/                     — Icon-, Kompass-, Feature-Graphic-Generatoren
legal/                    — Datenschutzerklärung (.md + .html)
assets/                   — icon.png, compass.png, feature_graphic.png
screenshots/              — Play-Store-Screenshots (Phone + Tablet)
.github/workflows/ci.yml  — analyze + test bei Push / PR
```

### Icon- und Splash-Assets regenerieren

Das 1024×1024-Quell-PNG unter `assets/icon.png` wird programmatisch erzeugt:

```bash
flutter test tool/generate_icon.dart       # → assets/icon.png
dart run flutter_launcher_icons             # → Plattform-Icons
dart run flutter_native_splash:create       # → Plattform-Splash-Screens
```

Das Kompass-Bild (`assets/compass.png`) ist für Marketing- und Hero-Kontexte gedacht und entsteht per
`tool/generate_compass.dart` nach demselben Muster. Das 1024×500 Play-Store-Feature-Graphic
(`assets/feature_graphic.png`) entsteht per `tool/generate_feature_graphic.dart`:

```bash
flutter test tool/generate_feature_graphic.dart
```

## Lizenz

Copyright (c) 2026 Eric Naville.

Dieses Projekt steht unter der **MIT-Lizenz**, Volltext in [`LICENSE`](LICENSE). Kurz gesagt: Du darfst das Werk für
jeden Zweck nutzen, ändern und weitergeben, auch kommerziell. Der Copyright-Hinweis und der MIT-Lizenztext müssen in
abgeleiteten Werken erhalten bleiben.

Lokalisierte Hybrid-Fassungen mit Kurzzusammenfassung in jeder Sprache und englischem MIT-Volltext liegen unter
[`legal/license.<code>.md`](legal/) (vierzehn Sprachen).

## Datenschutz

Dozenal Calc erhebt, speichert und übermittelt keinerlei Nutzerdaten. Die App läuft vollständig offline und fordert keine
Plattform-Berechtigungen an. Die vollständige Datenschutzerklärung ist in der App ausgeliefert (Info →
Datenschutzerklärung) und liegt unter [`legal/privacy-policy.de.md`](legal/privacy-policy.de.md). Für den Web-Build gilt
die Ausnahme unter «Netzziele» in [docs/architektur.md](docs/architektur.md).

## Kontakt

<dozenal@weltanschauung.app>
