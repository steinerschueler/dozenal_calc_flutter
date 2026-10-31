# Entwicklung

Aus dem früheren Gesamtdokument übernommen. Verweise wie «oben» oder «siehe …-Abschnitt» meinen die Themenseiten, die
[architektur.md](architektur.md) auflistet.

```bash
flutter pub get
flutter run                   # aktuelle Plattform
flutter run -d chrome         # Web
flutter analyze               # was CI ausführt
flutter test                  # gesamte Suite (592 Tests in 34 Dateien, Stand 31.10.2026)
flutter test test/rational_test.dart           # einzelne Datei
flutter test --plain-name "parses 1/7"         # einzelner Test per Name
```

Test-Routing (für gezielte Edits):
- `state_test.dart` — Orchestrator inkl. Handler-Pfade, mit Abstand die
  grösste Datei.
- `rational_test.dart` + `rat_parser_test.dart` — exakte Rational-Schiene.
- `expression_test.dart` — f64-Auswerter inkl. `resolvePostfix`.
- `dozenal_converter_test.dart` — Doz ↔ Dez-Konvertierung.
- `keypad_layout_test.dart` — Orientierungs-Dispatch, Repaint-Verhalten
  und die Keypad-Modi/-Profile (Overlay/Scroll, Alle/Einfach).
- `long_press_popup_test.dart` — Langdruck-Popups: Host-Map, beide
  Auswahl-Gesten (Gleiten+Loslassen / Loslassen+Tippen),
  Tap-outside-Dismiss, a11y-Hold-Hint, EXP-statt-Doz/Dez in Set 10.
- `glyph_style_test.dart` — `GlyphStyleNotifier`: beide unabhängigen
  Prefs (Display/Keypad), Persistenz, Fallbacks, `keypadStyleOf`.
- `calc_prefs_test.dart` — `CalcPrefsNotifier`: Defaults, Persistenz-
  Roundtrip, Fallback bei unbekannten Strings, Notify-Verhalten.
- `app_theme_test.dart` — `ThemeNotifier` (Defaults, Persistenz,
  System-Modus-Auflösung), `AppColors.of`-Fallback, Light-Boot-Smoke
  der ganzen App.
- `settings_page_test.dart` — Einstellungen-Seite: Zeilen-Rendering,
  Segment-Toggles, Sichtbarkeit der State-Zeilen ohne `CalcStateScope`.
- `edge_cases_test.dart` — Grenzfall-Sammler über die Module hinweg.
- `unit_convert_test.dart` + `converter_state_test.dart` — Einheitenrechner:
  SI-Drehscheibe/Faktoren/Breakdown bzw. Compound-Eingabe + Cursor; dazu
  die Resultat-Brücke (`insertCalcAns`/`ansForBridge`) und das Überleben
  der Pending-Zahl beim Kategorienwechsel.
- `calc_pager_test.dart` — Rechner↔Umrechner-Pager: Swipe in beide
  Richtungen, Tastatur-Routing nach aktiver Seite, Ans/CONV-Roundtrip
  durchs UI (Umrechner UND Werterechner inkl. CONV-Fallback),
  Info-Listen-Eintrag → Pager-Wechsel.
- `converter_keypad_layout_test.dart` — Umrechner-Layout über Seitenverhältnisse.
- `asset_convert_test.dart` + `asset_state_test.dart` — Werterechner (dritte
  Pager-Seite, Edelmetalle/Währungen): exakte Metall-/Währungsfaktoren bzw.
  Klasse→Gattung→Einheit-Drilldown, `=`-Zyklus, Basis, Wertmodus,
  Resultat-Brücke (`insertCalcAns`/`ansForBridge` inkl. Wertmodus). Dazu
  `asset_keypad_layout_test.dart` (Höhen-Regime × Drill-Ebenen ×
  Seitenverhältnisse + Tile-Tap-Drilldown). `calc_pager_test.dart` deckt
  zusätzlich die dritte Seite ab (Swipe, Tastatur-Routing, 3-Punkte-Peek).
