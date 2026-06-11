// Donation / "support development" page. Reached from the Info list.
// Two external-link cards: Ko-fi (preferred, lower platform overhead)
// and GitHub Sponsors (secondary). Intro paragraph frames donations
// concretely against the Apple Developer Program fee, which gives
// supporters a tangible "what your tip enables" — namely the iOS
// publication path that currently isn't accessible from a Linux-only
// build environment.

import 'package:flutter/material.dart';

import 'app_theme.dart';
import 'l10n/app_localizations.dart';
import 'license_page.dart' show openExternalLink;

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  static const _kofiUrl = 'https://ko-fi.com/steinerschueler';

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final t = AppColors.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(l.supportTitle, style: const TextStyle(fontSize: 14)),
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l.supportIntro,
                style: TextStyle(
                  fontSize: 14,
                  height: 1.5,
                  color: t.textSecondary,
                ),
              ),
              const SizedBox(height: 24),
              _DonationCard(
                title: 'Ko-fi',
                subtitle: l.supportKofiNote,
                url: _kofiUrl,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DonationCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String url;

  const _DonationCard({
    required this.title,
    required this.subtitle,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    final t = AppColors.of(context);
    return Material(
      color: t.cardFill,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () => openExternalLink(context, url),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: t.textPrimary,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.open_in_new,
                    size: 16,
                    color: t.textMuted,
                  ),
                ],
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 8),
                Text(
                  subtitle!,
                  style: TextStyle(
                    fontSize: 12.5,
                    height: 1.45,
                    color: t.textTertiary,
                  ),
                ),
              ],
              const SizedBox(height: 6),
              Text(
                url,
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'monospace',
                  color: t.link,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
