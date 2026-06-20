// The historical price chart (Werterechner Phase 3): a custom-painted,
// pan/zoom-able log-scale curve that replaces the keypad when toggled. No
// 3rd-party chart package — GestureDetector (scale recognizer) + CustomPainter,
// the app's convention. Design + honesty model: docs/asset-converter.md.
//
// Honesty enforced visually: antiquity/sparse points are discrete dots, never
// joined by a line; lines connect only adjacent MODERN points; gaps stay gaps;
// reconstructed points are visually distinct ("nur Ankerpunkte"). Axis labels
// honour the active numeral base (formatBaseNum), so the dozenal calculator's
// curve reads in base 12 or 10.

import 'package:flutter/material.dart';

import 'app_theme.dart';
import 'logic/base_num.dart';
import 'logic/price_history.dart';
import 'logic/price_history_data.dart';

const EdgeInsets _kPlotMargin = EdgeInsets.fromLTRB(46, 10, 12, 22);

class PriceChart extends StatefulWidget {
  const PriceChart({
    super.key,
    required this.base,
    required this.seriesLabel,
    required this.unitLabel,
    required this.sourcesLabel,
    required this.caption,
    required this.eraReconstructedLabel,
    this.onSourcesTap,
    this.onClose,
  });

  /// Active numeral base (12 / 10) for axis labels.
  final int base;

  /// Localized toggle label for a series (short, e.g. "Silber").
  final String Function(PriceSeriesId) seriesLabel;

  /// Localized relationship caption shown on the value axis (e.g.
  /// "Silber in Gold").
  final String Function(PriceSeriesId) unitLabel;

  /// Localized "Quellen" link label + the honesty caption shown under the chart.
  final String sourcesLabel;
  final String caption;

  /// Label for a reconstructed (antiquity) point's tap callout.
  final String eraReconstructedLabel;

  final VoidCallback? onSourcesTap;

  /// Closes the chart (the "Kurve" toggle off) — restores the keypad.
  final VoidCallback? onClose;

  @override
  State<PriceChart> createState() => _PriceChartState();
}

class _PriceChartState extends State<PriceChart> {
  PriceSeriesId _id = PriceSeriesId.gold;
  late ChartViewport _viewport = defaultViewport(kPriceSeries[_id]!);

  // Gesture snapshot.
  ChartViewport _startVp = const ChartViewport(0, 1, 0, 1);
  Offset _startFocal = Offset.zero;
  bool _moved = false;
  Rect _plotRect = Rect.zero;
  DateTime? _lastTapAt; // manual double-tap detection (scale recognizer eats it)

  // Tap-to-read selection.
  PricePoint? _selected;
  Offset _selectedAt = Offset.zero;

  PriceSeries get _series => kPriceSeries[_id]!;
  double get _baseline => baselineOf(_series);

  void _selectSeries(PriceSeriesId id) {
    setState(() {
      _id = id;
      _viewport = defaultViewport(kPriceSeries[id]!); // last ~100 years
      _selected = null;
    });
  }

  // Double-tap zooms fully out (oldest value at left, near the 0 baseline).
  void _resetView() => setState(() {
        _viewport = fitViewport(_series);
        _selected = null;
      });

  Rect _computePlotRect(Size size) => Rect.fromLTRB(
        _kPlotMargin.left,
        _kPlotMargin.top,
        size.width - _kPlotMargin.right,
        size.height - _kPlotMargin.bottom,
      );

  void _onScaleStart(ScaleStartDetails d) {
    _startVp = _viewport;
    _startFocal = d.localFocalPoint;
    _moved = false;
  }

  void _onScaleUpdate(ScaleUpdateDetails d) {
    final rect = _plotRect;
    if (rect.width <= 0 || rect.height <= 0) return;
    if ((d.localFocalPoint - _startFocal).distance > 6) _moved = true;
    // Zoom around the (snapshot) focal point, then pan by its pixel movement.
    final fx = ((_startFocal.dx - rect.left) / rect.width).clamp(0.0, 1.0);
    final fyTop = ((_startFocal.dy - rect.top) / rect.height).clamp(0.0, 1.0);
    final fy = 1 - fyTop; // value axis points up
    var vp = _startVp;
    if (d.scale != 1.0) vp = vp.zoomed(d.scale, fx, fy);
    final dxFrac = -(d.localFocalPoint.dx - _startFocal.dx) / rect.width;
    final dyFrac = (d.localFocalPoint.dy - _startFocal.dy) / rect.height;
    vp = vp.panned(dxFrac, dyFrac);
    setState(() => _viewport = vp);
  }

