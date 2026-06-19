# Werterechner (dritter Rechner-Modus): Edelmetalle & Währungen

Der **Werterechner** ist der dritte Rechner neben Haupt- und Einheitenrechner —
**Seite 3 des horizontalen Pagers** (zweimal Links-Swipe vom Hauptrechner).
Nutzer-sichtbarer Name „Werterechner" (`pagerLabelAsset`); der interne Code-/
Dateinamensraum bleibt `asset` (umbrella für Metalle/Währungen/später
Krypto/Rohstoff). Künftige Begleittexte: „Bedienung des Werterechners"
(Handbuch) und „Wertetheorie" (analog zur Einheitentheorie). Im Design des Einheitenrechners,
aber mit **drei** Hierarchien statt zwei:

```
Klasse (AssetClass)  →  Gattung (AssetGenus)  →  Einheit (Unit)
Edelmetall           →  Gold/Silber/Platin/   →  gr · dwt · oz · oz t · lb t · lb
                        Palladium                · g · kg
Währung              →  USD/EUR/GBP/JPY/CHF/  →  $/¢ · €/ct · £/sh/d/p · ¥ · …
                        CAD/AUD
```

Hintergrund, Recherche, Lizenz- und Store-Befunde sowie die abgelehnten
Annahmen: siehe den genehmigten Plan (17-Agenten-Recherche + adversariale
Prüfung). Diese Datei ist die laufende Spezifikation.

## Phasen

- **Phase 1 (v1) — umgesetzt:** exakte Umrechnung. Troy-/avoirdupois-Gewichte
  (metallunabhängig) und Währungs-Stückelungen. **Keine** Preise/Kurse.
- **Phase 2 — umgesetzt:** Kurse & Werte. Grober, datierter Snapshot
  (`logic/rate_data.dart`, überschreibbar) + Kurs-Editor (`rates_page.dart`) +
  **Wertmodus mit Zielwährungs-Picker** („≈"-Wert, „Stand: Datum"). Erst hier
  wird die Metall-Gattung (Wert) und die Cross-Währungs-Umrechnung aktiv.
  Opt-in-Selbst-API nur als Doku (`docs/asset-rates-api.md`), **kein Netzcode
  im ausgelieferten Binary, keine Datenschutz-Änderung** (erlauben ≠ ausliefern).
- **Phase 3 — geplant:** historische Preiskurve (BoE-Spine ab 1209 + diskrete
  Antike-Ankerpunkte), Custom-Paint, log10-Achse, Basis-12-Ticks; Toggle ersetzt
  das Keypad im selben Rect.

## Datenmodell (`lib/logic/asset_data.dart`)

Reine Daten, keine Flutter-Imports. **Wiederverwendet `Unit`/`UnitWorld`** aus
`unit_data.dart` — für v1 ist jeder Faktor „Tier 1": ein exaktes definitorisches
Vielfaches eines gemeinsamen Basiswerts, also genau das `Unit.toBase`/`fromBase`-
Modell. (Tier 2 — dichteabhängige Rohstoff-Umrechnungen mit „≈"-Suffix — kommt
mit der Rohstoffklasse in einer späteren Phase.)

- `enum AssetClass { metal, currency }` (später `crypto`, `commodity`).
- `class AssetGenus { key, assetClass, units, breakdown, singleWorld }` —
  `ladderFor(world)`, `unitBySymbol`, `breakdownUnits()`. `singleWorld` = kein
  met/imp-Axis (alle Währungen).
- `kAssetCatalogue` / `generaOf(class)`.

**Edelmetall — exakte Faktoren (Basis = kg, Anker grain = 0,06479891 g):**
gr · dwt (24 gr) · oz avdp (437,5 gr) · oz t (480 gr = **31,1034768 g**) ·
lb t (12 oz t = 5760 gr = **373,2417216 g**) · lb avdp (7000 gr). Alle vier
Metalle teilen **dieselbe** Leiter (`_metalUnits`) — reine Gewichtsumrechnung ist
metallunabhängig. Dozenal-Aufhänger: **12 troy oz = 1 troy lb**. Falle: troy oz
ist 9,71 % schwerer als avdp oz, aber das troy-Pfund ist **leichter** (12 statt
16 Unzen).

