// Renders legal/privacy-policy.de.md inside the app via flutter_markdown_plus.
// The .md file is bundled as a Flutter asset (see pubspec.yaml). When the
// privacy policy text changes, edit the .md file and rebuild — no Dart
// changes needed.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';

class PrivacyPage extends StatefulWidget {
  const PrivacyPage({super.key});

  @override
  State<PrivacyPage> createState() => _PrivacyPageState();
}

class _PrivacyPageState extends State<PrivacyPage> {
  late final Future<String> _markdown =
      rootBundle.loadString('legal/privacy-policy.de.md');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Datenschutzerklärung',
          style: TextStyle(fontSize: 14),
        ),
        backgroundColor: const Color(0xFF1A1A1A),
      ),
      body: FutureBuilder<String>(
        future: _markdown,
        builder: (ctx, snap) {
          if (snap.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snap.hasError) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Datenschutzerklärung konnte nicht geladen werden:\n${snap.error}',
                style: const TextStyle(color: Colors.redAccent),
              ),
            );
          }
          return Markdown(
            data: snap.data ?? '',
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
            styleSheet: MarkdownStyleSheet(
              h1: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                height: 1.25,
              ),
              h2: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                height: 1.35,
              ),
              p: const TextStyle(
                color: Color(0xFFE0E0E0),
                fontSize: 13.5,
                height: 1.5,
              ),
              strong: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              code: const TextStyle(
                color: Color(0xFFC8C8C8),
                fontFamily: 'monospace',
                fontSize: 12.5,
                backgroundColor: Color(0xFF2A2A2A),
              ),
              a: const TextStyle(color: Color(0xFF64C8FF)),
              listBullet: const TextStyle(
                color: Color(0xFFE0E0E0),
                fontSize: 13.5,
              ),
            ),
          );
        },
      ),
    );
  }
}
