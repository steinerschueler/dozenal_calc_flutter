# App Store Keywords (iOS) — alle 14 Sprachen

Referenz für das **App-Store-Connect-Keywords-Feld** (nur iOS). Anlass: beim
ersten US-Release standen versehentlich die *deutschen* Keywords in der
English-(U.S.)-Lokalisierung. Diese Datei ist die single source of truth, damit
das pro Locale nicht mehr passiert.

## Wichtige Eigenheiten des Keyword-Felds

- **Nur iOS.** Google Play hat **kein** Keywords-Feld — dort läuft ASO über die
  lange Beschreibung + die „Tags" (siehe `docs/store-listings.md` und die
  `store/play-store/listing.*.md`). Diese Datei betrifft ausschließlich den App Store.
- **Max. 100 Zeichen**, kommagetrennt. **Keine Leerzeichen nach den Kommas** —
  Leerzeichen zählen mit, also spart `a,b` gegenüber `a, b` pro Komma ein Zeichen.
- **Pro Lokalisierung getrennt.** Jede App-Store-Sprache hat ihr eigenes
  Keyword-Feld. Niemals den Block einer Sprache in eine andere Lokalisierung
  kopieren.
- **App-Name-Wörter nicht wiederholen.** Apple indexiert den Lokalisierungs-
  Titel mit und kombiniert ihn mit den Keywords. „Dozenal"/„Calc" (Latein-
  Locales) bzw. das Dutzend-Lehnwort (Nicht-Latein, siehe
  `docs/store-listings.md` → App-Name-Konvention) stehen deshalb bewusst **nicht**
  in den Keywords — das spart Zeichen für zusätzliche Suchbegriffe.
- **Ändern erfordert eine neue Version.** Solange eine Version „Bereit für den
  Vertrieb" ist, sind Keywords (anders als Werbetext/URLs) gesperrt. Korrektur
  nur über eine neue App-Store-Version + erneuten Review.

## Keyword-Strings pro Locale

Zeichenzahl in Klammern (Limit 100). Zum Einfügen jeweils den Code-Block 1:1
in App Store Connect → die jeweilige Lokalisierung → Feld „Keywords".

### de — Deutsch (95)
```
Zwölfersystem,Basis 12,duodezimal,Taschenrechner,wissenschaftlich,Bruch,Mathematik,Zahlensystem
```

### en — English (83)
```
base12,duodecimal,scientific,fraction,math,number system,base twelve,counting,radix
```

### fr — Français (84)
```
base 12,duodécimal,scientifique,fraction,maths,système numération,douze,calculatrice
```

### es — Español (86)
```
base 12,duodecimal,científica,fracción,matemáticas,sistema numérico,docena,calculadora
```

### it — Italiano (89)
```
base 12,duodecimale,scientifica,frazione,matematica,sistema numerico,dozzina,calcolatrice
```

### fa — فارسی (63)
```
ماشین حساب علمی,پایه ۱۲,دوجین,کسر,ریاضی,دستگاه اعداد,دوازده‌دهی
```

### ru — Русский (91)
```
двенадцатеричная,основание 12,научный калькулятор,дробь,математика,система счисления,дюжина
```

### ga — Gaeilge (74) — ⚠️ Muttersprachler-Check empfohlen
```
áireamhán eolaíoch,bonn 12,codán,matamaitic,córas uimhreacha,dosaen,dáréag
```

### hi — हिन्दी (66)
```
वैज्ञानिक कैलकुलेटर,आधार 12,भिन्न,गणित,संख्या प्रणाली,दर्जन,द्वादश
```

### zh — 简体中文 (46)
```
十二进制,基数12,科学计算器,分数,数学,记数系统,一打,数制,换算,十二
```

### zh-Hant — 繁體中文 (46)
```
十二進制,基數12,科學計算機,分數,數學,記數系統,一打,數制,換算,十二
```

### cy — Cymraeg (70) — ⚠️ Muttersprachler-Check empfohlen
```
cyfrifiannell wyddonol,sail 12,ffracsiwn,mathemateg,system rifau,dwsin
```

### ja — 日本語 (44)
```
十二進法,十二進数,関数電卓,分数,数学,記数法,ダース,十二,進法,換算
```

### ar — العربية (61)
```
آلة حاسبة علمية,أساس ١٢,كسر,رياضيات,نظام عددي,دزينة,اثنا عشري
```

## Herkunft & Qualität der Übersetzungen

Die zentralen Begriffe (**„wissenschaftlicher Taschenrechner"**,
**„duodezimal/Zwölfersystem"**, **„Bruch"**) sind aus dem jeweils vom Autor
geschriebenen Eröffnungssatz der `store/app-store/listing.<code>.md` gezogen — also bereits
muttersprachlich geprüft. Die ergänzenden Begriffe (base 12, Mathematik,
Zahlensystem, Dutzend) sind abgeleitete Übersetzungen.

Zwei Sprachen haben **keine** `store/app-store/listing.*.md` (Gaeilge, Cymraeg), ihre
Keywords sind daher nicht autoren-gegründet → mit ⚠️ markiert, vor dem nächsten
Release idealerweise gegenprüfen lassen.

CJK-Felder (zh, zh-Hant, ja) haben durch das Ein-Zeichen-Zählen viel Budget
übrig (< 50 von 100); dort wurden zusätzliche Begriffe (数制/數制, 换算/換算,
十二) ergänzt, um das Feld auszunutzen.

## Verwandt

- `docs/store-listings.md` — Play-Store-Listing (App-Namen-Konvention, Tags,
  Screenshots). Play hat kein Keyword-Feld.
- `store/app-store/listing.<code>.md` — vollständige Listing-Texte (App-Name,
  Kurz-/Langbeschreibung) für 12 Locales. **Lücke:** `ga` und `cy` fehlen noch
  als eigene Listing-Datei.
