# Info-Modal und Empfehlungen

Verweise wie «oben» oder «siehe …-Abschnitt» meinen die Themenseiten, die
[architektur.md](architektur.md) auflistet.

## Info-Modal

`info_pages.dart` (Navigator-Routen + reine Routing-Logik der `InfoListPage`).
Der eigentliche Inhalt liegt in drei Bäumen (plus `lib/recommendations/`,
eigener Abschnitt unten):

- **`lib/theory/`** — der Theorie-Stoff. `theory_blocks.dart` baut über
  `theoryBlocks(l, langTag)` die vier Blöcke (Grundlagen, Zwölf und die Welt,
  Dozenale Mathematik, Dozenale Gesellschaft) aus `TheoryChapterRef`-Prosa-
  Kapiteln (Datenmodell `ProseChapter`/`ProseSection` in `prose_chapter.dart`);
  dazu separat `werteTheoryBlock` — die **Wertetheorie** des Werterechners
  (27 Kapitel, Dispatcher `werte_theory.dart`). Genre-Dateien
  `grundlagen_/math_/society_/world_/unit_theory.dart` + `werte_theory.dart`
  mit je einem per-Sprach-Part-Verzeichnis `lib/theory/<lang>/`.
  Illustrationen auf zwei Schienen: Kapitel-Kopfbilder per `imageId`
  (`_customChapterIllustration` in `info_pages.dart`) und Inline-Figuren
  nach einzelnen Sections per `ProseSection.illustrationId`
  (`inlineTheoryIllustration` in `werte_illustrations.dart`).
- **`lib/manual/`** — das Bedienhandbuch. `manual.dart` liefert
  `manualChapters(langTag)` (Hauptrechner), `converterManualChapters(langTag)`
  (Umrechner) und `assetManualChapters(langTag)` (Werterechner) als
  `ManualChapter`-Widget-Listen; Inhalt in den per-Sprach-Part-
  Dateien `lib/manual/<lang>/manual_<lang>.dart`, geteilte Helfer `_H/_P/_Pre`,
  Illustrationen in `manual_illustrations.dart`.
- **`lib/unit_descriptions/`** — lokalisierte Ein-Satz-Definitionen für
  die Langdruck-Info-Box über den Einheiten-Tasten des Umrechners:
  `unitDescription(category, symbol, langTag)` mit 14 Sprach-Parts und
  **per-Symbol**-Deutsch-Fallback (feiner als der positionsweise
  Kapitel-Fallback); konsumiert via `unitInfoOf` in `converter_page.dart`
  → `showUnitInfoBox` (`keypad_parts.dart`).

**Aufbau des Menüs** (`InfoListPage`): vier Gruppen, jede Zeile eine Fläche wie eine Taste (`menu_rows.dart`). Symbole
sind neutral, Farbe tragen nur die drei Rechner unter «Bedienung».

1. **Lernen** (`infoListGroupLearn`)
   - **Intro** (`a11yIntro`) pusht `IntroPage`.
   - **Bedienung** (`infoListManualExpansion`, `_ManualExpansion`) klappt auf die drei Rechner auf, jeder Rechner auf seine
     Handbuch-Kapitel: `manualChapters`, `converterManualChapters` (sechs Kapitel), `assetManualChapters` (sechs Kapitel).
     Die Namen der Rechner sind dieselben wie im Page-Peek.
   - **Theorie** (`_TheoryExpansion`) klappt auf zu den vier Theorie-Blöcken (Grundlagen, Zwölf und die Welt, Dozenale
     Mathematik, Dozenale Gesellschaft), «Einheitentheorie» (`ConversionsPage`) und «Wertetheorie» (`werteTheoryBlock`).
2. **App** (`infoListGroupApp`)
   - **Einstellungen** pusht `SettingsPage` (`settings_page.dart`).
   - **Sprache** (`infoListLanguageEntry`, `_LanguagePickerExpansion`) zeigt Flagge und aktive Sprache, klappt auf
     `kSupportedLanguages` auf und nach der Wahl wieder zu.
3. **Empfehlungen** (`_RecommendationsExpansion`) ist eine Gruppe ohne Überschrift: Der Eintrag sagt es schon.
4. **Über die App** (`infoListGroupAbout`): Datenschutz, Lizenz, Spenden, Feedback.

Darunter `_VersionFooter`. Einen Navigations-Eintrag «Einheitenrechner» gibt es nicht: Der Wechsel läuft über die Taste
rechts vom Gleichbalken. Am Mi A3 passen alle Gruppen ohne Scrollen auf den Bildschirm, nur die Versionszeile nicht.

AppBar-Titel ist `infoListTitle`: DE „Dozenal Calc Menü",
EN „Dozenal Calc Menu", entsprechend lokalisiert in allen 14 Locales.

Der Dispatch ist script-aware (zh-Hant vor zh): `manualChapters` /
`converterManualChapters` / `assetManualChapters` wählen über ihre
`_own…Chapters`-Helfer per BCP-47-Präfix die Sprach-Funktion, die
Theorie analog über `worldChapters/mathChapters/societyChapters/
grundlagenChapters/werteChapters(langTag)`. Fallback auf Deutsch: die
Handbücher mergen **per Kapitel nach Position** (eine Sprache zeigt ihre
eigenen Kapitel so weit übersetzt, der Rest deutsch); die
Theorie-Dispatcher fallen als **ganze Liste** zurück, wenn eine Sprache
fehlt.