  void _onScaleEnd(ScaleEndDetails d) {
    if (_moved) {
      _lastTapAt = null;
      return;
    }
    // No movement → a tap. Two quick taps = double-tap → zoom fully out (the
    // scale recognizer otherwise swallows GestureDetector.onDoubleTap).
    final now = DateTime.now();
    if (_lastTapAt != null &&
        now.difference(_lastTapAt!).inMilliseconds < 500) {
      _lastTapAt = null;
      _resetView();
    } else {
      _lastTapAt = now;
      _hitTest(_startFocal);
    }
  }

  void _hitTest(Offset local) {
    final rect = _plotRect;
    PricePoint? best;
    Offset bestAt = Offset.zero;
    var bestDist = 28.0; // hit radius
    final base = _baseline;
    for (final p in _series.points) {
      final sx = rect.left + _viewport.nx(p.year) * rect.width;
      final sy = rect.bottom - _viewport.ny(p.value / base) * rect.height;
      final at = Offset(sx, sy);
      final dist = (at - local).distance;
      if (dist < bestDist) {
        bestDist = dist;
        best = p;
        bestAt = at;
      }
    }
    setState(() {
      _selected = best;
      _selectedAt = bestAt;
    });
  }

  @override
  Widget build(BuildContext context) {
    final t = AppColors.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _topBar(t),
        Expanded(
          child: LayoutBuilder(
            builder: (ctx, c) {
              final size = Size(c.maxWidth, c.maxHeight);
              _plotRect = _computePlotRect(size);
              return GestureDetector(
                behavior: HitTestBehavior.opaque,
                onScaleStart: _onScaleStart,
                onScaleUpdate: _onScaleUpdate,
                onScaleEnd: _onScaleEnd,
                child: CustomPaint(
                  size: size,
                  painter: _PriceChartPainter(
                    series: _series,
                    viewport: _viewport,
                    base: widget.base,
                    baseline: _baseline,
                    unitLabel: widget.unitLabel(_id),
                    colors: t,
                    plotMargin: _kPlotMargin,
                    selected: _selected,
                    selectedAt: _selectedAt,
                    reconstructedLabel: widget.eraReconstructedLabel,
                  ),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 2, 10, 4),
          child: Text(
            widget.caption,
            textAlign: TextAlign.center,
            maxLines: 2,
            style: TextStyle(fontSize: 10, color: t.textFaint, height: 1.25),
          ),
        ),
      ],
    );
  }

  Widget _topBar(AppColors t) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 4, 4, 6),
      child: Row(
        children: [
          // Tabs scroll horizontally so the bar never overflows on narrow
          // phones; the sources link + close stay pinned right.
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (final id in PriceSeriesId.values) ...[
                    _seriesTab(id, t),
                    const SizedBox(width: 6),
                  ],
                ],
              ),
            ),
          ),
          // Zoom fully out (oldest value left, at the 0 line). Pinch + double-
          // tap do the same; this makes it discoverable.
          IconButton(
            onPressed: _resetView,
            visualDensity: VisualDensity.compact,
            tooltip: 'Fit',
            icon: Icon(Icons.zoom_out_map, color: t.textSecondary, size: 18),
          ),
          TextButton(
            onPressed: widget.onSourcesTap,
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              minimumSize: const Size(0, 36),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Text(widget.sourcesLabel,
                style: TextStyle(color: t.link, fontSize: 12)),
          ),
          if (widget.onClose != null)
            IconButton(
              onPressed: widget.onClose,
              visualDensity: VisualDensity.compact,
              icon: Icon(Icons.close, color: t.textSecondary, size: 20),
            ),
        ],
      ),
    );
  }

  Widget _seriesTab(PriceSeriesId id, AppColors t) {
    final active = id == _id;
    return GestureDetector(
      onTap: () => _selectSeries(id),
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
              color: active ? t.accentGold : t.keyBorder,
              width: active ? 2 : 1),
        ),
        child: Text(
          widget.seriesLabel(id),
          style: TextStyle(
            color: active ? t.accentGold : t.textSecondary,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class _PriceChartPainter extends CustomPainter {
  final PriceSeries series;
  final ChartViewport viewport;
  final int base;

  /// The series' index baseline (oldest value); every value is plotted as
  /// value/baseline (so the oldest sits on the 0 reference line).
  final double baseline;

  /// Localized relationship caption (e.g. "Silber in Gold").
  final String unitLabel;

  final AppColors colors;
  final EdgeInsets plotMargin;
  final PricePoint? selected;
  final Offset selectedAt;
  final String reconstructedLabel;

  _PriceChartPainter({
    required this.series,
    required this.viewport,
    required this.base,
    required this.baseline,
    required this.unitLabel,
    required this.colors,
    required this.plotMargin,
    required this.selected,
    required this.selectedAt,
    required this.reconstructedLabel,
  });

  Rect _rect(Size size) => Rect.fromLTRB(plotMargin.left, plotMargin.top,
      size.width - plotMargin.right, size.height - plotMargin.bottom);

  /// Screen position of a raw (year, value) — value is indexed to [baseline].
  Offset _screen(Rect r, num year, double value) => Offset(
        r.left + viewport.nx(year) * r.width,
        r.bottom - viewport.ny(value / baseline) * r.height,
      );

  /// Label for an index tick value: "0" at the baseline, else ×factor / ÷factor.
  String _factorLabel(double index) {
    if ((index - 1).abs() < 1e-9) return '0';
    if (index > 1) return '×${formatBaseNum(index, base)}';
    return '÷${formatBaseNum(1 / index, base)}';
  }

  void _label(Canvas canvas, String text, Offset at, Color color,
      {double size = 9, TextAlign align = TextAlign.left}) {
    final tp = TextPainter(
      text: TextSpan(
          text: text,
          style: TextStyle(color: color, fontSize: size, fontFamily: 'monospace')),
      textDirection: TextDirection.ltr,
      textAlign: align,
    )..layout();
    var dx = at.dx;
    if (align == TextAlign.right) dx -= tp.width;
    if (align == TextAlign.center) dx -= tp.width / 2;
    tp.paint(canvas, Offset(dx, at.dy));
  }

  String _yearLabel(double year) {
    final y = year.round();
    if (y < 0) return '${formatBaseNum(-y.toDouble(), base)}v';
    return formatBaseNum(y.toDouble(), base);
  }

  @override
  void paint(Canvas canvas, Size size) {
    final r = _rect(size);
    if (r.width <= 0 || r.height <= 0) return;

    // Frame.
    final framePaint = Paint()
      ..color = colors.displayBorder
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    canvas.drawRect(r, framePaint);

    // ── Grid + axis labels ──
    final gridPaint = Paint()
      ..color = colors.hairline
      ..strokeWidth = 1;
    final baselinePaint = Paint()
      ..color = colors.textSecondary
      ..strokeWidth = 1.5;
    // Y minor: 2/3/5 subdivisions per decade — faint gridlines (drawn under the
    // decade lines), with ×2/×5 (÷2/÷5) labeled so values are readable between
    // the decades on the log axis.
    final minorPaint = Paint()
      ..color = colors.hairline.withValues(alpha: 0.45)
      ..strokeWidth = 0.5;
    for (final v in logMinorTicks(viewport.lyMin, viewport.lyMax)) {
      final mant = (v / pow10(log10(v).floorToDouble())).round();
      if (mant != 2 && mant != 3 && mant != 5) continue;
      final y = r.bottom - viewport.ny(v) * r.height;
      if (y < r.top - 1 || y > r.bottom + 1) continue;
      canvas.drawLine(Offset(r.left, y), Offset(r.right, y), minorPaint);
      if (mant != 3) {
        _label(canvas, _factorLabel(v), Offset(r.left - 4, y - 5),
            colors.textFaint, size: 8, align: TextAlign.right);
      }
    }
    // Y: index decade ticks; the baseline (index 1 = oldest value) is the bold
    // "0" reference line.
    for (final v in logDecadeTicks(viewport.lyMin, viewport.lyMax)) {
      final y = r.bottom - viewport.ny(v) * r.height;
      if (y < r.top - 1 || y > r.bottom + 1) continue;
      final isBaseline = (v - 1).abs() < 1e-9;
      canvas.drawLine(Offset(r.left, y), Offset(r.right, y),
          isBaseline ? baselinePaint : gridPaint);
      _label(canvas, _factorLabel(v), Offset(r.left - 4, y - 5),
          isBaseline ? colors.textSecondary : colors.textMuted,
          align: TextAlign.right);
    }
    // X: nice year ticks.
    for (final yr in niceTicks(viewport.xMin, viewport.xMax, maxTicks: 6)) {
      final x = r.left + viewport.nx(yr) * r.width;
      if (x < r.left - 1 || x > r.right + 1) continue;
      canvas.drawLine(Offset(x, r.top), Offset(x, r.bottom), gridPaint);
      _label(canvas, _yearLabel(yr), Offset(x, r.bottom + 4), colors.textMuted,
          align: TextAlign.center);
    }
    // Relationship caption (value axis).
    _label(canvas, unitLabel, Offset(r.left + 2, r.top + 2),
        colors.textSecondary, size: 10);

    // ── Series ──
    canvas.save();
    canvas.clipRect(r);

    // Uncertainty band: a filled estimated range around the points that carry
    // one (mostly antiquity / sparse) — "geschätzter Bereich rund um die Linie".
    final banded = series.points.where((p) => p.hasBand).toList();
    if (banded.length >= 2) {
      final path = Path();
      for (var i = 0; i < banded.length; i++) {
        final at = _screen(r, banded[i].year, banded[i].valueHigh!);
        i == 0 ? path.moveTo(at.dx, at.dy) : path.lineTo(at.dx, at.dy);
      }
      for (var i = banded.length - 1; i >= 0; i--) {
        final at = _screen(r, banded[i].year, banded[i].valueLow!);
        path.lineTo(at.dx, at.dy);
      }
      path.close();
      canvas.drawPath(
          path, Paint()..color = colors.textMuted.withValues(alpha: 0.13));
    }
    final whisker = Paint()
      ..color = colors.textMuted.withValues(alpha: 0.5)
      ..strokeWidth = 1;
    for (final p in banded) {
      canvas.drawLine(_screen(r, p.year, p.valueHigh!),
          _screen(r, p.year, p.valueLow!), whisker);
    }

    // Lines only between adjacent MODERN points (never across eras/gaps).
    final linePaint = Paint()
      ..color = colors.accentGold
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeJoin = StrokeJoin.round;
    for (var i = 0; i < series.points.length - 1; i++) {
      final a = series.points[i];
      final b = series.points[i + 1];
      if (a.era == Era.modern && b.era == Era.modern) {
        canvas.drawLine(_screen(r, a.year, a.value),
            _screen(r, b.year, b.value), linePaint);
      }
    }

    // Dots, styled by era.
    for (final p in series.points) {
      final at = _screen(r, p.year, p.value);
      switch (p.era) {
        case Era.modern:
          canvas.drawCircle(at, 2.6, Paint()..color = colors.accentGold);
        case Era.sparse:
          canvas.drawCircle(
              at, 3.2, Paint()..color = colors.textSecondary);
        case Era.reconstructed:
          // Hollow ring — "Ankerpunkt, nur Größenordnung".
          canvas.drawCircle(
              at,
              4.2,
              Paint()
                ..color = colors.textMuted
                ..style = PaintingStyle.stroke
                ..strokeWidth = 1.6);
      }
    }
    canvas.restore();

    // ── Tap callout ──
    final sel = selected;
    if (sel != null) {
      canvas.drawCircle(
          selectedAt,
          5,
          Paint()
            ..color = colors.accentGold
            ..style = PaintingStyle.stroke
            ..strokeWidth = 2);
      final lines = <String>[
        '${_yearLabel(sel.year.toDouble())} · ${_factorLabel(sel.value / baseline)}',
        if (sel.label != null) sel.label!,
        if (sel.era == Era.reconstructed) reconstructedLabel,
      ];
      _calloutBox(canvas, r, selectedAt, lines);
    }
  }

  void _calloutBox(Canvas canvas, Rect r, Offset at, List<String> lines) {
    final tps = [
      for (final l in lines)
        TextPainter(
          text: TextSpan(
              text: l,
              style: TextStyle(color: colors.textPrimary, fontSize: 10)),
          textDirection: TextDirection.ltr,
        )..layout()
    ];
    final w = tps.fold(0.0, (m, tp) => m > tp.width ? m : tp.width) + 12;
    final h = tps.fold(0.0, (m, tp) => m + tp.height) + 8;
    var left = at.dx + 8;
    var top = at.dy - h - 8;
    if (left + w > r.right) left = at.dx - w - 8;
    if (left < r.left) left = r.left + 2;
    if (top < r.top) top = at.dy + 10;
    final box = Rect.fromLTWH(left, top, w, h);
    canvas.drawRRect(
        RRect.fromRectAndRadius(box, const Radius.circular(6)),
        Paint()..color = colors.cardFill);
    canvas.drawRRect(
        RRect.fromRectAndRadius(box, const Radius.circular(6)),
        Paint()
          ..color = colors.cardBorder
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1);
    var y = top + 4;
    for (final tp in tps) {
      tp.paint(canvas, Offset(left + 6, y));
      y += tp.height;
    }
  }

  @override
  bool shouldRepaint(covariant _PriceChartPainter old) =>
      old.series.id != series.id ||
      old.viewport != viewport ||
      old.base != base ||
      old.baseline != baseline ||
      old.unitLabel != unitLabel ||
      old.colors != colors ||
      old.selected != selected;
}
