// Pure math of the price-history engine: log10/viewport transforms, LTTB
// downsampling and axis-tick generation. (The compiled dataset is checked
// separately once it lands.)

import 'package:dozenal_calc_flutter/logic/price_history.dart';
import 'package:dozenal_calc_flutter/logic/price_history_data.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('log10 transform', () {
    test('roundtrips and clamps non-positive', () {
      expect(log10(100), closeTo(2, 1e-9));
      expect(pow10(log10(2350)), closeTo(2350, 1e-6));
      expect(log10(0).isFinite, isTrue); // clamped, not -inf
      expect(log10(-5).isFinite, isTrue);
    });
  });

  group('ChartViewport', () {
    const vp = ChartViewport(1000, 2000, 0, 3); // years 1000..2000, value 1..1000

    test('normalizes year and value (log) into [0,1]', () {
      expect(vp.nx(1000), closeTo(0, 1e-9));
      expect(vp.nx(2000), closeTo(1, 1e-9));
      expect(vp.nx(1500), closeTo(0.5, 1e-9));
      expect(vp.ny(1), closeTo(0, 1e-9)); // log10(1)=0
      expect(vp.ny(1000), closeTo(1, 1e-9)); // log10(1000)=3 → top
    });

    test('pan shifts both ranges by a fraction of the span', () {
      final p = vp.panned(0.1, 0.0);
      expect(p.xMin, closeTo(1100, 1e-9));
      expect(p.xMax, closeTo(2100, 1e-9));
    });

    test('zoom in around a focus shrinks the span and keeps the focus fixed', () {
      final z = vp.zoomed(2, 0.5, 0.5); // 2× around the centre
      expect(z.xSpan, closeTo(500, 1e-6));
      final focusYear = 1000 + 0.5 * 1000;
      expect(z.xMin + 0.5 * z.xSpan, closeTo(focusYear, 1e-6));
    });

    test('value equality (for shouldRepaint)', () {
      expect(const ChartViewport(0, 1, 0, 1) == const ChartViewport(0, 1, 0, 1),
          isTrue);
      expect(vp == const ChartViewport(0, 1, 0, 1), isFalse);
    });
  });

  group('index viewport (baseline = oldest)', () {
    const s = PriceSeries(
      id: PriceSeriesId.gold,
      unit: 'x',
      points: [
        PricePoint(-400, 5, Era.reconstructed,
            valueLow: 3, valueHigh: 8, label: 'Babylon', sourceId: 0),
        PricePoint(1900, 20, Era.modern),
        PricePoint(2000, 280, Era.modern),
        PricePoint(2024, 2350, Era.modern),
      ],
    );

    test('baselineOf = oldest point value', () {
      expect(baselineOf(s), 5);
    });

    test('fit encloses all points in index space (oldest → 0 line)', () {
      final base = baselineOf(s);
      final vp = fitViewport(s);
      expect(vp.xMin, lessThan(-400));
      expect(vp.xMax, greaterThan(2024));
      // index values (value/baseline) land inside [0,1]; the baseline (index 1)
      // is included.
      expect(vp.ny(5 / base), inInclusiveRange(0.0, 1.0)); // = ny(1)
      expect(vp.ny(2350 / base), inInclusiveRange(0.0, 1.0));
      expect(vp.lyMin, lessThanOrEqualTo(0)); // 0 (= log10 index 1) in range
      expect(vp.lyMax, greaterThanOrEqualTo(0));
    });

    test('defaultViewport shows the last ~century and keeps the 0 line', () {
      final vp = defaultViewport(s, nowYear: 2025, span: 100);
      expect(vp.xMin, closeTo(1925, 1));
      expect(vp.xMax, closeTo(2025, 1));
      expect(vp.lyMin, lessThanOrEqualTo(0));
      expect(vp.lyMax, greaterThanOrEqualTo(0));
    });
  });

  group('LTTB downsampling', () {
    List<PricePoint> ramp(int n) =>
        [for (var i = 0; i < n; i++) PricePoint(i, (i % 7) + 1.0, Era.modern)];

    test('is a no-op when threshold ≥ n', () {
      final d = ramp(20);
      expect(lttbDownsample(d, 50).length, 20);
    });

    test('reduces to the threshold and keeps the endpoints', () {
      final d = ramp(1000);
      final out = lttbDownsample(d, 50);
      expect(out.length, 50);
      expect(out.first.year, 0);
      expect(out.last.year, 999);
    });
  });

  group('axis ticks', () {
    test('niceTicks lands on round years within range', () {
      final t = niceTicks(1000, 2000, maxTicks: 6);
      expect(t, isNotEmpty);
      expect(t.first, greaterThanOrEqualTo(900));
      expect(t.last, lessThanOrEqualTo(2100));
      // steps are equal and "nice"
      final step = t[1] - t[0];
      expect(step, anyOf(100, 200, 250, 500));
    });

    test('logDecadeTicks returns powers of ten in the window', () {
      final t = logDecadeTicks(0, 3); // 1..1000
      expect(t, [1, 10, 100, 1000]);
    });
  });

  group('compiled dataset integrity', () {
    test('has all three series with non-empty points', () {
      for (final id in PriceSeriesId.values) {
        expect(kPriceSeries[id], isNotNull);
        expect(kPriceSeries[id]!.points, isNotEmpty);
      }
    });

    test('points are ascending by year and strictly positive', () {
      for (final s in kPriceSeries.values) {
        for (var i = 1; i < s.points.length; i++) {
          expect(s.points[i].year, greaterThan(s.points[i - 1].year),
              reason: '${s.id} not sorted at index $i');
        }
        for (final p in s.points) {
          expect(p.value, greaterThan(0),
              reason: '${s.id} non-positive value at ${p.year}');
        }
      }
    });

    test('every referenced sourceId is a valid index', () {
      for (final s in kPriceSeries.values) {
        for (final id in s.sourceIds) {
          expect(id, inInclusiveRange(0, kPriceSources.length - 1));
        }
        for (final p in s.points) {
          if (p.sourceId != null) {
            expect(p.sourceId!, inInclusiveRange(0, kPriceSources.length - 1),
                reason: '${s.id} bad sourceId at ${p.year}');
          }
        }
      }
    });

    test('bands are consistent (low ≤ value ≤ high)', () {
      for (final s in kPriceSeries.values) {
        for (final p in s.points) {
          if (p.hasBand) {
            expect(p.valueLow!, lessThanOrEqualTo(p.value));
            expect(p.valueHigh!, greaterThanOrEqualTo(p.value));
          }
        }
      }
    });

    test('silver reaches deep antiquity; every series reaches today; fits', () {
      expect(kPriceSeries[PriceSeriesId.silver]!.minYear, lessThan(-1000));
      for (final s in kPriceSeries.values) {
        expect(s.maxYear, greaterThanOrEqualTo(2024));
        for (final vp in [fitViewport(s), defaultViewport(s)]) {
          expect(vp.xSpan, greaterThan(0));
          expect(vp.lySpan, greaterThan(0));
        }
      }
    });

    test('gold series is the reciprocal of grain-in-gold (wheat)', () {
      final gold = kPriceSeries[PriceSeriesId.gold]!;
      final wheat = kPriceSeries[PriceSeriesId.wheat]!;
      expect(gold.points.length, wheat.points.length);
      for (var i = 0; i < gold.points.length; i++) {
        expect(gold.points[i].value, closeTo(1 / wheat.points[i].value, 1e-9));
      }
    });
  });
}
