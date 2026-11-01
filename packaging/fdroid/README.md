# F-Droid-Einreichung: Dozenal Calc

Arbeitskopie der F-Droid-Metadaten für die Veröffentlichung auf [F-Droid](https://f-droid.org). F-Droid baut **aus dem
Quellcode** auf eigenen Servern. Bei Play lädt man ein gebautes AAB hoch, Flathub liefert ein vorgebautes Bundle aus. Die
Arbeit besteht hier also aus einem Bau-*Rezept*, nicht aus einem Artefakt.

- `app.weltanschauung.dozenal.yml`: Metadaten und Bau-Rezept. Diese Datei kommt nach
  `fdroiddata/metadata/app.weltanschauung.dozenal.yml`.

Die App-ID `app.weltanschauung.dozenal` entspricht der Bundle-ID von Play, iOS, macOS und Flathub.

## Warum die App ein sauberer F-Droid-Kandidat ist

- **MIT**-lizenziert, Quellcode öffentlich auf GitHub.
- **Keine proprietären Abhängigkeiten:** nur `flutter_markdown_plus`, `shared_preferences`, `url_launcher` und
  `package_info_plus`, alle FOSS.
- **Keine Anti-Features:** keine Werbung, kein Tracking, keine Analyse, kein Netzzugriff, keine Google Play Services und
  kein Firebase. Ein Block `AntiFeatures:` ist deshalb nicht nötig.
- Der Git-Tag `v1.5.1` (versionCode 19) existiert bereits auf GitHub. F-Droid baut von diesem Tag.

## Das Bau-Rezept in Kürze

- Pinnt Flutter über die srclib `flutter` auf **3.41.8**, passend zum Tag `v1.5.1`. Die Version steigt mit dem nächsten
  Tag, nicht mit jeder Änderung an der CI.
- Entfernt die Flutter-Ziele ausser Android (`ios linux macos web watch`).
- Baut ein **universelles APK** (`flutter build apk --release`, beide ABIs in einer Datei). Getrennte APKs pro ABI sind
  eine spätere Grössenoptimierung und brauchen ein Schema `versionCode * 10 + offset` sowie mehrere Ausgaben.
- F-Droid **signiert mit eigenem Schlüssel**. Der F-Droid-Build hat also eine *andere Signatur* als der Play-Store-Build.
  Das ist bei F-Droid normal und erwartet.

## So einreichen (braucht ein GitLab-Konto, F-Droid nutzt GitLab statt GitHub)

1. Bei [gitlab.com](https://gitlab.com) anmelden und [`fdroid/fdroiddata`](https://gitlab.com/fdroid/fdroiddata) **forken**.
2. Diese Datei in den Fork kopieren als `metadata/app.weltanschauung.dozenal.yml`.
3. **Das Rezept lokal testen**. Das wird vor dem MR dringend empfohlen, weil Flutter-Rezepte meist ein bis zwei Runden
   brauchen:

   ```bash
   pip install fdroidserver        # oder: apt install fdroidserver
   fdroid readmeta
   fdroid lint app.weltanschauung.dozenal
   fdroid build -v -l app.weltanschauung.dozenal:19
   ```

4. Auf einem Branch committen, in den Fork pushen und einen **Merge Request** gegen `fdroiddata` `master` eröffnen. Die CI
   von F-Droid wiederholt Lint und Build. Nach dem Einarbeiten allfälliger Rückmeldungen mergen die Maintainer.

## Bekannte Stellschrauben (bei CI-Problemen den Prüfern nennen)

- **Flutter-srclib-Ref:** Lässt sich `flutter@3.41.8` nicht auflösen, ist der Ausweg `flutter@stable` plus ein
  `prebuild`-Schritt `git -C $$flutter$$ checkout 3.41.8`.
- **Automatische Aktualisierung des versionCode:** `UpdateCheckMode: Tags` und `AutoUpdateMode: Version` erkennen neue Tags
  `vX.Y.Z`. Flutter führt den versionCode aber in `pubspec.yaml` (`version: X.Y.Z+N`), was der Updater von F-Droid nicht
  immer liest. Erkennt er ihn falsch, hilft ein Verweis `UpdateCheckData` auf `pubspec.yaml` oder ein manueller Eintrag
  unter `Builds:` pro Release. Der erste Eintrag (1.5.1/19) ist in jedem Fall manuell.

## Für ein späteres Release aktualisieren

Auf GitHub `vX.Y.Z` taggen (die Version muss in `pubspec.yaml` stehen). Dann schlägt entweder der Update-Bot von F-Droid
den neuen Build vor, oder es kommt ein Eintrag unter `Builds:` dazu, der dem von 1.5.1 folgt, mit neuem `versionName`,
`versionCode` und `commit`.
