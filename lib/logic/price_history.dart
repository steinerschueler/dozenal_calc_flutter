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

  /// Optional uncertainty band (low ≤ value ≤ high). Set mainly on antiquity /
  /// sparse points; the chart draws a shaded estimated range around them.
  final double? valueLow;
  final double? valueHigh;

  final String? label;
  final int? sourceId;
  const PricePoint(this.year, this.value, this.era,
      {this.valueLow, this.valueHigh, this.label, this.sourceId});

  bool get isAnchor => era != Era.modern;
  bool get hasBand => valueLow != null && valueHigh != null;
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

/// The index baseline of a series: its OLDEST point's value. Every value is
/// shown relative to this (oldest → index 1 → the "0" reference line).
double baselineOf(PriceSeries series) =>
    series.points.isEmpty ? 1.0 : series.points.first.value;

/// All index values (value/baseline plus band bounds) used for the Y extent.
List<double> _indexExtent(PriceSeries s, double base, bool Function(int) keep) {
  final out = <double>[1.0]; // the baseline (0 line) is always in range
  for (final p in s.points) {
    if (!keep(p.year)) continue;
    out.add(p.value / base);
    if (p.valueLow != null) out.add(p.valueLow! / base);
    if (p.valueHigh != null) out.add(p.valueHigh! / base);
  }
  return out;
}

ChartViewport _yFitted(double xMin, double xMax, List<double> index) {
  // Centre the value axis on the baseline (index 1 → log10 = 0): the bold "0"
  // reference line (= oldest value) sits in the middle of the picture, and the
  // curve fans up/down from it. The half-span covers the largest deviation.
  var maxDev = 0.25;
  for (final v in index) {
    final d = log10(v).abs();
    if (d > maxDev) maxDev = d;
  }
  final span = maxDev * 1.15;
  return ChartViewport(xMin, xMax, -span, span);
}

/// Fully zoomed-out view: the whole series in index space (oldest point left,
/// near the 0 line). Reached via double-tap.
ChartViewport fitViewport(PriceSeries series) {
  if (series.points.isEmpty) return const ChartViewport(0, 1, -1, 1);
  final base = baselineOf(series);
  final years = [for (final p in series.points) p.year];
  var xMin = years.reduce(math.min).toDouble();
  var xMax = years.reduce(math.max).toDouble();
  if (xMax - xMin < 1) xMax = xMin + 1;
  final xPad = (xMax - xMin) * 0.03;
  return _yFitted(xMin - xPad, xMax + xPad, _indexExtent(series, base, (_) => true));
}

/// Default initial view: the last [span] years (≈ a century) on X, Y fitted to
/// that window in index space, with the baseline (0 line) always visible.
ChartViewport defaultViewport(PriceSeries series,
    {int nowYear = 2025, int span = 100}) {
  if (series.points.isEmpty) return const ChartViewport(0, 1, -1, 1);
  final base = baselineOf(series);
  final xMax = nowYear.toDouble();
  final xMin = (nowYear - span).toDouble();
  return _yFitted(
      xMin, xMax, _indexExtent(series, base, (y) => y >= xMin && y <= xMax + 1));
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

/// Minor log tick VALUES within [lyMin, lyMax]: the 2…9 subdivisions of each
/// decade (…, 0.2, 0.5, 2, 5, 20, …). A log axis only labels the decades, so
/// the chart draws faint gridlines at these (a few labeled, e.g. ×2/×5) to make
/// values between the decade lines readable. The 1-mantissa (the decade itself)
/// is excluded — that's [logDecadeTicks].
List<double> logMinorTicks(double lyMin, double lyMax) {
  final lo = lyMin.floor();
  final hi = lyMax.ceil();
  final ticks = <double>[];
  for (var k = lo; k <= hi; k++) {
    final base = pow10(k.toDouble());
    for (var m = 2; m <= 9; m++) {
      final v = base * m;
      final ly = log10(v);
      if (ly >= lyMin - 1e-9 && ly <= lyMax + 1e-9) ticks.add(v);
    }
  }
  return ticks;
}
