// Dispatcher + per-language parts for the "Wertetheorie" theory block — the
// prose companion to the Werterechner (value & money, precious metals, the
// gold/silver ratio, gold's purchasing power against food, reading the
// historical price curve). Deliberately complementary to the unit-theory
// `price` category (£sd / "money was weight"), which it references rather than
// repeats. German is the reference; other languages fall back to German until
// translated. Same shape as world/math/society_theory.dart.

import 'prose_chapter.dart';

part 'de/werte_de.dart';
part 'en/werte_en.dart';
part 'ja/werte_ja.dart';
part 'cy/werte_cy.dart';
part 'zh/werte_zh.dart';
part 'zh_Hant/werte_zh_Hant.dart';
part 'ga/werte_ga.dart';
part 'hi/werte_hi.dart';
part 'ar/werte_ar.dart';
part 'fa/werte_fa.dart';
part 'ru/werte_ru.dart';
part 'it/werte_it.dart';
part 'es/werte_es.dart';
part 'fr/werte_fr.dart';

/// The "Wertetheorie" chapters in [langTag] (BCP-47). German is the reference;
/// languages not yet authored fall back to German. To add a language, register
/// a `part 'xx/werte_xx.dart';` above and a branch here — in the same order as
/// the other genre dispatchers, with zh-Hant tested before bare zh.
List<ProseChapter> werteChapters(String langTag) {
  final c = langTag.toLowerCase();
  if (c.startsWith('en')) return _werteChaptersEn();
  if (c.startsWith('fr')) return _werteChaptersFr();
  if (c.startsWith('es')) return _werteChaptersEs();
  if (c.startsWith('it')) return _werteChaptersIt();
  if (c.startsWith('ru')) return _werteChaptersRu();
  if (c.startsWith('fa')) return _werteChaptersFa();
  if (c.startsWith('ar')) return _werteChaptersAr();
  if (c.startsWith('hi')) return _werteChaptersHi();
  if (c.startsWith('ga')) return _werteChaptersGa();
  if (c.startsWith('zh') && c.contains('hant')) return _werteChaptersZhHant();
  if (c.startsWith('zh')) return _werteChaptersZh();
  if (c.startsWith('cy')) return _werteChaptersCy();
  if (c.startsWith('ja')) return _werteChaptersJa();
  return _werteChaptersDe();
}
