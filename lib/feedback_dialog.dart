// Tester feedback popup. Asks for a 1-5 star rating, two short free-text
// fields, and pre-fills a mailto: URI with the answers + version/build
// metadata so a tap on "Senden" hands the message to the user's default
// mail client. Nothing leaves the device unless the user actively sends
// the mail — no analytics, no backend, no permissions.

import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

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
    final pkg = await PackageInfo.fromPlatform();
    final ratingStr =
        _rating == 0 ? '(keine Angabe)' : '$_rating von 5';
    final liked = _likedCtrl.text.trim().isEmpty
        ? '(keine Angabe)'
        : _likedCtrl.text.trim();
    final change = _changeCtrl.text.trim().isEmpty
        ? '(keine Angabe)'
        : _changeCtrl.text.trim();
    final body = '''Feedback Dozenal Calc

Bewertung: $ratingStr

Was hat dir gefallen:
$liked

Was würdest du anders machen:
$change

---
Version: ${pkg.version}
Build: ${pkg.buildNumber}
''';
    final uri = Uri(
      scheme: 'mailto',
      path: _feedbackEmail,
      query: 'subject=${Uri.encodeComponent('Feedback Dozenal Calc')}'
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
    const labelStyle = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    return AlertDialog(
      backgroundColor: const Color(0xFF1A1A1A),
      title: const Text(
        'Feedback',
        style: TextStyle(color: Colors.white),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Danke fürs Testen von Dozenal Calc! Deine Antworten landen '
              'als E-Mail in deinem Standard-Mail-Programm, das du noch '
              'prüfen oder verwerfen kannst, bevor sie verschickt wird.',
              style: TextStyle(color: Color(0xFFD0D0D0), fontSize: 12.5),
            ),
            const SizedBox(height: 16),
            const Text('Bewertung', style: labelStyle),
            _stars(),
            const SizedBox(height: 12),
            const Text('Was hat dir gefallen?', style: labelStyle),
            const SizedBox(height: 4),
            TextField(
              controller: _likedCtrl,
              maxLines: 3,
              style: const TextStyle(color: Colors.white, fontSize: 13),
              decoration: _fieldDecoration(),
            ),
            const SizedBox(height: 12),
            const Text('Was würdest du anders machen?', style: labelStyle),
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
          child: const Text(
            'Abbrechen',
            style: TextStyle(color: Color(0xFFA0A0A0)),
          ),
        ),
        FilledButton(
          onPressed: _send,
          child: const Text('Senden'),
        ),
      ],
    );
  }
}
