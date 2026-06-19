# Eigene Kurs-API verdrahten (Opt-in, fortgeschritten)

Der **Werterechner** liefert datierte, grobe Snapshot-Kurse mit (siehe
`lib/logic/rate_data.dart`) und lässt jeden Kurs im Kurs-Editor („Kurse"-Taste)
von Hand überschreiben. Die **ausgelieferte App macht keine Netzverbindungen** —
sie liest nie eine Live-API. Das ist Absicht und der Grund, warum die
Datenschutzerklärung **unverändert** bleibt: erlauben ≠ ausliefern.

Wer die Kurse automatisch frisch halten will, kann das **in einem eigenen
Build** tun. Das ist ein bewusster, selektiver Eingriff des Nutzers in seinen
eigenen Quellcode — die offiziellen Store-Binaries enthalten diesen Pfad nicht.

> ⚠️ Sobald du Netzwerk-Code hinzufügst, macht **dein** Build Verbindungen.
> Dann gelten für **dich** die Store-/Datenschutz-Pflichten (Play Data Safety,
> Apple Privacy, F-Droid-Anti-Features, INTERNET-Permission im Manifest). Das
> betrifft nur deinen Fork, nicht die offizielle App.

## Idee

`RateStore` (`lib/rate_store.dart`) ist die einzige Quelle der Kurse. Es genügt,
beim Start einmal eine API abzufragen und die Werte über die vorhandenen
`setCurrencyOverride` / `setMetalOverride` einzuspielen — die gesamte UI,
Persistenz und der „≈/Stand"-Mechanismus funktionieren dann unverändert weiter.

## Schritte (Skizze)

1. **Abhängigkeit:** in `pubspec.yaml` ein HTTP-Paket ergänzen (z. B. `http`)
   und `android/app/src/main/AndroidManifest.xml` um
   `<uses-permission android:name="android.permission.INTERNET"/>` erweitern.
2. **Eine eigene, NICHT eingecheckte Datei** `lib/rate_api.dart` (in
   `.gitignore` aufnehmen) mit einer Funktion, die deine API abfragt und ein
   `RateStore` füllt, z. B.:

   ```dart
   // NICHT Teil der ausgelieferten App — eigener Build.
   Future<void> refreshRates(RateStore store) async {
     // Währungen (pivot = USD): z. B. Frankfurter (kein Key, FOSS-freundlich)
     //   https://api.frankfurter.dev/latest?base=USD
     // Metalle (eigener Key nötig): z. B. metals.dev / GoldAPI.io
     // → store.setCurrencyOverride('eur', rate);
     // → store.setMetalOverride('gold', spotProTroyUnze);
   }
   ```
3. **Aufruf** nach `_rateStore.load()` in `lib/main.dart`
   (`_CalcScaffoldState.initState`), hinter einem Flag, das per Default **aus**
   ist (Muster `_kFuncPageEnabled`), oder direkt nur in deinem Fork.

## Quellen-Hinweise

- **Währungen:** [Frankfurter](https://frankfurter.dev) (keine Anmeldung,
  open-source, self-hostbar) ist die FOSS-sauberste Wahl. Alternativ EZB-
  Referenzkurse direkt.
- **Edelmetalle:** z. B. **metals.dev** oder **GoldAPI.io** (kostenloser Key,
  begrenzte Anfragen/Monat) — Spotpreis **pro Troy-Unze**, passend zu
  `metalSpotPivot`. **Kitco** ist eine menschenlesbare Quelle zum Abschreiben,
  kein programmierbarer Endpunkt.

Pivot-Konvention: `currencyPerPivot[x]` = Einheiten von x pro 1 USD;
`metalSpotPivot[m]` = USD pro Troy-Unze. Siehe `rate_data.dart`.
