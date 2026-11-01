// Info modal navigation: List → Detail → Back via the Flutter Navigator.
// Pure routing. Chapter content lives in lib/theory/ (theory blocks) and
// lib/manual/ (the calculator manual).

import 'dart:async';

import 'package:dozenal_calc_flutter/app_theme.dart';
import 'package:dozenal_calc_flutter/conversions_page.dart';
import 'package:dozenal_calc_flutter/feedback_dialog.dart';
import 'package:dozenal_calc_flutter/intro_pages.dart';
import 'package:dozenal_calc_flutter/l10n/app_localizations.dart';
import 'package:dozenal_calc_flutter/language_options.dart';
import 'package:dozenal_calc_flutter/license_page.dart';
import 'package:dozenal_calc_flutter/locale_notifier.dart';
import 'package:dozenal_calc_flutter/manual/manual.dart';
import 'package:dozenal_calc_flutter/menu_rows.dart';
import 'package:dozenal_calc_flutter/privacy_page.dart';
import 'package:dozenal_calc_flutter/recommendations/recommendations.dart';
import 'package:dozenal_calc_flutter/recommendations/recommendations_page.dart';
import 'package:dozenal_calc_flutter/round_badge.dart';
import 'package:dozenal_calc_flutter/settings_page.dart';
import 'package:dozenal_calc_flutter/support_page.dart';
import 'package:dozenal_calc_flutter/theory/chapter_image_view.dart';
import 'package:dozenal_calc_flutter/theory/chapter_images.dart';
import 'package:dozenal_calc_flutter/theory/prose_chapter.dart';
import 'package:dozenal_calc_flutter/theory/theory_blocks.dart';
import 'package:dozenal_calc_flutter/theory/theory_illustrations.dart';
import 'package:dozenal_calc_flutter/theory/werte_illustrations.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

/// The menu: what the app teaches, its settings, recommendations and the
/// legal and contact pages, in groups on key faces.
class InfoListPage extends StatelessWidget {
  const InfoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return Scaffold(
      // AppBar background comes from the MaterialApp's appBarTheme (palette-
      // derived), so no explicit color here — same on all themed pages.
      appBar: AppBar(title: Text(l.infoListTitle)),
      body: SafeArea(
        // Top is owned by the AppBar, but the bottom inset matters under
        // edge-to-edge: without it the last list rows hide behind the
        // system navigation bar.
        top: false,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          children: [
            MenuGroup(
              title: l.infoListGroupLearn,
              children: [
                _MenuLink(
                  icon: Icons.help_outline,
                  title: _sentenceCase(l.a11yIntro),
                  onTap: () => _openPage(context, (_) => const IntroPage()),
                ),
                const _ManualExpansion(),
                const _TheoryExpansion(),
              ],
            ),
            MenuGroup(
              title: l.infoListGroupApp,
              children: [
                _MenuLink(
                  icon: Icons.settings_outlined,
                  title: l.settingsTitle,
                  onTap: () => _openPage(context, (_) => const SettingsPage()),
                ),
                const _LanguagePickerExpansion(),
              ],
            ),
            const MenuGroup(children: [_RecommendationsExpansion()]),
            MenuGroup(
              title: l.infoListGroupAbout,
              children: [
                _MenuLink(
                  icon: Icons.shield_outlined,
                  title: l.infoListPrivacyEntry,
                  onTap: () => _openPage(context, (_) => const PrivacyPage()),
                ),
                _MenuLink(
                  icon: Icons.balance,
                  title: l.infoListLicenseEntry,
                  onTap: () =>
                      _openPage(context, (_) => const AppLicensePage()),
                ),
                _MenuLink(
                  icon: Icons.favorite_outline,
                  title: l.infoListSupportEntry,
                  onTap: () => _openPage(context, (_) => const SupportPage()),
                ),
                _MenuLink(
                  icon: Icons.mail_outline,
                  title: l.infoListFeedbackEntry,
                  onTap: () => showFeedbackDialog(context),
                ),
              ],
            ),
            const _VersionFooter(),
          ],
        ),
      ),
    );
  }
}

void _openPage(BuildContext context, WidgetBuilder builder) {
  Navigator.of(context).push(MaterialPageRoute<void>(builder: builder));
}

/// A menu row that leads somewhere else, marked by the chevron.
class _MenuLink extends StatelessWidget {
  const _MenuLink({
    required this.title,
    required this.onTap,
    this.icon,
    this.subtitle,
    this.depth = 0,
  });

