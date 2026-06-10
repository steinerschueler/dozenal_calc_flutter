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

/// "Grundlagen" chapters in [langTag] (BCP-47). Falls back to German for
/// locales not yet authored. Add `if (c.startsWith('xx')) return _…Xx();`
/// branches here as each `lib/theory/<lang>/grundlagen_<lang>.dart` lands.
List<ProseChapter> grundlagenChapters(String langTag) {
  // ignore: unused_local_variable
  final c = langTag.toLowerCase();
  return _grundlagenChaptersDe();
}
