# Verbesserungen — offene Todos (Code-Review)

Stand: 2026-06-10. Quelle: Code-Review der App. Die **Korrekturen** (Bugfixes +
Code-Hygiene) und die ersten Features sind bereits umgesetzt und committet
(siehe [Erledigt](#erledigt-referenz)). Hier die noch offenen Vorschläge als
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
mit neuem `showCursor`-Flag), Tap = Recall + schließen. ARB
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
recall + schließen).

**Constraint:** Mittlerer-großer Aufwand. **Keine** Store-Screenshot-Änderung,
solange der Einstieg nicht über eine neue Keypad-Taste läuft.

### 2. M+ / M− — ✅ erledigt (Logik + Hoch-UI; Breit offen)
**Umgesetzt:** Tokens `MemPlus`/`MemMinus`, exakte BigInt-Akkumulation auf
`memoryRational` (`cur.add/sub(lastAns)`), Tasten auf der **zweiten Overlay-Seite
(OLR)**. Tests grün. *Offen: Breit (Tablet) — siehe Sammelnotiz unter #4.*

**Problem (Ausgangslage):** `Sto` überschreibt den einzigen Speicher. Kein akkumulierender
Speicher (Standard auf wissenschaftlichen Rechnern).

**Lösung:** `memPlus()`/`memMinus()` addieren/subtrahieren `lastAns` auf
`memoryRational` (exakt, BigInt). Braucht zwei neue Tasten oder eine
Umwidmung (z. B. Sto-Doppeltipp).

**Constraint:** Neue Keypad-Tasten ⇒ **Store-Screenshots betroffen.** Set 6
(Memory) hätte Platz, aber es ist eine Layout-Änderung am Haupt-Keypad.

### 3. Funktionstasten (ln, eˣ, x², ±, log₁₂, nCr/nPr) — ✅ erledigt (Logik + Hoch-UI; Breit offen)
**Umgesetzt:** `Ln`/`ExpE`/`Log12` (f64: ln/exp/log12), `NCr`/`NPr`
(fakultätsbasiert im Resolver), `Square` (= ^2-Shortcut), `PlusMinus`
(Vorzeichen-Toggle des aktuellen Literals). Tasten auf OLR. 9 Tests grün.
*Offen: Breit (Tablet) — siehe Sammelnotiz unter #4.*

**Problem (Ausgangslage):** Kein direktes `ln`/`eˣ`, kein `x²`, kein Vorzeichen-Toggle `±`,
kein Logarithmus zur Basis 12, keine Kombinatorik.

**Lösung:** Pro Funktion ein Token + Eval-Pfad ergänzen (`expression.dart`:
`tokenMevalStr`/`_applyFunc`, ggf. `rat_parser.dart`; die jetzt erschöpfenden
`switch` zwingen zur Vollständigkeit) + Taste in einem Overlay-Set. `ln` ist
intern schon da (log-Auflösung), braucht nur Token + Taste. `x²` = `^2`-
Shortcut. `±` = Negate am aktuellen Literal. `nCr/nPr` BigInt-Fakultäts-basiert
(in Basis 12 didaktisch reizvoll).

**Constraint:** Neue Tasten ⇒ **Store-Screenshots.** Set 9 (Extended) hat Luft.

### 4. Wissenschaftsnotation / EXP-Eingabe — ✅ erledigt (Logik + Hoch-UI; Breit offen)
**Umgesetzt:** Token `Sci`; `a EXP b` → `a·Basis^b` (×10ⁿ dezimal, ×12ⁿ dozenal,
in `buildMevalString` mit der aktiven Basis). Taste auf OLR. Test `5 EXP 2 = 500`
(dozenal) grün.

**Offen für #2–#4 — Breit (Tablet/Landscape):** Die neuen Tasten leben bislang
nur im **Hoch-Zwei-Seiten-Overlay (OLL/OLR mit Rand-Pfeilen + Wisch)**. In Breit
(alle Sets inline) fehlen sie noch. Inline-Anhängen (16 statt 13 Spalten) bricht
die „Kompakt-Phone passt ohne Scrollen"-Garantie (Test) — daher braucht Breit
**dieselbe Zwei-Seiten-Behandlung** wie Hoch (Design-Entscheid), nicht Inline-
Scroll. Bis dahin sind die Funktionen am Telefon-Hochformat voll nutzbar.

**Problem (Ausgangslage):** Sehr große/kleine Zahlen sind weder eingebbar (`EXP`/`×10ⁿ`) noch
lesbar (lange exakte Ergebnisse werden hart geschnitten).

**Lösung:** `Exp`-Token (`×10ⁿ`, in Doz mit 10 = zwölf) + Lexer/Parser-
Erweiterung in `expression.dart`; Ergebnis-Formatierung mit Mantisse +
Exponent ab einer Stellen-Schwelle.

**Constraint:** Neue Taste + Eval + Formatierung. Screenshots. Größer.

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

### 7. Heller Modus
**Problem:** Nur Dark-Theme; Farben sind als `const Color(...)` über die
Custom-Painter verstreut.

**Lösung:** Farb-Palette zentralisieren (ein `CalcColors`-Scope statt verstreuter
Konstanten), Light-Variante definieren, Theme-Toggle (persistiert wie GlyphStyle/
Haptik). Alle Custom-Painter (Glyphen, Tokens, Display) müssen die Farben aus
dem Scope lesen statt aus Konstanten.

**Constraint:** Marken-/Design-Entscheidung (wie soll Light aussehen?).
Größerer Umbau über alle Painter.

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
  (OLL/OLR)** verdrahtet. Breit-Verdrahtung als einziger Rest offen.
