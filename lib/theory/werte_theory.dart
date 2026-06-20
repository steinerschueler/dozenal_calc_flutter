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

/// The "Wertetheorie" chapters in [langTag] (BCP-47). German is the reference;
/// languages not yet authored fall back to German. To add a language, register
/// a `part 'xx/werte_xx.dart';` above and a branch here — in the same order as
/// the other genre dispatchers, with zh-Hant tested before bare zh.
List<ProseChapter> werteChapters(String langTag) {
  final c = langTag.toLowerCase();
  if (c.startsWith('en')) return _werteChaptersEn();
  return _werteChaptersDe();
}
