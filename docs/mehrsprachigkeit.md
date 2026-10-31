# Intro, Sprachen, RTL

## Intro

Onboarding-PageView beim ersten Start, gesperrt über einen
`SharedPreferences`-Schlüssel der Form `intro_seen_v<N>` (aktuell `v4`,
definiert als `_kIntroSeenFlag` in `lib/main.dart`). Bei substanziellen
Intro-Änderungen den Suffix erhöhen, damit Bestandstester das
überarbeitete Intro erneut sehen. Slide-Inhalte (Text) kommen aus dem
ARB-System (`introSlide1`–`introSlide4`); Slide-Layout-Metadata
(Bild, Highlight-Rechtecke/Kreise, Ziffer-Labels) bleibt
sprach-neutral in `intro_pages.dart`.

## Mehrsprachigkeit

Vierzehn Sprachen aktiv: DE, EN, FR, ES, IT, FA, RU, GA, HI, ZH
(vereinfacht), ZH-Hant (traditionell, post-Build-11), CY (Walisisch),
JA (Japanisch) und AR (Arabisch). Die Infrastruktur:

- **ARB + gen_l10n:** `lib/l10n/app_<code>.arb` pro Sprache (DE ist
  Template-arb-file, andere fallen auf DE zurück, falls Key fehlt).
  Script-Tagged-Locales nutzen Flutters Konvention mit Unterstrich:
  `app_zh_Hant.arb`. `flutter gen-l10n` läuft automatisch bei
  `flutter pub get` dank `generate: true` in `pubspec.yaml`. Output unter
  `lib/l10n/` (per `.gitignore` ignoriert, da Build-Artefakt).
- **Locale-State:** `lib/locale_notifier.dart` mit `LocaleNotifier`
  (SharedPreferences-Schlüssel `locale_v1`, null = OS-Locale folgen) +
  `LocaleScope` (InheritedNotifier, macht Notifier für tiefe Widgets
  zugänglich ohne Provider-Dependency). Persistiert den vollen
  BCP-47-Tag (`zh-Hant`, nicht nur `zh`), damit `zh_Hans` und `zh_Hant`
  koexistieren können; alte einsprachige Einträge (`de`) bleiben
  rückwärtskompatibel. `resolveLocale` ist script-aware: exakte
  Sprache+Script gewinnt vor reinem Sprach-Match; `zh-TW/HK/MO` mappt
  automatisch auf `zh-Hant`. Die Theorie-/Manual-Dispatcher (`lib/theory/`,
  `lib/manual/`), `privacy_page.dart`, `license_page.dart` und der
  Sprach-Picker in `info_pages.dart` (`_LanguagePickerExpansion`) vergleichen
  über `toLanguageTag()` statt nur `languageCode`. Sonst würden zh-Hant-Routen auf die vereinfachten
  Dateien zurückfallen — und im Picker (`languageCode == 'zh'` für beide
  Chinesisch-Varianten) markiert der Häkchen-Indikator fälschlich beide
  Zeilen und der Header zeigt immer die zuerst registrierte Variante.
- **Sprach-Registry:** `lib/language_options.dart` mit
  `kSupportedLanguages`-Liste — single source of truth für Locale,
  Anzeige-Label (selbstreferentiell: „Deutsch", „English", „Français",
  „Español", „Italiano", „فارسی", „Русский", „Gaeilge", „हिन्दी",
  „简体中文", „繁體中文", „Cymraeg", „日本語", „العربية"),
  Flag-Painter und kanonisches Flag-Seitenverhältnis. Picker
  (`_LanguagePickerExpansion` in `info_pages.dart`) ist datengetrieben
  aus dieser Liste.
- **Flag-Painter:** `lib/flag_painter.dart` enthält je einen
  `CustomPainter` pro Sprache. Iran-Wappen ist eine vereinfachte
  Tulpen-Silhouette mit weisser Schwert-Aussparung in Rot.
- **Kapitel-Prosa:** per-Sprach-`part`-Dateien unter `lib/theory/<lang>/`
  und `lib/manual/<lang>/` — siehe Info-Modal-Abschnitt oben.

## RTL-Behandlung (Persisch + Arabisch)

`Localizations.localeOf(context)` löst persische (`fa`) und arabische
(`ar`) Locales als RTL auf, Flutter spiegelt alle direction-aware
Widgets automatisch. Zwei Eigenheiten in dieser App:

- **Calc-UI bleibt erzwungen LTR.** `_CalcScaffold` in `main.dart`
  wickelt sein Body in `Directionality(textDirection: TextDirection.ltr)`.
  Mathematische Notation ist sprach-übergreifend immer LTR (auch
  Persisch-Mathematiker schreiben `2 + 3 = 5` von links nach rechts mit
  westlichen Ziffern), und das Tastenfeld-Layout / Display-Cursor-
  Richtung müssen konsistent bleiben. Text-Screens (Info-Liste,
  Kapitel, Intro, Feedback, Privacy/License) folgen der Locale.
- **`_Pre`-Tabellen werden ebenfalls auf LTR gezwungen.** Monospace-
  Tabellen mit westlichen Ziffern und sprach-Labels würden sonst vom
  Bidi-Algorithmus zerlegt. Der Wrap sitzt direkt im `_Pre`-Widget in
  `lib/manual/manual.dart`.

Direction-aware Bauteile, die korrekt sein müssen:
- `_NavChevron` in `info_pages.dart` — wählt `chevron_left` in RTL,
  `chevron_right` in LTR (ListTile-Trailing zeigt richtig zum Detail).
- `EdgeInsetsDirectional.fromSTEB` statt `EdgeInsets.fromLTRB` überall,
  wo asymmetrische horizontale Paddings gemeint sind (z. B.
  Sprach-Tile-Einrückung).
- `TextAlign.end` statt `TextAlign.right` für kapitellnummer-Prefixe.

Wenn neue UI hinzukommt, immer diese drei Stellen prüfen.
