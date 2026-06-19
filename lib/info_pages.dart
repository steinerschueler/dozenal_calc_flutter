// Info modal navigation: List → Detail → Back via the Flutter Navigator.
// Pure routing. Chapter content lives in lib/theory/ (theory blocks) and
// lib/manual/ (the calculator manual).

import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'app_theme.dart';
import 'conversions_page.dart';
import 'feedback_dialog.dart';
import 'l10n/app_localizations.dart';
import 'language_options.dart';
import 'manual/manual.dart';
import 'license_page.dart';
import 'locale_notifier.dart';
import 'privacy_page.dart';
import 'recommendations/recommendations.dart';
import 'recommendations/recommendations_page.dart';
import 'round_badge.dart';
import 'settings_page.dart';
import 'support_page.dart';
import 'theory/chapter_image_view.dart';
import 'theory/chapter_images.dart';
import 'theory/prose_chapter.dart';
import 'theory/theory_blocks.dart';
import 'theory/theory_illustrations.dart';

class InfoListPage extends StatelessWidget {
  const InfoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final t = AppColors.of(context);
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
          padding: const EdgeInsets.symmetric(vertical: 4),
          children: [
            // Bedienung ist App-Hilfe, kein Theorie-Stoff — darum zwei
            // eigenstaendige, ausklappbare Handbuch-Sammlungen ganz oben:
            // Hauptrechner (Grundbedienung + Lehr-Kapitel) und
            // Einheitenrechner (Wechsel, Kategorien, met/imp + Farbcode,
            // Terme, Skalar-Rechnen, Speicher/Bruecke).
            _ManualSectionExpansion(
              icon: Icons.touch_app_outlined,
              color: BadgeHue.blue,
              titleOf: (l) => l.chapterTitle01,
              chaptersOf: manualChapters,
            ),
            Divider(color: t.divider, height: 1),
            _ManualSectionExpansion(
              icon: Icons.swap_horiz,
              color: BadgeHue.teal,
              titleOf: (l) => l.infoListConverterManual,
              chaptersOf: converterManualChapters,
            ),
            Divider(color: t.divider, height: 1),
            // Werterechner (dritte Pager-Seite): Klasse/Gattung/Einheit,
            // beide Welt-Systeme zugleich, Speicher im Drill, Wert/Kurse/Kurve.
            _ManualSectionExpansion(
              icon: Icons.diamond_outlined,
              color: BadgeHue.bronze,
              titleOf: (l) => l.infoListAssetManual,
              chaptersOf: assetManualChapters,
            ),
            Divider(color: t.divider, height: 1),
            // Theorie-Sektion: ausklappbar (Default collapsed) zu den drei
            // Bloecken (Zwoelf und die Welt, Dozenale Mathematik, Dozenale
            // Gesellschaft) plus der Einheitentheorie; jeder Block fuehrt zu
            // seinen Kapiteln. Die fruehere Einheiten-Sektion ist aufgeloest:
            // der Einheitenrechner ist seit dem Pager eine Swipe-Geste (kein
            // Navigations-Eintrag mehr noetig), die Einheitentheorie wohnt
            // jetzt hier.
            const _TheoryExpansion(),
            Divider(color: t.divider, height: 1),
            // Empfehlungen-Sektion: ausklappbar, direkt unter "Theorie" — ein
            // Kapitel pro Plattform (Physisch, Android Play Store / F-Droid,
            // iOS, macOS, Linux, Windows) mit Pros/Cons je Rechner.
            const _RecommendationsExpansion(),
            Divider(color: t.divider, height: 1),
            // Einstellungen: buendelt die frueher hier liegenden Quick-Toggles
            // (Glyphen-Stil, Haptik) mit den Keypad-Praeferenzen (Overlay/
            // Scrollen, Alle/Einfach) und Zahlensystem/Winkelmodus auf einer
            // eigenen Seite (settings_page.dart).
            ListTile(
              leading: const RoundIconBadge(
                icon: Icons.settings_outlined,
                color: BadgeHue.slate,
              ),
              title: Text(
                l.settingsTitle,
                style: TextStyle(fontSize: 14, color: t.textSecondary),
              ),
              trailing: const _NavChevron(),
              onTap: () => Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => const SettingsPage())),
            ),
            Divider(color: t.divider, height: 1),
            const _LanguagePickerExpansion(),
            Divider(color: t.divider, height: 1),
            ListTile(
              leading: const RoundIconBadge(
                icon: Icons.shield_outlined,
                color: BadgeHue.green,
              ),
              title: Text(
                l.infoListPrivacyEntry,
                style: TextStyle(fontSize: 14, color: t.textSecondary),
              ),
              trailing: const _NavChevron(),
              onTap: () => Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => const PrivacyPage())),
            ),
            Divider(color: t.divider, height: 1),
            ListTile(
              leading: const RoundIconBadge(
                icon: Icons.balance,
                color: BadgeHue.bronze,
              ),
              title: Text(
                l.infoListLicenseEntry,
                style: TextStyle(fontSize: 14, color: t.textSecondary),
              ),
              trailing: const _NavChevron(),
              onTap: () => Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => const AppLicensePage())),
            ),
            Divider(color: t.divider, height: 1),
            ListTile(
              leading: const RoundIconBadge(
                icon: Icons.favorite_outline,
                color: BadgeHue.pink,
              ),
              title: Text(
                l.infoListSupportEntry,
                style: TextStyle(fontSize: 14, color: t.textSecondary),
              ),
              trailing: const _NavChevron(),
              onTap: () => Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => const SupportPage())),
            ),
            Divider(color: t.divider, height: 1),
            ListTile(
              leading: const RoundIconBadge(
                icon: Icons.mail_outline,
                color: BadgeHue.cyan,
              ),
              title: Text(
                l.infoListFeedbackEntry,
                style: TextStyle(fontSize: 14, color: t.textSecondary),
              ),
              trailing: const _NavChevron(),
              onTap: () => showFeedbackDialog(context),
            ),
            const _VersionFooter(),
          ],
        ),
      ),
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

