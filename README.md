# Dozenal Calc

Ein wissenschaftlicher Taschenrechner, der nativ in **Basis 12** (dozenal)
rechnet — mit eigens gezeichneten Ziffernsymbolen, exakter
Rational-Arithmetik mit Periodenerkennung und einem integrierten
didaktischen Kapitelwerk zum Dozenalsystem.

Flutter-Port der ursprünglichen Rust + egui Implementierung unter
[Bawdyness/dozenal_calc](https://github.com/Bawdyness/dozenal_calc).
Dieses Repository:
[Bawdyness/dozenal_calc_flutter](https://github.com/Bawdyness/dozenal_calc_flutter).

## Funktionsumfang

- **Rechner** — zwölf eigene Ziffern-Glyphen, Addition / Subtraktion /
  Multiplikation / Division / Exponentiation / Paralleladdition (⊕) /
  Quadrat- und n-te Wurzel / Logarithmus / trigonometrische und
  hyperbolische Funktionen. Der Ausdrucksparser läuft auf zwei Schienen
  parallel: eine exakte `Rational`-Schiene auf `BigInt`-Basis, die
  Periodizität bewahrt (z. B. `1/7` wird als `0.186A3` mit Überstrich +
  Punktmarker dargestellt), und eine `f64`-Schiene, die die irrationalen
  Fälle abfängt.
- **Speicher** — ein Slot, `STO` / `RCL` / `MC`, mit exaktem
  Rational-Round-Trip wenn möglich.
- **Modi** — Winkel (`RAD` / `DEG` / `GRD`), Anzeige-Basis (Dozenal ↔
  Dezimal zur Inspektion), Inversen-Umschaltung beim zweiten Tippen einer
  beliebigen Trig-/Hyperbolik-Taste.
- **Info-Bereich** — zwölf Kapitel mit Hintergrund: wie das Symbolsystem
  funktioniert, warum die Basis 12 schönere Brüche als Basis 10 ergibt,
  das regelmäßige Zwölfeck, der platonische Dodekaeder, Zodiak-Astronomie,
  Fingerzählen, imperiale Einheiten, TGM. Die beiden Geometrie-Kapitel
  enthalten benutzerdefinierte Illustrationen.

## Repo-Aufbau

```
lib/
  state.dart              — DozenalCalcState (ChangeNotifier)
  display.dart            — TwoLineDisplay (adaptive Höhe, State A/B/C)
  keypad.dart             — Orientierungs-Dispatch: _HochKeypad (Panel-Swap)
                            und _BreitKeypad (alle zehn Sets inline)
  glyph_painter.dart      — zwölf Dozenal-Ziffer-Glyphen
  token_painter.dart      — Operator-/Funktionstasten-Glyphen
  app_layout.dart         — Display-Höhen-Formel + Tablet-Proportionen
  info_pages.dart         — Info-Modal-Navigation
  info_content.dart       — Kapitelprosa + Illustrationen
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
test/                     — 144 Tests über Logik, State und Layout
tool/                     — Icon-, Kompass-, Feature-Graphic-Generatoren
legal/                    — Datenschutzerklärung (.md + .html)
assets/                   — icon.png, compass.png, feature_graphic.png
screenshots/              — Play-Store-Screenshots (Phone + tablet)
.github/workflows/ci.yml  — analyze + test bei Push / PR
```

## Bauen & Ausführen

```bash
flutter pub get
flutter run                   # aktuelle Plattform
flutter run -d chrome         # Web
flutter test                  # alle 144 Tests
```

`flutter pub get` meldet sechs transitive Abhängigkeiten (`meta`,
`vector_math`, `cli_util`, `matcher`, `test_api`, `xml`) mit neueren
verfügbaren Versionen, die mit den aktuellen Constraints inkompatibel
sind. Diese Pins kommen vom Flutter-SDK selbst, nicht von diesem
`pubspec.yaml`, weshalb weder `flutter pub upgrade` noch
`flutter pub upgrade --major-versions` sie auf dem Stable-Channel
anhebt. Nach jedem Flutter-Minor-Stable-Release den Upgrade erneut
versuchen und analyze + Tests laufen lassen; bis dahin ist die Warnung
nur informativ.

Release-Builds:

```bash
flutter build apk --release       # Android (signiert via android/key.properties)
flutter build appbundle --release # Android Play-Store-Bundle
flutter build ios --release       # iOS (benötigt Xcode + Apple Developer)
flutter build web --release       # statische Seite unter build/web
```

Der Android-Release-Build erwartet einen vom Entwickler bereitgestellten
Keystore unter dem in `android/key.properties` deklarierten Pfad — siehe
Kommentare in `android/app/build.gradle.kts`. Ohne diese Datei fällt der
Build auf Debug-Signing zurück, was für lokales Testen reicht, aber nicht
für die Store-Distribution.

## Icon- und Splash-Assets regenerieren

Das 1024×1024-Quell-PNG unter `assets/icon.png` wird programmatisch erzeugt:

```bash
flutter test tool/generate_icon.dart       # → assets/icon.png
dart run flutter_launcher_icons             # → Plattform-Icons
dart run flutter_native_splash:create       # → Plattform-Splash-Screens
```

Das Kompass-Bild (`assets/compass.png`) ist für Marketing-/Hero-Kontexte
gedacht und wird per `tool/generate_compass.dart` nach demselben Muster
erzeugt. Das 1024×500 Play-Store-Feature-Graphic
(`assets/feature_graphic.png`) wird per
`tool/generate_feature_graphic.dart` erzeugt:

```bash
flutter test tool/generate_feature_graphic.dart
```

## Lizenz

Copyright (c) 2026 Eric Naville.

Dieses Projekt steht unter der **MIT-Lizenz** — Volltext in
[`LICENSE`](LICENSE). Kurz gesagt: du darfst das Werk für jeden Zweck
nutzen, ändern und weitergeben (auch kommerziell); der Copyright-Hinweis
und der MIT-Lizenztext müssen in abgeleiteten Werken erhalten bleiben.

Lokalisierte Hybrid-Fassungen mit Kurzzusammenfassung in jeder
Sprache plus englischem MIT-Volltext liegen unter
[`legal/license.<code>.md`](legal/) (vierzehn Sprachen).

## Datenschutz

Dozenal Calc erhebt, speichert und übermittelt keinerlei Nutzerdaten.
Die App läuft vollständig offline und fordert keine Plattform-Berechtigungen
an. Die vollständige Datenschutzerklärung ist in der App ausgeliefert
(Info → Datenschutzerklärung) und liegt unter
[`legal/privacy-policy.de.md`](legal/privacy-policy.de.md).

## Kontakt

dozenal@weltanschauung.app
