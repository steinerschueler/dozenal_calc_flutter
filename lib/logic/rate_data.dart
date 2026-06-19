// Baked exchange-rate / spot-price snapshot for the value calculator
// (Werterechner, Phase 2). Pure Dart, no Flutter imports.
//
// IMPORTANT — these are deliberately ROUGH reference values for a fixed date
// (`asOf`). The app ships fully offline and makes NO network calls; rates go
// stale by nature. Every value is user-overridable (see rate_store.dart) and
// every rate-based result is shown with a "≈" marker and the "Stand: <asOf>"
// label, so a stale snapshot can never read as exact/current. Update the
// numbers + `asOf` at release time, or let users set their own (the rate
// editor / an opt-in self-wired API — see docs/asset-rates-api.md).
//
// Keys match the AssetGenus.key values in asset_data.dart.

/// 1 troy ounce in kilograms (definitional; the metal ladder's base is kg).
const double kTroyOunceKg = 0.0311034768;

class RateSnapshot {
  /// Human label of the snapshot date, e.g. "2026-06".
  final String asOf;

  /// The pivot currency every rate routes through.
  final String pivot;

  /// Units of each currency per 1 [pivot] (e.g. pivot USD → eur 0.92 means
  /// 0.92 EUR = 1 USD). The pivot itself is 1.
  final Map<String, double> currencyPerPivot;

  /// Spot price of each metal per troy ounce, expressed in the [pivot]
  /// currency (e.g. gold 2350 = 2350 USD / troy oz).
  final Map<String, double> metalSpotPivot;

  const RateSnapshot({
    required this.asOf,
    required this.pivot,
    required this.currencyPerPivot,
    required this.metalSpotPivot,
  });
}

/// Rough, dated, fully overridable defaults. Pivot = USD.
const RateSnapshot kRateSnapshot = RateSnapshot(
  asOf: '2026-06',
  pivot: 'usd',
  currencyPerPivot: {
    'usd': 1.0,
    'eur': 0.92,
    'gbp': 0.79,
    'jpy': 158.0,
    'chf': 0.89,
    'cad': 1.37,
    'aud': 1.51,
  },
  metalSpotPivot: {
    'gold': 2350.0,
    'silver': 30.0,
    'platinum': 1000.0,
    'palladium': 950.0,
  },
);
