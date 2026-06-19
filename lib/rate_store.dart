// Holds the live rate table for the value calculator: the baked snapshot
// (rate_data.dart) overlaid with user overrides, persisted via
// SharedPreferences. A ChangeNotifier like CalcPrefsNotifier — the value
// calculator listens so an edited rate updates the result immediately.
//
// All rates route through the snapshot's pivot currency. Every rate-based
// value is "≈" (rates are approximate + dated), never exact.

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'logic/rate_data.dart';

class RateStore extends ChangeNotifier {
  static const _curPrefix = 'rate_ovr_cur_';
  static const _metPrefix = 'rate_ovr_met_';

  final Map<String, double> _curOverride = {};
  final Map<String, double> _metOverride = {};
  SharedPreferences? _prefs;

  String get asOf => kRateSnapshot.asOf;
  String get pivot => kRateSnapshot.pivot;

  Iterable<String> get currencyKeys => kRateSnapshot.currencyPerPivot.keys;
  Iterable<String> get metalKeys => kRateSnapshot.metalSpotPivot.keys;

  /// Units of [key] currency per 1 pivot (override else snapshot).
  double currencyRate(String key) =>
      _curOverride[key] ?? kRateSnapshot.currencyPerPivot[key] ?? double.nan;

  /// Spot of [key] metal per troy ounce in the pivot currency.
  double metalSpot(String key) =>
      _metOverride[key] ?? kRateSnapshot.metalSpotPivot[key] ?? double.nan;

  double snapshotCurrencyRate(String key) =>
      kRateSnapshot.currencyPerPivot[key] ?? double.nan;
  double snapshotMetalSpot(String key) =>
      kRateSnapshot.metalSpotPivot[key] ?? double.nan;

  bool hasCurrencyOverride(String key) => _curOverride.containsKey(key);
  bool hasMetalOverride(String key) => _metOverride.containsKey(key);
  bool get hasAnyOverride =>
      _curOverride.isNotEmpty || _metOverride.isNotEmpty;

  // ── Conversion primitives (all route through the pivot) ────────────────

  /// Pivot-currency amount of [amount] units of currency [key].
  double pivotOfCurrency(double amount, String key) =>
      amount / currencyRate(key);

  /// Pivot-currency value of [kg] kilograms of metal [key] (weight → troy oz
  /// → spot).
  double pivotOfMetalKg(double kg, String key) =>
      (kg / kTroyOunceKg) * metalSpot(key);

  /// Express a pivot-currency [pivotAmount] in the target currency [key].
  double currencyFromPivot(double pivotAmount, String key) =>
      pivotAmount * currencyRate(key);

  // ── Overrides ──────────────────────────────────────────────────────────

  void setCurrencyOverride(String key, double value) {
    if (!value.isFinite || value <= 0) return;
    _curOverride[key] = value;
    _prefs?.setDouble('$_curPrefix$key', value);
    notifyListeners();
  }

  void setMetalOverride(String key, double value) {
    if (!value.isFinite || value <= 0) return;
    _metOverride[key] = value;
    _prefs?.setDouble('$_metPrefix$key', value);
    notifyListeners();
  }

  void clearCurrencyOverride(String key) {
    if (_curOverride.remove(key) != null) {
      _prefs?.remove('$_curPrefix$key');
      notifyListeners();
    }
  }

  void clearMetalOverride(String key) {
    if (_metOverride.remove(key) != null) {
      _prefs?.remove('$_metPrefix$key');
      notifyListeners();
    }
  }

  void clearAll() {
    if (!hasAnyOverride) return;
    for (final k in _curOverride.keys) {
      _prefs?.remove('$_curPrefix$k');
    }
    for (final k in _metOverride.keys) {
      _prefs?.remove('$_metPrefix$k');
    }
    _curOverride.clear();
    _metOverride.clear();
    notifyListeners();
  }

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    _prefs = prefs;
    for (final key in currencyKeys) {
      final v = prefs.getDouble('$_curPrefix$key');
      if (v != null && v.isFinite && v > 0) _curOverride[key] = v;
    }
    for (final key in metalKeys) {
      final v = prefs.getDouble('$_metPrefix$key');
      if (v != null && v.isFinite && v > 0) _metOverride[key] = v;
    }
    notifyListeners();
  }
}