  final String title;
  final VoidCallback onTap;
  final IconData? icon;
  final String? subtitle;
  final int depth;

  @override
  Widget build(BuildContext context) {
    final glyph = icon;
    return MenuRow(
      title: title,
      subtitle: subtitle,
      depth: depth,
      leading: glyph == null ? null : MenuRowIcon(glyph),
      trailing: const _NavChevron(),
      onTap: onTap,
    );
  }
}

/// Footer pinned to the bottom of the info list that shows the running
/// version and build number. Useful while collecting tester feedback so
/// the build a report came from is unambiguous. Version is read at
/// runtime from PackageInfo, so a pubspec bump is the only place that
/// needs updating.
class _VersionFooter extends StatefulWidget {
  const _VersionFooter();

  @override
  State<_VersionFooter> createState() => _VersionFooterState();
}

class _VersionFooterState extends State<_VersionFooter> {
  // Cached: PackageInfo.fromPlatform() returns a fresh Future on every
  // call, and recreating it in build() makes FutureBuilder rerun the
  // platform channel and flicker an empty state on each rebuild.
  late final Future<PackageInfo> _info = PackageInfo.fromPlatform();

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return FutureBuilder<PackageInfo>(
      future: _info,
      builder: (ctx, snap) {
        final label = snap.hasData
            ? l.infoListVersionFooter(
                snap.data!.version,
                snap.data!.buildNumber,
              )
            : '';
        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 32, 16, 24),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.of(ctx).textFaint,
              fontSize: 11,
              fontFamily: 'JetBrainsMono',
            ),
          ),
        );
      },
    );
  }
}

/// "Bedienung": one entry that unfolds to the three calculators, each of which
/// unfolds to its own manual chapters. The calculators keep their colours here,
/// the only colour in the menu's rows.
class _ManualExpansion extends StatelessWidget {
  const _ManualExpansion();

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return MenuExpansionRow(
      title: l.infoListManualExpansion,
      leading: const MenuRowIcon(Icons.touch_app_outlined),
      childrenBuilder: (context, _) => [
        _CalculatorManualExpansion(
          icon: Icons.calculate_outlined,
          color: BadgeHue.blue,
          title: l.pagerLabelMain,
          chaptersOf: manualChapters,
        ),
        _CalculatorManualExpansion(
          icon: Icons.swap_horiz,
          color: BadgeHue.teal,
          title: l.infoListConverterEntry,
          chaptersOf: converterManualChapters,
        ),
        _CalculatorManualExpansion(
          icon: Icons.diamond_outlined,
          color: BadgeHue.bronze,
          title: l.pagerLabelAsset,
          chaptersOf: assetManualChapters,
        ),
      ],
    );
  }
}

/// The manual of one calculator: a flat list of chapters.
class _CalculatorManualExpansion extends StatelessWidget {
  const _CalculatorManualExpansion({
    required this.icon,
    required this.color,
    required this.title,
    required this.chaptersOf,
  });

  final IconData icon;
  final Color color;
  final String title;
  final List<ManualChapter> Function(String langTag) chaptersOf;

  @override
  Widget build(BuildContext context) {
    final langTag = Localizations.localeOf(context).toLanguageTag();
    return MenuExpansionRow(
      title: title,
      depth: 1,
      leading: MenuRowIcon(icon, color: color),
      childrenBuilder: (context, _) => [
        for (final chapter in chaptersOf(langTag))
          _MenuLink(
            title: chapter.title,
            depth: 2,
            onTap: () => _openPage(context, (_) => ManualChapterPage(chapter)),
          ),
      ],
    );
  }
}

/// Renders a single manual chapter — its title in the AppBar and its body
/// widgets (prose + inline illustrations) in a scroll view.
class ManualChapterPage extends StatelessWidget {
  const ManualChapterPage(this.chapter, {super.key});
  final ManualChapter chapter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(chapter.title, style: const TextStyle(fontSize: 14)),
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: chapter.body,
          ),
        ),
      ),
    );
  }
}

