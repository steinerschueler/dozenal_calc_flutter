// Long-form prose for the "Zwölf und die Welt" theory block (Block 1).
// Nature & culture chapters about where the number twelve — as the
// dodecahedron / twelve-faced form — shows up in the world. Distilled from
// the science dossiers in docs/research/nature_*.md.
//
// Authored ahead of the four-block theory restructure: these new nature
// chapters are not yet wired into the UI (the restructure will merge them
// with the existing teaching chapters under "Zwölf und die Welt").
//
// Same per-language folder convention as unit_theory.dart: prose lives in
// lib/theory/<lang>/world_<lang>.dart. Simple sentences for clean
// translation; honest about caveats (a pyritohedron is NOT a platonic
// dodecahedron).

import 'prose_chapter.dart';

part 'de/world_de.dart';
part 'en/world_en.dart';
part 'fr/world_fr.dart';
part 'es/world_es.dart';
part 'it/world_it.dart';
part 'ru/world_ru.dart';
part 'ga/world_ga.dart';
part 'hi/world_hi.dart';
part 'cy/world_cy.dart';
part 'ja/world_ja.dart';
part 'fa/world_fa.dart';
part 'ar/world_ar.dart';
part 'zh/world_zh.dart';
part 'zh_Hant/world_zh_Hant.dart';

/// "Zwölf und die Welt" nature chapters in [langTag] (BCP-47). Falls back to
/// German for locales not yet authored.
List<ProseChapter> worldChapters(String langTag) {
  final c = langTag.toLowerCase();
  if (c.startsWith('en')) return _worldChaptersEn();
  if (c.startsWith('fr')) return _worldChaptersFr();
  if (c.startsWith('es')) return _worldChaptersEs();
  if (c.startsWith('it')) return _worldChaptersIt();
  if (c.startsWith('ru')) return _worldChaptersRu();
  if (c.startsWith('ga')) return _worldChaptersGa();
  if (c.startsWith('hi')) return _worldChaptersHi();
  if (c.startsWith('cy')) return _worldChaptersCy();
  if (c.startsWith('ja')) return _worldChaptersJa();
  if (c.startsWith('fa')) return _worldChaptersFa();
  if (c.startsWith('ar')) return _worldChaptersAr();
  if (c.startsWith('zh') && c.contains('hant')) return _worldChaptersZhHant();
  if (c.startsWith('zh')) return _worldChaptersZh();
  return _worldChaptersDe();
}
