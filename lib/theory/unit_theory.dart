// Long-form unit-theory prose for the unit-theory page (the upgraded
// conversions page). One scrollable text per area, split into facet sections
// (history, usage, decimal incompatibility, religious/cultural, worldwide …).
//
// Folder convention: this dispatcher lives in lib/theory/, the actual prose
// in per-language sub-folders (lib/theory/de/, lib/theory/en/, …). One content
// file per language and topic (currently de/unit_theory_de.dart). This keeps
// lib/ flat as the prose grows across 14 languages and several theory blocks.
//
// Content is written in deliberately simple sentences so it translates cleanly
// into languages like Chinese, Hindi and Persian. Translations are produced
// later by a subagent workflow (two translators + one reconciler per language).

import '../logic/unit_data.dart';
import 'prose_chapter.dart';

export 'prose_chapter.dart' show Source, reliabilityLabel, accessLabel;

part 'de/unit_theory_de.dart';
part 'en/unit_theory_en.dart';
part 'fr/unit_theory_fr.dart';
part 'es/unit_theory_es.dart';
part 'it/unit_theory_it.dart';
part 'ru/unit_theory_ru.dart';
part 'ga/unit_theory_ga.dart';
part 'hi/unit_theory_hi.dart';
part 'cy/unit_theory_cy.dart';
part 'ja/unit_theory_ja.dart';
part 'fa/unit_theory_fa.dart';
part 'ar/unit_theory_ar.dart';
part 'zh/unit_theory_zh.dart';
part 'zh_Hant/unit_theory_zh_Hant.dart';

/// One facet of an area's theory: a bold heading + a body paragraph.
class UnitTheorySection {
  final String heading;
  final String body;
  const UnitTheorySection(this.heading, this.body);
}

/// The areas that get a theory tab, in display order. `count` is first and
/// covers the counting *units* (dozen/gross/great gross/baker's dozen) — kept
/// deliberately complementary to Theorie → Grundlagen, which carries the
/// why-twelve / finger-counting story (no duplication).
const List<UnitCategory> kTheoryAreas = [
  UnitCategory.count,
  UnitCategory.dist,
  UnitCategory.area,
  UnitCategory.space,
  UnitCategory.weight,
  UnitCategory.time,
  UnitCategory.angle,
  UnitCategory.price,
  UnitCategory.temp,
];

/// Theory sections for [cat] in [langTag] (BCP-47). Falls back to German until
/// the other languages are filled in.
List<UnitTheorySection> unitTheory(UnitCategory cat, String langTag) {
  final r = _localeTheory(cat, langTag);
  // A language that has not translated this area yet returns [] (currently only
  // `count`); fall back to German so the tab is never empty.
  return r.isEmpty ? _unitTheoryDe(cat) : r;
}

List<UnitTheorySection> _localeTheory(UnitCategory cat, String langTag) {
  final c = langTag.toLowerCase();
  if (c.startsWith('en')) return _unitTheoryEn(cat);
  if (c.startsWith('fr')) return _unitTheoryFr(cat);
  if (c.startsWith('es')) return _unitTheoryEs(cat);
  if (c.startsWith('it')) return _unitTheoryIt(cat);
  if (c.startsWith('ru')) return _unitTheoryRu(cat);
  if (c.startsWith('ga')) return _unitTheoryGa(cat);
  if (c.startsWith('hi')) return _unitTheoryHi(cat);
  if (c.startsWith('cy')) return _unitTheoryCy(cat);
  if (c.startsWith('ja')) return _unitTheoryJa(cat);
  if (c.startsWith('fa')) return _unitTheoryFa(cat);
  if (c.startsWith('ar')) return _unitTheoryAr(cat);
  if (c.startsWith('zh') && c.contains('hant')) return _unitTheoryZhHant(cat);
  if (c.startsWith('zh')) return _unitTheoryZh(cat);
  return _unitTheoryDe(cat);
}

/// Cited sources for [cat] in [langTag] (BCP-47), shown at the foot of the
/// area's tab. Curated from the dossier in docs/research/unit_<area>.md.
/// Falls back to German until other languages are filled in.
List<Source> unitSources(UnitCategory cat, String langTag) {
  final r = _localeSources(cat, langTag);
  return r.isEmpty ? _unitSourcesDe(cat) : r;
}

List<Source> _localeSources(UnitCategory cat, String langTag) {
  final c = langTag.toLowerCase();
  if (c.startsWith('en')) return _unitSourcesEn(cat);
  if (c.startsWith('fr')) return _unitSourcesFr(cat);
  if (c.startsWith('es')) return _unitSourcesEs(cat);
  if (c.startsWith('it')) return _unitSourcesIt(cat);
  if (c.startsWith('ru')) return _unitSourcesRu(cat);
  if (c.startsWith('ga')) return _unitSourcesGa(cat);
  if (c.startsWith('hi')) return _unitSourcesHi(cat);
  if (c.startsWith('cy')) return _unitSourcesCy(cat);
  if (c.startsWith('ja')) return _unitSourcesJa(cat);
  if (c.startsWith('fa')) return _unitSourcesFa(cat);
  if (c.startsWith('ar')) return _unitSourcesAr(cat);
  if (c.startsWith('zh') && c.contains('hant')) return _unitSourcesZhHant(cat);
  if (c.startsWith('zh')) return _unitSourcesZh(cat);
  return _unitSourcesDe(cat);
}
