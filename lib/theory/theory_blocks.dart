// Navigation model for the restructured "Theorie" tab: blocks → chapters.
// Groups the existing teaching chapters (referenced by index into
// info_content.dart's buildChapterContent) with the new prose nature chapters
// (worldChapters) under named blocks. This keeps info_content.dart and the 14
// language part-files untouched — chapters are only re-grouped at this layer.

import '../info_content.dart';
import '../l10n/app_localizations.dart';
import 'math_theory.dart';
import 'prose_chapter.dart';
import 'society_theory.dart';
import 'world_theory.dart';

/// One chapter inside a theory block. Exactly one of [legacyIndex] (rendered
/// via buildChapterContent, incl. custom-painted illustrations) or [prose]
/// (rendered directly) is set.
class TheoryChapterRef {
  final String title;
  final int? legacyIndex;
  final List<ProseSection>? prose;
  final List<Source> sources;

  const TheoryChapterRef.legacy(this.title, int index)
      : legacyIndex = index,
        prose = null,
        sources = const [];

  const TheoryChapterRef.prose(this.title, List<ProseSection> sections,
      [this.sources = const []])
      : legacyIndex = null,
        prose = sections;
}

/// A named group of chapters. [inProgress] blocks have no chapters yet and are
/// shown with an "in Arbeit" hint.
class TheoryBlock {
  final String title;
  final List<TheoryChapterRef> chapters;
  final bool inProgress;

  const TheoryBlock(this.title, this.chapters, {this.inProgress = false});
}

/// The theory blocks shown under the "Theorie" expansion, in display order.
///
/// "Zwölf und die Welt" keeps the existing teaching chapters (Dozenalsystem,
/// Fibonacci, Zwölfeck, Dodekaeder, Tierkreis, Zwölf Glieder an der Hand) and
/// replaces the old collective chapter 10 ("Zwölf Flächen in Kristallen und
/// Lebewesen", idx 9) with the detailed nature chapters. Excluded from the
/// blocks: chapter 1 (Bedienung, idx 0 → standalone entry) and chapter 12
/// (Zoll/Fuss/Pfund, idx 11 → covered by the Einheitentheorie).
List<TheoryBlock> theoryBlocks(AppLocalizations l, String langTag) {
  final titles = infoTitles(l);
  final welt = <TheoryChapterRef>[
    for (final i in const [1, 2, 3, 4, 5, 6, 7, 8])
      TheoryChapterRef.legacy(titles[i], i),
    for (final c in worldChapters(langTag))
      TheoryChapterRef.prose(c.title, c.sections, c.sources),
    TheoryChapterRef.legacy(titles[10], 10),
  ];
  return [
    TheoryBlock(l.theoryBlockWelt, welt),
    TheoryBlock(l.theoryBlockMath, [
      for (final c in mathChapters(langTag))
        TheoryChapterRef.prose(c.title, c.sections, c.sources),
    ]),
    TheoryBlock(l.theoryBlockSociety, [
      for (final c in societyChapters(langTag))
        TheoryChapterRef.prose(c.title, c.sections, c.sources),
    ]),
  ];
}
