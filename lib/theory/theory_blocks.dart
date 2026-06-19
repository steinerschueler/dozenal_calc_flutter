// Navigation model for the "Theorie" tab: blocks → chapters. All chapters are
// now bequellte prose (ProseChapter); custom-painted diagrams attach via a
// chapter's imageId (see _customChapterIllustration in info_pages.dart). The
// former legacy chapters (info_content.dart) have been fully migrated away.

import '../l10n/app_localizations.dart';
import 'grundlagen_theory.dart';
import 'math_theory.dart';
import 'prose_chapter.dart';
import 'society_theory.dart';
import 'werte_theory.dart';
import 'world_theory.dart';

/// One chapter inside a theory block: a [title], its [prose] sections, cited
/// [sources], and an optional [imageId] for a chapter illustration (photo via
/// theoryImageFor, or a custom-painted diagram via _customChapterIllustration).
class TheoryChapterRef {
  final String title;
  final List<ProseSection>? prose;
  final List<Source> sources;

  /// Stable, language-neutral id used to look up a chapter image
  /// ([theoryImageFor]). Null for chapters without an image slot.
  final String? imageId;

  const TheoryChapterRef.prose(this.title, List<ProseSection> sections,
      [this.sources = const [], this.imageId])
      : prose = sections;
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

  // Zwölf und die Welt: durchgehend bequellte Natur/Kultur-Prosa (inkl. des
  // gehobenen Tierkreis-Kapitels). Keine Legacy mehr.
  final welt = <TheoryChapterRef>[
    for (final (i, c) in world.indexed)
      TheoryChapterRef.prose(
          c.title, c.sections, c.sources, c.imageId ?? 'world/$i'),
  ];

  // Dozenale Mathematik: komplett bequellte Prosa (Zahlen/Basen, Fibonacci,
  // das Zwölfeck mit Diagramm-imageId, der Dodekaeder). Keine Legacy mehr.
  final mathematik = <TheoryChapterRef>[
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

/// The "Wertetheorie" block — the bequellte prose companion to the Werterechner
/// (Geld & Wert, Edelmetalle, Gold-Silber-Verhältnis, Kaufkraft, Preiskurve
/// lesen). Kept OUT of [theoryBlocks] on purpose: the info list places it LAST,
/// AFTER the Einheitentheorie entry. It renders the same way (TheoryBlockPage →
/// TheoryChapterPage); the imageId-override (world/math form) is preserved so a
/// custom diagram can attach later.
TheoryBlock werteTheoryBlock(AppLocalizations l, String langTag) {
  final werte = werteChapters(langTag);
  return TheoryBlock(l.theoryBlockWerte, [
    for (final (i, c) in werte.indexed)
      TheoryChapterRef.prose(
          c.title, c.sections, c.sources, c.imageId ?? 'werte/$i'),
  ]);
}
