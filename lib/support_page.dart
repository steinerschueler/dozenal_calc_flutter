// Donation / "support development" page. Reached from the Info list.
// Two external-link cards: Ko-fi (preferred, lower platform overhead)
// and GitHub Sponsors (secondary). Intro paragraph frames donations
// concretely against the Apple Developer Program fee, which gives
// supporters a tangible "what your tip enables" — namely the iOS
// publication path that currently isn't accessible from a Linux-only
// build environment.

import 'package:flutter/material.dart';

import 'l10n/app_localizations.dart';
import 'license_page.dart' show openExternalLink;

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  static const _kofiUrl = 'https://ko-fi.com/steinerschueler';

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(l.supportTitle, style: const TextStyle(fontSize: 14)),
        backgroundColor: const Color(0xFF1A1A1A),
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
                style: const TextStyle(
                  fontSize: 14,
                  height: 1.5,
                  color: Color(0xFFE0E0E0),
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
    return Material(
      color: const Color(0xFF2A2A2A),
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
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.open_in_new,
                    size: 16,
                    color: Color(0xFFA0A0A0),
                  ),
                ],
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 8),
                Text(
                  subtitle!,
                  style: const TextStyle(
                    fontSize: 12.5,
                    height: 1.45,
                    color: Color(0xFFB0B0B0),
                  ),
                ),
              ],
              const SizedBox(height: 6),
              Text(
                url,
                style: const TextStyle(
                  fontSize: 12,
                  fontFamily: 'monospace',
                  color: Color(0xFF64C8FF),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
