# Roh-Screenshots (Quellmaterial für Marketing-Bilder)

Unbearbeitete Simulator-/Fenster-Aufnahmen, die als **Quelle** für die gerahmten
App-Store-Marketing-Screenshots dienen (Build 16, v1.3.0). Aus diesen lassen sich
die fertigen Bilder jederzeit neu rahmen/beschriften, **ohne erneut aufnehmen zu
müssen** — siehe [`../../../tool/screenshots/`](../../../tool/screenshots/) und
[`../../../docs/appstore-connect-pipeline.md`](../../../docs/appstore-connect-pipeline.md).

## Inhalt
- `iphone/` — iPhone 17 Pro Max, **1320×2868**. Intro (Glyphen-Folie 2) je Sprache
  (de/en/fr/es/it/ru/hi/ja/zh-Hans/zh-Hant/ar) + `calc-1over15` (1÷15, exakte Periode) + `converter`.
- `ipad/` — iPad Pro 13″, **2064×2752** (für den 12,9″-Slot auf 2048×2732 skaliert). Gleiche Motive;
  **Reihenfolge weicht ab: `ja` wurde zuletzt aufgenommen** (Dateinamen sind sprechend, Reihenfolge egal).
- `watch/` — Apple Watch Series 11 46 mm, **416×496**. `glyphs` (Ziffern-Tastatur, `10−2=A`) +
  `functions` (Funktionstasten). Werden **nicht** gerahmt (App Store verlangt exakt diese Größe).
- `macos/` — macOS-Fenster, 1824×1488. `intro` (englisch) + `calc-1over15` + `converter`.
  macOS wird je Sprache nur mit **übersetztem Overlay** über dieselbe englische Fenster-Aufnahme komponiert.

Die **fertig gerahmten** Bilder sind Build-Artefakte (regenerierbar) und werden nicht versioniert
(landen unter `fastlane/screenshots/`, gitignored).
