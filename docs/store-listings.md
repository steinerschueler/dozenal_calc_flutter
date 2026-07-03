# Store-Listings: App-Namen-Konvention + Screenshots

Referenz für Play-Store-Listing-Arbeit (App-Namen, Screenshots). Aus CLAUDE.md
ausgelagert — nur beim Hinzufügen einer Sprache oder bei Listing-/Asset-Arbeit
gebraucht. Der `sync_play_listings` / `publishListing` / `publishBundle`-
Workflow bleibt in CLAUDE.md (Befehle → Automatisches Listing-Push).

**iOS-Keywords** (App-Store-Connect-only, kein Play-Feld): siehe
`docs/app-store-keywords.md` — pro-Locale-Keyword-Strings für alle 14 Sprachen.

## App-Name-Konvention (Dutzend-Lehnwort statt Mathe-Begriff)

Latein-Schrift-Locales (DE/EN/FR/ES/IT/GA/CY) verwenden den Markennamen
„Dozenal Calc". Die sieben Nicht-Latein-Locales nutzen statt dem akademischen
Zahlensystem-Begriff (十二进制 / 十二進法 / двенадцатеричный / द्वादश पद्धति /
دستگاه پایه ۱۲ / نظام اثنا عشري) das in der jeweiligen Sprache etablierte
Lehnwort für „Dutzend" plus ein Rechen-Wort:

| Locale | App-Name | Wortbildung |
|---|---|---|
| hi | दर्जन गणक | दर्जन (Dutzend, engl. Lehnwort) + गणक (Rechner) |
| ru | Дюжинный расчёт | дюжина (franz./ital. Lehnwort) → adjektiv. дюжинный + расчёт |
| zh-Hans | 打进制计算 | 打 (engl. *dozen* phonetisch) + 进制 (Stellensystem) + 计算 |
| zh-Hant | 打進制計算 | gleich, in Hant-Glyphen |
| ja | ダース計算 | ダース (Katakana dāsu, engl. *dozen*) + 計算 |
| fa | حساب دوجینی | دوجین (franz. *douzaine*) → adjektiv. دوجینی + حساب |
| ar | حساب الدزينة | الدزينة (mediterran-romanisch) + Idāfa mit حساب |

Begründung: das Dutzend-Lehnwort ist in allen sieben Sprachen Markt-Standard
(Bazar/Supermarkt-Vokabular), nicht Lehrbuch-Mathe. Signalisiert: App spricht
die Alltagssprache der Zielgruppe. Quelle für neue Sprachen: Wikipedia-Artikel
der jeweiligen Lehnwort-Form (oft unter eigenem Artikel-Titel: ru.wiki/Дюжина,
ja.wiki/ダース, …).

Die App-Namen leben an *zwei* Stellen, die parallel gepflegt werden müssen:

1. **Play-Console-Listing-Titel**: `## App-Name`-Block in
   `store/play-store/listing.<code>.md`. Sync via `tool/sync_play_listings.dart`.
2. **Android-Launcher-Name**: `<string name="app_name">…</string>` in
   `android/app/src/main/res/values-<XX>/strings.xml` (Default in
   `values/strings.xml` = „Dozenal Calc"). Manifest referenziert nur
   `@string/app_name`.

## Play-Store-Screenshots (Status: per-Locale im Repo)

**Aktueller Stand:** per-Locale-Screenshots liegen versioniert unter
`store/screenshots/play/<locale>/` (11 Locales × 3 Phone-PNGs) und
`store/screenshots/play-tablet/<locale>/` (11 × 4); dazu `ios/`, `linux/`
und die ungerahmten Captures in `raw/`. `tool/sync_play_listings.dart`
synct die Play-Sets zusammen mit den Listings in die Play-Grafik-Slots
(`android/app/src/main/play/listings/<play-locale>/graphics/…`); fa, ga
und cy haben keine Screenshot-Ordner und behalten in Play Console den
Bestand. Die Rahmen-/Text-Overlay-Pipeline lebt in `tool/screenshots/`
(`i18n.json` als Text-Quelle, Python + Swift-Text-Renderer für RTL/CJK/
Devanagari) — Vollanleitung in `docs/appstore-connect-pipeline.md`.

**Capture-Weg** ist adb vom physischen Gerät. Die raw/-Konvention ist
**geräte-zuerst mit Locale im Dateinamen** (`raw/{android,android-tablet,
iphone,ipad,macos,watch}/<name>-<locale>.png`) — genau dieses Layout liest
die Rahmen-Pipeline hart ein (`tool/screenshots/produce_play.py`:
`RAW = store/screenshots/raw/android`):

```bash
adb -s <serial> shell input tap …          # zur gewünschten Seite navigieren
adb -s <serial> shell screencap -p /sdcard/s.png
adb -s <serial> pull /sdcard/s.png store/screenshots/raw/android/<name>-<locale>.png
```

Pro Locale: in der App die Sprache umstellen (oder OS-Locale ändern), dann
durchklicken und capturen. Funktioniert mit echten Android-Fonts inkl. CJK,
ohne Font-Workarounds — die generelle adb-UI-Driving-Loop steht in
`docs/local/device-testing.md` (lokal/gitignored, nicht im Repo).

**Historie:** eine Generator-Pipeline via flutter_test
(`tool/generate_screenshots.dart`, matchesGoldenFile + System-Font-Loading)
wurde verworfen: das flutter_test-Environment lädt `.ttc`-Font-Collections
nicht zuverlässig (NotoSansCJK-Regular.ttc ergab Tofu-Boxen für
Chinesisch/Japanisch, auch mit korrekt registrierter
fontFamilyFallback-Chain). Ein qualitativ schlechter Screenshot in der
Muttersprache ist für Play-Store-UX schlimmer als gar kein lokalisierter
Screenshot — Nutzer:innen würden sonst denken, die App selbst rendere so.