/// Collapsible theory section. Default collapsed so the Info page opens
/// compact; tapping the header unfolds the three theory blocks (Zwölf und die
/// Welt, Dozenale Mathematik, Dozenale Gesellschaft). Each block leads to its
/// own chapter list (see [theoryBlocks] / [TheoryBlockPage]).
/// Collapsible manual section: a flat list of chapters (no sub-blocks,
/// unlike the theory section). Instantiated twice — "Bedienung des
/// Hauptrechners" (Grundbedienung + Lehr-Kapitel) and "Bedienung des
/// Einheitenrechners" — parameterised instead of duplicated.
class _ManualSectionExpansion extends StatefulWidget {
  const _ManualSectionExpansion({
    required this.icon,
    required this.color,
    required this.titleOf,
    required this.chaptersOf,
  });

  final IconData icon;
  final Color color;
  final String Function(AppLocalizations) titleOf;
  final List<ManualChapter> Function(String langTag) chaptersOf;

  @override
  State<_ManualSectionExpansion> createState() =>
      _ManualSectionExpansionState();
}

class _ManualSectionExpansionState extends State<_ManualSectionExpansion> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final t = AppColors.of(context);
    final langTag = Localizations.localeOf(context).toLanguageTag();
    final chapters = widget.chaptersOf(langTag);
    return Column(
      children: [
        ListTile(
          leading: RoundIconBadge(icon: widget.icon, color: widget.color),
          title: Text(
            widget.titleOf(l),
            style: TextStyle(fontSize: 14, color: t.textPrimary),
          ),
          trailing: AnimatedRotation(
            turns: _expanded ? 0.5 : 0,
            duration: const Duration(milliseconds: 200),
            child: Icon(Icons.expand_more, color: t.textFaint, size: 20),
          ),
          onTap: () => setState(() => _expanded = !_expanded),
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 200),
          alignment: Alignment.topCenter,
          child: _expanded
              ? Column(
                  children: [
                    for (final c in chapters) ...[
                      Divider(color: t.divider, height: 1),
                      ListTile(
                        contentPadding: const EdgeInsetsDirectional.fromSTEB(
                          kSubItemIndent,
                          0,
                          16,
                          0,
                        ),
                        title: Text(
                          c.title,
                          style: TextStyle(fontSize: 14, color: t.textPrimary),
                        ),
                        trailing: const _NavChevron(),
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => ManualChapterPage(c),
                          ),
                        ),
                      ),
                    ],
                  ],
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}

/// Renders a single manual chapter — its title in the AppBar and its body
/// widgets (prose + inline illustrations) in a scroll view.
class ManualChapterPage extends StatelessWidget {
  final ManualChapter chapter;
  const ManualChapterPage(this.chapter, {super.key});

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

class _TheoryExpansion extends StatefulWidget {
  const _TheoryExpansion();

