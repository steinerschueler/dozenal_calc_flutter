// The historical price chart (Werterechner Phase 3): a custom-painted,
// pan/zoom-able log-scale curve that replaces the keypad when toggled. No
// 3rd-party chart package — GestureDetector (scale recognizer) + CustomPainter,
// the app's convention. Design + honesty model: docs/asset-converter.md.
//
// It answers one question at a time: pick a period, and a line above the plot
// states a real amount for a year ("1 g gold = 290 L grain"), for the newest
// point first and then for whichever point is tapped.
//
// Honesty enforced visually: antiquity/sparse points are discrete dots, never
// joined by a line; lines connect only adjacent MODERN points; gaps stay gaps;
// every estimate shows its uncertainty as a bar; reconstructed points are
// visually distinct. Numbers honour the active numeral base (formatBaseNum), so
// the dozenal calculator's curve reads in base 12 or 10.

import 'package:dozenal_calc_flutter/app_theme.dart';
import 'package:dozenal_calc_flutter/key_face.dart';
import 'package:dozenal_calc_flutter/logic/base_num.dart';
import 'package:dozenal_calc_flutter/logic/price_history.dart';
import 'package:dozenal_calc_flutter/logic/price_history_data.dart';
import 'package:flutter/material.dart';

const EdgeInsets _kPlotMargin = EdgeInsets.fromLTRB(52, 8, 12, 24);
const int _kHeaderEndFlex = 2;
const double _kChipGap = 4;
const double _kAxisFontSize = 11;
const double _kMinorAxisFontSize = 10;
const double _kMinLabelSpacing = 14;
const double _kBarCapHalfWidth = 3.5;
const int _kDoubleTapMillis = 500;
const double _kTapMoveTolerance = 6;

String _rangeLabel(PricePoint point, int base) {
  final low = roughValueLabel(point.valueLow!, base);
  final high = roughValueLabel(point.valueHigh!, base);
  return '$low – $high';
}

/// Reads a year as text in [base], with a "v" suffix before year 0.
String _yearLabel(double year, int base) {
  final y = year.round();
  if (y < 0) return '${formatBaseNum(-y.toDouble(), base)}v';
  return formatBaseNum(y.toDouble(), base);
}

class PriceChart extends StatefulWidget {
  const PriceChart({
    required this.base,
    required this.seriesLabel,
    required this.unitLabel,
    required this.readoutLabel,
    required this.epochLabel,
    required this.allLabel,
    required this.sourcesLabel,
    required this.caption,
    required this.eraReconstructedLabel,
    super.key,
    this.onSourcesTap,
    this.onClose,
    this.headerEnd,
    this.headerHeight,
  });

  /// Active numeral base (12 / 10) for axis labels.
  final int base;

  /// Localized toggle label for a series (short, e.g. "Silber").
  final String Function(PriceSeriesId) seriesLabel;

  /// Localized relationship caption shown on the value axis (e.g.
  /// "Silber in Gold").
  final String Function(PriceSeriesId) unitLabel;

  /// Localized statement of a read value (e.g. "1 oz Silber = 0.011 oz Gold").
  final String Function(PriceSeriesId, String value) readoutLabel;

  /// Localized label of a historical period, and of the whole series.
  final String Function(ChartEpoch) epochLabel;
  final String allLabel;

  /// Localized "Quellen" link label + the honesty caption shown under the chart.
  final String sourcesLabel;
  final String caption;

  /// Label for a reconstructed (antiquity) point.
  final String eraReconstructedLabel;

  final VoidCallback? onSourcesTap;

  /// Closes the chart (the "Kurve" toggle off) — restores the keypad.
  final VoidCallback? onClose;

  /// Shown at the end of the chart's top band (the calculator's display on a
  /// low screen). The choice of series and period then keeps its first third.
  final Widget? headerEnd;

  /// Height of the top band when [headerEnd] is set.
  final double? headerHeight;

  @override
  State<PriceChart> createState() => _PriceChartState();
}

class _PriceChartState extends State<PriceChart> {
  PriceSeriesId _id = PriceSeriesId.gold;

  /// The period shown; null for the whole series or a view dragged off it.
  ChartEpoch? _epoch = ChartEpoch.present;
  late ChartViewport _viewport = epochViewport(_series, ChartEpoch.present);
  late PricePoint? _selected = _newestVisible();

  // Gesture snapshot.
  ChartViewport _startVp = const ChartViewport(0, 1, 0, 1);
  Offset _startFocal = Offset.zero;
  bool _moved = false;
  Rect _plotRect = Rect.zero;
  DateTime?
  _lastTapAt; // manual double-tap detection (scale recognizer eats it)