- `cursor_tap_test.dart` — Tipp-Cursor (Hauptrechner-Hit-Test + `moveCursorTo`).
- `recommendations_test.dart` — „Empfehlungen": Kapitel-Dispatcher plus
  Struktur-Treue aller 14 Sprachen (7 Kapitel, Pro-/Contra-Zählung je Rechner,
  URL-Menge identisch zur deutschen Vorlage), übersetzte Titel,
  `RecChapterPage`-Rendering.
- `rate_store_test.dart` + `rates_page_test.dart` — Werterechner Phase 2:
  Snapshot-Defaults, pivot-geroutete Konversion, SharedPreferences-Overrides
  bzw. Kurs-Editor (Override schreiben, Reset pro Zeile/global).
- `price_history_test.dart` + `price_chart_test.dart` — Preiskurve:
  log10/Viewport/LTTB/Ticks (reine Mathematik) bzw. Chart-Widget,
  Quellen-Seite und der „Kurve"-Keypad-Swap.
- `werte_docs_test.dart` — Struktur-Treue von Werterechner-Handbuch
  (`assetManualChapters`, 6 Kapitel) und Wertetheorie über alle 14 Tags.
- `manual_test.dart` — Handbuch-Dispatcher (`manualChapters` ×14) +
  Render-Smoke der deutschen Kapitel.
- `unit_descriptions_test.dart` — Langdruck-Einheiten-Beschreibungen:
  jede Katalog-Einheit × jede Sprache, echte Übersetzung, DE-Fallback.
- `unit_theory_count_test.dart` + `converter_intro_test.dart` —
  Einheitentheorie-Seite: „Anzahl"-Karte bzw. Intro-Tab (Prosa + Quellen
  ×14, echte Übersetzung, Fallback auf Deutsch).
- `converter_display_test.dart` — Umrechner-Display-Glyphen:
  custom/conventional/ohne Scope, Per-Zellen-Glyph-Gating (Ziffern ja,
  Einheiten-Buchstaben nie) + Render-Smokes.
- `function_keys_test.dart` — Funktionstasten-Block: M+/M−, x²/±,
  ln/eˣ/log₁₂, nCr/nPr, wissenschaftliche Notation.
- `result_format_test.dart` — Präsentations-Helfer aus
  `logic/result_format.dart` (Clipboard-String, Cross-Base-Referenz).
- `watch_parity_test.dart` — Dart-Hälfte des Watch-Paritäts-Netzes:
  replayed `test/fixtures/watch_parity_fixtures.json` gegen `evalF64`;
  Swift-Gegenstück `watch/Tests/CalculatorParityTests.swift` (nur mit
  Xcode; Scope = Schnittmenge beider Auswerter).

CI (`.github/workflows/ci.yml`) ist auf Flutter 3.47.9 stable festgenagelt
und führt `pub get --enforce-lockfile`, `analyze` und `test` aus. Das Flutter-SDK selbst pinnt transitive Abhängigkeiten (etwa `cli_util`, `test_api`, `xml`) auf Versionen, die `pub outdated` flaggt — das ist
erwartet, kein Bug. Nach jedem Flutter-Minor-Stable-Release erneut prüfen.

## Manuelles Testen auf physischem Gerät

Grundprinzip: adb-Loop (Gerät finden → bauen/installieren → per
`input tap/swipe` ansteuern → `screencap` → `Read`); bei
State-Wechsel-Prüfungen (Sprache/Orientierung/Theme/Tastenmodus) **beide**
Zustände als Datei capturen und via `SendUserFile` nebeneinander zeigen, nie
Spot-Check zurückgeben.

Die **vollständige Anleitung** (Geräte-Quick-Reference mit Serials/Auflösung,
Entsperr-Rezepte mit Pixelkoordinaten, Install-Konflikt-Lösung, udev-Reflex)
liegt **bewusst nur lokal** in `docs/local/device-testing.md` — diese Datei ist
**gitignored und gehört nicht ins (ggf. veröffentlichte) Repo**, weil sie
gerätespezifische und persönliche Daten enthält. Sie ist auf der Arbeits-
maschine vorhanden; bei Gerätetests dort nachschlagen. Beim Anlegen neuer
gerätebezogener Test-Doku ebenfalls dort (gitignored) ablegen, nie in
versionierten Dateien.
