// Shared rendering for the legal markdown assets (license, privacy policy).
// Both pages used to duplicate the FutureBuilder + MarkdownStyleSheet
// scaffolding verbatim — keeping the style decisions in one place means a
// future tweak to typography or link colour only touches this file.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';

import 'app_theme.dart';
import 'license_page.dart' show openExternalLink;

/// Renders a Markdown file from the asset bundle inside a Scaffold with the
/// app's standard dark style. [title] sets the AppBar label, [assetPath]
/// is the asset path passed to `rootBundle.loadString`, and [errorLabel]
/// is the prose shown if loading fails.
class MarkdownAssetPage extends StatefulWidget {
  final String title;
  final String assetPath;
  final String errorLabel;

  const MarkdownAssetPage({
    super.key,
    required this.title,
    required this.assetPath,
    required this.errorLabel,
  });

  @override
  State<MarkdownAssetPage> createState() => _MarkdownAssetPageState();
}

class _MarkdownAssetPageState extends State<MarkdownAssetPage> {
  late final Future<String> _markdown =
      rootBundle.loadString(widget.assetPath);

  @override
  Widget build(BuildContext context) {
    final t = AppColors.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(fontSize: 14),
        ),
      ),
      body: SafeArea(
        // Edge-to-edge: top inset is owned by the AppBar; the bottom matters
        // so the markdown text doesn't slide under the system nav bar.
        top: false,
        child: FutureBuilder<String>(
        future: _markdown,
        builder: (ctx, snap) {
          if (snap.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snap.hasError) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                '${widget.errorLabel}\n${snap.error}',
                style: TextStyle(color: t.displayError),
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
              h1: TextStyle(
                color: t.textPrimary,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                height: 1.25,
              ),
              h2: TextStyle(
                color: t.textPrimary,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                height: 1.35,
              ),
              p: TextStyle(
                color: t.textSecondary,
                fontSize: 13.5,
                height: 1.5,
              ),
              strong: TextStyle(
                color: t.textPrimary,
                fontWeight: FontWeight.bold,
              ),
              code: TextStyle(
                color: t.textTertiary,
                fontFamily: 'JetBrainsMono',
                fontSize: 12.5,
                backgroundColor: t.cardFill,
              ),
              a: TextStyle(color: t.link),
              listBullet: TextStyle(
                color: t.textSecondary,
                fontSize: 13.5,
              ),
            ),
          );
        },
        ),
      ),
    );
  }
}
