// Sources + method screen for the historical price chart (Werterechner
// Phase 3). Lists the bundled dataset's freely-citable sources (citation,
// license, tappable URL) under an honesty/method note. Pushed from the chart's
// "Quellen" link. Mirrors the source-list pattern in conversions_page.dart.

import 'package:flutter/material.dart';

import 'app_theme.dart';
import 'l10n/app_localizations.dart';
import 'license_page.dart' show openExternalLink;
import 'logic/price_history.dart';
import 'logic/price_history_data.dart';

class PriceSourcesPage extends StatelessWidget {
  const PriceSourcesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final t = AppColors.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(l.priceSourcesTitle)),
      body: SafeArea(
        top: false,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 14, 16, 28),
          children: [
            Text(
              l.priceSourcesIntro,
              style: TextStyle(color: t.textSecondary, fontSize: 13, height: 1.4),
            ),
            const SizedBox(height: 16),
            for (var i = 0; i < kPriceSources.length; i++)
              _sourceTile(context, i + 1, kPriceSources[i], t),
          ],
        ),
      ),
    );
  }

  Widget _sourceTile(BuildContext context, int n, PriceSource s, AppColors t) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$n. ${s.citation}',
            style: TextStyle(color: t.textPrimary, fontSize: 13, height: 1.35),
          ),
          const SizedBox(height: 2),
          Text(s.license,
              style: TextStyle(color: t.textMuted, fontSize: 11)),
          if (s.url.isNotEmpty)
            GestureDetector(
              onTap: () => openExternalLink(context, s.url),
              child: Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Text(
                  s.url,
                  style: TextStyle(
                      color: t.link,
                      fontSize: 11,
                      decoration: TextDecoration.underline),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