  @override
  State<_TheoryExpansion> createState() => _TheoryExpansionState();
}

class _TheoryExpansionState extends State<_TheoryExpansion> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final t = AppColors.of(context);
    final langTag = Localizations.localeOf(context).toLanguageTag();
    final blocks = theoryBlocks(l, langTag);
    // Rendered LAST, after the Einheitentheorie entry (per the desired order).
    final werteBlock = werteTheoryBlock(l, langTag);
    return Column(
      children: [
        ListTile(
          leading: const RoundIconBadge(
            icon: Icons.menu_book_outlined,
            color: BadgeHue.violet,
          ),
          title: Text(
            l.infoListTheoryExpansion,
            style: TextStyle(fontSize: 14, color: t.textPrimary),
          ),
          trailing: AnimatedRotation(
            turns: _expanded ? 0.5 : 0,
            duration: const Duration(milliseconds: 200),
            child: Icon(
              Icons.expand_more,
              color: t.textFaint,
              size: 20,
            ),
          ),
          onTap: () => setState(() => _expanded = !_expanded),
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 200),
          alignment: Alignment.topCenter,
          child: _expanded
              ? Column(
                  children: [
                    for (final block in blocks) ...[
                      Divider(color: t.divider, height: 1),
                      ListTile(
                        contentPadding: const EdgeInsetsDirectional.fromSTEB(
                          kSubItemIndent,
                          0,
                          16,
                          0,
                        ),
                        title: Text(
                          block.title,
                          style: TextStyle(
                            fontSize: 14,
                            color: t.textPrimary,
                          ),
                        ),
                        subtitle: block.inProgress
                            ? Text(
                                l.theoryInProgress,
                                style: TextStyle(
                                  fontSize: 11,
                                  color: t.textFaint,
                                ),
                              )
                            : null,
                        trailing: const _NavChevron(),
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => TheoryBlockPage(block: block),
                          ),
                        ),
                      ),
                    ],
                    // Einheitentheorie als vierter Block — hierher gezogen,
                    // als die Einheiten-Sektion aufgeloest wurde (der
                    // Einheitenrechner selbst ist eine Swipe-Geste, kein
                    // Listen-Eintrag mehr).
                    Divider(color: t.divider, height: 1),
                    ListTile(
                      contentPadding: const EdgeInsetsDirectional.fromSTEB(
                        kSubItemIndent,
                        0,
                        16,
                        0,
                      ),
                      title: Text(
                        l.infoListConversionsEntry,
                        style: TextStyle(fontSize: 14, color: t.textPrimary),
                      ),
                      trailing: const _NavChevron(),
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const ConversionsPage(),
                        ),
                      ),
                    ),
                    // Wertetheorie zuletzt — nach der Einheitentheorie. Prosa-
                    // Block, rendert wie die anderen über TheoryBlockPage.
                    Divider(color: t.divider, height: 1),
                    ListTile(
                      contentPadding: const EdgeInsetsDirectional.fromSTEB(
                        kSubItemIndent,
                        0,
                        16,
                        0,
                      ),
                      title: Text(
                        werteBlock.title,
                        style: TextStyle(fontSize: 14, color: t.textPrimary),
                      ),
                      trailing: const _NavChevron(),
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => TheoryBlockPage(block: werteBlock),
                        ),
                      ),
                    ),
                  ],
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}

/// Collapsible "Empfehlungen" section: one chapter per platform, each opening a
/// [RecChapterPage] with pros/cons per recommended calculator. A flat list (no
/// sub-blocks), placed directly under the Theorie section.
class _RecommendationsExpansion extends StatefulWidget {
  const _RecommendationsExpansion();

  @override
  State<_RecommendationsExpansion> createState() =>
      _RecommendationsExpansionState();
}

class _RecommendationsExpansionState extends State<_RecommendationsExpansion> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final t = AppColors.of(context);
    final langTag = Localizations.localeOf(context).toLanguageTag();
    final chapters = recommendationChapters(langTag);
    return Column(
      children: [
        ListTile(
          leading: const RoundIconBadge(
            icon: Icons.recommend_outlined,
            color: BadgeHue.amber,
          ),
          title: Text(
            l.infoListRecommendationsExpansion,
            style: TextStyle(fontSize: 14, color: t.textPrimary),
          ),
          trailing: AnimatedRotation(
            turns: _expanded ? 0.5 : 0,
            duration: const Duration(milliseconds: 200),
            child: Icon(Icons.expand_more, color: t.textFaint, size: 20),
          ),
          onTap: () => setState(() => _expanded = !_expanded),
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 200),
          alignment: Alignment.topCenter,
          child: _expanded
              ? Column(
                  children: [
                    for (final c in chapters) ...[
                      Divider(color: t.divider, height: 1),
                      ListTile(
                        contentPadding: const EdgeInsetsDirectional.fromSTEB(
                          kSubItemIndent,
                          0,
                          16,
                          0,
                        ),
                        title: Text(
                          c.title,
                          style: TextStyle(fontSize: 14, color: t.textPrimary),
                        ),
                        trailing: const _NavChevron(),
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => RecChapterPage(c),
                          ),
                        ),
                      ),
                    ],
                  ],
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}

