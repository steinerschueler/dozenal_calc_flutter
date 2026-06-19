// RateStore: snapshot defaults, the pivot-routed conversion math, and
// SharedPreferences-persisted overrides.

import 'package:dozenal_calc_flutter/logic/rate_data.dart';
import 'package:dozenal_calc_flutter/rate_store.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() => SharedPreferences.setMockInitialValues({}));

  test('defaults come from the baked snapshot', () {
    final s = RateStore();
    expect(s.asOf, kRateSnapshot.asOf);
    expect(s.currencyRate('usd'), 1.0);
    expect(s.currencyRate('eur'), 0.92);
    expect(s.metalSpot('gold'), 2350.0);
  });

  test('currency cross-conversion routes through the pivot', () {
    final s = RateStore();
    // 100 USD → EUR
    final pivot = s.pivotOfCurrency(100, 'usd'); // 100 USD in pivot (USD) = 100
    expect(pivot, closeTo(100, 1e-9));
    expect(s.currencyFromPivot(pivot, 'eur'), closeTo(92, 1e-9));
    // 100 EUR → GBP : 100/0.92 USD * 0.79
    final p2 = s.pivotOfCurrency(100, 'eur');
    expect(s.currencyFromPivot(p2, 'gbp'), closeTo(100 / 0.92 * 0.79, 1e-9));
  });

  test('metal value: 1 troy oz gold → USD → EUR', () {
    final s = RateStore();
    final kg = kTroyOunceKg; // 1 troy oz in kg
    final pivot = s.pivotOfMetalKg(kg, 'gold');
    expect(pivot, closeTo(2350, 1e-6)); // 1 oz × 2350 USD/oz
    expect(s.currencyFromPivot(pivot, 'eur'), closeTo(2350 * 0.92, 1e-6));
  });

  test('overrides win over the snapshot and notify', () {
    final s = RateStore();
    var notified = 0;
    s.addListener(() => notified++);
    s.setMetalOverride('gold', 3000);
    expect(s.metalSpot('gold'), 3000);
    expect(s.hasMetalOverride('gold'), isTrue);
    expect(s.snapshotMetalSpot('gold'), 2350); // snapshot still readable
    expect(notified, 1);
    s.clearMetalOverride('gold');
    expect(s.metalSpot('gold'), 2350);
    expect(notified, 2);
  });

  test('invalid overrides are rejected', () {
    final s = RateStore();
    s.setCurrencyOverride('eur', -1);
    s.setCurrencyOverride('eur', double.nan);
    expect(s.hasCurrencyOverride('eur'), isFalse);
  });

  test('overrides persist across a reload', () async {
    final s1 = RateStore();
    await s1.load();
    s1.setMetalOverride('gold', 2800);
    s1.setCurrencyOverride('eur', 0.90);

    final s2 = RateStore();
    await s2.load();
    expect(s2.metalSpot('gold'), 2800);
    expect(s2.currencyRate('eur'), 0.90);

    s2.clearAll();
    final s3 = RateStore();
    await s3.load();
    expect(s3.hasAnyOverride, isFalse);
    expect(s3.metalSpot('gold'), 2350);
  });
}