  PriceSeries get _series => kPriceSeries[_id]!;

  PricePoint? _newestVisible() =>
      nearestVisiblePoint(_series, _viewport, _viewport.xMax);

  void _showView(ChartViewport view, ChartEpoch? epoch) => setState(() {
    _viewport = clampedToSeries(view, _series);
    _epoch = epoch;
    _selected = _newestVisible();
  });

  void _selectSeries(PriceSeriesId id) {
    _id = id;
    final epoch = _epoch;
    _showView(
      epoch == null
          ? wholeSeriesViewport(_series)
          : epochViewport(_series, epoch),
      epoch,
    );
  }

  void _showWholeSeries() => _showView(wholeSeriesViewport(_series), null);

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
    if ((d.localFocalPoint - _startFocal).distance > _kTapMoveTolerance) {
      _moved = true;
    }
    if (!_moved && d.scale == 1) return;
    // The finger moves through time only: zoom around the (snapshot) focal
    // point, pan by its pixel movement. The value axis then follows what shows.
    final fx = ((_startFocal.dx - rect.left) / rect.width).clamp(0.0, 1.0);
    var vp = _startVp;
    if (d.scale != 1) vp = vp.zoomed(d.scale, fx, 0);
    final dxFrac = -(d.localFocalPoint.dx - _startFocal.dx) / rect.width;
    vp = fittedToVisibleValues(
      clampedToSeries(vp.panned(dxFrac, 0), _series),
      _series,
    );
    setState(() {
      _viewport = vp;
      _epoch = null;
      final selected = _selected;
      if (selected == null ||
          selected.year < vp.xMin ||
          selected.year > vp.xMax) {
        _selected = _newestVisible();
      }
    });
  }

  void _onScaleEnd(ScaleEndDetails d) {
    if (_moved) {
      _lastTapAt = null;
      return;
    }
    // No movement → a tap. Two quick taps = double-tap → the whole series (the
    // scale recognizer otherwise swallows GestureDetector.onDoubleTap).
    final now = DateTime.now();
    final lastTap = _lastTapAt;
    if (lastTap != null &&
        now.difference(lastTap).inMilliseconds < _kDoubleTapMillis) {
      _lastTapAt = null;
      _showWholeSeries();
    } else {
      _lastTapAt = now;
      _readAt(_startFocal);
    }
  }

  void _readAt(Offset local) {
    final rect = _plotRect;
    if (rect.width <= 0) return;
    final fraction = ((local.dx - rect.left) / rect.width).clamp(0.0, 1.0);
    final year = _viewport.xMin + fraction * _viewport.xSpan;
    setState(() => _selected = nearestVisiblePoint(_series, _viewport, year));
  }

  @override
  Widget build(BuildContext context) {
    final t = AppColors.of(context);
    final headerEnd = widget.headerEnd;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (headerEnd == null)
          _tallHeader(t)
        else
          SizedBox(
            height: widget.headerHeight,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _seriesChips(t),
                      Row(children: _actions(t)),
                    ],
                  ),
                ),
                Expanded(flex: _kHeaderEndFlex, child: headerEnd),
              ],
            ),
          ),
        _readout(t, withEpochs: headerEnd != null),
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
                    unitLabel: widget.unitLabel(_id),
                    colors: t,
                    plotMargin: _kPlotMargin,
                    selected: _selected,
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
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 11, color: t.textFaint),
          ),
        ),
      ],
    );
  }

  Widget _tallHeader(AppColors t) => Padding(
    padding: const EdgeInsets.only(bottom: 4),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(child: _seriesChips(t)),
            ..._actions(t),
          ],
        ),
        const SizedBox(height: _kChipGap),
        _epochChips(t),
      ],
    ),
  );

  Widget _chipRow(List<Widget> chips) => SingleChildScrollView(
    // Long translations scroll instead of overflowing on narrow phones.
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        for (final chip in chips) ...[chip, const SizedBox(width: _kChipGap)],
      ],
    ),
  );

  Widget _seriesChips(AppColors t) => _chipRow([
    for (final id in PriceSeriesId.values)
      _chip(
        widget.seriesLabel(id),
        active: id == _id,
        onTap: () => _selectSeries(id),
        t: t,
      ),
  ]);

  Widget _epochChips(AppColors t) => _chipRow([
    for (final epoch in ChartEpoch.values)
      _chip(
        widget.epochLabel(epoch),
        active: epoch == _epoch,
        onTap: () => _showView(epochViewport(_series, epoch), epoch),
        t: t,
        compact: true,
      ),
    _chip(
      widget.allLabel,
      active: false,
      onTap: _showWholeSeries,
      t: t,
      compact: true,
    ),
  ]);

  Widget _chip(
    String label, {
    required bool active,
    required VoidCallback onTap,
    required AppColors t,
    bool compact = false,
  }) => GestureDetector(
    onTap: onTap,
    behavior: HitTestBehavior.opaque,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: compact ? 5 : 10, vertical: 6),
      decoration: keyFaceDecoration(t, KeyRole.operation, gold: active),
      child: Text(
        label,
        style: TextStyle(
          color: active ? t.accentGold : t.textSecondary,
          fontFamily: keyFontFamily,
          fontSize: compact ? 12 : 13,
          fontWeight: keyTextWeight,
        ),
      ),
    ),
  );

  List<Widget> _actions(AppColors t) => [
    TextButton(
      onPressed: widget.onSourcesTap,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        minimumSize: const Size(0, 36),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Text(
        widget.sourcesLabel,
        style: TextStyle(color: t.link, fontSize: 13),
      ),
    ),
    if (widget.onClose != null)
      IconButton(
        onPressed: widget.onClose,
        visualDensity: VisualDensity.compact,
        icon: Icon(Icons.close, color: t.textSecondary, size: 22),
      ),
  ];

  /// States the selected point: a real amount for a year, then what is known
  /// about it — its origin and how far the estimate reaches.
  Widget _readout(AppColors t, {required bool withEpochs}) {
    final point = _selected;
    final base = widget.base;
    final detail = point == null
        ? ''
        : [
            if (point.hasBand) _rangeLabel(point, base),
            if (point.label != null) point.label!,
            if (point.era == Era.reconstructed) widget.eraReconstructedLabel,
          ].join(' · ');
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    point == null
                        ? ' '
                        : '${_yearLabel(point.year.toDouble(), base)} · '
                              '${widget.readoutLabel(_id, roughValueLabel(point.value, base))}',
                    maxLines: 1,
                    style: TextStyle(
                      color: t.displayText,
                      fontFamily: keyFontFamily,
                      fontSize: 17,
                      fontWeight: keyTextWeight,
                    ),
                  ),
                ),
                Text(
                  detail,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: t.textMuted, fontSize: 12),
                ),
              ],
            ),
          ),
          if (withEpochs) Flexible(child: _epochChips(t)),
        ],
      ),
    );
  }
}

