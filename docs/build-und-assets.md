# Build und Assets

## Release-Builds

```bash
flutter build apk --release
JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64 flutter build appbundle --release
flutter build web --release
```

Der Play-Store-Appbundle-Build braucht explizit Java 17 (Java 21 auf dieser
Maschine zerbricht Gradle). Android-Signing liest `android/key.properties` —
fehlt die Datei, fällt der Build still auf Debug-Signing zurück.

**Nach jedem Release-Build** mehrsprachige Play-Console-Versionshinweise
verfassen — ein <500-Zeichen-Block (Play-Limit) pro Listing-Locale für die
**zwölf** Play-Console-Release-Notes-Locales (DE, EN, FR, ES, IT, FA, RU, HI,
ZH, ZH-Hant, JA, AR; Play-Tags de-DE/en-US/fr-FR/es-ES/it-IT/fa-AF/ru-RU/
hi-IN/zh-CN/zh-TW/ja-JP/ar — massgeblich ist die `_localeMap` in
`tool/sync_play_listings.dart`). Nur Irisch (GA) und Walisisch (CY) haben dort
keinen Slot. Als `build<N>-release-notes.txt`
im Projekt-Root ablegen, dann via Gradle Play Publisher pushen:

```bash
dart run tool/sync_play_listings.dart   # store/play-store/listing.*.md + build<N>-release-notes.txt → play/
./gradlew publishListing                # nur Texte/Grafiken
./gradlew publishBundle                 # AAB-Upload (Track: internal, Status: DRAFT)
```

`publishBundle` lädt nur hoch (AAB muss schon gebaut sein), landet als Entwurf
auf `internal` und muss in Play Console manuell promotet werden. Vollständiger
Workflow — Notes-Block-Format + Template, `-Pplay.track`-Override, Credentials
(`~/keys/play-publisher.json`), Sync-Source-Layout:
[`docs/release-workflow.md`](release-workflow.md). App-Namen-Konvention
pro Locale: [`docs/store-listings.md`](store-listings.md).

## Asset-Regenerierung

`assets/icon.png`, `assets/compass.png` und das Play-Store-Feature-Graphic
werden programmatisch über Golden-Style-Tests in `tool/` erzeugt:

```bash
flutter test tool/generate_icon.dart            # → assets/icon.png
flutter test tool/generate_compass.dart         # → assets/compass.png
flutter test tool/generate_feature_graphic.dart # → assets/feature_graphic.png
dart run flutter_launcher_icons                 # → Plattform-Icons
dart run flutter_native_splash:create
```

Die erzeugten PNGs sind versionierte Build-Outputs und gehören mit
committed — sie werden zur Laufzeit aus `assets/` geladen, nicht im Build
neu generiert. Nach `flutter_launcher_icons` / `flutter_native_splash`
auch die jeweils gepatchten Plattform-Resources (`android/app/src/main/res/`,
`ios/Runner/Assets.xcassets/`, …) prüfen und mitnehmen.

## Store-Screenshots (per-Locale, im Repo)

`store/screenshots/` hält die per-Locale-Sets: `play/<locale>/` (11 Locales
× 3 Phone-PNGs) und `play-tablet/<locale>/` (11 × 4) — fa/ga/cy haben keine
Ordner und behalten in Play Console den Bestand; dazu `ios/`, `linux/` und
die ungerahmten Captures in `raw/`. `tool/sync_play_listings.dart` synct
die Play-Sets zusammen mit den Listings in die Play-Grafik-Slots.
Erzeugung: adb-Capture vom Gerät (siehe `docs/local/device-testing.md`,
lokal/gitignored) plus Rahmen-/Overlay-Pipeline in `tool/screenshots/`
(`i18n.json` als Text-Quelle, Python+Swift; Vollanleitung
[`docs/appstore-connect-pipeline.md`](appstore-connect-pipeline.md)).
Eine frühere flutter_test-Generator-Pipeline wurde wegen unzuverlässigem
`.ttc`-Font-Loading (CJK-Tofu) verworfen — Details + Begründung:
[`docs/store-listings.md`](store-listings.md).