/// Collapsible theory section: the theory blocks, then the Einheitentheorie and
/// the Wertetheorie. Each leads to its own chapters.
class _TheoryExpansion extends StatelessWidget {
  const _TheoryExpansion();

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return MenuExpansionRow(
      title: l.infoListTheoryExpansion,
      leading: const MenuRowIcon(Icons.menu_book_outlined),
      childrenBuilder: (context, _) {
        final langTag = Localizations.localeOf(context).toLanguageTag();
        final werteBlock = werteTheoryBlock(l, langTag);
        return [
          for (final block in theoryBlocks(l, langTag))
            _MenuLink(
              title: block.title,
              subtitle: block.inProgress ? l.theoryInProgress : null,
              depth: 1,
              onTap: () =>
                  _openPage(context, (_) => TheoryBlockPage(block: block)),
            ),
          _MenuLink(
            title: l.infoListConversionsEntry,
            depth: 1,
            onTap: () => _openPage(context, (_) => const ConversionsPage()),
          ),
          _MenuLink(
            title: werteBlock.title,
            depth: 1,
            onTap: () =>
                _openPage(context, (_) => TheoryBlockPage(block: werteBlock)),
          ),
        ];
      },
    );
  }
}

/// Collapsible "Empfehlungen" section: one chapter per platform, each opening a
/// [RecChapterPage] with pros/cons per recommended calculator.
class _RecommendationsExpansion extends StatelessWidget {
  const _RecommendationsExpansion();

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return MenuExpansionRow(
      title: l.infoListRecommendationsExpansion,
      leading: const MenuRowIcon(Icons.recommend_outlined),
      childrenBuilder: (context, _) {
        final langTag = Localizations.localeOf(context).toLanguageTag();
        return [
          for (final chapter in recommendationChapters(langTag))
            _MenuLink(
              title: chapter.title,
              depth: 1,
              onTap: () => _openPage(context, (_) => RecChapterPage(chapter)),
            ),
        ];
      },
    );
  }
}

/// Language picker. Folded it names what it is and the active language;
/// unfolded it lists [kSupportedLanguages]. To add a language, append a
/// [LanguageOption] there, no UI changes needed here.
class _LanguagePickerExpansion extends StatelessWidget {
  const _LanguagePickerExpansion();

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final notifier = LocaleScope.of(context);
    final t = AppColors.of(context);
    // Match by full BCP-47 tag, not just languageCode — otherwise `zh` and
    // `zh-Hant` collide (both have languageCode `'zh'`) and the picker shows
    // both rows checked while the collapsed header always picks whichever
    // appears first in kSupportedLanguages.
    final activeTag = Localizations.localeOf(context).toLanguageTag();
    final active = kSupportedLanguages.firstWhere(
      (option) => option.locale.toLanguageTag() == activeTag,
      orElse: () => kSupportedLanguages.first,
    );
    return MenuExpansionRow(
      title: l.infoListLanguageEntry,
      value: active.label,
      leading: RoundFlagBadge(option: active),
      childrenBuilder: (context, collapse) => [
        for (final option in kSupportedLanguages)
          MenuRow(
            title: option.label,
            depth: 1,
            leading: RoundFlagBadge(option: option),
            trailing: option.locale.toLanguageTag() == activeTag
                ? Icon(Icons.check, color: t.textPrimary, size: 18)
                : null,
            onTap: () {
              unawaited(notifier.setOverride(option.locale));
              collapse();
            },
          ),
      ],
    );
  }
}

/// Trailing chevron for list rows that open a detail page. Picks
/// `chevron_right` in LTR locales and `chevron_left` in RTL — without
/// this, the icon would point away from the row content in RTL because
/// ListTile mirrors the trailing slot to the leading visual position
/// but the icon glyph itself doesn't auto-flip.
class _NavChevron extends StatelessWidget {
  const _NavChevron();

  @override
  Widget build(BuildContext context) {
    final rtl = Directionality.of(context) == TextDirection.rtl;
    return Icon(
      rtl ? Icons.chevron_left : Icons.chevron_right,
      color: AppColors.of(context).textFaint,
      size: 18,
    );
  }
}

