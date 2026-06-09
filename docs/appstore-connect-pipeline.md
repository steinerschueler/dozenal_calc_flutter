# App Store Connect mit Claude — wiederverwendbare Pipeline

Anleitung für **andere Claude-Instanzen / andere Apps**, um einen App-Store-Connect-
Release (iOS, optional iPadOS/watchOS/macOS) **automatisiert** durchzuziehen:
Build → Signieren → Upload, **Listing-Texte in N Sprachen ohne Copy-Paste**, und
**gerahmte, lokalisierte Marketing-Screenshots**. Erprobt an „Dozenal Calc"
(Flutter, 11 App-Store-Sprachen, 4 Plattformen). App-spezifische Werte sind als
`<PLATZHALTER>` markiert.

> Faustregel: **Claude baut, signiert, lädt hoch und pusht Texte/Screenshots.**
> **Interaktiv (nur Mensch im Browser):** Lizenzvereinbarung akzeptieren,
> Plattformen/Verträge aktivieren, App-Privacy-Fragebogen, **„Zur Prüfung einreichen"**.

---

## 0. Voraussetzungen (einmalig)

- **Xcode** + Command Line Tools; **CocoaPods** (`brew install cocoapods`).
- **fastlane** (`brew install fastlane`), **ImageMagick** (`brew install imagemagick`).
- Bei Bild-/Rahmen-Arbeit: `swiftc` (kommt mit Xcode) für den CoreText-Text-Renderer.
- **App-Store-Connect-API-Key** (App Store Connect → Users and Access → Integrations →
  App Store Connect API → Key mit Rolle *App Manager*/*Admin*): `.p8`-Datei, **Key-ID**,
  **Issuer-ID**. Liegt als Geheimnis **außerhalb des Repos** (z. B. `~/keys/AuthKey_<KEYID>.p8`).
- Für `altool`: die `.p8` auch nach `~/.appstoreconnect/private_keys/` kopieren.
- Für fastlane: einen kombinierten Key als JSON bauen (nicht ins Repo):
  ```bash
  python3 - <<'PY'
  import json, os
  p8=os.path.expanduser("~/keys/AuthKey_<KEYID>.p8")
  json.dump({"key_id":"<KEYID>","issuer_id":"<ISSUER>","key":open(p8).read(),"in_house":False},
            open(os.path.expanduser("~/keys/appstore_api_key.json"),"w"), indent=2)
  PY
  ```

---

## 1. Geräte-loses Build & Upload (kein Test-Gerät nötig)

Der iOS-Trick (kein registriertes Gerät): **unsigniert archivieren → beim Export signieren.**
```bash
flutter build ios --release --no-codesign           # nur bei Flutter
xcodebuild -workspace ios/Runner.xcworkspace -scheme Runner -configuration Release \
  -archivePath build/ios/archive/Runner.xcarchive -destination 'generic/platform=iOS' \
  archive CODE_SIGNING_ALLOWED=NO CODE_SIGNING_REQUIRED=NO
xcodebuild -exportArchive -archivePath build/ios/archive/Runner.xcarchive \
  -exportOptionsPlist ios/ExportOptions.plist -exportPath build/ios/ipa \
  -allowProvisioningUpdates -authenticationKeyPath ~/keys/AuthKey_<KEYID>.p8 \
  -authenticationKeyID <KEYID> -authenticationKeyIssuerID <ISSUER>
xcrun altool --validate-app -f build/ios/ipa/<APP>.ipa -t ios --apiKey <KEYID> --apiIssuer <ISSUER>
xcrun altool --upload-app  -f build/ios/ipa/<APP>.ipa -t ios --apiKey <KEYID> --apiIssuer <ISSUER>
```
`ExportOptions.plist`: `method=app-store-connect`, `signingStyle=automatic`, `teamID=<TEAMID>`,
`manageAppVersionAndBuildNumber=false`. `-allowProvisioningUpdates` legt fehlende App-IDs/Profile
(auch für eingebettete watchOS-Apps) automatisch an.

**macOS weicht ab:** Der „unsigniert archivieren"-Trick wendet die **Sandbox-Entitlements
NICHT** an → ASC-Reject 90296. macOS deshalb **signiert archivieren** (`archive
-allowProvisioningUpdates …` **ohne** `CODE_SIGNING_ALLOWED=NO`), Export liefert eine `.pkg`,
Upload mit `-t macos`. Verifizieren: `codesign -d --entitlements - <app>` zeigt `app-sandbox`.

---

## 2. Listing-Texte in N Sprachen — OHNE Copy-Paste (der große Zeitgewinn)

**Prinzip:** *Eine* menschenlesbare Quelle pro Sprache → ein Sync-Skript → die per-Locale-
Textdateien, die `fastlane deliver` erwartet → **ein** Push für alle Sprachen.

1. **Quelle** (single source of truth), z. B. `store/<…>/listing.<code>.md` + `whats-new-<ver>.md`.
   Strukturierte Abschnitte (Name, Untertitel, Werbetext, Keywords, Beschreibung) parsen.
2. **Sync-Skript** schreibt `fastlane/metadata/<asc-locale>/{name,subtitle,promotional_text,
   keywords,description,release_notes}.txt`. **Locale-Ordner = ASC-Codes**
   (de-DE, en-US, fr-FR, es-ES, it, ru, hi, ja, zh-Hans, zh-Hant, ar-SA — region nur wo nötig).
3. **`fastlane/Appfile`** (`app_identifier("<BUNDLE_ID>")`) + **`fastlane/Deliverfile`**:
   ```ruby
   app_identifier("<BUNDLE_ID>")
   skip_binary_upload(true)        # Binaries via altool, s. o.
   overwrite_screenshots(true)     # ACHTUNG: ersetzt den GANZEN Screenshot-Satz der Plattform
   force(true)                     # keine HTML-Preview-Rückfrage
   submit_for_review(false)        # nur Entwurf aktualisieren, Mensch reicht ein
   ```
4. **Push** (Texte für ALLE Sprachen auf einmal):
   ```bash
   dart run tool/sync_appstore_metadata.dart            # bzw. das Sync-Skript der App
   fastlane deliver --api_key_path ~/keys/appstore_api_key.json --platform ios --skip_screenshots true
   ```
   Für macOS zusätzlich `--platform osx`. **Gleiche Texte gelten für iOS und macOS.**

- **App-Name & Untertitel** liegen auf App-Ebene (über Plattformen geteilt); deliver setzt sie
  pro Locale aus `name.txt`/`subtitle.txt`. **Beschreibung/Keywords/Werbetext/Neuheiten** sind
  pro-Plattform-pro-Version. Kategorie/Preis/Altersfreigabe/App-Privacy bleiben in ASC (keine
  App-Level-Metadaten-Dateien erzeugen → deliver lässt sie unangetastet).
- **Namens-/Übersetzungs-Logik** app-spezifisch dokumentieren (Beispiel Dozenal Calc:
  `docs/store-listings.md` — Marken-Name für Latein-Schriften, lokales „Dutzend"-Lehnwort für
  Nicht-Latein). Übersetzungen gehören in die **Quelldateien**, nicht ad-hoc beim Sync.

---

## 3. Gerahmte, lokalisierte Marketing-Screenshots

**Stack:** echte Roh-Captures + Geräterahmen (frameit) + lokalisierter Text (CoreText) +
ImageMagick-Komposition auf **exaktes App-Store-Maß**.

1. **Roh-Captures** (Mensch oder via `xcrun simctl io <udid> screenshot`): pro Sprache die
   gewünschten App-Screens. Intro je Sprache zeigen: App-Locale setzen + Onboarding-Flag löschen
   (Flutter: `flutter.locale_v1` / `flutter.intro_seen_v<N>` in NSUserDefaults; macOS via
   `defaults write <BUNDLE_ID> …`, iOS-Sim via direktes Plist-Schreiben vor erstem Start).
2. **Geräterahmen:** `fastlane frameit download_frames` → `~/.fastlane/frameit/latest/`.
   Screenshot in den Bezel: `magick -size <frameWxH> xc:none <shot> -geometry <offset aus
   offsets.json> -composite <frame.png> -composite <out>`.
3. **Text mit korrekter Formung** (Arabisch-RTL, Devanagari-Ligaturen, CJK, Kyrillisch):
   ImageMagicks `pango:` ist teils kaputt. Robust ist ein **Swift/AppKit-Renderer** (CoreText =
   native macOS-Engine): `NSAttributedString` + `NSParagraphStyle.alignment = .natural`
   (→ RTL automatisch) + System-Font (Glyph-Fallback je Schrift automatisch), als transparentes
   PNG. Einmal `swiftc -O render_text.swift -o render_text`, dann pro String aufrufen.
4. **Komposition** auf Canvas in **exakter App-Store-Größe** (= das Endmaß; das Hintergrund-
   Canvas bestimmt die Ausgabegröße). Übersetzungen aus einer `i18n.json` (alle Sprachen).
   Layout-Hinweise: hohe Phones → Liste oben / Gerät unten (Geräteposition **adaptiv** unter dem
   gemessenen Textblock, sonst Überlappung); quadratische Tablets → mehrspaltige Liste; macOS
   Querformat → Fenster + Text seitlich; RTL spiegeln.
5. **Alpha entfernen** (App Store lehnt Transparenz ab): auf opakem Canvas komponieren bzw.
   `magick … -alpha remove -alpha off`. Verifizieren mit `sips -g hasAlpha`.

**Maße & Slots (Stand 2026):**
| Slot | Größe | Hinweis |
|---|---|---|
| iPhone 6,9″ | 1320×2868 | aktueller Pflicht-Slot |
| iPad 12,9″ | 2048×2732 | 13″-Captures (2064×2752) darauf skalieren |
| Apple Watch | 416×496 | **NICHT rahmen** — exakt diese Größe, sprachneutral |
| macOS | 2880×1800 | Querformat 16:10 |

**macOS billig lokalisieren:** App-Fenster **einmal** (z. B. englisch) capturen; den übersetzten
Marketing-Text je Sprache über dasselbe Fenster komponieren (Fenster-UI bleibt englisch — bei
Marketing-Bildern üblich). Alternativ Fallback nutzen: Sprachen ohne eigene macOS-Screenshots
zeigen automatisch die der Primärsprache.

**Upload-Layout:** Ordnernamen = ASC-Locale-Codes. **iPhone + iPad + Watch alle zusammen** in
`fastlane/screenshots/ios/<loc>/` (deliver sortiert per Pixelmaß in die Geräte-Slots); macOS
getrennt in `fastlane/screenshots/osx/<loc>/`.
```bash
fastlane deliver --api_key_path ~/keys/appstore_api_key.json \
  --platform ios --screenshots_path fastlane/screenshots/ios --skip_metadata true
fastlane deliver --api_key_path ~/keys/appstore_api_key.json \
  --platform osx --screenshots_path fastlane/screenshots/osx --skip_metadata true
```

---

## 4. Stolpersteine (alle real aufgetreten)

- **ASC „Server error got 500"** beim Screenshot-Upload → deliver hängt in Endlos-Retry
  („unlikely to be recovered"). **Prozess killen, frisch neu starten** (oft beim 2. Versuch ok);
  sonst pro Sprache hochladen / später erneut. Server­seitig, nicht die Bilder.
- **`overwrite_screenshots` ersetzt den GANZEN Plattform-Satz** → der `screenshots_path` muss
  **immer alle Geräte-Typen** enthalten (iPhone+iPad+Watch), sonst werden fehlende gelöscht.
- **macOS Universal Purchase:** Vor dem ersten macOS-Upload muss die **macOS-Plattform** im
  bestehenden App-Eintrag aktiviert sein, sonst `altool`: „Cannot determine the Apple ID …
  platform 'MAC_OS'". Wird **nicht** durch den Upload auto-angelegt.
- **macOS Pflicht-Plist-Keys:** `LSApplicationCategoryType` (ASC 90242) und
  `ITSAppUsesNonExemptEncryption=false` (überspringt die Export-Compliance-Frage).
- **Keine Transparenz** in Screenshots (App Store reject). **iPhone-Bilder >2:1** sind für den
  **Play Store** zu hoch (dort max 2:1) — nicht 1:1 wiederverwendbar.
- **Eingebettete watchOS-App:** als Target ins iOS-Xcode-Projekt, Embed-Phase **vor** Flutters
  „Thin Binary" (sonst Build-Cycle); `-allowProvisioningUpdates` erzeugt das Watch-Profil mit.

---

## 5. Was der Mensch im Browser tun muss

1. **Aktualisierte Apple Developer Program License Agreement akzeptieren** (sonst keine Einreichung).
2. **Plattformen/Verträge** aktivieren (z. B. macOS Universal Purchase, Paid-Apps-Vertrag).
3. **Build abwarten** (Processing ~15–60 min), dann in der Version auswählen.
4. **Export-Compliance** beantworten (bei App ohne Krypto/Netzwerk: „Keiner der genannten
   Algorithmen" / `ITSAppUsesNonExemptEncryption=false`).
5. **App-Privacy-Fragebogen** (bei keiner Datenerfassung: „Keine Daten erfasst").
6. **Screenshots/Metadaten prüfen** und **„Zur Prüfung einreichen"** (iOS und macOS getrennt).
