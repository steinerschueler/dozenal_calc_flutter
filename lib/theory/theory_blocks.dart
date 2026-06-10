// Navigation model for the restructured "Theorie" tab: blocks → chapters.
// Groups the existing teaching chapters (referenced by index into
// info_content.dart's buildChapterContent) with the new prose nature chapters
// (worldChapters) under named blocks. This keeps info_content.dart and the 14
// language part-files untouched — chapters are only re-grouped at this layer.

import '../info_content.dart';
import '../l10n/app_localizations.dart';
import 'grundlagen_theory.dart';
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

  /// Stable, language-neutral id used to look up a chapter image
  /// ([theoryImageFor]). Null for chapters without an image slot.
  final String? imageId;

  const TheoryChapterRef.legacy(this.title, int index)
      : legacyIndex = index,
        prose = null,
        sources = const [],
        imageId = null;

  const TheoryChapterRef.prose(this.title, List<ProseSection> sections,
      [this.sources = const [], this.imageId])
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

/// The theory blocks shown under the "Theorie" expansion, in display order:
/// Grundlagen, Zwölf und die Welt, Dozenale Mathematik, Dozenale Gesellschaft.
///
/// The legacy teaching chapters are sorted by genre (see
/// docs/research/README.md — the single source of truth for the taxonomy):
///   - Grundlagen: Dozenalsystem (idx 1) + Zwölf Glieder an der Hand (idx 10).
///   - Welt: the nature/culture prose chapters + Tierkreis (idx 8).
///   - Mathematik: Fibonacci (idx 2), Zwölfeck (idx 3-5), Dodekaeder (idx 6-7)
///     + the existing math prose chapters.
/// The old collective chapter 10 ("Zwölf Flächen…", idx 9) is replaced by the
/// nature chapters. Excluded from the blocks: Bedienung (idx 0 → standalone
/// app-help entry, deliberately not theory) and chapter 12 (Zoll/Fuss/Pfund,
/// idx 11 → covered by the Einheitentheorie).
List<TheoryBlock> theoryBlocks(AppLocalizations l, String langTag) {
  final titles = infoTitles(l);
  final world = worldChapters(langTag);
  final math = mathChapters(langTag);
  final society = societyChapters(langTag);

  // Grundlagen (Einstieg): Dozenalsystem + Glieder an der Hand, beide als
  // bequellte Prosa. Bedienung (idx 0) bleibt draussen (App-Hilfe).
  final grund = grundlagenChapters(langTag);
  final grundlagen = <TheoryChapterRef>[
    for (final (i, c) in grund.indexed)
      TheoryChapterRef.prose(c.title, c.sections, c.sources, 'grundlagen/$i'),
  ];

  // Zwölf und die Welt: Natur/Kultur-Prosa, dann Tierkreis (Legacy).
  final welt = <TheoryChapterRef>[
    for (final (i, c) in world.indexed)
      TheoryChapterRef.prose(c.title, c.sections, c.sources, 'world/$i'),
    TheoryChapterRef.legacy(titles[8], 8),
  ];

  // Dozenale Mathematik: Dodekaeder-Legacy (idx 6-7, noch nicht gehoben) +
  // Math-Prosa (Fibonacci + das konsolidierte Zwölfeck mit Diagramm-imageId).
  final mathematik = <TheoryChapterRef>[
    for (final i in const [6, 7])
      TheoryChapterRef.legacy(titles[i], i),
    for (final (i, c) in math.indexed)
      TheoryChapterRef.prose(
          c.title, c.sections, c.sources, c.imageId ?? 'math/$i'),
  ];

  return [
    TheoryBlock(l.theoryBlockGrundlagen, grundlagen),
    TheoryBlock(l.theoryBlockWelt, welt),
    TheoryBlock(l.theoryBlockMath, mathematik),
    TheoryBlock(l.theoryBlockSociety, [
      for (final (i, c) in society.indexed)
        TheoryChapterRef.prose(c.title, c.sections, c.sources, 'society/$i'),
    ]),
  ];
}