**Währung — exakte Stückelungen (Basis = Haupteinheit, `singleWorld`):** GBP
£/sh/d/p mit £sd-Breakdown (12 d = 1 sh, 240 d = 1 £ — nativ dozenal); USD/EUR/
CHF/CAD/AUD mit 1/100-Untereinheit; JPY ohne Untereinheit. Symbole ASCII/Latin-1
(monospace-display-sicher), auf **sieben** Währungen begrenzt, damit Klasse +
Gattungen in die acht Drill-Zellen des Keypads passen. Cross-Währungs-Faktoren
in v1 leer (Phase 2).

## Konversionslogik (`lib/logic/asset_convert.dart`)

`assetNextInLadder`, `assetBracketPartner` (metals: nächster
Partner im Gegen-System; singleWorld: kein Partner → State zeigt Gegen-Basis),
`assetBreakdown` (mixed-radix; **Floor-Epsilon 1e-9** gegen f64-Undershoot der
kg-basierten Troy-Faktoren). `convert` wird aus `unit_convert.dart` reexportiert.

## State (`lib/asset_state.dart`)

`AssetState extends ChangeNotifier`, eng an `ConverterState` angelehnt (Compound-
Terme, Skalar-Operatoren, Edit-Cursor, `=`-Zyklus, met/imp, `setBase`). Stellt
`topLine`/`resultLine` als **`ConverterLine`** bereit → Display wiederverwendbar.
Zusätzlich: Drill-down `drillLevel` (`classes`/`genera`/`units`) über
`tapClass`/`tapGenus`/`tapMagnitude` (Tipp auf aktive Klasse/Gattung = eine Ebene
zurück). `worldToggleEnabled` ist false für Währungen. Bridge-Felder
(`calcAnsProvider`/`ansForBridge`) existieren, sind in v1 aber inert.

## UI

- **Display:** `ConverterDisplay` (`converter_display.dart`) unverändert
  wiederverwendet — es ist generisch über `ConverterLine`.
- **Keypad** (`lib/asset_keypad.dart`): eigener Widget-Baum, gebaut aus den
  geteilten Bausteinen in `keypad_parts.dart` (`PressableShell`, `DigitKey-/
  TokenKeyPainter`, **`LabelButton`/`SystemKey`/`showUnitInfoBox`** — beim Bau
  des Asset-Rechners aus `converter_keypad.dart` dorthin promotet, beide Keypads
  teilen sie jetzt). Die zwei rechten Tile-Spalten (8 Zellen) sind ein 3-Ebenen-
  Navigator; Op-Spalten (Set 1/2), System-Reihe und met/imp-Equals-Reihe wie im
  Umrechner. Genus-Tiles tragen einen Langdruck-Hinweis (`assetValueHint`:
  „Spotwert/Kurs folgt"). met/imp ist bei Währungen ausgegraut (`enabled`).
- **Seite** (`lib/asset_page.dart`): `AssetBody` (im Pager) + `AssetPage`
  (Route-Wrapper für Tests/Preview). Labels via `lib/asset_labels.dart`
  (`assetClassLabel`/`assetGenusLabel`; Währungs-Tiles = ISO-Code).

## Pager-Integration (`lib/main.dart`)

`_CalcScaffoldState` besitzt zusätzlich `_assetState` (v1 ohne Bridge). PageView
hat drei Kinder; `_pagerProgress` clampt auf `[0, 2]`; `_PagePeekOverlay` läuft
eine 3-Karten-Schleife (Karte i leuchtet bei `progress ≈ i`); `_handleAssetKey`
routet physische Tasten auf Seite 2; die globale „Zahlensystem"-Basis wird (wie
beim Umrechner) in `_assetState.setBase` gespiegelt.

## Lokalisierung

