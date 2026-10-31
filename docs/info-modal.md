# Info-Modal und Empfehlungen

Aus dem früheren Gesamtdokument übernommen. Verweise wie «oben» oder «siehe …-Abschnitt» meinen die Themenseiten, die
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

Die frühere `info_content.dart` mit ihren `info_content_<lang>.dart`-Parts und
der `_chapter<Lang>`-Funktion ist vollständig hierher migriert und existiert
nicht mehr.

**Layout der Info-Liste** (`InfoListPage`) — seit dem Texte-Umbau:
1. „Bedienung des Hauptrechners" (`chapterTitle01`) — Handbuch-
   Expansion (`_ManualSectionExpansion`, parametrisiert statt
   dupliziert): App-Hilfe, kein Theorie-Stoff.
2. „Bedienung des Einheitenrechners" (`infoListConverterManual`) —
   zweite Instanz derselben Expansion, gespeist aus
   `converterManualChapters` (sechs Kapitel: Der zweite Rechner ·
   Kategorie/Zahl/Einheit · met/imp+Farben · +/−-Terme ·
   Skalar-Rechnen · Speicher/Konstanten/Brücke). **Alle 14 Sprachen
   vollständig übersetzt** (Subagenten-Pipeline: Übersetzen + Review);
   der positionsweise Deutsch-Fallback bleibt als Mechanik für
   künftige Kapitel bestehen.
3. „Bedienung des Werterechners" (`infoListAssetManual`) — dritte
   Instanz derselben Expansion, gespeist aus `assetManualChapters`
   (sechs Kapitel, „Der dritte Rechner" … „Kurve"; alle 14 Sprachen).
4. `_TheoryExpansion` — ausklappbar zu sechs Zeilen: die vier
   Theorie-Blöcke (Grundlagen, Zwölf und die Welt, Dozenale
   Mathematik, Dozenale Gesellschaft), dann „Einheitentheorie"
   (`infoListConversionsEntry` → `ConversionsPage`; dorthin gezogen,
   als die frühere `_UnitsExpansion` aufgelöst wurde), zuletzt
   „Wertetheorie" (`theoryBlockWerte` → `werteTheoryBlock`). Einen
   Navigations-Eintrag „Einheitenrechner" gibt es nicht mehr (Swipe +
   Page-Peek tragen den Zugang; der `requestConverter`-Pfad in
   state/main ist entfernt).
5. `_RecommendationsExpansion` — ausklappbar; ein Kapitel pro
   Plattform mit Pros/Cons je Rechner (eigener Abschnitt
   „Empfehlungen" unten).
6. **Einstellungen-Eintrag** — pusht `SettingsPage`
   (`settings_page.dart`, eigener Abschnitt unten). Die früher hier
   liegenden Quick-Toggles (Glyphen-Stil, Haptik) sind dorthin gezogen.
7. `_LanguagePickerExpansion` — analoge Ausklapp-Struktur, Default
   collapsed, listet `kSupportedLanguages`.
8. Sekundärseiten als Navigations-Items (Datenschutz, Lizenz, Spenden,
   Feedback).
9. `_VersionFooter` (Padding + Versions-Anzeige).

Alle Top-Level-Items sind durch 1-dp-Dividers im Palette-Slot `divider`
getrennt; keine grösseren Gaps mehr (früher 24 dp vor dem Sprach-
Picker als visueller Sektions-Marker — mit dem Theorie-Expansion-
Container ist dieser Marker visuell redundant geworden).

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

Ausklappbarer Eintrag direkt unter „Theorie" (`_RecommendationsExpansion` in
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
