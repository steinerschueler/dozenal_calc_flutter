# Release-Workflow: Versionshinweise + Listing-Push

Operations-Referenz für den Release-Zeitpunkt. Aus CLAUDE.md (Release-Builds /
Automatisches Listing-Push) ausgelagert — nur beim Bauen+Veröffentlichen
gebraucht. Die Build-Befehle selbst stehen in CLAUDE.md.

## Mehrsprachige Play-Console-Versionshinweise

Abschließender Schritt nach jedem Release-Build: ein Block pro aktiv
unterstützter Listing-Locale. Die App enthält **vierzehn** Sprachen, aber Play
Console listet nur **sieben** als Release-Notes-Locale (DE, EN, FR, ES, IT, FA,
RU). Die übrigen (GA, HI, ZH-Hans, ZH-Hant, CY, JA, AR) leben nur in der App —
für sie werden keine Notes geschrieben. Persisch wird in Play Console nur als
`fa-AF` gelistet (Googles einzige Farsi-Listing-Locale).

Jeder Block: Tag-öffnen auf einer Zeile, Prosa als eine einzige lange Zeile
darunter, Tag-schliessen auf einer Zeile. Leerzeile zwischen Blöcken. So
vermeidet Copy-Paste in Play Console ungewollte Zeilenumbrüche in der
Beschreibung.

```
<de-DE>
…ca. 450 Zeichen (Limit 500 pro Locale)…
</de-DE>

<en-US>
…
</en-US>

<fr-FR>
…
</fr-FR>

<es-ES>
…
</es-ES>

<it-IT>
…
</it-IT>

<fa-AF>
…
</fa-AF>

<ru-RU>
…
</ru-RU>
```

Inhalt aus den tatsächlichen Build-Änderungen ableiten (nicht aus der
Commit-Message kopieren) und Ton an Tester richten — was sie sehen werden,
nicht die Constraint-Math dahinter. Zeichen pro Locale mit `wc -m` verifizieren.
Bei einem Release, das nur eine Locale betrifft (z. B. gezielter Persisch-Fix
nach Native-Speaker-Review), nur den entsprechenden Block schreiben — Play
Console übernimmt für nicht aufgeführte Locales automatisch die letzten Notes
weiter.

Fertige Release-Notes werden im Projekt-Root als `build<N>-release-notes.txt`
abgelegt (jeweils nur die aktuellste; ältere werden mit dem nächsten Build
verworfen), damit künftige Builds auf das gleiche Format und die gleiche
Block-Reihenfolge zurückgreifen können.

## Automatisches Listing-Push (Gradle Play Publisher)

Listings (App-Name, Kurz-/Lange Beschreibung) und Release-Notes werden direkt
aus dem Repo via Google Play Developer API gepusht — keine Copy-Paste-Runde
durch Play Console. Plugin: `com.github.triplet.play` 3.12.x, im app-Modul von
`android/app/build.gradle.kts` konfiguriert.

```bash
dart run tool/sync_play_listings.dart   # store/listing.*.md + build<N>-release-notes.txt → android/app/src/main/play/
./gradlew publishListing                # nur Texte/Grafiken
./gradlew publishBundle                 # AAB + Listings + Release-Notes (Track: internal, Status: DRAFT)
```

`publishBundle` setzt voraus, dass das AAB bereits gebaut ist (`flutter build
appbundle --release` zuerst). Es lädt nur hoch, baut nicht neu — Gradle Play
Publisher findet die fertige `app-release.aab` unter
`build/app/outputs/bundle/release/`.

Default-Track ist `internal`, Default-Release-Status `DRAFT` — ein
Bundle-Upload landet als Entwurf auf dem internen Test-Track und muss in Play
Console manuell promotet werden. Bewusst auf Production einmalig überschreiben:
`./gradlew publishBundle -Pplay.track=production -Pplay.releaseStatus=COMPLETED`.

**Credentials:** Service-Account-JSON unter `~/keys/play-publisher.json`
(parallel zur `~/keys/dozenal_calc.jks`-Keystore), **nicht** im Repo. Einmalige
Einrichtung in Google Cloud Console (Service-Account anlegen, JSON-Key
herunterladen) plus Play Console → Einrichtung → API-Zugriff (Service-Account
dem App-Account hinzufügen, Rolle „Store-Eintrag verwalten" für Listings +
„Tests verwalten" für Bundle-Upload auf internal/closed-Track). Bei fehlender
JSON laufen die `publish*`-Tasks mit klarer Fehlermeldung ins Leere — lokales
Bauen bleibt unbeeinflusst.

**Quell-Layout:** `store/listing.<code>.md` bleibt menschenlesbar autoritativ.
Das Sync-Script extrahiert die drei Code-Blöcke (App-Name, Kurzbeschreibung,
Lange Beschreibung) und schreibt sie in das vom Plugin erwartete Layout
`android/app/src/main/play/listings/<play-locale>/{title,short-description,full-description}.txt`.
Locale-Mapping in `tool/sync_play_listings.dart` → Konstante `_localeMap` (z. B.
`de` → `de-DE`, `fa` → `fa-AF`, `zh-Hant` → `zh-TW`). Das `play/`-Verzeichnis
ist gitignoriert — niemals von Hand editieren, der nächste Sync-Lauf würde
Änderungen überschreiben.

Release-Notes-Quelle ist die jeweils neueste `build<N>-release-notes.txt`
(numerisch sortiert, nicht lexikografisch — `build11` vor `build2`). Die
`<locale>...</locale>`-Blöcke landen in
`android/app/src/main/play/release-notes/<play-locale>/default.txt`.
Synchronisiert werden nur die sieben Play-Console-Release-Notes-Locales
(DE/EN/FR/ES/IT/FA/RU); die übrigen sieben App-Sprachen (GA, HI, ZH-Hans,
ZH-Hant, CY, JA, AR) haben in Play Console keinen Release-Notes-Slot.

App-Namen-Konvention pro Locale: siehe [`store-listings.md`](store-listings.md).
