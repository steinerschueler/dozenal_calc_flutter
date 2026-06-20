// Shared prose model for theory blocks that are pure text (no custom-painted
// illustrations): "Zwölf und die Welt" (nature chapters), "Dozenale
// Mathematik", "Dozenale Gesellschaft". One file per language and block holds
// the prose; this file holds the data types and their localized labels.

import '../l10n/app_localizations.dart';

/// One section of a chapter: a bold heading + a body paragraph, optionally
/// followed by an inline illustration.
class ProseSection {
  final String heading;
  final String body;

  /// Optional stable, language-neutral id of an illustration rendered right
  /// after this section's prose (resolved by inlineTheoryIllustration in
  /// theory/werte_illustrations.dart). Null → no inline illustration.
  final String? illustrationId;
  const ProseSection(this.heading, this.body, {this.illustrationId});
}

/// A cited source with a two-axis quality rating, distilled from the
/// `## Quellen (Tier-System)` block of the research dossier in docs/research/.
/// [reliability] is one of 'R1'..'R4','S'; [access] is one of 'A1'..'A3'.
class Source {
  final String title;
  final String url;
  final String reliability;
  final String access;
  const Source(this.title, this.url, this.reliability, this.access);
}

/// Localized label for a reliability tier (R1..R4, S).
String reliabilityLabel(AppLocalizations l, String r) => switch (r) {
      'R1' => l.sourceRelR1,
      'R2' => l.sourceRelR2,
      'R3' => l.sourceRelR3,
      'R4' => l.sourceRelR4,
      'S' => l.sourceRelS,
      _ => r,
    };

/// Localized label for an access tier (A1..A3).
String accessLabel(AppLocalizations l, String a) => switch (a) {
      'A1' => l.sourceAccA1,
      'A2' => l.sourceAccA2,
      'A3' => l.sourceAccA3,
      _ => a,
    };

/// A full prose chapter: a title, its sections, and its cited sources.
class ProseChapter {
  final String title;
  final List<ProseSection> sections;
  final List<Source> sources;

  /// Optional stable image/illustration id, overriding the index-based default
  /// (`<block>/<i>`). Used for chapters that carry a specific custom-painted
  /// illustration (e.g. the dodecagon diagrams) so the id stays correct
  /// regardless of the chapter's position in its block.
  final String? imageId;
  const ProseChapter(this.title, this.sections,
      {this.sources = const [], this.imageId});
}
