# Einstellungen und Theming

Aus dem früheren Gesamtdokument übernommen. Verweise wie «oben» oder «siehe …-Abschnitt» meinen die Themenseiten, die
[architektur.md](architektur.md) auflistet.

## Einstellungen (`lib/settings_page.dart`)

Eigene Seite, erreichbar über die Info-Liste. Bündelt die Quick-Toggles
(Glyphen-Stil, Haptik — früher lose Zeilen in der Info-Liste) mit den
Keypad-Präferenzen und den Live-Rechner-Modi. Neun Zeilen, getrennt
durch Dividers im Palette-Slot `divider`, Segment-Optik via `_SegmentRow`
(ToggleButtons im Stil des früheren `_GlyphStyleToggle`):

1. **Erscheinungsbild** Dunkel/Hell/System — liest `ThemeScope.maybeOf`
   und schreibt `ThemeNotifier.setSetting` (siehe Theming-Abschnitt
   unten); ohne ThemeScope (Standalone-Widget-Tests) wird die Zeile
   ausgeblendet — gleiche Konvention wie die Calc-State-Zeilen.
2. **Glyphen-Stil** (Display, `GlyphStyleScope.style`),
   3. **Ziffern auf Tasten** (`_KeypadGlyphsRow`,
   `GlyphStyleScope.keypadStyle` — unabhängiger zweiter Pref, siehe
   Rendering-Abschnitt), 4. **Schriftgrösse** (`_FontSizeRow`,
   `CalcPrefsNotifier.setFontSize`, Key `font_size_v1`) und
   5. **Haptik** (`HapticsScope`).
6. **Funktionstasten** Overlay/Scrollen und 7. **Funktionsumfang**
   Alle/Einfach — schreiben in `CalcPrefsNotifier`
   (`lib/calc_prefs.dart`): `ChangeNotifier` + SharedPreferences-Keys
   `keypad_mode_v1`, `keypad_profile_v1`, `numeral_system_v1`,
   `angle_mode_v1`; unbekannte gespeicherte Strings fallen auf die
   Defaults zurück (Overlay/Alle/Dez/Deg = exakt das
   Vor-Einstellungen-Verhalten, Store-Screenshots bleiben gültig).
   Bereitgestellt über `CalcPrefsScope` (InheritedNotifier).
8. **Zahlensystem** mit ausgeschriebenen, lokalisierten Labels
   „Dozenal"/„Dezimal" (`settingsNumeralSystemDozenal/Decimal`, ×14 —
   seit dem Wegfall der Doz/Dez-Keypad-Tasten ist diese Zeile der
   primäre Basis-Schalter und muss selbsterklärend sein; sie gilt seit
   der Basis/System-Entkopplung für BEIDE Rechner). Die Segmente tragen
   den Welt-Farbcode (`optionColors` auf `_SegmentRow`: Dozenal violett,
   Dezimal grün, gewähltes Segment mit Eigenfarb-Rahmen) und
   9. **Winkelmodus** DEG/RAD/GRD — bedienen den **lebenden**
   `DozenalCalcState` über `CalcStateScope.maybeOf`
   (`lib/calc_scope.dart`); ohne Scope (Widget-Tests, die die Seite
   standalone pumpen) werden beide Zeilen ausgeblendet. Doz/Dez läuft
   über `handleClick(Doz()/Dez())` (wertbewahrende Basis-Umschaltung,
   gleicher Pfad wie früher die Keypad-Taste); der Winkelmodus über den
   Setter `setAngleMode` (die DRG-Taste zykelt stattdessen).

Wichtig: die Doz/Dez-Tasten existieren auf dem Keypad nicht mehr
(in keinem Profil) — die Zahlensystem-Zeile ist der einzige Zugang
zur Basis-Umschaltung. Im Profil „Einfach" fehlt zusätzlich die
DRG-Taste, dann ist auch der Winkelmodus nur hier erreichbar.

