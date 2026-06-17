// Tester feedback popup. Asks for a 1-5 star rating, two short free-text
// fields, and pre-fills a mailto: URI with the answers + version/build
// metadata so a tap on "Senden" hands the message to the user's default
// mail client. Nothing leaves the device unless the user actively sends
// the mail — no analytics, no backend, no permissions.

import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'app_theme.dart';
import 'l10n/app_localizations.dart';
import 'license_page.dart' show openExternalLink;

const String _feedbackEmail = 'dozenal@weltanschauung.app';

Future<void> showFeedbackDialog(BuildContext context) async {
  await showDialog(
    context: context,
    builder: (ctx) => const _FeedbackDialog(),
  );
}

class _FeedbackDialog extends StatefulWidget {
  const _FeedbackDialog();

  @override
  State<_FeedbackDialog> createState() => _FeedbackDialogState();
}

class _FeedbackDialogState extends State<_FeedbackDialog> {
  int _rating = 0;
  final TextEditingController _likedCtrl = TextEditingController();
  final TextEditingController _changeCtrl = TextEditingController();

  @override
  void dispose() {
    _likedCtrl.dispose();
    _changeCtrl.dispose();
    super.dispose();
  }

  Future<void> _send() async {
    // Capture AppLocalizations before the `await` so the post-await section
    // doesn't need a fresh BuildContext lookup.
    final l = AppLocalizations.of(context);
    final pkg = await PackageInfo.fromPlatform();
    final ratingStr = _rating == 0
        ? l.feedbackNoAnswer
        : l.feedbackRatingValue(_rating);
    final liked = _likedCtrl.text.trim().isEmpty
        ? l.feedbackNoAnswer
        : _likedCtrl.text.trim();
    final change = _changeCtrl.text.trim().isEmpty
        ? l.feedbackNoAnswer
        : _changeCtrl.text.trim();
    final body = '''${l.feedbackMailSubject}

${l.feedbackRatingLabel}: $ratingStr

${l.feedbackMailLikedLabel}
$liked

${l.feedbackMailChangeLabel}
$change

---
${l.feedbackMailVersionLabel}: ${pkg.version}
${l.feedbackMailBuildLabel}: ${pkg.buildNumber}
''';
    final uri = Uri(
      scheme: 'mailto',
      path: _feedbackEmail,
      query: 'subject=${Uri.encodeComponent(l.feedbackMailSubject)}'
          '&body=${Uri.encodeComponent(body)}',
    );
    if (!mounted) return;
    // Open the link BEFORE popping: openExternalLink needs a live context for
    // AppLocalizations and the failure SnackBar. Popping first leaves it with
    // this dialog's defunct context (the error toast would be swallowed).
    await openExternalLink(context, uri.toString());
    if (mounted) Navigator.of(context).pop();
  }

  Widget _stars(AppColors t) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var i = 1; i <= 5; i++)
          IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            iconSize: 32,
            onPressed: () => setState(() => _rating = i),
            icon: Icon(
              i <= _rating ? Icons.star : Icons.star_border,
              color: i <= _rating ? t.accentGold : t.textMuted,
            ),
          ),
      ],
    );
  }

  InputDecoration _fieldDecoration(AppColors t) => InputDecoration(
        filled: true,
        fillColor: t.cardFill,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: t.cardBorder),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      );

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final t = AppColors.of(context);
    final labelStyle = TextStyle(
      color: t.textPrimary,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    return AlertDialog(
      backgroundColor: t.appBarBg,
      title: Text(
        l.feedbackTitle,
        style: TextStyle(color: t.textPrimary),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              l.feedbackIntro,
              style: TextStyle(color: t.textSecondary, fontSize: 12.5),
            ),
            const SizedBox(height: 16),
            Text(l.feedbackRatingLabel, style: labelStyle),
            _stars(t),
            const SizedBox(height: 12),
            Text(l.feedbackLikedLabel, style: labelStyle),
            const SizedBox(height: 4),
            TextField(
              controller: _likedCtrl,
              maxLines: 3,
              style: TextStyle(color: t.textPrimary, fontSize: 13),
              decoration: _fieldDecoration(t),
            ),
            const SizedBox(height: 12),
            Text(l.feedbackChangeLabel, style: labelStyle),
            const SizedBox(height: 4),
            TextField(
              controller: _changeCtrl,
              maxLines: 3,
              style: TextStyle(color: t.textPrimary, fontSize: 13),
              decoration: _fieldDecoration(t),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            l.feedbackCancel,
            style: TextStyle(color: t.textMuted),
          ),
        ),
        FilledButton(
          onPressed: _send,
          child: Text(l.feedbackSend),
        ),
      ],
    );
  }
}
