// Long-form prose for the "Grundlagen" theory block (the entry block): the
// foundational chapters that introduce the dozenal idea before the thematic
// genres. See docs/research/README.md for the taxonomy (Grundlagen holds the
// basic IDEAS; "Bedienung des Rechners" stays a standalone app-help entry).
//
// Same per-language folder convention as world_theory.dart: prose lives in
// lib/theory/<lang>/grundlagen_<lang>.dart. German is the reference; other
// languages are added incrementally and fall back to German until authored.

import 'prose_chapter.dart';

part 'de/grundlagen_de.dart';
part 'en/grundlagen_en.dart';
part 'fr/grundlagen_fr.dart';
part 'es/grundlagen_es.dart';
part 'it/grundlagen_it.dart';
part 'ru/grundlagen_ru.dart';
part 'hi/grundlagen_hi.dart';
part 'ja/grundlagen_ja.dart';
part 'ar/grundlagen_ar.dart';
part 'zh/grundlagen_zh.dart';
part 'zh_Hant/grundlagen_zh_Hant.dart';

/// "Grundlagen" chapters in [langTag] (BCP-47). Falls back to German for
/// locales not yet authored. Add a `part` above and a branch here as each
/// `lib/theory/<lang>/grundlagen_<lang>.dart` lands.
List<ProseChapter> grundlagenChapters(String langTag) {
  final c = langTag.toLowerCase();
  if (c.startsWith('en')) return _grundlagenChaptersEn();
  if (c.startsWith('fr')) return _grundlagenChaptersFr();
  if (c.startsWith('es')) return _grundlagenChaptersEs();
  if (c.startsWith('it')) return _grundlagenChaptersIt();
  if (c.startsWith('ru')) return _grundlagenChaptersRu();
  if (c.startsWith('hi')) return _grundlagenChaptersHi();
  if (c.startsWith('ja')) return _grundlagenChaptersJa();
  if (c.startsWith('ar')) return _grundlagenChaptersAr();
  if (c.startsWith('zh') && c.contains('hant')) return _grundlagenChaptersZhHant();
  if (c.startsWith('zh')) return _grundlagenChaptersZh();
  return _grundlagenChaptersDe();
}
