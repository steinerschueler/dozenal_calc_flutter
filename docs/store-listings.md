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

## Play-Store-Screenshots (Status: manueller Capture)

Per-Locale-Screenshots via `tool/generate_screenshots.dart` wurden einmal
versucht (flutter_test + matchesGoldenFile + System-Font-Loading für 14
Sprachen), aber wieder verworfen: das flutter_test-Environment lädt
`.ttc`-Font-Collections nicht zuverlässig (NotoSansCJK-Regular.ttc ergab
Tofu-Boxen für Chinesisch/Japanisch, auch mit korrekt registrierter
fontFamilyFallback-Chain). Ein qualitativ schlechter Screenshot in der
Muttersprache ist für Play-Store-UX schlimmer als gar kein lokalisierter
Screenshot — Nutzer:innen würden sonst denken, die App selbst rendere so.

**Aktueller Stand:** keine per-Locale-Screenshots im Repo. Play Console fällt
auf das Default-Locale-Set zurück (was du dort hochlädst), für alle Sprachen
identisch.

**Falls per-Locale-Screenshots später gewünscht sind**, ist der zuverlässigste
Weg adb-Capture vom physischen Gerät:

```bash
adb -s <serial> shell input tap …          # zur gewünschten Seite navigieren
adb -s <serial> shell screencap -p /sdcard/s.png
adb -s <serial> pull /sdcard/s.png store/screenshots/<locale>/N-name.png
```

Pro Locale: in der App die Sprache umstellen (oder OS-Locale ändern), dann
durchklicken und capturen. Funktioniert mit echten Android-Fonts inkl. CJK,
ohne Font-Workarounds — die generelle adb-UI-Driving-Loop steht in
`docs/local/device-testing.md` (lokal/gitignored, nicht im Repo).
