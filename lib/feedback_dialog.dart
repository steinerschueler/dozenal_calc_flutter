// Tester feedback popup. Asks for a 1-5 star rating, two short free-text
// fields, and pre-fills a mailto: URI with the answers + version/build
// metadata so a tap on "Senden" hands the message to the user's default
// mail client. Nothing leaves the device unless the user actively sends
// the mail — no analytics, no backend, no permissions.

import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

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
    Navigator.of(context).pop();
    await openExternalLink(context, uri.toString());
  }

  Widget _stars() {
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
              color: i <= _rating
                  ? const Color(0xFFFFD700)
                  : const Color(0xFFA0A0A0),
            ),
          ),
      ],
    );
  }

  InputDecoration _fieldDecoration() => const InputDecoration(
        filled: true,
        fillColor: Color(0xFF2A2A2A),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF404040)),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      );

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    const labelStyle = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    return AlertDialog(
      backgroundColor: const Color(0xFF1A1A1A),
      title: Text(
        l.feedbackTitle,
        style: const TextStyle(color: Colors.white),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              l.feedbackIntro,
              style: const TextStyle(color: Color(0xFFD0D0D0), fontSize: 12.5),
            ),
            const SizedBox(height: 16),
            Text(l.feedbackRatingLabel, style: labelStyle),
            _stars(),
            const SizedBox(height: 12),
            Text(l.feedbackLikedLabel, style: labelStyle),
            const SizedBox(height: 4),
            TextField(
              controller: _likedCtrl,
              maxLines: 3,
              style: const TextStyle(color: Colors.white, fontSize: 13),
              decoration: _fieldDecoration(),
            ),
            const SizedBox(height: 12),
            Text(l.feedbackChangeLabel, style: labelStyle),
            const SizedBox(height: 4),
            TextField(
              controller: _changeCtrl,
              maxLines: 3,
              style: const TextStyle(color: Colors.white, fontSize: 13),
              decoration: _fieldDecoration(),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            l.feedbackCancel,
            style: const TextStyle(color: Color(0xFFA0A0A0)),
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