`pagerLabelAsset` (DE „Werterechner", EN „Value calculator"),
`assetClassMetal/Currency`, `assetGenus{Gold,Silver,Platinum,Palladium}`,
`assetValueHint` plus die Phase-2-Keys (`assetValueKey`, `assetRatesKey`,
`assetRatesTitle`, `assetRatesAsOf`, `assetValueNote`, `assetRatesCurrencies`,
`assetRatesMetals`, `assetRatesReset`, `assetRatesResetAll`,
`assetRatesSourceHint`) — **alle 14 Sprachen vollständig übersetzt**
(Subagenten-Pipeline: Übersetzen + Review), Platzhalter `{date}`/`{pivot}`
erhalten. Equals-Hinweis nutzt `converterEqualsHint`. Einheiten-/Währungs-
symbole bleiben international.

## Wertmodus & Kurse (Phase 2)

Gattungsübergreifende Geldwerte über einen **expliziten Wertmodus + Zielwährungs-
Picker**:

- `lib/logic/rate_data.dart` — `RateSnapshot` + `kRateSnapshot`: grobe, datierte
  Richtwerte (Pivot USD, `asOf`). Keys = `AssetGenus.key`. Bewusst ungefähr.
- `lib/rate_store.dart` — `RateStore extends ChangeNotifier`: Snapshot +
  SharedPreferences-Overrides (`rate_ovr_cur_*` / `rate_ovr_met_*`), Pivot-
  geroutete Konversion (`pivotOfCurrency`/`pivotOfMetalKg`/`currencyFromPivot`).
- `lib/asset_state.dart` — Wertmodus: `drillLevel == valueTargets` (Picker),
  `enterValueMode`/`setValueTarget`/`toggleValueMode`, `valueLine` („≈", über
  `rates`). Jede bearbeitende Aktion ruft `_leaveValueMode()` → zurück zur
  exakten Leiter.
- `lib/asset_keypad.dart` — „Wert"/„Kurse"-Tasten in der Overlay-Bottom-Row
  (Breit: eigene Spalte); im Wertmodus rendert der Drill die Währungs-Ziel-Tiles.
- `lib/rates_page.dart` — Kurs-Editor (Stand-Kopf, editierbare Felder pro
  Währung/Metall, Reset pro Zeile + global), gepusht aus „Kurse".
- `lib/converter_display.dart` — neuer `resultPrefix` („≈ " statt „= ").
- `lib/main.dart` — `RateStore` besessen/`load()`, in `_assetState.rates`
  injiziert; `asset_page` lauscht via `Listenable.merge` auch auf die Kurse.
- **Opt-in-API:** nur Doku (`docs/asset-rates-api.md`); ausgeliefertes Binary
  netzwerkfrei, Release/Main-Manifest ohne `INTERNET`, `legal/privacy-*`
  unverändert.

## Tests

- `test/asset_convert_test.dart` — exakte Faktoren + Breakdown + Bracket.
- `test/asset_state_test.dart` — Drill-down, Commit, `=`-Zyklus, met/imp, Basis,
  **Wertmodus** (Ziel-Picker, `valueLine`, „≈", Editier-Exit).
- `test/rate_store_test.dart` — Konversionsmathematik + Override-Persistenz.
- `test/rates_page_test.dart` — Editor rendert, Override schreibt/zurücksetzt.
- `test/asset_keypad_layout_test.dart` — Höhen-Regime × Drill-Ebenen (inkl.
  `valueTargets`/Overlay) × Seitenverhältnisse, plus Tile-Tap-Drilldown.
- `test/calc_pager_test.dart` — dritte Seite per Swipe, Tastatur-Routing,
  Page-Peek mit drei Karten.

## Offene Punkte für spätere Phasen

Krypto/Rohstoff-Klassen
(Krypto: f64 mit gedeckelter Anzeige) · Rhodium/Karat/Apothekereinheiten ·
Result-Brücke Asset ↔ Hauptrechner · Breit-Layout-Feinschliff für lange
Gattungs-Labels.