Verdrahtung in `main.dart`: `_DozenalCalcAppState` besitzt
`CalcPrefsNotifier` **und** `DozenalCalcState` (oberhalb des
Navigators, damit die Settings-Seite den State erreicht);
`_applyStartupPrefs` spielt die persistierten Werte nach `load()`
einmalig in den State ein, `_syncPrefsFromState` spiegelt
State-getriebene Änderungen (DRG-Zyklus auf dem Keypad, Doz/Dez via
Settings-`handleClick`) zurück in die Prefs. ARB: 9 neue Keys (`settingsTitle`, `settingsKeypadMode*`,
`settingsScope*`, `settingsNumeralSystemTitle`,
`settingsAngleModeTitle`) in allen 14 Sprachen; plus 4 Theme-Keys
(`settingsThemeTitle/Dark/Light/System`).

## Theming Hell/Dunkel (`lib/app_theme.dart`)

Kein Material-ThemeData-zentriertes Theming — die App ist durchgängig
custom-painted, deshalb läuft alles über eine **semantische Palette**:

- **`AppColors`** — const-Klasse mit zwei Instanzen: `AppColors.dark`
  (= exakt die historischen Hardcoded-Farben, Default) und
  `AppColors.light`. Slots statt Literale: `scaffoldBg`, `appBarBg`,
  `divider` (ex `2C2C2C`), `hairline` (ex `333333`), `cardFill`/
  `cardBorder`, `inputFill`, Text-Treppe `textPrimary/Secondary/
  Tertiary/Muted/Faint`, `link`, `accentGold`, Illustrations-Neutrale
  `illusLine/illusFaint/illusDot`, Tasten-Akzente (`op`, `equals`,
  `ac`) u. a. Light behält die egui-Akzent-Identität (Blau/Grün/Rot),
  nur abgedunkelt für Kontrast auf Hell.
- **`ThemeNotifier`** (`ThemeSetting.dark/light/system`, Default
  **Dunkel**): SharedPreferences-Key `theme_mode_v1`, unbekannte
  Strings fallen auf Dunkel zurück. `system` löst über
  `updatePlatformBrightness` auf (notifiziert nur im System-Modus).
  Bereitgestellt via **`ThemeScope`** (InheritedNotifier, in
  `main.dart` zuoberst).
- **`AppColors.of(context)`** — zentrale Leseroutine; ohne ThemeScope
  (Widget-Tests, `tool/`-Golden-Generatoren) fällt sie auf
  `AppColors.dark` zurück. Painter-Konvention: CustomPainters tragen
  ein `final AppColors colors`-Feld mit Default `AppColors.dark`,
  `shouldRepaint` vergleicht `old.colors != colors` (const-Identität
  macht das billig); kontextlose Helper bekommen `AppColors t` als
  Parameter durchgereicht.
- **MaterialApp** bekommt nur ein dünnes abgeleitetes ThemeData
  (brightness, `scaffoldBackgroundColor`, `appBarTheme`,
  `NoSplash.splashFactory`) aus der Palette — Quelle der Wahrheit
  bleibt `AppColors`.
- **Status-Bar-Icon-Brightness:** KEIN `SystemChrome` (siehe
  Edge-to-edge-Abschnitt) — eigener MethodChannel
  `app.weltanschauung.dozenal/system_bars`, `MainActivity.java`
  setzt `setAppearanceLightStatusBars/NavigationBars` via
  `WindowInsetsControllerCompat`. Dart-Seite guarded gegen Web/
  Nicht-Android + `MissingPluginException` und dedupliziert
  (`_sentLightBars`).
- **Bewusst theme-unabhängig:** Intro bleibt dunkel, Flag-Painter,
  `legal/*.html`, farbige Polygon-/Diagonal-Akzente in den
  Theorie-Illustrationen, roter Eingabe-Caret, der `0A84FF`-Button
  + weisses Icon-Backing in `AppRefCard`. Keypad-Ziffern folgen der
  Palette; ob sie als Custom-Glyphen oder konventionell gerendert
  werden, steuert der theme-unabhängige `keypadStyle`-Pref (siehe
  Rendering-Abschnitt).
