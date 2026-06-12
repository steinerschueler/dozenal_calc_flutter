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

part 'de/unit_desc_de.dart';

/// One-sentence definition of [symbol] within [category], in [langTag]
/// (BCP-47). Falls back to German for any language not yet translated.
String? unitDescription(UnitCategory category, String symbol, String langTag) {
  // Translations dispatch here once added; German for now.
  return _unitDescDe[category]?[symbol];
}
