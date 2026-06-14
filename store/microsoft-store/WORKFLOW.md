# Microsoft Store — kompletter Veröffentlichungs-Ablauf (Dozenal Calc)

Vollständige, erprobte Schritt-für-Schritt-Anleitung, um **Dozenal Calc** auf
Windows zu bauen und im **Microsoft Store** zu veröffentlichen. Enthält die
nicht-offensichtlichen Stolpersteine, die beim ersten Mal (Juni 2026) Zeit
gekostet haben. Eine künftige Instanz/Person soll damit ohne Umwege durchkommen.

> **Kontext-Identität (Partner Center → Product identity)**
> | Wert | |
> |---|---|
> | App | Dozenal Calc |
> | Store ID | `9N4M1XLPLP0N` |
> | Seller ID | `94980040` |
> | Windows Publisher ID | `steinerschüler` |
> | Package/Identity/Name | `steinerschler.DozenalCalc` |
> | Package/Identity/Publisher | `CN=59EEE4E1-9593-4B2E-B30A-C93DF902109B` |
> | PublisherDisplayName | `steinerschüler` |

---

## 0. Voraussetzungen (Windows-Build-Umgebung)

Einmalig auf dem Windows-Rechner:

1. **Flutter** muss neu genug sein für das Projekt-SDK (`pubspec.yaml` →
   `environment: sdk`). Stand 2026: Dart ≥ 3.11.5 nötig → `flutter upgrade`.
2. **Visual Studio 2022** mit Workload **„Desktop development with C++"**
   (Pflicht für native Windows-Builds):
   ```
   winget install --id Microsoft.VisualStudio.2022.Community --override "--quiet --wait --add Microsoft.VisualStudio.Workload.NativeDesktop --includeRecommended" --accept-package-agreements --accept-source-agreements
   ```
3. **Developer Mode** aktivieren (für Plugin-Symlinks). Als Admin:
   ```
   New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock" -Force | Out-Null
   Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock" -Name AllowDevelopmentWithoutDevLicense -Value 1 -Type DWord
   ```
4. **Windows-Plattform-Ordner** erzeugen (falls `windows/` fehlt):
   ```
   flutter create --platforms=windows --org app.weltanschauung .
   ```
   ⚠️ Danach `test/widget_test.dart` löschen, falls neu angelegt — die
   Boilerplate kompiliert nicht gegen diese App.
5. `flutter doctor` muss „No issues" für Visual Studio zeigen.