/// Lists the chapters of one theory block. Tapping a chapter opens it via
/// [TheoryChapterPage]. An in-progress block (no chapters yet) shows a short
/// placeholder.
class TheoryBlockPage extends StatelessWidget {
  const TheoryBlockPage({required this.block, super.key});
  final TheoryBlock block;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final t = AppColors.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(block.title, style: const TextStyle(fontSize: 14)),
      ),
      body: SafeArea(
        top: false,
        child: block.chapters.isEmpty
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Text(
                    l.theoryInProgress,
                    style: TextStyle(fontSize: 14, color: t.textFaint),
                  ),
                ),
              )
            : ListView(
                padding: const EdgeInsets.symmetric(vertical: 4),
                children: [
                  for (var i = 0; i < block.chapters.length; i++) ...[
                    if (i > 0) Divider(color: t.divider, height: 1),
                    ListTile(
                      leading: SizedBox(
                        width: 28,
                        child: Text(
                          '${i + 1}.',
                          style: TextStyle(
                            color: t.textMuted,
                            fontFamily: 'JetBrainsMono',
                            fontSize: 13,
                          ),
                          textAlign: TextAlign.end,
                        ),
                      ),
                      title: Text(
                        block.chapters[i].title,
                        style: TextStyle(fontSize: 14, color: t.textPrimary),
                      ),
                      trailing: const _NavChevron(),
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (_) =>
                              TheoryChapterPage.fromRef(block.chapters[i]),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
      ),
    );
  }
}

/// Renders a single theory chapter: a heading + body prose sections, with an
/// optional head image or custom-painted illustration keyed by [imageId].
class TheoryChapterPage extends StatelessWidget {
  const TheoryChapterPage({
    required this.title,
    super.key,
    this.prose,
    this.sources = const [],
    this.imageId,
  });

  TheoryChapterPage.fromRef(TheoryChapterRef ref, {super.key})
    : title = ref.title,
      prose = ref.prose,
      sources = ref.sources,
      imageId = ref.imageId;
  final String title;
  final List<ProseSection>? prose;
  final List<Source> sources;
  final String? imageId;

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];
    final image = theoryImageFor(imageId);
    if (image != null) children.add(ChapterImageView(image));
    final appRef = theoryAppRefFor(imageId);
    if (appRef != null) children.add(AppRefCard(appRef));
    final customIllu = _customChapterIllustration(imageId);
    if (customIllu != null) children.add(customIllu);
    for (final s in prose ?? const <ProseSection>[]) {
      children.add(_ProseBlock(s));
      // Inline data figure right after this section's prose (if tagged).
      final inlineIllu = inlineTheoryIllustration(s.illustrationId);
      if (inlineIllu != null) children.add(inlineIllu);
    }
    if (sources.isNotEmpty) children.add(_SourceList(sources: sources));
    return Scaffold(
      appBar: AppBar(title: Text(title, style: const TextStyle(fontSize: 14))),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          ),
        ),
      ),
    );
  }
}

/// Custom-painted illustration shown at the head of a prose chapter, keyed by a
/// stable [ProseChapter.imageId]. Currently the two dodecagon diagrams
/// (inscribed polygons + diagonal types) for the consolidated Zwölfeck chapter.
Widget? _customChapterIllustration(String? id) {
  switch (id) {
    case 'math/dodekagon':
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 4),
        child: Column(
          children: [
            Chapter4Illustration(),
            SizedBox(height: 12),
            Chapter5Illustration(),
          ],
        ),
      );
    case 'math/parkettierung':
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 4),
        child: ParkettierungIllustration(),
      );
  }
  return null;
}

/// One prose section (bold heading + body), styled like the unit-theory page.
class _ProseBlock extends StatelessWidget {
  const _ProseBlock(this.section);
  final ProseSection section;

  @override
  Widget build(BuildContext context) {
    final t = AppColors.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            section.heading,
            style: TextStyle(
              color: t.textPrimary,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            section.body,
            style: TextStyle(
              color: t.textTertiary,
              fontSize: 13.5,
              height: 1.45,
            ),
          ),
        ],
      ),
    );
  }
}

/// The "Quellen" block at the end of a researched chapter. Each source title
/// is a tappable link (opens in the browser); below it the two-axis rating is
/// shown in words (e.g. "etablierte Referenz · Volltext gelesen").
class _SourceList extends StatelessWidget {
  const _SourceList({required this.sources});
  final List<Source> sources;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final t = AppColors.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(color: t.divider, height: 24),
          Text(
            l.sourcesSectionTitle,
            style: TextStyle(
              color: t.textPrimary,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          for (final s in sources)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () => openExternalLink(context, s.url),
                    child: Text(
                      s.title,
                      style: TextStyle(
                        color: t.link,
                        fontSize: 13.5,
                        height: 1.35,
                        decoration: TextDecoration.underline,
                        decorationColor: t.link,
                      ),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '${reliabilityLabel(l, s.reliability)} · ${accessLabel(l, s.access)}',
                    style: TextStyle(color: t.textFaint, fontSize: 11),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

String _sentenceCase(String text) =>
    text.isEmpty ? text : text[0].toUpperCase() + text.substring(1);
