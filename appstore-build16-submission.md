# App Store Connect — Einreichung Build 16 (Version 1.3.0)

Drei Plattformen, **ein** App-Store-Eintrag (`app.weltanschauung.dozenal`):
iOS/iPadOS (bestehend) · **Apple Watch** (in die iOS-App eingebettet, kein
eigener Eintrag) · **macOS** (Universal Purchase, gleiche Bundle-ID).

Was Claude erledigt hat:
- **iOS + eingebettete Watch**: gebaut, signiert, **hochgeladen** (UPLOAD
  SUCCEEDED, Delivery-UUID `91315778-2220-486c-a89c-35824b08867b`).
- **macOS**: `Dozenal Calc.pkg` gebaut + signiert. Upload **blockiert** — siehe
  Schritt 1b (App-Store-Connect hat noch keine macOS-Plattform für die
  Bundle-ID; altool: „Cannot determine the Apple ID … platform 'MAC_OS'").

Die folgenden Schritte sind **interaktiv im Browser/Xcode** und nur von dir
machbar.

## 0. Zwingend zuerst: neue Lizenzvereinbarung akzeptieren

developer.apple.com → Account → **Agreements** → das aktualisierte Apple
Developer Program License Agreement (8. Juni 2026) akzeptieren. Ohne Zustimmung
lassen sich die Builds nicht zur Prüfung einreichen.

## 1a. iOS-Build abwarten (Processing)

App Store Connect → Apps → **Dozenal Calc**. Build 16 (iOS) durchläuft erst
„Processing" (~15–60 min), dann ist er in der Build-Auswahl wählbar.
Export-Compliance ist über `ITSAppUsesNonExemptEncryption=false` beantwortet —
keine Rückfrage.

## 1b. macOS-Plattform aktivieren (Universal Purchase) — Voraussetzung für den macOS-Upload

Der macOS-Upload schlägt fehl, **solange** der App-Eintrag keine macOS-Plattform
hat. Einmalig einrichten:
1. App Store Connect → **Dozenal Calc** → oben/links beim App-Namen das
   Plattform-Menü bzw. **„(+)"** → **macOS hinzufügen** (Universal Purchase;
   möglich, weil die Bundle-ID `app.weltanschauung.dozenal` mit der iOS-App
   übereinstimmt).
2. Danach den macOS-Upload erneut anstoßen (das `.pkg` liegt fertig in
   `build/macos/pkg/`):
   ```bash
   xcrun altool --validate-app -f "build/macos/pkg/Dozenal Calc.pkg" -t macos \
     --apiKey RMAP26R27U --apiIssuer df8ff114-f196-4783-a030-bc8be4ab3434
   xcrun altool --upload-app   -f "build/macos/pkg/Dozenal Calc.pkg" -t macos \
     --apiKey RMAP26R27U --apiIssuer df8ff114-f196-4783-a030-bc8be4ab3434
   ```
   (Sag mir Bescheid, sobald die Plattform aktiv ist — ich übernehme Validierung
   + Upload dann.)
3. Build 16 (macOS) durchläuft „Processing", dann unter dem macOS-Tab wählbar.

## Metadaten + Screenshots: automatisch via fastlane deliver

Listing-Texte (11 Sprachen) und Screenshots müssen **nicht** von Hand pro
Sprache/Plattform eingetippt werden — `fastlane deliver` pusht sie aus dem Repo
(Details: `docs/release-workflow.md`). Texte sind bereits generiert
(`fastlane/metadata/`), je ein Watch- und ein Mac-Screenshot liegen bereit:

```bash
dart run tool/sync_appstore_metadata.dart            # store/app-store/*.md → fastlane/metadata/
fastlane deliver --api_key_path ~/keys/appstore_api_key.json \
  --platform ios --screenshots_path fastlane/screenshots/ios   # Texte + Watch-Screenshot
fastlane deliver --api_key_path ~/keys/appstore_api_key.json \
  --platform osx --screenshots_path fastlane/screenshots/osx   # Texte + Mac-Screenshot (erst nach Schritt 1b!)
```

`submit_for_review` ist aus → deliver aktualisiert nur die (vorhandene,
editierbare) Version 1.3.0, reicht nicht ein. Lege die Version 1.3.0 ggf. vorher
in App Store Connect an. Sag mir Bescheid, dann pushe ich.

## 2. iOS-Version 1.3.0

1. Plattform iOS → **(+) Version oder Plattform** → `1.3.0`.
2. **Neue Funktionen** + Beschreibung/Keywords: via `fastlane deliver --platform
   ios` (oben) — oder manuell aus `store/app-store/whats-new-1.3.0.md`.
3. **Build** 16 auswählen.
4. **Apple-Watch-Screenshot**: liegt bereit in
   `fastlane/screenshots/ios/<locale>/01_watch_keypad_416x496.png` (416×496,
   Series-11-46 mm; zeigt `10−2 = A`). deliver lädt ihn in den „Apple Watch"-
   Slot. Weitere Größen optional.
5. **Zur Prüfung einreichen**.

## 3. macOS-Version 1.3.0 (Plattform-Tab macOS)

1. macOS-Tab → **(+) Version** → `1.3.0` (erst nach Schritt 1b — macOS-Plattform
   aktiv).
2. **Texte** via `fastlane deliver --platform osx` (oben).
3. **Build** 16 (macOS) auswählen (nach Upload aus Schritt 1b).
4. **macOS-Screenshot**: liegt bereit in
   `fastlane/screenshots/osx/<locale>/01_keypad_2880x1800.png` (2880×1800).
5. **App-Sandbox/Privacy**: kein Netzwerk, kein Tracking → „Daten werden nicht
   erfasst" (gleiche Antworten wie iOS).
6. **Zur Prüfung einreichen**.

## 4. Nichts vergessen

- **Watch-Screenshots** sind der häufigste Reject-Grund bei eingebetteten
  Watch-Apps — ohne sie wird die iOS-Version u. U. zurückgewiesen.
- macOS und iOS sind getrennte Reviews, können aber gleichzeitig laufen.
- Versionsnummern: beide Plattformen + Watch tragen 1.3.0 (Build 16) — synchron.

## Wieder-Bauen (falls ein Build neu nötig ist)

```bash
# iOS + eingebettete Watch
flutter build ios --release --no-codesign
xcodebuild -workspace ios/Runner.xcworkspace -scheme Runner -configuration Release \
  -archivePath build/ios/archive/Runner.xcarchive -destination 'generic/platform=iOS' \
  archive CODE_SIGNING_ALLOWED=NO CODE_SIGNING_REQUIRED=NO
xcodebuild -exportArchive -archivePath build/ios/archive/Runner.xcarchive \
  -exportOptionsPlist ios/ExportOptions.plist -exportPath build/ios/ipa \
  -allowProvisioningUpdates -authenticationKeyPath ~/keys/AuthKey_RMAP26R27U.p8 \
  -authenticationKeyID RMAP26R27U -authenticationKeyIssuerID df8ff114-f196-4783-a030-bc8be4ab3434
xcrun altool --upload-app -f build/ios/ipa/dozenal_calc_flutter.ipa -t ios \
  --apiKey RMAP26R27U --apiIssuer df8ff114-f196-4783-a030-bc8be4ab3434

# macOS (App Store, .pkg) — analog mit macos/Runner.xcworkspace,
# macos/ExportOptions.plist, build/macos/pkg, -t macos.
```
