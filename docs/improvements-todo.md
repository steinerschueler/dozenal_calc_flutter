# Verbesserungen — offene Todos

Sammelstelle für alles, was noch zu tun ist, auch für Kleinigkeiten. Erledigtes wird hier gestrichen oder nach unten
verschoben.

## Offene Punkte

Stand: 2026-11-01, gegen den Code und die genannten Dienste geprüft. Was sich von hier aus nicht prüfen liess, ist markiert.

### Für Eric, von Hand

- [ ] **App-Store-Connect-Schlüssel erneuern.** Nur in App Store Connect möglich. Danach den neuen Schlüssel lokal
      eintragen, er kommt nicht ins Repo. Nicht dringend.

### Nächster Release

Erst, wenn der Werterechner bereit ist und das Design des Rechnerwechsels fertig ist (Erics Entscheid vom 2026-11-01).

- [ ] **Version anheben und taggen.** `pubspec.yaml` steht auf `1.5.1+19`, im `CHANGELOG.md` liegt unter `[Unreleased]`
      unter anderem der ganze Werterechner. Mitziehen: `MARKETING_VERSION` und `CURRENT_PROJECT_VERSION` des
      Watch-Targets, `msix_version`, die Flutter-Version im F-Droid-Rezept (heute 3.41.8, gepinnt auf den Tag `v1.5.1`).
- [ ] **Werterechner in die Store-Texte.** Die Listings für Play, App Store und Microsoft Store erwähnen ihn nicht. Alle
      Sprachen nachziehen, Neuheiten-Text schreiben.
- [ ] **Store-Screenshots prüfen.** Dritte Rechner-Seite und neuer Page-Peek sind in den Bildern vom Juni nicht zu sehen.
- [ ] **Kurse im Werterechner auffrischen.** `lib/logic/rate_data.dart` enthält feste Kurse mit `asOf`-Datum, sie altern
      mit jedem Release.

- [ ] **MSIX vor dem Einreichen starten.** `msix` 3.18.0 nimmt die C++-Laufzeit neu aus Visual Studio, das Paket ändert
      sich also. Die Rechenlogik ist nicht betroffen.