class _PriceChartPainter extends CustomPainter {
  _PriceChartPainter({
    required this.series,
    required this.viewport,
    required this.base,
    required this.unitLabel,
    required this.colors,
    required this.plotMargin,
    required this.selected,
  });
  final PriceSeries series;
  final ChartViewport viewport;
  final int base;

  /// Localized relationship caption (e.g. "Silber in Gold").
  final String unitLabel;

  final AppColors colors;
  final EdgeInsets plotMargin;
  final PricePoint? selected;

  Rect _rect(Size size) => Rect.fromLTRB(
    plotMargin.left,
    plotMargin.top,
    size.width - plotMargin.right,
    size.height - plotMargin.bottom,
  );

  Offset _screen(Rect r, num year, double value) => Offset(
    r.left + viewport.nx(year) * r.width,
    r.bottom - viewport.ny(value) * r.height,
  );

  void _label(
    Canvas canvas,
    String text,
    Offset at,
    Color color, {
    double size = _kAxisFontSize,
    TextAlign align = TextAlign.left,
  }) {
    final tp = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          color: color,
          fontSize: size,
          fontFamily: keyFontFamily,
        ),
      ),
      textDirection: TextDirection.ltr,
      textAlign: align,
    )..layout();
    var dx = at.dx;
    if (align == TextAlign.right) dx -= tp.width;
    if (align == TextAlign.center) dx -= tp.width / 2;
    tp.paint(canvas, Offset(dx, at.dy));
  }

  @override
  void paint(Canvas canvas, Size size) {
    final r = _rect(size);
    if (r.width <= 0 || r.height <= 0) return;
    canvas.drawRect(
      r,
      Paint()
        ..color = colors.displayBorder
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1,
    );
    _paintValueAxis(canvas, r);
    _paintYearAxis(canvas, r);
    _label(
      canvas,
      unitLabel,
      Offset(r.left + 4, r.top + 3),
      colors.textSecondary,
    );
    canvas
      ..save()
      ..clipRect(r);
    _paintSelectionGuide(canvas, r);
    _paintUncertaintyBars(canvas, r);
    _paintSeries(canvas, r);
    canvas.restore();
  }

  void _paintValueAxis(Canvas canvas, Rect r) {
    final gridPaint = Paint()
      ..color = colors.hairline
      ..strokeWidth = 1;
    final ticks = valueAxisTicks(viewport.lyMin, viewport.lyMax);
    bool isDecade(double value) =>
        (log10(value) - log10(value).roundToDouble()).abs() < 1e-9;
    final labelled = <double>[];

    void tick(double value) {
      final y = r.bottom - viewport.ny(value) * r.height;
      canvas.drawLine(Offset(r.left, y), Offset(r.right, y), gridPaint);
      if (labelled.any((other) => (other - y).abs() < _kMinLabelSpacing)) {
        return;
      }
      labelled.add(y);
      final decade = isDecade(value);
      _label(
        canvas,
        roughValueLabel(value, base),
        Offset(r.left - 4, y - 6),
        decade ? colors.textSecondary : colors.textMuted,
        size: decade ? _kAxisFontSize : _kMinorAxisFontSize,
        align: TextAlign.right,
      );
    }

    // Decades first, so they keep their label when the axis gets crowded.
    ticks.where(isDecade).forEach(tick);
    ticks.where((value) => !isDecade(value)).forEach(tick);
  }

  void _paintYearAxis(Canvas canvas, Rect r) {
    final gridPaint = Paint()
      ..color = colors.hairline
      ..strokeWidth = 1;
    for (final yr in niceTicks(viewport.xMin, viewport.xMax)) {
      final x = r.left + viewport.nx(yr) * r.width;
      if (x < r.left - 1 || x > r.right + 1) continue;
      canvas.drawLine(Offset(x, r.top), Offset(x, r.bottom), gridPaint);
      _label(
        canvas,
        _yearLabel(yr, base),
        Offset(x, r.bottom + 5),
        colors.textSecondary,
        align: TextAlign.center,
      );
    }
  }

  void _paintSelectionGuide(Canvas canvas, Rect r) {
    final sel = selected;
    if (sel == null) return;
    final x = _screen(r, sel.year, sel.value).dx;
    canvas.drawLine(
      Offset(x, r.top),
      Offset(x, r.bottom),
      Paint()
        ..color = colors.accentGold.withValues(alpha: 0.45)
        ..strokeWidth = 1,
    );
  }

  /// Each estimate as a capped bar: how far this one value may be off.
  void _paintUncertaintyBars(Canvas canvas, Rect r) {
    final bar = Paint()
      ..color = colors.textMuted
      ..strokeWidth = 1.5;
    for (final p in series.points.where((p) => p.hasBand)) {
      final high = _screen(r, p.year, p.valueHigh!);
      final low = _screen(r, p.year, p.valueLow!);
      const cap = Offset(_kBarCapHalfWidth, 0);
      canvas
        ..drawLine(high, low, bar)
        ..drawLine(high - cap, high + cap, bar)
        ..drawLine(low - cap, low + cap, bar);
    }
  }

  void _paintSeries(Canvas canvas, Rect r) {
    // Lines only between adjacent MODERN points (never across eras/gaps).
    final linePaint = Paint()
      ..color = colors.accentGold
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5
      ..strokeJoin = StrokeJoin.round;
    for (var i = 0; i < series.points.length - 1; i++) {
      final a = series.points[i];
      final b = series.points[i + 1];
      if (a.era == Era.modern && b.era == Era.modern) {
        canvas.drawLine(
          _screen(r, a.year, a.value),
          _screen(r, b.year, b.value),
          linePaint,
        );
      }
    }
    // Dots, styled by era.
    for (final p in series.points) {
      final at = _screen(r, p.year, p.value);
      switch (p.era) {
        case Era.modern:
          canvas.drawCircle(at, 3.5, Paint()..color = colors.accentGold);
        case Era.sparse:
          canvas.drawCircle(at, 4, Paint()..color = colors.textPrimary);
        case Era.reconstructed:
          // Hollow ring — "Ankerpunkt, nur Größenordnung".
          canvas.drawCircle(
            at,
            5,
            Paint()
              ..color = colors.textPrimary
              ..style = PaintingStyle.stroke
              ..strokeWidth = 2,
          );
      }
    }
    final sel = selected;
    if (sel != null) {
      canvas.drawCircle(
        _screen(r, sel.year, sel.value),
        8,
        Paint()
          ..color = colors.accentGold
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2.5,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _PriceChartPainter old) =>
      old.series.id != series.id ||
      old.viewport != viewport ||
      old.base != base ||
      old.unitLabel != unitLabel ||
      old.colors != colors ||
      old.selected != selected;
}
