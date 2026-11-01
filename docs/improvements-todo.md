# Verbesserungen — offene Todos

Sammelstelle für alles, was noch zu tun ist, auch für Kleinigkeiten. Erledigtes wird hier gestrichen oder nach unten
verschoben.

## Offene Punkte

Stand: 2026-11-01, gegen den Code und die genannten Dienste geprüft. Was sich von hier aus nicht prüfen liess, ist markiert.

### Nächster Release

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

- [ ] **`=`-Zyklus über beide Einheitensysteme** im Umrechner: [unit-converter.md](unit-converter.md#10-offene-ideen-todo).
      Der Eintrag dort spricht noch von der Doz/Dez-Welt, seit der Entkopplung ist das Einheitensystem gemeint.
- [ ] **Werterechner, spätere Phasen:** Krypto, Rohstoffe, Rhodium, Karat, Apothekereinheiten, Feinschliff für lange
      Gattungs-Labels im Breit-Layout: [asset-converter.md](asset-converter.md#offene-punkte-für-spätere-phasen).
- [ ] **Theorie-Themen ohne Dossier:** Goldener Schnitt, Pi, Einheitskreis und 360° sowie die Ideen im
      [Recherche-Backlog](research/README.md#backlog-stand-pflegen).
- [ ] **`DozenalCalcState` weiter entflechten**, nur bei Bedarf: siehe Punkt 8 unten.

### Aufräumen im Repo

- [ ] `build18-release-notes.txt` entfernen: Laut [release-workflow.md](release-workflow.md) bleibt nur die aktuellste
      Fassung liegen.
- [ ] `appstore-build16-submission.md` im Projekt-Root: prüfen, ob die Anleitung noch gebraucht wird, sonst nach `docs/`
      verschieben oder entfernen.
- [ ] **`tool/analyze_changed.py` robuster machen.** Die git-Aufrufe lesen noch mit der Standard-Kodierung des Systems,
      unter Windows also nicht UTF-8. Fehlt `git` oder `origin/master`, endet das Skript mit einem Traceback statt mit einer
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

---

## Code-Review vom Juni 2026

Stand: 2026-06-11. Quelle: Code-Review der App. Die **Korrekturen** (Bugfixes +
Code-Hygiene) und die ersten Features sind bereits umgesetzt und committet
(siehe [Erledigt](#erledigt-referenz-committet)). Hier die noch offenen Vorschläge als
Todos — jeweils mit Problem, Lösungsskizze und den Constraints (vor allem:
ändert es das Haupt-Keypad → Store-Screenshots? braucht es 14-Sprachen-
Lokalisierung? braucht es eine Produkt-/Design-Entscheidung?).

---

## Rechner-Funktionen

### 1. Ergebnis-Historie / Tape — ✅ erledigt (committet)

**Umgesetzt:** `List<HistoryEntry>` in `DozenalCalcState` (gecappt 30, überlebt
AC, dedup bei wiederholtem `=`), Push am Ende von `calculateResult`,
`recallHistory` wie `Ans` (exakt via `RatLit`, sonst Ziffern). **Einstieg
(Produktentscheidung): Abwärts-Wisch auf dem Display** (`TwoLineDisplay.onSwipeDown`)
→ Bottom-Sheet mit den Rechnungen (neueste zuerst, je read-only `TwoLineDisplay`
mit neuem `showCursor`-Flag), Tap = Recall + schliessen. ARB
`historyTitle`/`historyEmpty` (14 Sprachen). Ohne Persistenz (MVP).
*Hinweis: Wisch-Geste ist bewusst undiscoverable — optionaler Folgeschritt:
Erwähnung in „Bedienung des Rechners".*

**Problem (Ausgangslage):** Es gibt nur `lastAns` (genau einen Wert) + einen Speicher. Kein
scrollbarer Verlauf vergangener Rechnungen.

**Lösung:** Session-Tape in `DozenalCalcState`: `List<HistoryEntry>` (gecappt
~30), am Ende von `calculateResult` gepusht (Eintrag = Eingabe-Tokens +
resultBuffer + lastAns + lastResultF64 + isF64-Flag). `recallHistory(entry)`
fügt den Wert wie `Ans` ein (RatLit bei exaktem Wert, sonst resultBuffer-Tokens).
History bleibt über AC erhalten (Tape-Charakter). MVP ohne Persistenz; später
optional via SharedPreferences (Token-Listen serialisieren).

**Offene Entscheidung (Produkt):** Einstiegspunkt im engen 2-Zeilen-Display.
Optionen — (a) kleines `Icons.history`-Widget oben im Display, sichtbar/
diskoverbar, aber Platzkonkurrenz mit M-/DEG/DOZ-Indikatoren; (b) Swipe-Geste
auf dem Display, kollisionsarm gegen Tap/Long-Press, aber undiskoverbar;
(c) Eintrag „Verlauf" in der Info-Liste, sauber aber weit vom Rechner weg.
UI dann via `showModalBottomSheet` (Einträge „Ausdruck = Ergebnis", Tap →
recall + schliessen).

**Constraint:** Mittlerer-grosser Aufwand. **Keine** Store-Screenshot-Änderung,
solange der Einstieg nicht über eine neue Keypad-Taste läuft.

### 2. M+ / M− — ✅ erledigt (Logik + Hoch + Breit)

**Umgesetzt:** Tokens `MemPlus`/`MemMinus`, exakte BigInt-Akkumulation auf
`memoryRational` (`cur.add/sub(lastAns)`), Tasten auf der **zweiten Overlay-Seite
(OLR)** und der **Breit-Funktionsseite** (siehe Sammelnotiz unter #4). Tests grün.

**Problem (Ausgangslage):** `Sto` überschreibt den einzigen Speicher. Kein akkumulierender
Speicher (Standard auf wissenschaftlichen Rechnern).

**Lösung:** `memPlus()`/`memMinus()` addieren/subtrahieren `lastAns` auf
`memoryRational` (exakt, BigInt). Braucht zwei neue Tasten oder eine
Umwidmung (z. B. Sto-Doppeltipp).

**Constraint:** Neue Keypad-Tasten ⇒ **Store-Screenshots betroffen.** Set 6
(Memory) hätte Platz, aber es ist eine Layout-Änderung am Haupt-Keypad.

### 3. Funktionstasten (ln, eˣ, x², ±, log₁₂, nCr/nPr) — ✅ erledigt (Logik + Hoch + Breit)

**Umgesetzt:** `Ln`/`ExpE`/`Log12` (f64: ln/exp/log12), `NCr`/`NPr`
(fakultätsbasiert im Resolver), `Square` (= ^2-Shortcut), `PlusMinus`
(Vorzeichen-Toggle des aktuellen Literals). Tasten auf OLR und der
Breit-Funktionsseite. 9 Tests grün.

**Problem (Ausgangslage):** Kein direktes `ln`/`eˣ`, kein `x²`, kein Vorzeichen-Toggle `±`,
kein Logarithmus zur Basis 12, keine Kombinatorik.

**Lösung:** Pro Funktion ein Token + Eval-Pfad ergänzen (`expression.dart`:
`tokenMevalStr`/`_applyFunc`, ggf. `rat_parser.dart`; die jetzt erschöpfenden
`switch` zwingen zur Vollständigkeit) + Taste in einem Overlay-Set. `ln` ist
intern schon da (log-Auflösung), braucht nur Token + Taste. `x²` = `^2`-
Shortcut. `±` = Negate am aktuellen Literal. `nCr/nPr` BigInt-Fakultäts-basiert
(in Basis 12 didaktisch reizvoll).

**Constraint:** Neue Tasten ⇒ **Store-Screenshots.** Set 9 (Extended) hat Luft.

### 4. Wissenschaftsnotation / EXP-Eingabe — ✅ erledigt (Logik + Hoch + Breit)

**Umgesetzt:** Token `Sci`; `a EXP b` → `a·Basis^b` (×10ⁿ dezimal, ×12ⁿ dozenal,
in `buildMevalString` mit der aktiven Basis). Taste auf OLR. Test `5 EXP 2 = 500`
(dozenal) grün.

**Breit-Verdrahtung (#2–#4) — ✅ erledigt:** Die dritte Gruppe des
Breit-Keypads pagt jetzt analog zu Hoch (OLL/OLR): Seite 0 = Sets 6–10 mit
hohem Rand-Pfeil rechts, Seite 1 = Funktionstasten als transponierte Spalten
(`_funcCol1`–`_funcCol4`, gleiche Zeilen↔Spalten-Konvention wie Sets 1–4 ↔
`_hochOpRows`) mit Rand-Pfeil links zurück. Der Pfeil-Platz
(`_kPageArrowWidth + _kPageArrowMargin + interBlockGap`) ist in die
Breiten-Mathematik eingerechnet und auf beiden Seiten identisch — die
„Kompakt-Phone passt ohne Scrollen"-Garantie hält (eigener Test für Seite 1).
**Kein Wisch in Breit** (bewusst): horizontale Drags müssen für den
Scroll-Fallback auf schmalen Geräten frei bleiben; das Paging läuft nur über
die Pfeile. Beide Pfeile (Hoch + Breit) haben Semantics-Labels
(`a11yPageFunc`/`a11yPageSets`, 14 Sprachen). Inline-Anhängen (16 statt 13
Spalten) war zuvor verworfen worden, weil es die Fit-Garantie bricht.

**Problem (Ausgangslage):** Sehr grosse/kleine Zahlen sind weder eingebbar (`EXP`/`×10ⁿ`) noch
lesbar (lange exakte Ergebnisse werden hart geschnitten).

**Lösung:** `Exp`-Token (`×10ⁿ`, in Doz mit 10 = zwölf) + Lexer/Parser-
Erweiterung in `expression.dart`; Ergebnis-Formatierung mit Mantisse +
Exponent ab einer Stellen-Schwelle.

**Constraint:** Neue Taste + Eval + Formatierung. Screenshots. Grösser.

---

## UI / UX

### 5. „Expand"-Affordance schärfen — ✅ erledigt (Build-Folge, committet)

**Umgesetzt:** Dezenter, zentrierter „Erweiterungsfeld"-Header (···-Icon +
lokalisierter Titel, ARB-Key `keypadOverlayTitle`, 14 Sprachen) über den
erweiterten Sets im **offenen** Overlay. Nur im offenen Zustand gerendert →
geschlossenes Haupt-Keypad (Store-Screenshot) unverändert.

**Problem (Ausgangslage):** Der „…"-Button (System-Reihe) toggelt das Overlay-Panel; im
**geschlossenen** Zustand ist nicht offensichtlich, dass dahinter erweiterte
Funktionen liegen.

**Lösung:** Klareres Open-State-Feedback. **Screenshot-sicher nur**, wenn der
geschlossene Zustand (= Store-Screenshot) unverändert bleibt — also Politur am
**offenen** Overlay-Zustand (dezenter Header/Highlight „Erweiterte Funktionen").
Eine Glyphen-Änderung am geschlossenen Button würde den Screenshot ändern.

**Constraint:** Klein. Achtung Screenshot-Falle (s. o.).

### 6. Operator-Discoverability (√, log) — ✅ erledigt (Variante c, committet)

**Umgesetzt:** „Spezialoperatoren"-Sektion in „Bedienung des Rechners"
geschärft (14 Sprachen) — inkl. klarer Operandenreihenfolge mit Beispielen
(`3√8 = 2`, `8 log 2 = 3`). **Dabei einen echten Doku-Bug gefunden und behoben:**
log war als „Basis = vorangehende Zahl" beschrieben; korrekt ist
`x log n = ln(x)/ln(n)`, also linke Zahl = Argument, rechte Zahl = Basis.

**Problem (Ausgangslage):** `n √ x` (n-te Wurzel) und `x log n` (Logarithmus zur Basis n) —
die Operanden-Reihenfolge ist nicht offensichtlich.

**Lösung:** Optionen — (a) einmaliger, wegklickbarer Hinweis (SnackBar) beim
ersten Tippen; (b) visueller Operand-Platzhalter in der Eingabezeile;
(c) im Theorie-Kapitel/Intro erklären (Theorie ist ohnehin in Arbeit).

**Constraint:** Variante (a) braucht **lokalisierte Hinweis-Strings (14
Sprachen)** + SharedPreferences-Flag. (c) ist am billigsten, sobald Theorie passt.

---

## Design

### 7. Heller Modus — ✅ erledigt (committet)

**Umgesetzt:** Semantische Palette `AppColors` (dark/light) in
`lib/app_theme.dart`, `ThemeNotifier` (`theme_mode_v1`,
Dunkel/Hell/System) + `ThemeScope`, Settings-Zeile „Erscheinungsbild";
alle Custom-Painter lesen die Palette (`AppColors.of` mit
Dark-Fallback ohne Scope). Details: docs/einstellungen-und-theming.md Theming-Abschnitt.

**Problem (Ausgangslage):** Nur Dark-Theme; Farben waren als
`const Color(...)` über die Custom-Painter verstreut.

---

## Architektur

### 8. `DozenalCalcState` weiter entflechten — teilweise erledigt

**Erledigt:** Reine Ergebnis-Formatierung nach `lib/logic/result_format.dart`
ausgelagert (Flutter-frei, eigene Unit-Tests).

**Nuance / nicht naiv lösen:** Die naheliegende Idee „Memory + Modi in eigene
Notifier" ist **nicht** sauber — `angleMode`/`numeralSystem`/Memory sind
Rechen-**Kernzustand** (anders als Locale/GlyphStyle, die reine
Präsentations-Prefs sind) und eng mit `handleClick`/`calculateResult`
verzahnt. Eine Extraktion in ChangeNotifier brächte Indirektion ohne echte
Trennung.

**Bessere nächste Schritte, falls der Orchestrator weiter wächst:** (a)
Input/Cursor-Verwaltung (`_insertAtCursor`/`Del`/`_hasDecimalInCurrentLiteral`/
`_tryInverseToggle`/`moveCursorTo`) in eine pure `InputBuffer`-Hilfsklasse;
(b) die Ergebnis-Display-Felder (resultBuffer/period/`_reformatResultInBase`)
bündeln. Nur bei Bedarf — keine Refactor-Schuld auf Vorrat.

---

## Erledigt (Referenz, committet)

- Doz↔Dez Stale-Result-Fix (+ `_resultLive`-Guard gegen f64-Resurrection nach AC)
- Physische-Tastatur-A/B-Sperre im Dez-Modus
- `≈`-Marker für f64-Näherungen (getrennt vom Truncation-`…` und State-C-Punkten)
- Clipboard-Copy per Long-Press + Haptik-Schalter (HapticsNotifier/Scope)
- Toter `formatDecimalResult` entfernt
- Const-Quartett zentralisiert (`CalcToken.isIrrationalConstant`)
- `tokenMevalStr` / `_tokenText` / `_tokenSemanticLabel` als erschöpfende `switch`
- A11y-Screenreader-Labels in allen 14 Sprachen (statt hartcodiertem Deutsch)
- Basis-10-Klammer (`{…}`-Gegensystem-Referenz) auf der Hauptanzeige
- Ergebnis-Formatierung nach `logic/result_format.dart` ausgelagert
- #5 Open-State-„Erweiterungsfeld"-Header (screenshot-sicher, 14 Sprachen)
- #6 √/log-Operandenreihenfolge in „Bedienung des Rechners" (14 Sprachen);
  dabei log-Doku-Bug korrigiert (Basis = rechte Zahl, nicht linke)
- Glyphen-Doku-Fix: B (elf) ist Halbkreis über Vollkreis, kein gefüllter Kreis
- „Was ist das Dozenalsystem?": Apfel-Satz entzweideutigt (15 = dutzendunddrei)
- #1 Ergebnis-Historie / Tape (Wisch-Geste, Bottom-Sheet, recall, 14 Sprachen)
- #2/#3/#4 Funktionstasten-Rechenkern (M+/M−, x², ±, ln, eˣ, log₁₂, nCr, nPr,
  EXP) — Tokens, Eval, State, a11y×14, 9 Tests; **Hoch-Zwei-Seiten-Overlay
  (OLL/OLR)** verdrahtet.
- #2/#3/#4 Breit-Verdrahtung: dritte Gruppe pagt zwischen Sets 6–10 und den
  Funktionsspalten (Rand-Pfeile, kein Wisch); Pfeil-Platz in der
  Breiten-Mathematik, Fit-Garantie-Test für Seite 1, Pfeil-Semantics ×14.
  Damit ist #2–#4 vollständig.
- #7 Heller Modus (`AppColors` dark/light, `ThemeNotifier`/`ThemeScope`,
  Settings-Zeile, alle Painter auf Palette)
- **Langdruck-Redesign** (ersetzt die OLR-/Funktionsseiten-Verdrahtung
  von #2–#4): Funktionstasten jetzt als Langdruck-Popups auf
  Host-Tasten (x^□→{x²}; log_□→{ln, log₁₂, eˣ}; −→{±}; STO→{M+, M−};
  n!→{nCr, nPr}; Map `longPressOptionsFor`), Ecken-Marker + a11y-Hint,
  Auswahl per Gleiten+Loslassen **und** Loslassen+Tippen. Die zweite
  Overlay-/Funktionsseite ist per `_kFuncPageEnabled = false`
  deaktiviert (Code bleibt erhalten). Doz/Dez-Tasten vom Keypad
  entfernt — Basis-Umschaltung nur noch über die Einstellungen
  (ausgeschriebene Labels „Dozenal"/„Dezimal" ×14); EXP rückte in
  Set 10 nach. Neue Settings-Zeile „Ziffern auf Tasten"
  (`keypad_glyph_style_v1`, unabhängig vom Display-Pref). Intro-Slide 7
  + Kapitel-1-Prosa angepasst ×14, Intro-Flag `intro_seen_v3`.
