// Renders legal/license.de.md inside the app. The actual Markdown + Scaffold
// scaffolding lives in markdown_page.dart so the privacy page can share it
// — this file only configures asset path + labels. Also exports
// openExternalLink, which both legal pages and the feedback dialog reuse.

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'l10n/app_localizations.dart';
import 'markdown_page.dart';

/// Opens [href] in the user's default browser. On failure, shows a
/// SnackBar so the tap doesn't silently do nothing. Shared by the legal
/// pages and the feedback dialog via top-level export.
Future<void> openExternalLink(BuildContext context, String href) async {
  final uri = Uri.tryParse(href);
  if (uri == null) return;
  // Capture localizations before the async gap so we can still build the
  // failure message after `launchUrl` returns.
  final l = AppLocalizations.of(context);
  final ok =
      await launchUrl(uri, mode: LaunchMode.externalApplication);
  if (!ok && context.mounted) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(l.externalLinkError(href))),
    );
  }
}

class AppLicensePage extends StatelessWidget {
  const AppLicensePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final code = Localizations.localeOf(context).languageCode;
    return MarkdownAssetPage(
      title: l.licenseTitle,
      assetPath: 'legal/license.$code.md',
      errorLabel: l.licenseError,
    );
  }
}
