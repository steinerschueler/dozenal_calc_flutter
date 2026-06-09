# Marketing-Screenshot-Pipeline (App Store)

Erzeugt **gerahmte, lokalisierte** App-Store-Screenshots (iPhone/iPad/macOS) in allen
Sprachen aus Roh-Captures + Übersetzungen. Vollständige Erklärung + Voraussetzungen +
Upload via `fastlane deliver`: **[`../../docs/appstore-connect-pipeline.md`](../../docs/appstore-connect-pipeline.md)**.

## Dateien
- `i18n.json` — Marketing-Texte (Intro-/Umrechner-Schlagzeile, Rechner-Titel + 13 Funktions-
  Punkte) in 11 Sprachen. **Single source of truth** für die Overlay-Texte.
- `render_text.swift` — CoreText/AppKit-Text-Renderer (formt Arabisch-RTL, Devanagari, CJK,
  Kyrillisch korrekt; `pango:` ist im lokalen ImageMagick defekt). Einmal kompilieren:
  `xcrun swiftc -O tool/screenshots/render_text.swift -o /tmp/render_text`.
- `produce_ios.py` / `produce_ipad.py` / `produce_macos.py` — Komposition pro Plattform
  (Geräterahmen aus `~/.fastlane/frameit/latest/` + Text + ImageMagick), Ausgabe auf exaktes
  App-Store-Maß.

## Konventionen / Annahmen
- **Staging in `/tmp`** (alles ephemeral, nicht im Repo): Roh-Captures nach `/tmp/raw_*` bzw.
  `/tmp/frame_work*` aufbereiten; Output nach `/tmp/framed/<platform>/<locale>/`; Renderer als
  `/tmp/render_text`. Die Skripte sind **Templates** dieses Laufs (Build 16) — Pfade ggf. anpassen.
- Endmaße: iPhone 1320×2868 · iPad 2048×2732 · macOS 2880×1800. Watch (416×496) wird **nicht**
  gerahmt (separat, nackt).
- Upload-Ordner = ASC-Locale-Codes; iPhone+iPad+Watch zusammen unter `fastlane/screenshots/ios/`,
  macOS unter `fastlane/screenshots/osx/`. `fastlane/{metadata,screenshots}` sind gitignored.
