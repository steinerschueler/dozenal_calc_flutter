// Pure data model + math for the historical price chart (Werterechner Phase 3).
// No Flutter imports. The compiled dataset lives in price_history_data.dart;
// this file holds the types, the LTTB downsampler, the log10/viewport
// transforms and the axis-tick generation. Design: docs/asset-converter.md.
//
// Honesty model: the curve is a curated, coarse, sourced reconstruction — NOT
// an authoritative series. Per-point [Era] drives confidence shading, antiquity
// lives as discrete [AnchorPoint]s that are never joined by a line, and gaps
// render as gaps (real (year, value) pairs, no interpolation).

import 'dart:math' as math;

/// The user-facing toggleable series.
enum PriceSeriesId { gold, silver, wheat }

/// A bundle-able source backing some data points (citation + license + url).
/// Points reference these by index (see [PricePoint.sourceId] / the sources
/// screen). Only freely-citable / public-domain / CC-BY sources are included.
class PriceSource {
  final String citation;
  final String license;
  final String url;
  const PriceSource(this.citation, this.license, this.url);
}

/// Confidence band of a data point — drives the line/area shading.
enum Era { reconstructed, sparse, modern }

/// One (year, value) sample. [year] is negative for BC. Antiquity / anchor
/// points additionally carry a [label] (tap-to-explain) and a [sourceId]; their
/// [era] is `reconstructed` or `sparse`, which the chart renders as discrete
/// dots (never joined by a line — see the honesty model).
class PricePoint {
  final int year;
  final double value;
  final Era era;
  final String? label;
  final int? sourceId;
  const PricePoint(this.year, this.value, this.era, {this.label, this.sourceId});

  bool get isAnchor => era != Era.modern;
}

/// One series: ordered points, its unit and the source ids backing it. Antiquity
/// reference points live inline as [PricePoint]s with a non-modern [Era].
class PriceSeries {
  final PriceSeriesId id;

  /// Unit label shown on the value axis (e.g. "USD/oz t", "Au/Ag", "g Ag/L").
  final String unit;

  /// Points ordered ascending by year (assert-checked in debug).
  final List<PricePoint> points;

  /// Indices into the dataset's source list.
  final List<int> sourceIds;

  const PriceSeries({
    required this.id,
    required this.unit,
    required this.points,
    this.sourceIds = const [],
  });

  int get minYear => points.isEmpty ? 0 : points.first.year;
  int get maxYear => points.isEmpty ? 0 : points.last.year;

  double get minValue =>
      points.fold(double.infinity, (m, p) => math.min(m, p.value));
  double get maxValue =>
      points.fold(double.negativeInfinity, (m, p) => math.max(m, p.value));
}

// ── log10 helpers ──────────────────────────────────────────────────────────

const double _tinyPositive = 1e-12;

/// log10 with a floor so non-positive values can't blow up (prices are > 0,
/// but the clamp keeps the transform total).
double log10(double v) => math.log(v < _tinyPositive ? _tinyPositive : v) /
    math.ln10;

double pow10(double e) => math.pow(10, e).toDouble();

// ── Viewport ────────────────────────────────────────────────────────────────

/// The visible window: a year range on X and a log10(value) range on Y. Value-
/// object — every pan/zoom produces a NEW instance (so the chart's
/// shouldRepaint can compare by identity/fields).
class ChartViewport {
  final double xMin; // year
  final double xMax;
  final double lyMin; // log10(value)
  final double lyMax;

  const ChartViewport(this.xMin, this.xMax, this.lyMin, this.lyMax);

  double get xSpan => xMax - xMin;
  double get lySpan => lyMax - lyMin;

  /// Year → normalized x in [0,1] across the viewport.
  double nx(num year) => (year - xMin) / xSpan;

  /// Value → normalized y in [0,1] across the viewport (log space).
  double ny(double value) => (log10(value) - lyMin) / lySpan;

  /// Pan by a fraction of the current spans (e.g. drag in normalized units).
  ChartViewport panned(double dxFrac, double dyFrac) => ChartViewport(
        xMin + dxFrac * xSpan,
        xMax + dxFrac * xSpan,
        lyMin + dyFrac * lySpan,
        lyMax + dyFrac * lySpan,
      );

  /// Zoom around a focus given in normalized [0,1]×[0,1] viewport coords.
  /// [scale] > 1 zooms in. Clamped to a sane min/max span.
  ChartViewport zoomed(double scale, double fx, double fy,
      {double minXSpan = 1, double maxXSpan = 6000}) {
    final s = 1 / scale;
    var nxSpan = (xSpan * s).clamp(minXSpan, maxXSpan);
    final nlySpan = (lySpan * s).clamp(0.3, 14.0);
    final focusYear = xMin + fx * xSpan;
    final focusLy = lyMin + fy * lySpan;
    return ChartViewport(
      focusYear - fx * nxSpan,
      focusYear + (1 - fx) * nxSpan,
      focusLy - fy * nlySpan,
      focusLy + (1 - fy) * nlySpan,
    );
  }