- [ ] **`package_info_plus` 8 auf 10 (Dependabot #13) auf Android und Windows testen.** Die neue Hauptversion ändert das
      Android-SDK und `win32` und bringt `ffi_leak_tracker` neu mit (Herausgeber `halildurmus.dev`, derselbe wie `win32`).

### Apple

- [ ] **watchOS-Screenshots.** In App Store Connect liegen noch die Bilder von Build 16 (416×496). Neu aufnehmen auf dem
      Watch-Simulator mit `simctl io screenshot`, nicht rahmen. Vorher den nächsten Punkt entscheiden.
- [ ] **Erstrender-Zoom der Watch-App.** Direkt nach dem Start ist die unterste Glyphen-Reihe abgeschnitten, bis einmal
      gewischt wird. Ursache und deterministische Lösung: [watch.md](watch.md#bekanntes-problem-page-tabview-erstrender-zoom).
- [ ] **Freigabe von 1.5.1 in App Store Connect kontrollieren.** Im Juni war die Version hochgeladen, aber noch nicht
      eingereicht. Der heutige Stand ist nicht geprüft. Screenshots sind nach dem Einreichen gesperrt, also zuerst hochladen.

### Weitere Vertriebswege

- [ ] **F-Droid einreichen.** Die App ist noch nicht in `fdroiddata`. Rezept mit `fdroid build` testen, dann MR auf
      GitLab: [packaging/fdroid/README.md](../packaging/fdroid/README.md).

### App

- [ ] **Entscheid Eric: Schriftgrösse im Einheiten- und Werterechner.** Das Display richtet die Schrift seit dem Design-Umbau
      nur nach seiner Höhe, die Einstellung «Schriftgrösse» wirkt dort nicht mehr. Entweder wieder berücksichtigen oder
      die Einstellung entsprechend beschreiben.
- [ ] **Antwort übernehmen:** Ein neues Resultat mit demselben Wert wie das zuletzt übernommene wandert nicht in den
      Einheiten- und Werterechner. Der Vergleich müsste eine Rechnung erkennen, nicht den Wert.
- [ ] **Kurve beim Drehen:** Die Wahl von Reihe, Zeitraum und Punkt geht beim Wechsel zwischen Hoch- und Querformat verloren.
- [ ] **Display-Zeile ziehen:** Ein zweiter Finger auf der anderen Zeile lenkt das Ziehen um. Die Zeile beim Start festlegen.
- [ ] **Niedrige Fenster:** `isLowScreen` und `displayHeightFor` messen unterschiedliche Höhen und prüfen die Breite nicht,
      das betrifft Split-Screen und schmale Fenster.
- [ ] **Hauptrechner-Tasten:** `_HochKeypad` nimmt die Breite vom Bildschirm minus fester 24 dp statt vom Platz, den es
      bekommt. Mit seitlichem Rand werden die Beschriftungen ungleich gross.
- [ ] **Lange Methoden (CC-03):** `ConverterDisplay.build` und `_MovableLineState.build` sind länger als 50 Zeilen.
- [ ] **Lange Eingaben:** Das Display misst alle Zeichen pro Bild und Ziehschritt mehrfach, das lässt sich zwischenspeichern.
- [ ] **Einstellungen an das Menü angleichen.** Dort stehen noch Farbscheiben und Trennlinien, das Menü zeigt Flächen.
- [ ] **Intro-Titel abgeschnitten:** «Bedienungs-Intro» wird auf dem Mi A3 neben «Überspringen» gekürzt.
- [ ] **Kapiteltitel mit «log»:** Im Titel «Rechnen in der Eingabe» erscheint «log» in einer fremden Schrift und auf eigener Zeile.
- [ ] **Werterechner fertigstellen.** Er ist noch nicht bereit für eine Veröffentlichung. Was fehlt, legt Eric fest.
- [ ] **Design des Rechnerwechsels (Taste, Peek) überarbeiten.** Das Wischen ist abgeschaltet, gewechselt wird per Taste.
      Ob dieser Punkt damit erledigt ist, entscheidet Eric.
- [ ] **`=`-Zyklus über beide Einheitensysteme** im Umrechner: [unit-converter.md](unit-converter.md#10-offene-ideen-todo).
      Der Eintrag dort spricht noch von der Doz/Dez-Welt, seit der Entkopplung ist das Einheitensystem gemeint.
- [ ] **Werterechner, spätere Phasen:** Krypto, Rohstoffe, Rhodium, Karat, Apothekereinheiten, Feinschliff für lange
      Gattungs-Labels im Breit-Layout: [asset-converter.md](asset-converter.md#offene-punkte-für-spätere-phasen).
- [ ] **Theorie-Themen ohne Dossier:** Goldener Schnitt, Pi, Einheitskreis und 360° sowie die Ideen im
      [Recherche-Backlog](research/README.md#backlog-stand-pflegen).
- [ ] **`DozenalCalcState` weiter entflechten**, nur bei Bedarf. Memory und Modi in eigene Notifier zu ziehen, trennt nichts,
      sie sind Rechen-Kernzustand. Sinnvoll wären eine reine `InputBuffer`-Klasse für Eingabe und Cursor und eine Bündelung
      der Felder der Ergebnisanzeige.

### Aufräumen im Repo

- [ ] `build18-release-notes.txt` entfernen: Laut [release-workflow.md](release-workflow.md) bleibt nur die aktuellste
      Fassung liegen.
- [ ] **`tool/analyze_changed.py` robuster machen.** Die git-Aufrufe lesen noch mit der Standard-Kodierung des Systems,
      unter Windows also nicht UTF-8. Fehlt `git` oder `origin/main`, endet das Skript mit einem Traceback statt mit einer
      Meldung. Heute ohne Wirkung: Alle Dart-Dateien haben ASCII-Namen, und CI und Hooks haben `git`.
- [ ] **Hook-Tests brauchen `python3` und `git`.** `test/analyze_changed_hook_test.dart` scheitert ohne die beiden mit
      einer Meldung, die nichts mit dem Hook zu tun hat. CI und Pre-Push haben beide, ein klarer Hinweis fehlt trotzdem.
- [ ] **Lint-Altlast abbauen.** `flutter analyze` meldet Tausende alte Befunde, geprüft werden nur geänderte Dateien
      (CC-41).
- [ ] **Paket- und GitHub-Name ändern**, wenn das npf-Backlog (A-067) so weit ist.

### Kürzlich erledigt

- Fehlende Leerzeichen in der traditionell-chinesischen Anleitung (`41d9bc7`). Eine Suche über alle Zeilenumbrüche in
  den Texten unter `lib/` fand danach keine weitere Stelle.
- `㏒` aus den App-Store-Texten entfernt (`4e2f744`), App Store Connect lehnt das Zeichen ab.
