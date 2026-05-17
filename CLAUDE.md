# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project

Flutter port of a Rust + egui scientific calculator that computes natively in
**base 12** (dozenal). Origin: https://github.com/Bawdyness/dozenal_calc.
Many `.dart` files explicitly state which Rust file they port from (e.g.
`state.dart` ↔ `src/input.rs` + `src/eval.rs`). When changing logic, check the
header comment for the Rust counterpart — the port is intentionally close to
1:1 for the calculator's `logic/` and dispatch layers.

## Commands

```bash
flutter pub get
flutter run                   # current platform
flutter run -d chrome         # web
flutter analyze               # what CI runs
flutter test                  # full suite (≈78 tests)
flutter test test/rational_test.dart           # single file
flutter test --plain-name "parses 1/7"         # single test by name
```

CI (`.github/workflows/ci.yml`) pins Flutter 3.41.8 stable and runs `analyze`
+ `test`. The Flutter SDK itself pins six transitive deps (`meta`,
`vector_math`, `cli_util`, `matcher`, `test_api`, `xml`) to versions
`pub outdated` flags — this is expected, not a bug to fix. Retry after each
Flutter stable minor release.

### Release builds

```bash
flutter build apk --release
JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64 flutter build appbundle --release
flutter build web --release
```

The Play Store appbundle build needs Java 17 explicitly (Java 21 on this
machine breaks Gradle). Android signing reads `android/key.properties` — if
missing, the build silently falls back to debug-signed.

### Asset regeneration

`assets/icon.png`, `assets/compass.png`, and the Play Store feature graphic
are generated programmatically via golden-style tests in `tool/`:

```bash
flutter test tool/generate_icon.dart           # → assets/icon.png
flutter test tool/generate_feature_graphic.dart
dart run flutter_launcher_icons                # → platform icons
dart run flutter_native_splash:create
```

## Architecture

### Two-track evaluation (the core idea)

Every `=` press runs **both** an exact `Rational` (BigInt-backed) evaluator
and an `f64` evaluator in parallel:

- `lib/logic/rational.dart` — exact rationals with period detection (`1/7` →
  `0.186A3` with overline + raised-dot start marker).
- `lib/logic/rat_parser.dart` — rational-track parser. Collapses only on
  non-rational tokens (sin, log, …) or division by zero.
- `lib/logic/expression.dart` — f64 fallback evaluator and result formatting.

When the rational track collapses, the f64 result shows as **State B** (with
a "≈" suffix). When both succeed, the rational wins. `DozenalCalcState.isF64Fallback` is the layer that gates this.

### State (`lib/state.dart`)

`DozenalCalcState extends ChangeNotifier` is the single orchestrator. It owns
input/result buffers, memory, modes, and `infoState`. `handleClick(token)` is
the only entry point — keypad taps and physical-keyboard events both funnel
through it (see the keyboard map in `lib/main.dart`).

**List mutations create fresh instances** because `CustomPainter.shouldRepaint`
compares via `listEquals`; mutating in place breaks repaint detection.

### Tokens (`lib/tokens.dart`)

`sealed class CalcToken` with const-singleton subclasses for payload-free
variants. Mirrors the Rust enum and enables exhaustive `switch` patterns.

### Rendering

- `glyph_painter.dart` — twelve custom dozenal digit glyphs (no font: pure
  `CustomPainter`).
- `token_painter.dart` — operator/function key glyphs.
- `display.dart` — two-line display, overline rendering, period bracket.
- `keypad.dart` — Sets 1–5 always visible; Sets 6–10 in `OverlayKeypad` on
  mobile, inlined on tablet (`isTabletScreen` in `app_layout.dart`).
- `app_layout.dart` — all layout constants live here, including the overlay
  rectangle (`mobileOpGridTopY`, `mobileOverlayHeight`).

### Info modal

`info_pages.dart` (Navigator routes) + `info_content.dart` (twelve chapters of
prose + custom-painted illustrations for the geometry chapters). When
`handleClick` sets `state.infoState` to `InfoList`, `main.dart`'s state
listener pushes the route and resets `infoState` to `Closed` — the Navigator
drives all further list/detail/back transitions.

### Intro

First-run intro pages gated by `SharedPreferences` key `intro_seen_v1`. Bump
the version suffix when the intro changes enough to re-show to existing users.

## Conventions

- **License header note**: this project is CC BY-NC-SA 4.0 (non-commercial).
- **No analytics, no network, no platform permissions.** The privacy policy is
  bundled (`legal/privacy-policy.de.md`, surfaced via `privacy_page.dart`) and
  the app is German-first.
- When porting from Rust, preserve the Rust function/struct names in
  comments — they are the lookup key for cross-referencing behavior.

## Environment notes

- The `tablet` Android emulator is unstable under repeated `flutter install`
  cycles on this machine. Prefer a physical device or restart the emulator
  between installs.
