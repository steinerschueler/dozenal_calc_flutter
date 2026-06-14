# Microsoft Store Listing — Dozenal Calc

> 📘 **Den kompletten, erprobten Veröffentlichungs-Ablauf (Build → MSIX →
> Listings → Submit) inkl. aller Stolpersteine findest du in
> [`WORKFLOW.md`](WORKFLOW.md).** Diese README beschreibt nur die Listing-Felder.

Store-Listing-Inhalt für das **Partner Center** (Store ID `9N4M1XLPLP0N`,
Seller ID `94980040`, Publisher „steinerschüler"). Eine Datei pro Sprache:
`listing.<locale>.md`. Der Text stammt aus den vorhandenen Play-Store-
Listings — **ohne HTML-Tags**, denn das Microsoft-Store-Beschreibungsfeld
ist reiner Text (Zeilenumbrüche bleiben erhalten, `<b>`/`<i>` werden NICHT
gerendert). Walisisch (`cy`) und Irisch (`ga`) sind neu übersetzt.

## Feld-Zuordnung Play Store → Microsoft Store

| Play Store | Microsoft Store (Partner Center → Store listings) |
|---|---|
| Lange Beschreibung (HTML) | **Description** (Plain Text, max 10 000 Zeichen) — hier einfügen |
| Kurzbeschreibung | kein eigenes Feld im MS Store; als erster Satz / „Product feature" nutzbar |
| Feature-Bullets | optional als **Product features** (max 20, je 200 Zeichen) |
| App-Name | kommt global aus dem reservierten Namen **„Dozenal Calc"** (siehe unten) |
| Keywords | **Search terms** (max 7, je 30 Zeichen) — pro Sprache unten |

## Wichtig: App-Name ist global

Anders als im Play Store hat ein MS-Store-Listing **kein eigenes Titelfeld
pro Sprache**. Der angezeigte Name ist überall der reservierte Produktname
**„Dozenal Calc"** (bzw. der `display_name` aus dem MSIX-Manifest). Die im
Play Store genutzten lokalisierten Namen (ダース計算, 打进制计算, حساب الدزينة
usw.) lassen sich hier **nicht** ohne Weiteres als Titel verwenden — der Name
bleibt „Dozenal Calc". Das per-Sprache lokalisierte Feld ist nur die
**Description**.

## Pflicht- und Zusatzfelder pro Listing

- **Description** — aus der jeweiligen `listing.<locale>.md` (Pflicht).
- **Screenshots** — mind. 1 Desktop-Screenshot (≥ 1366×768). Wiederverwendbar
  aus `store/screenshots/` für alle Sprachen.
- **Store logos** — optional; das 1024er-Icon (`assets/icon.png`) reicht.
- **Search terms** — siehe Liste unten (pro Sprache).

## Search terms (max 7 je Sprache, je ≤ 30 Zeichen)

| Locale | Search terms |
|---|---|
| en | dozenal, base 12, duodecimal, scientific, fractions, converter, units |
| de | dozenal, zwölfersystem, duodezimal, basis 12, brüche, umrechner, teiler |
| fr | douzénal, base 12, duodécimal, scientifique, fractions, convertisseur, diviseur |
| es | dozenal, base 12, duodecimal, científica, fracciones, conversor, divisor |
| it | dozenale, base 12, duodecimale, scientifica, frazioni, convertitore, divisore |
| ru | двенадцатеричная, основание 12, научный, дроби, конвертер, делитель, дюжина |
| ja | 十二進法, 十二進, 関数電卓, 分数, 単位変換, 約数, ダース |
| hi | डोज़ेनल, बारह-आधारी, द्वादशमिक, वैज्ञानिक, भिन्न, कन्वर्टर, भाजक |
| fa | دوازده‌دهی, پایه ۱۲, ماشین حساب علمی, کسرها, مبدل, مقسوم‌علیه, دوجین |
| ar | اثنا عشري, نظام عد, حاسبة علمية, كسور, محول, قاسم, دزينة |
| zh | 十二进制, 十二进位, 科学计算器, 分数, 单位换算, 约数, 一打 |
| zh-Hant | 十二進位, 十二進制, 科學計算機, 分數, 單位換算, 約數, 一打 |
| cy | deuddegol, base 12, duodecimal, gwyddonol, ffracsiynau, trawsnewidydd, rhannydd |
| ga | dáréagach, bonn 12, duodecimal, eolaíoch, codáin, tiontaire, roinnteoir |

## Gemeinsame Felder (alle Sprachen)

- **Copyright/Trademark:** `© 2026 steinerschüler` (oder dein Name)
- **Developed by:** `steinerschüler`
- **Additional license terms / License:** MIT License
- **Kontakt / Support:** `dozenal@weltanschauung.app`
- **Website:** `https://dozenal.weltanschauung.app`
- **Privacy policy URL:** `https://dozenal.weltanschauung.app/privacy.html`
- **Kategorie:** Education (sekundär: Productivity / Tools)
- **System requirements:** Memory / Processor / Graphics → *Not specified*

## Hinweis zu cy / ga

Walisisch und Irisch sind **neu aus dem Englischen übersetzt** (es gab keine
Play-Store-Vorlage). Die App ist zwar in beide Sprachen lokalisiert
(`lib/l10n/app_cy.arb`, `app_ga.arb`) — bitte die Fachbegriffe (z. B. für
„dozenal", „base 12", Funktionsnamen) bei Gelegenheit gegen die In-App-
Terminologie gegenprüfen oder von einer Muttersprachlerin lektorieren lassen.