Die Aussprache-Konvention für Dozenal-Zahlen (Magnituden quader/cuber/tesser/…,
pro Sprache unterschiedliche Konnektoren und Mutationsregeln) lebt im
Mathematik-Theoriekapitel. **Vor jedem Edit an dieser Prosa in
`lib/theory/<lang>/math_<lang>.dart` die vollständige Konvention
in [`docs/chapter2-conventions.md`](chapter2-conventions.md)
nachschlagen.** Das e/o-Präfix als Theorie-Lese-Hilfe (e = dezimal,
o = dozenal) bleibt in allen Sprachen sprachneutral.

Wenn `handleClick` `state.infoState` auf `InfoList` setzt, pusht der
State-Listener in `main.dart` die Route und resettet `infoState` auf
`Closed` — der Navigator steuert ab dann alle Listen-/Detail-/Zurück-
Übergänge.

Sekundärseiten (aus `info_pages.dart` gepusht, alle über die Info-Liste —
keine direkten Routen aus `main.dart`): `privacy_page.dart` +
`license_page.dart` (laden `legal/<typ>.<code>.md` per Locale via
`markdown_page.dart`), `feedback_dialog.dart` (`mailto:`-Composer, kein
Netzwerk, Strings über ARB), `conversions_page.dart` (die
**Einheitentheorie**-Seite, ausgebaut aus der alten
Imperial-12-Umrechnungsliste: `DefaultTabController` mit Intro-Tab plus
einem Tab je Theorie-Kategorie, Prosa aus `lib/theory/unit_theory.dart`
mit Quellenlisten und Kapitel-Bildern, weiterhin inkl. Live-Umrechnung
mit eigener Doz/Dez-Toggle und symbolischer Notation
`ft/in/sh/d/£/min/h/°` statt Wörtern, damit die Bodies in allen Locales
identisch bleiben), `converter_page.dart` (interaktiver Einheitenrechner —
zweiter Rechner-Modus, eigener Abschnitt unten), `support_page.dart`
(externer Ko-fi-Link via
`openExternalLink`, kein In-App-Payment; rahmt die Spende gegen die
Apple-Developer-Program-Gebühr für den iOS-Weg).

**Datenschutz-Web-Hosting (cPanel):** Parallel zu den in-app
`legal/privacy-policy.<tag>.md` (App-Bundle, via `flutter_markdown_plus`)
leben unter `legal/privacy.<tag>.html` vierzehn stand-alone HTML-Versionen
für `weltanschauung.app`; die Play-Console-Datenschutz-URL zeigt auf eine
(Default `privacy.de.html`). Jede enthält einen `<nav class="lang-picker">`
mit allen 14 Sprachen (Flag + nativer Name, `direction: ltr` erzwungen, damit
FA/AR nicht spiegeln). **Walisische Flagge ist Inline-SVG** (Pfad aus
`WelshFlagPainter`), weil die Unicode-Subdivision-Sequenz auf Firefox-Linux
und älteren Android-Versionen unzuverlässig rendert; die anderen 13 nutzen
Regional-Indicator-Emojis.

## Empfehlungen (`lib/recommendations/`)

Ausklappbarer Eintrag im Menü (`_RecommendationsExpansion` in
`info_pages.dart`) → sieben Plattform-Kapitel: Physisch, Android — Play Store,
Android — F-Droid, iOS, macOS, Linux, Windows. Jedes öffnet eine
`RecChapterPage` (`recommendations_page.dart`): kurze Einleitung, je Rechner
eine Karte (Name · `tag` = Lizenz/Genre · `blurb` · ✓ Pros in `t.equals` · ✗
Cons in `t.ac` · Link-Zeile mit abgeleitetem Host) und ein „Fazit"-Kasten mit
Goldakzent. Kuratiert aus [`docs/taschenrechner-analyse.md`](taschenrechner-analyse.md):
Power-User-Rahmung, immergrün (keine Preise/Versionen/Daten/Lagerstatus),
redaktionell ehrlich (nur belegte Aussagen als Fakt).

Datenmodell + Dispatch in `recommendations.dart` (`RecCalc`, `RecChapter`,
`recommendationChapters(langTag)`); Inhalte als per-Sprach-`part`-Dateien
`<lang>/recommendations_<lang>.dart` — **alle 14 Sprachen übersetzt**, Dispatch
script-aware wie bei `theory/` (zh-Hant vor zh). Produktnamen werden im
Karten-Titel per `TextDirection.ltr` erzwungen, damit „!" („Qalculate!") und
„/" („Free42 / Plus42") in RTL (fa/ar) nicht umsortiert werden. Plattform-
Kapiteltitel ausser „Physisch" bleiben Eigennamen (iOS, macOS, …). ARB-Eintrag
der Sektion: `infoListRecommendationsExpansion` (×14). Der Dozenal-Bezug
(Qalculate! als einziger mit Basis-12-Ausgabe) ist bewusst eingewoben.
