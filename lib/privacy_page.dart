// Renders legal/privacy-policy.de.md inside the app. Shared Markdown
// scaffolding lives in markdown_page.dart — when the privacy policy text
// changes, edit the .md file and rebuild, no Dart changes needed.

import 'package:flutter/material.dart';

import 'markdown_page.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MarkdownAssetPage(
      title: 'Datenschutzerklärung',
      assetPath: 'legal/privacy-policy.de.md',
      errorLabel: 'Datenschutzerklärung konnte nicht geladen werden:',
    );
  }
}
