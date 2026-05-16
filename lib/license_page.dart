// Renders legal/license.de.md inside the app via flutter_markdown_plus.
// Mirrors privacy_page.dart so a future copy-editor only needs to touch
// the .md file when the license text changes.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:url_launcher/url_launcher.dart';

/// Opens [href] in the user's default browser. On failure, shows a
/// SnackBar so the tap doesn't silently do nothing. Shared by
/// license_page.dart and privacy_page.dart via top-level export.
Future<void> openExternalLink(BuildContext context, String href) async {
  final uri = Uri.tryParse(href);
  if (uri == null) return;
  final ok =
      await launchUrl(uri, mode: LaunchMode.externalApplication);
  if (!ok && context.mounted) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Link konnte nicht geöffnet werden: $href')),
    );
  }
}

class AppLicensePage extends StatefulWidget {
  const AppLicensePage({super.key});

  @override
  State<AppLicensePage> createState() => _AppLicensePageState();
}

class _AppLicensePageState extends State<AppLicensePage> {
  late final Future<String> _markdown =
      rootBundle.loadString('legal/license.de.md');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lizenz',
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
                'Lizenz konnte nicht geladen werden:\n${snap.error}',
                style: const TextStyle(color: Colors.redAccent),
              ),
            );
          }
          return Markdown(
            data: snap.data ?? '',
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
            onTapLink: (text, href, title) {
              if (href != null) openExternalLink(context, href);
            },
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
