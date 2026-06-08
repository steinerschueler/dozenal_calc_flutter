// Long-form prose for the "Dozenale Mathematik" theory block (Block 3).
// Number theory of base 12, base comparison, history of positional systems,
// and how this calculator works internally. The math/history chapters are
// distilled from docs/research/math_*.md; the app-internals chapter is written
// from the source (logic/rational.dart, logic/expression.dart, state.dart).

import 'prose_chapter.dart';

part 'de/math_de.dart';
part 'en/math_en.dart';
part 'fr/math_fr.dart';
part 'es/math_es.dart';
part 'it/math_it.dart';
part 'ru/math_ru.dart';
part 'ga/math_ga.dart';
part 'hi/math_hi.dart';
part 'cy/math_cy.dart';
part 'ja/math_ja.dart';
part 'fa/math_fa.dart';
part 'ar/math_ar.dart';
part 'zh/math_zh.dart';
part 'zh_Hant/math_zh_Hant.dart';

/// "Dozenale Mathematik" chapters in [langTag] (BCP-47). Falls back to German.
List<ProseChapter> mathChapters(String langTag) {
  final c = langTag.toLowerCase();
  if (c.startsWith('en')) return _mathChaptersEn();
  if (c.startsWith('fr')) return _mathChaptersFr();
  if (c.startsWith('es')) return _mathChaptersEs();
  if (c.startsWith('it')) return _mathChaptersIt();
  if (c.startsWith('ru')) return _mathChaptersRu();
  if (c.startsWith('ga')) return _mathChaptersGa();
  if (c.startsWith('hi')) return _mathChaptersHi();
  if (c.startsWith('cy')) return _mathChaptersCy();
  if (c.startsWith('ja')) return _mathChaptersJa();
  if (c.startsWith('fa')) return _mathChaptersFa();
  if (c.startsWith('ar')) return _mathChaptersAr();
  if (c.startsWith('zh') && c.contains('hant')) return _mathChaptersZhHant();
  if (c.startsWith('zh')) return _mathChaptersZh();
  return _mathChaptersDe();
}
