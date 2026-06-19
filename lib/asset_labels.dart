// Localized labels for the asset converter's classes and genera. Currency
// genera show their international ISO code (USD/EUR/…) — only metal names and
// the class labels are translated. Kept separate (like unit_labels.dart) so the
// keypad and any theory page can share them without a circular import.

import 'l10n/app_localizations.dart';
import 'logic/asset_data.dart';

/// Localized class label (Edelmetall / Währung).
String assetClassLabel(AssetClass c, AppLocalizations l) => switch (c) {
      AssetClass.metal => l.assetClassMetal,
      AssetClass.currency => l.assetClassCurrency,
    };

/// Genus tile label: a translated metal name, or a currency's ISO code
/// (uppercased key) which stays international like the unit symbols.
String assetGenusLabel(AssetGenus g, AppLocalizations l) {
  switch (g.key) {
    case 'gold':
      return l.assetGenusGold;
    case 'silver':
      return l.assetGenusSilver;
    case 'platinum':
      return l.assetGenusPlatinum;
    case 'palladium':
      return l.assetGenusPalladium;
    default:
      return g.key.toUpperCase();
  }
}