/// Language picker between the twelve teaching chapters and the legal-link
/// section. Collapsed it looks like an ordinary list entry showing the
/// active language; tapping unfolds the full list of supported languages
/// from [kSupportedLanguages]. Designed to scale to many languages — to
/// add a new one, append a [LanguageOption] entry there, no UI changes
/// needed here.
class _LanguagePickerExpansion extends StatefulWidget {
  const _LanguagePickerExpansion();

  @override
  State<_LanguagePickerExpansion> createState() =>
      _LanguagePickerExpansionState();
}

class _LanguagePickerExpansionState extends State<_LanguagePickerExpansion> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final notifier = LocaleScope.of(context);
    final t = AppColors.of(context);
    // Match by full BCP-47 tag, not just languageCode — otherwise `zh` and
    // `zh-Hant` collide (both have languageCode `'zh'`) and the picker shows
    // both rows checked while the collapsed header always picks whichever
    // appears first in kSupportedLanguages.
    final activeTag = Localizations.localeOf(context).toLanguageTag();
    final active = kSupportedLanguages.firstWhere(
      (l) => l.locale.toLanguageTag() == activeTag,
      orElse: () => kSupportedLanguages.first,
    );

    return Column(
      children: [
        ListTile(
          leading: RoundFlagBadge(option: active),
          title: Text(
            active.label,
            style: TextStyle(fontSize: 14, color: t.textSecondary),
          ),
          trailing: AnimatedRotation(
            turns: _expanded ? 0.5 : 0,
            duration: const Duration(milliseconds: 200),
            child: Icon(
              Icons.expand_more,
              color: t.textFaint,
              size: 20,
            ),
          ),
          onTap: () => setState(() => _expanded = !_expanded),
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 200),
          alignment: Alignment.topCenter,
          child: _expanded
              ? Column(
                  children: [
                    Divider(color: t.divider, height: 1),
                    for (final lang in kSupportedLanguages)
                      ListTile(
                        contentPadding: const EdgeInsetsDirectional.fromSTEB(
                          kSubItemIndent,
                          0,
                          16,
                          0,
                        ),
                        leading: RoundFlagBadge(option: lang),
                        title: Text(
                          lang.label,
                          style: TextStyle(
                            fontSize: 14,
                            color: t.textSecondary,
                          ),
                        ),
                        trailing: lang.locale.toLanguageTag() == activeTag
                            ? Icon(
                                Icons.check,
                                color: t.textPrimary,
                                size: 16,
                              )
                            : null,
                        onTap: () {
                          notifier.setOverride(lang.locale);
                          setState(() => _expanded = false);
                        },
                      ),
                  ],
                )
              : const SizedBox.shrink(),
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
  final TheoryBlock block;

  const TheoryBlockPage({super.key, required this.block});

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
                    style: TextStyle(
                      fontSize: 14,
                      color: t.textFaint,
                    ),
                  ),
                ),
              )
            : ListView(
                padding: const EdgeInsets.symmetric(vertical: 4),
                children: [
                  for (var i = 0; i < block.chapters.length; i++) ...[
                    if (i > 0)
                      Divider(color: t.divider, height: 1),
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
                        style: TextStyle(
                          fontSize: 14,
                          color: t.textPrimary,
                        ),
                      ),
                      trailing: const _NavChevron(),
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
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
  final String title;
  final List<ProseSection>? prose;
  final List<Source> sources;
  final String? imageId;

  const TheoryChapterPage({
    super.key,
    required this.title,
    this.prose,
    this.sources = const [],
    this.imageId,
  });

  TheoryChapterPage.fromRef(TheoryChapterRef ref, {super.key})
    : title = ref.title,
      prose = ref.prose,
      sources = ref.sources,
      imageId = ref.imageId;

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];
    final image = theoryImageFor(imageId);
    if (image != null) children.add(ChapterImageView(image));
    final appRef = theoryAppRefFor(imageId);
    if (appRef != null) children.add(AppRefCard(appRef));
    final customIllu = _customChapterIllustration(imageId);
    if (customIllu != null) children.add(customIllu);
    children.addAll([
      for (final s in prose ?? const <ProseSection>[]) _ProseBlock(s),
    ]);
    if (sources.isNotEmpty) children.add(_SourceList(sources: sources));
    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: const TextStyle(fontSize: 14)),
      ),
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
  final ProseSection section;
  const _ProseBlock(this.section);

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
  final List<Source> sources;
  const _SourceList({required this.sources});

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
                    style: TextStyle(
                      color: t.textFaint,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
