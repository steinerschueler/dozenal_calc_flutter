// Long-form prose for the "Dozenale Gesellschaft" theory block (Block 4).
// History and present of the dozenal movement: advocates and societies, the
// digit-symbol question, dozenal number names (do/gro/mo, SDN) and the TGM
// measurement system, plus today's community and tools. Distilled from the
// dossiers in docs/research/society_*.md (and material in math_*.md).

import 'prose_chapter.dart';

part 'de/society_de.dart';
part 'en/society_en.dart';
part 'fr/society_fr.dart';
part 'es/society_es.dart';
part 'it/society_it.dart';
part 'ru/society_ru.dart';
part 'ga/society_ga.dart';
part 'hi/society_hi.dart';
part 'cy/society_cy.dart';
part 'ja/society_ja.dart';
part 'fa/society_fa.dart';
part 'ar/society_ar.dart';
part 'zh/society_zh.dart';
part 'zh_Hant/society_zh_Hant.dart';

/// "Dozenale Gesellschaft" chapters in [langTag] (BCP-47). Falls back to German.
List<ProseChapter> societyChapters(String langTag) {
  final c = langTag.toLowerCase();
  if (c.startsWith('en')) return _societyChaptersEn();
  if (c.startsWith('fr')) return _societyChaptersFr();
  if (c.startsWith('es')) return _societyChaptersEs();
  if (c.startsWith('it')) return _societyChaptersIt();
  if (c.startsWith('ru')) return _societyChaptersRu();
  if (c.startsWith('ga')) return _societyChaptersGa();
  if (c.startsWith('hi')) return _societyChaptersHi();
  if (c.startsWith('cy')) return _societyChaptersCy();
  if (c.startsWith('ja')) return _societyChaptersJa();
  if (c.startsWith('fa')) return _societyChaptersFa();
  if (c.startsWith('ar')) return _societyChaptersAr();
  if (c.startsWith('zh') && c.contains('hant')) return _societyChaptersZhHant();
  if (c.startsWith('zh')) return _societyChaptersZh();
  return _societyChaptersDe();
}
