// Renders one "Empfehlungen" platform chapter: a short intro, a card per
// recommended calculator (name · tag · blurb · ✓ pros · ✗ cons · link), and a
// closing "Fazit" callout. Plain Material widgets throughout, so RTL (fa/ar)
// mirrors automatically. Theme colors come from AppColors.

import 'package:flutter/material.dart';

import '../app_theme.dart';
import '../license_page.dart' show openExternalLink;
import 'recommendations.dart';

class RecChapterPage extends StatelessWidget {
  final RecChapter chapter;
  const RecChapterPage(this.chapter, {super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppColors.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(chapter.title, style: const TextStyle(fontSize: 14)),
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                chapter.intro,
                style: TextStyle(
                  fontSize: 13.5,
                  height: 1.45,
                  color: t.textSecondary,
                ),
              ),
              const SizedBox(height: 16),
              for (final c in chapter.calcs) _RecCalcCard(c),
              _VerdictBox(chapter.verdict),
            ],
          ),
        ),
      ),
    );
  }
}

class _RecCalcCard extends StatelessWidget {
  final RecCalc calc;
  const _RecCalcCard(this.calc);

  @override
  Widget build(BuildContext context) {
    final t = AppColors.of(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: t.cardFill,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: t.hairline),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            calc.name,
            // Product names are always LTR ("Qalculate!", "Free42 / Plus42")
            // even in an RTL (fa/ar) page, so the trailing "!" and the " / "
            // separator don't get reordered by the bidi algorithm.
            textDirection: TextDirection.ltr,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: t.textPrimary,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            calc.tag,
            style: TextStyle(fontSize: 12, color: t.textMuted),
          ),
          const SizedBox(height: 8),
          Text(
            calc.blurb,
            style: TextStyle(
              fontSize: 13.5,
              height: 1.4,
              color: t.textSecondary,
            ),
          ),
          const SizedBox(height: 10),
          for (final p in calc.pros)
            _Bullet(icon: Icons.check_rounded, color: t.equals, text: p),
          for (final c in calc.cons)
            _Bullet(icon: Icons.close_rounded, color: t.ac, text: c),
          const SizedBox(height: 8),
          _LinkRow(calc.url),
        ],
      ),
    );
  }
}

/// One ✓/✗ line: a colored icon plus neutral text (so the bullets read as
/// rows of tradeoffs, not walls of red/green).
class _Bullet extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;
  const _Bullet({required this.icon, required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    final t = AppColors.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 3),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 1.5),
            child: Icon(icon, size: 16, color: color),
          ),
          const SizedBox(width: 7),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 13,
                height: 1.35,
                color: t.textSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// A tappable link row showing the destination host; opens it externally.
class _LinkRow extends StatelessWidget {
  final String url;
  const _LinkRow(this.url);

  @override
  Widget build(BuildContext context) {
    final t = AppColors.of(context);
    var host = Uri.tryParse(url)?.host ?? url;
    if (host.startsWith('www.')) host = host.substring(4);
    return InkWell(
      onTap: () => openExternalLink(context, url),
      borderRadius: BorderRadius.circular(6),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.open_in_new, size: 14, color: t.link),
            const SizedBox(width: 6),
            Flexible(
              child: Text(
                host,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: t.link,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// The closing "Fazit" callout: a card with a gold accent bar on the leading
/// edge (direction-aware via Border + EdgeInsetsDirectional).
class _VerdictBox extends StatelessWidget {
  final String verdict;
  const _VerdictBox(this.verdict);

  @override
  Widget build(BuildContext context) {
    final t = AppColors.of(context);
    return Container(
      padding: const EdgeInsetsDirectional.fromSTEB(12, 11, 11, 11),
      decoration: BoxDecoration(
        color: t.cardFill,
        borderRadius: BorderRadius.circular(8),
        border: BorderDirectional(
          start: BorderSide(color: t.accentGold, width: 3),
        ),
      ),
      child: Text(
        verdict,
        style: TextStyle(
          fontSize: 13.5,
          height: 1.45,
          color: t.textSecondary,
        ),
      ),
    );
  }
}
