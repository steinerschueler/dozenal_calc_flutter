// Step 11 of PORTING.md: Info modal navigation.
// List → Detail → Back via the Flutter Navigator. Pure routing; chapter
// content is in info_content.dart.

import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'conversions_page.dart';
import 'feedback_dialog.dart';
import 'info_content.dart';
import 'l10n/app_localizations.dart';
import 'language_options.dart';
import 'license_page.dart';
import 'locale_notifier.dart';
import 'privacy_page.dart';

class InfoListPage extends StatelessWidget {
  const InfoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final titles = infoTitles(l);
    return Scaffold(
      appBar: AppBar(
        title: Text(l.infoListTitle),
        backgroundColor: const Color(0xFF1A1A1A),
      ),
      body: SafeArea(
        // Top is owned by the AppBar, but the bottom inset matters under
        // edge-to-edge: without it the last list rows hide behind the
        // system navigation bar.
        top: false,
        child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 4),
        children: [
          for (var i = 0; i < titles.length; i++) ...[
            if (i > 0)
              const Divider(color: Color(0xFF2C2C2C), height: 1),
            ListTile(
              leading: SizedBox(
                width: 28,
                child: Text(
                  '${i + 1}.',
                  style: const TextStyle(
                    color: Color(0xFFA0A0A0),
                    fontFamily: 'monospace',
                    fontSize: 13,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
              title: Text(
                titles[i],
                style: const TextStyle(fontSize: 14, color: Colors.white),
              ),
              trailing: const _NavChevron(),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => InfoDetailPage(chapterIndex: i),
                ),
              ),
            ),
          ],
          // Language picker + visually-distinct legal-link section.
          const SizedBox(height: 24),
          const Divider(color: Color(0xFF2C2C2C), height: 1),
          const _LanguagePickerExpansion(),
          const Divider(color: Color(0xFF2C2C2C), height: 1),
          ListTile(
            leading: const SizedBox(
              width: 28,
              child: Icon(
                Icons.straighten,
                color: Color(0xFFA0A0A0),
                size: 16,
              ),
            ),
            title: Text(
              l.infoListConversionsEntry,
              style: const TextStyle(fontSize: 14, color: Color(0xFFD0D0D0)),
            ),
            trailing: const _NavChevron(),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const ConversionsPage()),
            ),
          ),
          const Divider(color: Color(0xFF2C2C2C), height: 1),
          ListTile(
            leading: const SizedBox(
              width: 28,
              child: Icon(
                Icons.shield_outlined,
                color: Color(0xFFA0A0A0),
                size: 16,
              ),
            ),
            title: Text(
              l.infoListPrivacyEntry,
              style: const TextStyle(fontSize: 14, color: Color(0xFFD0D0D0)),
            ),
            trailing: const _NavChevron(),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const PrivacyPage()),
            ),
          ),
          const Divider(color: Color(0xFF2C2C2C), height: 1),
          ListTile(
            leading: const SizedBox(
              width: 28,
              child: Icon(
                Icons.balance,
                color: Color(0xFFA0A0A0),
                size: 16,
              ),
            ),
            title: Text(
              l.infoListLicenseEntry,
              style: const TextStyle(fontSize: 14, color: Color(0xFFD0D0D0)),
            ),
            trailing: const _NavChevron(),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const AppLicensePage()),
            ),
          ),
          const Divider(color: Color(0xFF2C2C2C), height: 1),
          ListTile(
            leading: const SizedBox(
              width: 28,
              child: Icon(
                Icons.mail_outline,
                color: Color(0xFFA0A0A0),
                size: 16,
              ),
            ),
            title: Text(
              l.infoListFeedbackEntry,
              style: const TextStyle(fontSize: 14, color: Color(0xFFD0D0D0)),
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
                snap.data!.version, snap.data!.buildNumber)
            : '';
        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 32, 16, 24),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF707070),
              fontSize: 11,
              fontFamily: 'monospace',
            ),
          ),
        );
      },
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
    final activeCode = Localizations.localeOf(context).languageCode;
    final active = kSupportedLanguages.firstWhere(
      (l) => l.locale.languageCode == activeCode,
      orElse: () => kSupportedLanguages.first,
    );

    return Column(
      children: [
        ListTile(
          leading: _FlagThumb(option: active),
          title: Text(
            active.label,
            style: const TextStyle(fontSize: 14, color: Color(0xFFD0D0D0)),
          ),
          trailing: AnimatedRotation(
            turns: _expanded ? 0.5 : 0,
            duration: const Duration(milliseconds: 200),
            child: const Icon(
              Icons.expand_more,
              color: Color(0xFF707070),
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
                    const Divider(color: Color(0xFF2C2C2C), height: 1),
                    for (final lang in kSupportedLanguages)
                      ListTile(
                        contentPadding:
                            const EdgeInsetsDirectional.fromSTEB(
                                32, 0, 16, 0),
                        leading: _FlagThumb(option: lang),
                        title: Text(
                          lang.label,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xFFD0D0D0),
                          ),
                        ),
                        trailing: lang.locale.languageCode == activeCode
                            ? const Icon(Icons.check,
                                color: Colors.white, size: 16)
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
      color: const Color(0xFF707070),
      size: 18,
    );
  }
}

/// Small flag rendered at a uniform 16-dp height; width follows the
/// language's canonical flag aspect ratio so DE (5:3) and UK (2:1) keep
/// their natural shape.
class _FlagThumb extends StatelessWidget {
  final LanguageOption option;
  const _FlagThumb({required this.option});

  @override
  Widget build(BuildContext context) {
    const h = 16.0;
    final w = h * option.canonicalFlagSize.aspectRatio;
    return SizedBox(
      width: w,
      height: h,
      child: CustomPaint(
        size: Size(w, h),
        painter: option.flagPainter,
      ),
    );
  }
}

class InfoDetailPage extends StatelessWidget {
  final int chapterIndex;

  const InfoDetailPage({super.key, required this.chapterIndex});

  @override
  Widget build(BuildContext context) {
    final titles = infoTitles(AppLocalizations.of(context));
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${chapterIndex + 1}. ${titles[chapterIndex]}',
          style: const TextStyle(fontSize: 14),
        ),
        backgroundColor: const Color(0xFF1A1A1A),
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: buildChapterContent(chapterIndex, context),
          ),
        ),
      ),
    );
  }
}
