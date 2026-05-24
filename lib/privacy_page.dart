// Renders legal/privacy-policy.de.md inside the app. Shared Markdown
// scaffolding lives in markdown_page.dart — when the privacy policy text
// changes, edit the .md file and rebuild, no Dart changes needed.

import 'package:flutter/material.dart';

import 'l10n/app_localizations.dart';
import 'markdown_page.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final tag = Localizations.localeOf(context).toLanguageTag();
    return MarkdownAssetPage(
      title: l.privacyTitle,
      assetPath: 'legal/privacy-policy.$tag.md',
      errorLabel: l.privacyError,
    );
  }
}