  @override
  bool operator ==(Object other) =>
      other is ChartViewport &&
      other.xMin == xMin &&
      other.xMax == xMax &&
      other.lyMin == lyMin &&
      other.lyMax == lyMax;

  @override
  int get hashCode => Object.hash(xMin, xMax, lyMin, lyMax);
}

/// A viewport that fits [series] with a small margin (log Y).
ChartViewport fitViewport(PriceSeries series) {
  if (series.points.isEmpty) return const ChartViewport(0, 1, 0, 1);
  final years = [for (final p in series.points) p.year];
  final vals = [for (final p in series.points) p.value];
  var xMin = years.reduce(math.min).toDouble();
  var xMax = years.reduce(math.max).toDouble();
  if (xMax - xMin < 1) xMax = xMin + 1;
  final xPad = (xMax - xMin) * 0.03;
  var lyMin = log10(vals.reduce(math.min));
  var lyMax = log10(vals.reduce(math.max));
  if (lyMax - lyMin < 0.3) lyMax = lyMin + 0.3;
  final yPad = (lyMax - lyMin) * 0.08;
  return ChartViewport(
      xMin - xPad, xMax + xPad, lyMin - yPad, lyMax + yPad);
}

// ── LTTB downsampling (Largest-Triangle-Three-Buckets) ───────────────────────
//
// Vendored (no pub dependency). For the coarse historical series this is a
// no-op (threshold ≥ n) but keeps the chart fast if a dense series is added.
// Area is computed in (year, log10 value) space to match the visual.

List<PricePoint> lttbDownsample(List<PricePoint> data, int threshold) {
  final n = data.length;
  if (threshold >= n || threshold < 3) return data;
  final sampled = <PricePoint>[data.first];
  final bucketSize = (n - 2) / (threshold - 2);
  var a = 0;
  for (var i = 0; i < threshold - 2; i++) {
    var avgStart = ((i + 1) * bucketSize).floor() + 1;
    var avgEnd = ((i + 2) * bucketSize).floor() + 1;
    if (avgEnd > n) avgEnd = n;
    final avgLen = avgEnd - avgStart;
    var avgX = 0.0, avgY = 0.0;
    for (var j = avgStart; j < avgEnd; j++) {
      avgX += data[j].year;
      avgY += log10(data[j].value);
    }
    avgX /= avgLen;
    avgY /= avgLen;
    final rangeFrom = (i * bucketSize).floor() + 1;
    final rangeTo = ((i + 1) * bucketSize).floor() + 1;
    final ax = data[a].year.toDouble();
    final ay = log10(data[a].value);
    var maxArea = -1.0;
    var nextA = rangeFrom;
    for (var j = rangeFrom; j < rangeTo; j++) {
      final area = ((ax - avgX) * (log10(data[j].value) - ay) -
                  (ax - data[j].year) * (avgY - ay))
              .abs() *
          0.5;
      if (area > maxArea) {
        maxArea = area;
        nextA = j;
      }
    }
    sampled.add(data[nextA]);
    a = nextA;
  }
  sampled.add(data.last);
  return sampled;
}

// ── Axis ticks ───────────────────────────────────────────────────────────────

double _niceNum(double range, {required bool round}) {
  if (range <= 0) return 1;
  final exp = (math.log(range) / math.ln10).floor();
  final frac = range / pow10(exp.toDouble());
  double nf;
  if (round) {
    nf = frac < 1.5 ? 1 : (frac < 3 ? 2 : (frac < 7 ? 5 : 10));
  } else {
    nf = frac <= 1 ? 1 : (frac <= 2 ? 2 : (frac <= 5 ? 5 : 10));
  }
  return nf * pow10(exp.toDouble());
}

/// "Nice" linear tick values across [lo, hi] (Heckbert) — used for the X
/// (year) axis. The chart labels them via formatBaseNum (base-aware).
List<double> niceTicks(double lo, double hi, {int maxTicks = 6}) {
  if (hi <= lo || maxTicks < 2) return [lo];
  final range = _niceNum(hi - lo, round: false);
  final step = _niceNum(range / (maxTicks - 1), round: true);
  final niceLo = (lo / step).floor() * step;
  final niceHi = (hi / step).ceil() * step;
  final ticks = <double>[];
  for (var v = niceLo; v <= niceHi + step * 0.5; v += step) {
    if (v >= lo - step * 0.5 && v <= hi + step * 0.5) ticks.add(v);
  }
  return ticks;
}

/// Decade tick VALUES (…, 1, 10, 100, …) whose log10 falls within [lyMin,
/// lyMax] — the Y (log value) axis. Returns the raw values; the chart places
/// them at log positions and labels via formatBaseNum.
List<double> logDecadeTicks(double lyMin, double lyMax) {
  final lo = lyMin.floor();
  final hi = lyMax.ceil();
  final ticks = <double>[];
  for (var k = lo; k <= hi; k++) {
    final ly = k.toDouble();
    if (ly >= lyMin - 1e-9 && ly <= lyMax + 1e-9) ticks.add(pow10(ly));
  }
  return ticks;
}