`flutter build windows --release` →
`build\windows\x64\runner\Release\dozenal_calc_flutter.exe` (+ DLLs + `data\`).
Der ganze `Release`-Ordner ist die portable App.

---

## 1. MSIX-Paket für den Store bauen

Konfiguration steht in `pubspec.yaml` unter `msix_config` (dev_dependency
`msix`). `store: true` → unsigniert, der Store signiert beim Ingest.

```
dart run msix:create --store
```
→ `build\windows\x64\runner\Release\dozenal_calc_flutter.msix` (x64, ~22 MB).

**Pro Einreichung:** `msix_version` in `pubspec.yaml` erhöhen (4-teilig,
letzte Stelle = Revision = **0**, z. B. `1.5.1.0` → `1.5.2.0`), dann neu bauen.

Das `.msix` wird in der Submission unter **Packages** hochgeladen.

---

## 2. Store-Listings (Texte + Bilder) — der knifflige Teil

Im Microsoft Store hat **jede Sprache** ein eigenes Listing. Vorgehen über
**Import and export listings** (Bulk-CSV), nicht alles per Hand.

### 2a. Format der Export/Import-CSV verstehen

Partner Center exportiert eine CSV im Format **Feld-pro-Zeile /
Sprache-pro-Spalte**:
- Spalten: `Field`, `ID`, `Type (Type)`, `default`, dann **eine Spalte pro
  Sprache** (z. B. `en-us, en, de, fr-fr, es-es, it, ru, ja, hi, fa, ar,
  zh-hans, zh-hant, cy, ga`). Für Dozenal Calc: **15 Sprachspalten** (Englisch
  doppelt: `en-us` + `en`).
- Zeilen (≈ 453): `Description` (ID 2), `Title` (ID 4), `ShortDescription`
  (8), `ReleaseNotes` (3), `DesktopScreenshot1..20` (100..119),
  `StoreLogo720x1080` (600), `StoreLogo1080x1080` (601), `StoreLogo300x300`
  (602), Xbox-/Trailer-Felder usw.
- Bildfelder sind Typ **„Relative path (or URL to file in Partner Center)"**.

### 2b. Texte (Description) befüllen

Quelle: die Play-Store-Listings in `store/play-store/` — aber **HTML-Tags
entfernen** (`<b>`…`</b>`), denn das MS-Store-Description-Feld ist Plain Text.
Pro Sprache als `store/microsoft-store/listing.<locale>.md` abgelegt (lesbare
Quelle). Walisisch (`cy`) und Irisch (`ga`) hatten keine Play-Store-Vorlage →
neu aus dem Englischen übersetzt.

`Title` = global **„Dozenal Calc"** (kommt aus dem reservierten Namen / MSIX —
**kein** per-Sprache-Titel im MS Store, anders als bei Play).

### 2c. ⚠️ BILDER: der entscheidende Stolperstein

**Was NICHT funktioniert:** Bilder als **relative Pfade** in die CSV schreiben
und CSV+Bilder als ZIP/Ordner importieren. Der Browser-Import akzeptiert das
**nicht** — er bricht mit „We couldn't import listings for the following
languages because of errors in your file" ab. Das „Relative path"-Feld ist nur
für andere Tools, nicht den Web-Import.

**Was funktioniert — Upload-once-then-propagate-URLs:**
1. Bilder **einmal** im **englischen** Listing über das Web-UI hochladen
   (Screenshots + die 3 Store-Logos). Speichern.
2. Listings **erneut exportieren** → jetzt stehen in der `en-us`-Spalte die
   echten **Partner-Center-URLs** (`https://developer.microsoft.com/.../...`).
3. Skript `propagate_urls.ps1` kopiert diese URLs in **alle** Sprachspalten →
   `listingData-URLS.csv` (reine CSV, keine Bilddateien mehr).
4. `listingData-URLS.csv` als **reine CSV** (kein ZIP) importieren.

### 2d. ⚠️⚠️ NACH dem Import: jede Sprache öffnen + speichern

**Der wichtigste, am wenigsten offensichtliche Schritt.** Nach erfolgreichem
CSV-Import zeigen die Sprachen weiterhin **„Incomplete"** — obwohl Description
und Bilder korrekt eingespielt sind. Grund: Partner Center validiert/committet
ein importiertes Sprach-Listing erst, wenn man es **manuell öffnet, ganz nach
unten scrollt und auf „Save" klickt**. Erst dann springt es auf **„Complete"**.

➡️ Also für **jede** der 15 Sprachen: Listing öffnen → nach unten scrollen →
**Save**. (Kein Fehler, keine fehlenden Felder — nur dieser Commit-Klick fehlt.)

Wenn nach einem Import „nur eine Sprache komplett" ist, ist das **kein**
Import-Fehler — die übrigen brauchen nur noch den Öffnen+Speichern-Schritt.

---

## 3. Restliche Submission-Felder

- **Packages:** `dozenal_calc_flutter.msix` hochladen.
- **Pricing and availability:** Preis (kostenlos), Märkte.
- **Properties:** Kategorie **Education** (sekundär Productivity/Tools).
  - **System requirements** Memory / Processor / Graphics / Video Memory /
    DirectX → **Not specified** (App hat keine besonderen Anforderungen).
  - **Minimum hardware:** möglichst **leer** lassen (App ist per Touch/Tastatur
    bedienbar; „Maus = Pflicht" würde reine Touch-Geräte ausschließen).
- **Age ratings:** Fragebogen ausfüllen → „Everyone".
- **Search terms** (max 7/Sprache, je ≤ 30 Zeichen): siehe `README.md`.

Dann **Submit** → Zertifizierung (Stunden bis ~1 Tag).

### 3a. ⚠️ Restricted capability `runFullTrust` — Begründung nötig

Bei der Submission meldet Partner Center die **restricted capability
`runFullTrust`** im `Package.appxmanifest` und verlangt eine Begründung in
einem Textfeld. **Das ist normal und erwartet** — das `msix`-Tool fügt
`runFullTrust` automatisch hinzu, weil Flutter-Desktop-Apps klassische
Win32-Prozesse sind, die als MSIX verpackt werden. **Nicht entfernen** (sonst
läuft die App nicht). Approval wird für Desktop-Apps routinemäßig erteilt.

Fertiger Begründungstext (Englisch, zum Einfügen ins Feld „Why do you need the
runFullTrust capability…"):

```
Dozenal Calc is a desktop application built with Flutter (a native C++/Win32
runner hosting the Flutter engine) and packaged as MSIX. Like every packaged
classic Win32 desktop app, the Flutter/MSIX toolchain automatically declares
the runFullTrust capability so the application can run as a standard full-trust
desktop process. The capability is required purely by this packaging model, not
to access any protected or system-level functionality.

The app is an offline scientific calculator. It does not use runFullTrust to
perform any privileged operations: it requires no administrator elevation, makes
no network connections, installs no services or drivers, and accesses no user
files outside its own app-data storage. It only persists its own settings via
the standard shared_preferences API and opens external links (such as the
privacy policy) in the user's default browser. It accesses no camera,
microphone, location, contacts, or other sensitive resource.

In summary, runFullTrust is present solely because Flutter desktop apps are
full-trust Win32 processes packaged as MSIX; it is not used for any elevated or
restricted behavior.
```

---

## 4. Bild-Spezifikationen (Referenz)

| Bild | Feld | Maß | Hinweis |
|---|---|---|---|
| Desktop-Screenshot | `DesktopScreenshot1..20` | ≥ 1366×768, .png | unsere: 1854×1048 |
| 9:16 Poster art | `StoreLogo720x1080` | exakt 720×1080 | Haupt-Logo Win10/11, Xbox-Pflicht |
| 1:1 Box art | `StoreLogo1080x1080` | exakt 1080×1080 | Fallback-Logo |
| 1:1 App tile icon | `StoreLogo300x300` | exakt 300×300 | überschreibt Paket-Icon |

Alle: .png, < 50 MB. Store-Logos brauchen **exakte** Maße; Screenshots nur ein
Minimum. Quelle der Bilder: `store/screenshots/linux/*.png` (Desktop) bzw.
generiert aus `assets/icon.png`.

---

## 5. Skripte in diesem Ordner (`store/microsoft-store/`)

Alle PowerShell-Skripte enthalten **nur ASCII-Literale** (Windows PowerShell
5.1 liest `.ps1` als ANSI → nicht-lateinische Literale würden zerstört). Die
mehrsprachigen Texte kommen zur Laufzeit als UTF-8 aus den `.md`-Dateien.

| Skript | Zweck |
|---|---|
| `build_csv.ps1` | (früh) baut eine einfache Language+Description-CSV aus den `.md` |
| `fill_template.ps1` | füllt die Description-Zeile der exportierten Vorlage je Sprache → `listingData-FILLED.csv` |
| `gen_logos.ps1` | erzeugt die 3 Store-Logos (300², 1080², 720×1080-Poster mit Icon + Name) |
| `build_listing_package.ps1` | setzt Screenshot- + Logo-**Dateinamen** in die CSV (für den ZIP-Versuch — **funktioniert nicht** für den Web-Import, siehe 2c) |
| `propagate_urls.ps1` | **der funktionierende Weg:** kopiert die Bild-**URLs** aus `en-us` in alle Sprachen → `listingData-URLS.csv` |

**Empfohlener Weg für ein Update der Listings:**
1. `fill_template.ps1` (Texte) — oder direkt in der vorhandenen URL-CSV editieren.
2. Bilder nur bei Änderung neu: einmal im UI hochladen, exportieren,
   `propagate_urls.ps1`.
3. `listingData-URLS.csv` importieren → **jede Sprache öffnen + speichern**.

---

## 6. Schnell-Checkliste für die nächste Veröffentlichung

- [ ] `msix_version` in `pubspec.yaml` erhöhen (Revision = 0)
- [ ] `dart run msix:create --store`
- [ ] `.msix` unter Packages hochladen
- [ ] Listing-Texte aktualisiert? → `fill_template.ps1` / CSV editieren
- [ ] Bilder geändert? → UI-Upload (EN) → Export → `propagate_urls.ps1`
- [ ] `listingData-URLS.csv` importieren
- [ ] **JEDE Sprache öffnen, runterscrollen, Save** → Complete
- [ ] Pricing / Properties / Age ratings prüfen
- [ ] `runFullTrust`-Begründung einfügen (Text in §3a) — kommt bei jeder Submission
- [ ] Submit
