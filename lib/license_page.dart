// Renders legal/license.de.md inside the app. The actual Markdown + Scaffold
// scaffolding lives in markdown_page.dart so the privacy page can share it
// — this file only configures asset path + labels. Also exports
// openExternalLink, which both legal pages and the feedback dialog reuse.

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'markdown_page.dart';

/// Opens [href] in the user's default browser. On failure, shows a
/// SnackBar so the tap doesn't silently do nothing. Shared by the legal
/// pages and the feedback dialog via top-level export.
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

class AppLicensePage extends StatelessWidget {
  const AppLicensePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MarkdownAssetPage(
      title: 'Lizenz',
      assetPath: 'legal/license.de.md',
      errorLabel: 'Lizenz konnte nicht geladen werden:',
    );
  }
}
