// One-sentence, localized descriptions for every unit-converter unit, shown in
// a long-press box directly above the unit key (see converter_keypad). Keyed by
// (category, symbol) — necessary because a symbol can repeat across categories
// with a different meaning ('d' = day in time, penny in price) or the same
// meaning in two ladders ('fl oz', 'pint', 'mL', 'L' in cook & liquid).
//
// The box also carries a pointer to the in-app unit theory; that pointer is
// assembled in the UI from already-localized labels (Einheiten →
// Einheitentheorie → <category>), so only these one-sentence definitions are
// genuinely new content. German is the source of truth; other languages attach
// via `part` and fall back to German until translated.

import '../logic/unit_data.dart';

part 'ar/unit_desc_ar.dart';
part 'cy/unit_desc_cy.dart';
part 'de/unit_desc_de.dart';
part 'en/unit_desc_en.dart';
part 'es/unit_desc_es.dart';
part 'fa/unit_desc_fa.dart';
part 'fr/unit_desc_fr.dart';
part 'ga/unit_desc_ga.dart';
part 'hi/unit_desc_hi.dart';
part 'it/unit_desc_it.dart';
part 'ja/unit_desc_ja.dart';
part 'ru/unit_desc_ru.dart';
part 'zh/unit_desc_zh.dart';
part 'zh_Hant/unit_desc_zh_Hant.dart';

/// One-sentence definition of [symbol] within [category], in [langTag]
/// (BCP-47). Falls back to German per symbol for anything a language has not
/// covered yet.
String? unitDescription(UnitCategory category, String symbol, String langTag) {
  final m = _descMapFor(langTag.toLowerCase());
  return m[category]?[symbol] ?? _unitDescDe[category]?[symbol];
}

Map<UnitCategory, Map<String, String>> _descMapFor(String c) {
  if (c.startsWith('en')) return _unitDescEn;
  if (c.startsWith('fr')) return _unitDescFr;
  if (c.startsWith('es')) return _unitDescEs;
  if (c.startsWith('it')) return _unitDescIt;
  if (c.startsWith('ru')) return _unitDescRu;
  if (c.startsWith('ga')) return _unitDescGa;
  if (c.startsWith('hi')) return _unitDescHi;
  if (c.startsWith('cy')) return _unitDescCy;
  if (c.startsWith('ja')) return _unitDescJa;
  if (c.startsWith('fa')) return _unitDescFa;
  if (c.startsWith('ar')) return _unitDescAr;
  if (c.startsWith('zh') && c.contains('hant')) return _unitDescZhHant;
  if (c.startsWith('zh')) return _unitDescZh;
  return _unitDescDe;
}
