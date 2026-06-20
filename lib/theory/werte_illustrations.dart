// Inline, custom-painted data figures for the "Wertetheorie" prose chapters.
// Distributed WITHIN the text via ProseSection.illustrationId (resolved here by
// inlineTheoryIllustration) — the prose loop in info_pages.dart renders the
// returned widget right after the tagged section.
//
// Same discipline as theory/theory_illustrations.dart: theme-aware through
// AppColors (shouldRepaint compares const-identity), while the categorical
// accent colours are deliberately theme-independent so legend ↔ drawing stays
// exact on both surfaces. No external assets — every figure is geometry/data,
// evergreen (no live prices). The two price curves reuse the Phase-3 chart
// dataset (logic/price_history*.dart) as static, pan-free pictures; axis labels
// are decimal for readability inside running prose.
//
// Phase 1: German-default labels (i18n later, like manual_illustrations.dart).

import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../app_theme.dart';
import '../logic/price_history.dart';
import '../logic/price_history_data.dart';

// Theme-independent categorical accents (read fine on light and dark).
const _teal = Color(0xFF0F6E56);
const _blue = Color(0xFF185FA5);
const _purple = Color(0xFF534AB7);
const _orange = Color(0xFF993C1D);
const _gold = Color(0xFFB8860B);
const _silver = Color(0xFF8C9196);
const _copper = Color(0xFF9C5A2E);
const _slate = Color(0xFF5F6B73);

// ───────────────────────── shared text helpers ──────────────────────────────

TextPainter _layout(String s, Color color,
    {double size = 11,
    FontWeight weight = FontWeight.w400,
    double? maxWidth,
    TextAlign align = TextAlign.left}) {
  return TextPainter(
    text: TextSpan(
        text: s,
        style:
            TextStyle(color: color, fontSize: size, fontWeight: weight, height: 1.1)),
    textDirection: TextDirection.ltr,
    textAlign: align,
    maxLines: 2,
    ellipsis: '…',
  )..layout(maxWidth: maxWidth ?? double.infinity);
}

void _text(Canvas canvas, String s, Offset at, Color color,
    {double size = 11,
    FontWeight weight = FontWeight.w400,
    TextAlign align = TextAlign.left,
    double? maxWidth}) {
  final tp = _layout(s, color,
      size: size, weight: weight, maxWidth: maxWidth, align: align);
  var dx = at.dx;
  if (align == TextAlign.right) dx -= tp.width;
  if (align == TextAlign.center) dx -= tp.width / 2;
  tp.paint(canvas, Offset(dx, at.dy));
}

/// Compact decimal formatter — no false precision (the figures are coarse).
String _compact(double v) {
  if (!v.isFinite) return '';
  final a = v.abs();
  if (a >= 10) return v.round().toString();
  if (a >= 1) return _trim(v.toStringAsFixed(1));
  if (a >= 0.01) return _trim(v.toStringAsFixed(2));
  return v.toStringAsExponential(0);
}

String _trim(String s) =>
    s.contains('.') ? s.replaceFirst(RegExp(r'0+$'), '').replaceFirst(RegExp(r'\.$'), '') : s;

// ════════════════════════════ dispatch ══════════════════════════════════════

/// Resolve a [ProseSection.illustrationId] to its inline figure, or null.
Widget? inlineTheoryIllustration(String? id) {
  switch (id) {
    case 'werte/money-functions':
      return const _MoneyFunctionsFigure();
    case 'werte/troy-ladder':
      return const _TroyLadderFigure();
    case 'werte/density':
      return const _DensityFigure();
    case 'werte/conductivity':
      return const _ConductivityFigure();
    case 'werte/ratio-curve':
      return const _PriceFigure(
          id: PriceSeriesId.silver, caption: 'Silber in Gold');
    case 'werte/crust-vs-money':
      return const _CrustVsMoneyFigure();
    case 'werte/demand-split':
      return const _DemandSplitFigure();
    case 'werte/purchasing-power':
      return const _PriceFigure(
          id: PriceSeriesId.gold, caption: 'Gold in Getreide');
    case 'werte/inflation-horizon':
      return const _InflationHorizonFigure();
    case 'werte/goldstandard-timeline':
      return const _GoldStandardTimelineFigure();
    case 'werte/allocated':
      return const _AllocatedFigure();
    case 'werte/catalyst':
      return const _CatalystFigure();
  }
  return null;
}

// ════════════════════════ A/B · price curves ════════════════════════════════

/// A static, pan-free picture of one gold-referenced price series — the same
/// data + rendering discipline as the live chart (price_chart.dart), fully
/// fitted (oldest point on the bold "0" line).
class _PriceFigure extends StatelessWidget {
  final PriceSeriesId id;
  final String caption;
  const _PriceFigure({required this.id, required this.caption});

  @override
  Widget build(BuildContext context) {
    final t = AppColors.of(context);
    final series = kPriceSeries[id]!;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1.5,
            child: CustomPaint(
              painter: _PriceFigurePainter(
                series: series,
                viewport: fitViewport(series),
                baseline: baselineOf(series),
                caption: caption,
                colors: t,
              ),
            ),
          ),
          const SizedBox(height: 8),
          _eraLegend(t),
          const SizedBox(height: 4),
          Text(
            'Ältester Wert = 0-Linie. Nach oben teurer in Gold, nach unten billiger.',
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.w300, color: t.textMuted),
          ),
        ],
      ),
    );
  }

  Widget _eraLegend(AppColors t) {
    Widget item(Widget mark, String label) => Padding(
          padding: const EdgeInsetsDirectional.only(end: 14),
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            mark,
            const SizedBox(width: 5),
            Text(label,
                style: TextStyle(
                    fontSize: 11.5,
                    fontWeight: FontWeight.w300,
                    color: t.textTertiary)),
          ]),
        );
    Widget dot(Color c, {required bool filled}) => Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: filled ? c : null,
            border: filled ? null : Border.all(color: c, width: 1.4),
          ),
        );
    return Wrap(runSpacing: 4, children: [
      item(dot(t.accentGold, filled: true), 'neuzeitlich'),
      item(dot(t.textSecondary, filled: true), 'spärlich belegt'),
      item(dot(t.textMuted, filled: false), 'Antike (Größenordnung)'),
    ]);
  }
}

class _PriceFigurePainter extends CustomPainter {
  final PriceSeries series;
  final ChartViewport viewport;
  final double baseline;
  final String caption;
  final AppColors colors;
  _PriceFigurePainter({
    required this.series,
    required this.viewport,
    required this.baseline,
    required this.caption,
    required this.colors,
  });

  static const _margin = EdgeInsets.fromLTRB(36, 18, 10, 18);

  Offset _screen(Rect r, num year, double value) => Offset(
        r.left + viewport.nx(year) * r.width,
        r.bottom - viewport.ny(value / baseline) * r.height,
      );

  String _factor(double index) {
    if ((index - 1).abs() < 1e-9) return '0';
    return index > 1 ? '×${_compact(index)}' : '÷${_compact(1 / index)}';
  }

  String _year(double year) {
    final y = year.round();
    return y < 0 ? '${-y}v' : '$y';
  }

  void _txt(Canvas canvas, String s, Offset at, Color color,
      {double size = 9, TextAlign align = TextAlign.left}) {
    final tp = TextPainter(
      text: TextSpan(text: s, style: TextStyle(color: color, fontSize: size)),
      textDirection: TextDirection.ltr,
    )..layout();
    var dx = at.dx;
    if (align == TextAlign.right) dx -= tp.width;
    if (align == TextAlign.center) dx -= tp.width / 2;
    tp.paint(canvas, Offset(dx, at.dy));
  }

  @override
  void paint(Canvas canvas, Size size) {
    final r = Rect.fromLTRB(_margin.left, _margin.top, size.width - _margin.right,
        size.height - _margin.bottom);
    if (r.width <= 0 || r.height <= 0) return;

    canvas.drawRect(
        r,
        Paint()
          ..color = colors.displayBorder
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1);

    final grid = Paint()
      ..color = colors.hairline
      ..strokeWidth = 1;
    final basePaint = Paint()
      ..color = colors.textSecondary
      ..strokeWidth = 1.5;

    // Minor 2/3/5 subdivisions per decade — faint gridlines with ×2/×5 (÷2/÷5)
    // labels so values are readable between the decade lines on the log axis.
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
        _txt(canvas, _factor(v), Offset(r.left - 4, y - 5), colors.textFaint,
            size: 8, align: TextAlign.right);
      }
    }

    for (final v in logDecadeTicks(viewport.lyMin, viewport.lyMax)) {
      final y = r.bottom - viewport.ny(v) * r.height;
      if (y < r.top - 1 || y > r.bottom + 1) continue;
      final isBase = (v - 1).abs() < 1e-9;
      canvas.drawLine(Offset(r.left, y), Offset(r.right, y), isBase ? basePaint : grid);
      _txt(canvas, _factor(v), Offset(r.left - 4, y - 5),
          isBase ? colors.textSecondary : colors.textMuted, align: TextAlign.right);
    }
    for (final yr in niceTicks(viewport.xMin, viewport.xMax, maxTicks: 6)) {
      final x = r.left + viewport.nx(yr) * r.width;
      if (x < r.left - 1 || x > r.right + 1) continue;
      canvas.drawLine(Offset(x, r.top), Offset(x, r.bottom), grid);
      _txt(canvas, _year(yr), Offset(x, r.bottom + 4), colors.textMuted,
          align: TextAlign.center);
    }
    _txt(canvas, caption, Offset(r.left + 2, r.top + 2), colors.textSecondary,
        size: 10);

    canvas.save();
    canvas.clipRect(r);

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

    final line = Paint()
      ..color = colors.accentGold
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeJoin = StrokeJoin.round;
    for (var i = 0; i < series.points.length - 1; i++) {
      final a = series.points[i];
      final b = series.points[i + 1];
      if (a.era == Era.modern && b.era == Era.modern) {
        canvas.drawLine(
            _screen(r, a.year, a.value), _screen(r, b.year, b.value), line);
      }
    }

    for (final p in series.points) {
      final at = _screen(r, p.year, p.value);
      switch (p.era) {
        case Era.modern:
          canvas.drawCircle(at, 2.4, Paint()..color = colors.accentGold);
        case Era.sparse:
          canvas.drawCircle(at, 3.0, Paint()..color = colors.textSecondary);
        case Era.reconstructed:
          canvas.drawCircle(
              at,
              4.0,
              Paint()
                ..color = colors.textMuted
                ..style = PaintingStyle.stroke
                ..strokeWidth = 1.5);
      }
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _PriceFigurePainter old) =>
      old.colors != colors ||
      old.series != series ||
      old.viewport != viewport ||
      old.baseline != baseline;
}

// ════════════════════════ C/D/E/F · bar charts ══════════════════════════════

class _BarDatum {
  final String label;
  final double value; // bar length
  final String valueText; // shown number
  final Color color;
  const _BarDatum(this.label, this.value, this.valueText, this.color);
}

/// A small horizontal bar chart: title, labelled bars (normalized to the max),
/// and a one-line caption. Reused for density / conductivity / ratio / demand.
class _BarChart extends StatelessWidget {
  final String title;
  final List<_BarDatum> bars;
  final String note;
  const _BarChart(
      {required this.title, required this.bars, required this.note});

  @override
  Widget build(BuildContext context) {
    final t = AppColors.of(context);
    final h = 26.0 + bars.length * 30.0;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: h,
            child: CustomPaint(
              size: Size.infinite,
              painter: _BarChartPainter(title: title, bars: bars, colors: t),
            ),
          ),
          const SizedBox(height: 6),
          Text(note,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  color: t.textMuted)),
        ],
      ),
    );
  }
}

class _BarChartPainter extends CustomPainter {
  final String title;
  final List<_BarDatum> bars;
  final AppColors colors;
  _BarChartPainter(
      {required this.title, required this.bars, required this.colors});

  @override
  void paint(Canvas canvas, Size size) {
    const topPad = 20.0;
    _text(canvas, title, const Offset(0, 2), colors.textSecondary,
        size: 11.5, weight: FontWeight.w600);

    final labelW = size.width * 0.34;
    final barLeft = labelW + 8;
    final barMaxW = (size.width - barLeft - 6).clamp(10.0, double.infinity);
    final maxV = bars.fold(0.0, (m, b) => b.value > m ? b.value : m);
    final rows = bars.length;
    final rowH = (size.height - topPad) / rows;

    for (var i = 0; i < rows; i++) {
      final b = bars[i];
      final cy = topPad + rowH * i + rowH / 2;

      final lp = _layout(b.label, colors.textSecondary,
          size: 11.5, maxWidth: labelW);
      lp.paint(canvas, Offset(labelW - lp.width, cy - lp.height / 2));

      final barTh = (rowH * 0.5).clamp(8.0, 16.0);
      final barW = maxV <= 0 ? 0.0 : barMaxW * (b.value / maxV);
      canvas.drawRRect(
          RRect.fromRectAndRadius(
              Rect.fromLTWH(barLeft, cy - barTh / 2, barW, barTh),
              const Radius.circular(3)),
          Paint()..color = b.color);

      final after = barLeft + barW + 6;
      final vp = _layout(b.valueText, colors.textPrimary,
          size: 10.5, weight: FontWeight.w500);
      if (after + vp.width <= size.width) {
        vp.paint(canvas, Offset(after, cy - vp.height / 2));
      } else {
        final wp = _layout(b.valueText, const Color(0xFFFFFFFF),
            size: 10.5, weight: FontWeight.w600);
        wp.paint(
            canvas, Offset(barLeft + barW - wp.width - 5, cy - wp.height / 2));
      }
    }
  }

  @override
  bool shouldRepaint(covariant _BarChartPainter old) =>
      old.colors != colors || old.bars != bars || old.title != title;
}

class _DensityFigure extends StatelessWidget {
  const _DensityFigure();
  @override
  Widget build(BuildContext context) => const _BarChart(
        title: 'Dichte (g/cm³)',
        bars: [
          _BarDatum('Gold', 19.3, '19,3', _gold),
          _BarDatum('Blei', 11.3, '11,3', _slate),
          _BarDatum('Eisen', 7.9, '7,9', _copper),
          _BarDatum('Wasser', 1.0, '1,0', _blue),
        ],
        note: 'Gold zählt zu den dichtesten Stoffen des Alltags — dichter als Blei.',
      );
}

class _ConductivityFigure extends StatelessWidget {
  const _ConductivityFigure();
  @override
  Widget build(BuildContext context) => const _BarChart(
        title: 'Elektrische Leitfähigkeit (Silber = 100)',
        bars: [
          _BarDatum('Silber', 100, '100', _silver),
          _BarDatum('Kupfer', 95, '95', _copper),
          _BarDatum('Gold', 65, '65', _gold),
          _BarDatum('Aluminium', 60, '60', _blue),
        ],
        note:
            'Silber leitet Strom am besten — grobe Richtwerte, Silber als Maßstab 100.',
      );
}

class _CrustVsMoneyFigure extends StatelessWidget {
  const _CrustVsMoneyFigure();
  @override
  Widget build(BuildContext context) => const _BarChart(
        title: 'Gold-Silber-Verhältnis (Silber je Gold)',
        bars: [
          _BarDatum('Antike · Preis', 12, '≈ 12 : 1', _purple),
          _BarDatum('Erdkruste · Menge', 17, '≈ 17 : 1', _teal),
          _BarDatum('Heute · Preis', 80, '≈ 80 : 1', _orange),
        ],
        note:
            'Der Preis löste sich von der natürlichen Häufigkeit; der heutige Wert schwankt stark.',
      );
}

class _DemandSplitFigure extends StatelessWidget {
  const _DemandSplitFigure();
  @override
  Widget build(BuildContext context) => const _BarChart(
        title: 'Industrieanteil an der Nachfrage',
        bars: [
          _BarDatum('Gold', 8, '≈ 8 %', _gold),
          _BarDatum('Silber', 50, '≈ 50 %', _silver),
        ],
        note:
            'Silber ist halb Industriemetall; Gold dient fast nur als Wertspeicher und Schmuck.',
      );
}

// ════════════════════════ G · troy weight ladder ════════════════════════════

class _TroyLadderFigure extends StatelessWidget {
  const _TroyLadderFigure();
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: AspectRatio(
          aspectRatio: 2.3,
          child: CustomPaint(
              painter: _TroyLadderPainter(colors: AppColors.of(context))),
        ),
      );
}

class _TroyLadderPainter extends CustomPainter {
  final AppColors colors;
  _TroyLadderPainter({required this.colors});

  static const _nodes = ['gr', 'dwt', 'oz t', 'lb t'];
  static const _steps = ['×24', '×20', '×12'];

  @override
  void paint(Canvas canvas, Size size) {
    final n = _nodes.length;
    final boxW = size.width * 0.155;
    final gap = (size.width - n * boxW) / (n - 1);
    final boxH = size.height * 0.4;
    final cy = size.height * 0.42;
    final highlight = colors.worldTwelve; // the dozenal ×12 step

    for (var i = 0; i < n; i++) {
      final left = i * (boxW + gap);
      final isLast = i == n - 1;
      final rect = Rect.fromLTWH(left, cy - boxH / 2, boxW, boxH);
      final accent = isLast ? highlight : colors.illusLine;
      final rr = RRect.fromRectAndRadius(rect, const Radius.circular(6));
      canvas.drawRRect(rr, Paint()..color = accent.withValues(alpha: 0.10));
      canvas.drawRRect(
          rr,
          Paint()
            ..color = accent
            ..style = PaintingStyle.stroke
            ..strokeWidth = isLast ? 2.0 : 1.4);
      final lp = _layout(_nodes[i],
          isLast ? highlight : colors.textPrimary,
          size: 14, weight: FontWeight.w600);
      lp.paint(canvas,
          Offset(rect.center.dx - lp.width / 2, rect.center.dy - lp.height / 2));

      if (i < n - 1) {
        final ax0 = left + boxW + 3;
        final ax1 = left + boxW + gap - 3;
        final isDoz = i == n - 2;
        final col = isDoz ? highlight : colors.illusFaint;
        canvas.drawLine(
            Offset(ax0, cy),
            Offset(ax1 - 4, cy),
            Paint()
              ..color = col
              ..strokeWidth = isDoz ? 2.0 : 1.4);
        canvas.drawPath(
            Path()
              ..moveTo(ax1, cy)
              ..lineTo(ax1 - 6, cy - 4)
              ..lineTo(ax1 - 6, cy + 4)
              ..close(),
            Paint()..color = col);
        final sp = _layout(_steps[i], col,
            size: 11.5, weight: isDoz ? FontWeight.w700 : FontWeight.w400);
        sp.paint(canvas,
            Offset((ax0 + ax1) / 2 - sp.width / 2, cy - boxH / 2 - sp.height - 1));
      }
    }
    _text(canvas, '12 oz t = 1 Troy-Pfund — der dozenale Schritt.',
        Offset(size.width / 2, cy + boxH / 2 + 8), colors.textMuted,
        size: 11.5, align: TextAlign.center);
  }

  @override
  bool shouldRepaint(covariant _TroyLadderPainter old) => old.colors != colors;
}

// ════════════════════════ H · functions of money ════════════════════════════

class _MoneyFunctionsFigure extends StatelessWidget {
  const _MoneyFunctionsFigure();
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: AspectRatio(
          aspectRatio: 2.2,
          child: CustomPaint(
              painter: _MoneyFunctionsPainter(colors: AppColors.of(context))),
        ),
      );
}

class _MoneyFunctionsPainter extends CustomPainter {
  final AppColors colors;
  _MoneyFunctionsPainter({required this.colors});

  static const _labels = ['Tauschmittel', 'Recheneinheit', 'Wertspeicher'];
  static const _accents = [_teal, _blue, _purple];

  @override
  void paint(Canvas canvas, Size size) {
    const n = 3;
    final gap = size.width * 0.05;
    final boxW = (size.width - (n - 1) * gap) / n;
    final boxTop = size.height * 0.08;
    final boxH = size.height * 0.62;

    for (var i = 0; i < n; i++) {
      final left = i * (boxW + gap);
      final rect = Rect.fromLTWH(left, boxTop, boxW, boxH);
      final rr = RRect.fromRectAndRadius(rect, const Radius.circular(8));
      canvas.drawRRect(rr, Paint()..color = _accents[i].withValues(alpha: 0.10));
      canvas.drawRRect(
          rr,
          Paint()
            ..color = _accents[i].withValues(alpha: 0.9)
            ..style = PaintingStyle.stroke
            ..strokeWidth = 1.4);
      _glyph(canvas, i, rect);
      _text(canvas, _labels[i], Offset(rect.center.dx, boxTop + boxH + 6),
          colors.textSecondary,
          size: 11.5,
          align: TextAlign.center,
          weight: FontWeight.w500,
          maxWidth: boxW + gap);
    }
  }

  void _glyph(Canvas canvas, int i, Rect box) {
    final cx = box.center.dx, cy = box.center.dy;
    final s = box.shortestSide * 0.26;
    final p = Paint()
      ..color = _accents[i]
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;
    if (i == 0) {
      // ↔ medium of exchange
      canvas.drawLine(Offset(cx - s, cy), Offset(cx + s, cy), p);
      canvas.drawPath(
          Path()
            ..moveTo(cx - s + 7, cy - 6)
            ..lineTo(cx - s, cy)
            ..lineTo(cx - s + 7, cy + 6),
          p);
      canvas.drawPath(
          Path()
            ..moveTo(cx + s - 7, cy - 6)
            ..lineTo(cx + s, cy)
            ..lineTo(cx + s - 7, cy + 6),
          p);
    } else if (i == 1) {
      // ruler / unit of account
      final rr = Rect.fromCenter(
          center: Offset(cx, cy), width: s * 2, height: s * 1.1);
      canvas.drawRect(rr, p);
      for (var k = 1; k < 4; k++) {
        final x = rr.left + rr.width * k / 4;
        canvas.drawLine(Offset(x, rr.top), Offset(x, rr.top + rr.height * 0.45), p);
      }
    } else {
      // vault / store of value
      canvas.drawRRect(
          RRect.fromRectAndRadius(
              Rect.fromCenter(
                  center: Offset(cx, cy), width: s * 1.8, height: s * 1.8),
              const Radius.circular(4)),
          p);
      canvas.drawCircle(Offset(cx, cy), s * 0.42, p);
      canvas.drawLine(Offset(cx, cy), Offset(cx + s * 0.42, cy - s * 0.42), p);
    }
  }

  @override
  bool shouldRepaint(covariant _MoneyFunctionsPainter old) =>
      old.colors != colors;
}

// ════════════════════════ I · gold-standard timeline ════════════════════════

class _GoldStandardTimelineFigure extends StatelessWidget {
  const _GoldStandardTimelineFigure();
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: AspectRatio(
          aspectRatio: 2.4,
          child: CustomPaint(
              painter: _TimelinePainter(colors: AppColors.of(context))),
        ),
      );
}

class _TimelinePainter extends CustomPainter {
  final AppColors colors;
  _TimelinePainter({required this.colors});

  // (year, two-line label, place above?)
  static const _events = <(int, String, bool)>[
    (1870, 'klassischer\nGoldstandard', true),
    (1944, 'Bretton\nWoods', false),
    (1971, 'Nixon-\nSchock', true),
    (2025, 'heute:\nfreie Währungen', false),
  ];
  static const _accents = [_teal, _blue, _orange, _slate];
  static const _y0 = 1850, _y1 = 2035;

  @override
  void paint(Canvas canvas, Size size) {
    final axisY = size.height * 0.5;
    final left = size.width * 0.04, right = size.width * 0.96;
    canvas.drawLine(
        Offset(left, axisY),
        Offset(right, axisY),
        Paint()
          ..color = colors.illusLine
          ..strokeWidth = 1.6);
    canvas.drawPath(
        Path()
          ..moveTo(right, axisY)
          ..lineTo(right - 7, axisY - 5)
          ..lineTo(right - 7, axisY + 5)
          ..close(),
        Paint()..color = colors.illusLine);

    double xOf(int y) => left + (y - _y0) / (_y1 - _y0) * (right - left);
    for (var i = 0; i < _events.length; i++) {
      final e = _events[i];
      final x = xOf(e.$1);
      final col = _accents[i];
      canvas.drawCircle(Offset(x, axisY), 4, Paint()..color = col);
      canvas.drawLine(Offset(x, axisY - (e.$3 ? 6 : 0)),
          Offset(x, axisY + (e.$3 ? 0 : 6)), Paint()..color = col..strokeWidth = 1.2);

      final yearTp =
          _layout('${e.$1}', colors.textPrimary, size: 12, weight: FontWeight.w600);
      final labTp =
          _layout(e.$2, colors.textTertiary, size: 10.5, align: TextAlign.center);
      if (e.$3) {
        yearTp.paint(canvas, Offset(x - yearTp.width / 2, axisY - 8 - yearTp.height));
        labTp.paint(canvas,
            Offset(x - labTp.width / 2, axisY - 8 - yearTp.height - labTp.height));
      } else {
        yearTp.paint(canvas, Offset(x - yearTp.width / 2, axisY + 8));
        labTp.paint(
            canvas, Offset(x - labTp.width / 2, axisY + 9 + yearTp.height));
      }
    }
  }

  @override
  bool shouldRepaint(covariant _TimelinePainter old) => old.colors != colors;
}

// ════════════════════════ J · allocated vs paper claims ═════════════════════

class _AllocatedFigure extends StatelessWidget {
  const _AllocatedFigure();
  @override
  Widget build(BuildContext context) {
    final t = AppColors.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1.9,
            child: CustomPaint(painter: _AllocatedPainter(colors: t)),
          ),
          const SizedBox(height: 6),
          Text(
            'Wie viele Papieransprüche auf einen physischen Barren kommen, ist umstritten und schwer einsehbar.',
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.w300, color: t.textMuted),
          ),
        ],
      ),
    );
  }
}

class _AllocatedPainter extends CustomPainter {
  final AppColors colors;
  _AllocatedPainter({required this.colors});

  @override
  void paint(Canvas canvas, Size size) {
    final areaTop = size.height * 0.14, areaH = size.height * 0.60;

    // Left: 3 solid physical bars.
    final barW = size.width * 0.24;
    final barX = size.width * 0.06;
    const n = 3;
    final bh = areaH / (n + (n - 1) * 0.5);
    final vgap = bh * 0.5;
    for (var i = 0; i < n; i++) {
      final r = Rect.fromLTWH(barX, areaTop + i * (bh + vgap), barW, bh);
      final rr = RRect.fromRectAndRadius(r, const Radius.circular(3));
      canvas.drawRRect(rr, Paint()..color = _gold.withValues(alpha: 0.85));
      canvas.drawRRect(
          rr,
          Paint()
            ..color = _gold
            ..style = PaintingStyle.stroke
            ..strokeWidth = 1.2);
    }
    _text(canvas, 'physisch\n(zugeteilt)',
        Offset(barX + barW / 2, areaTop + areaH + 6), colors.textSecondary,
        size: 10.5, align: TextAlign.center, maxWidth: size.width * 0.34);

    // Right: 3×3 hollow paper claims.
    const cols = 3, rowsC = 3;
    final claimsLeft = size.width * 0.50, claimsRight = size.width * 0.96;
    final cw = (claimsRight - claimsLeft) / cols;
    final ch = areaH / rowsC;
    final claims = <Rect>[];
    for (var rr = 0; rr < rowsC; rr++) {
      for (var cc = 0; cc < cols; cc++) {
        final rect = Rect.fromLTWH(
            claimsLeft + cc * cw + 2, areaTop + rr * ch + 2, cw - 6, ch - 6);
        claims.add(rect);
        canvas.drawRRect(
            RRect.fromRectAndRadius(rect, const Radius.circular(2)),
            Paint()
              ..color = colors.textMuted
              ..style = PaintingStyle.stroke
              ..strokeWidth = 1.1);
      }
    }
    _text(canvas, 'Papieransprüche',
        Offset((claimsLeft + claimsRight) / 2, areaTop + areaH + 6),
        colors.textSecondary,
        size: 10.5, align: TextAlign.center, maxWidth: claimsRight - claimsLeft + 10);

    // A few claim→bar arrows (many claims, one physical pool).
    final arrow = Paint()
      ..color = colors.textMuted.withValues(alpha: 0.6)
      ..strokeWidth = 1.1;
    final target = Offset(barX + barW + 2, areaTop + areaH / 2);
    for (final cr in [claims[0], claims[4], claims[8]]) {
      canvas.drawLine(Offset(cr.left, cr.center.dy), target, arrow);
    }
    canvas.drawPath(
        Path()
          ..moveTo(target.dx, target.dy)
          ..lineTo(target.dx + 6, target.dy - 4)
          ..lineTo(target.dx + 6, target.dy + 4)
          ..close(),
        Paint()..color = colors.textMuted.withValues(alpha: 0.6));
  }

  @override
  bool shouldRepaint(covariant _AllocatedPainter old) => old.colors != colors;
}

// ════════════════════════ K · inflation horizon ═════════════════════════════

class _InflationHorizonFigure extends StatelessWidget {
  const _InflationHorizonFigure();
  @override
  Widget build(BuildContext context) {
    final t = AppColors.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1.9,
            child: CustomPaint(painter: _InflationHorizonPainter(colors: t)),
          ),
          const SizedBox(height: 8),
          _LegendSwatch(
              color: t.accentGold, label: 'lange Sicht: Kaufkraft hält grob', t: t),
          const SizedBox(height: 4),
          _LegendSwatch(
              color: t.textSecondary, label: 'kurze Sicht: starke Schwankung', t: t),
        ],
      ),
    );
  }
}

class _InflationHorizonPainter extends CustomPainter {
  final AppColors colors;
  _InflationHorizonPainter({required this.colors});

  @override
  void paint(Canvas canvas, Size size) {
    final r = Rect.fromLTWH(8, 8, size.width - 16, size.height - 16);
    canvas.save();
    canvas.clipRect(r);
    final midY = r.center.dy;
    canvas.drawLine(Offset(r.left, midY), Offset(r.right, midY),
        Paint()..color = colors.hairline..strokeWidth = 1);

    final longPath = Path();
    final shortPath = Path();
    const steps = 120;
    for (var i = 0; i <= steps; i++) {
      final tt = i / steps;
      final x = r.left + tt * r.width;
      // gentle long-run drift around the midline.
      final longY = midY + r.height * (0.16 - 0.30 * tt);
      i == 0 ? longPath.moveTo(x, longY) : longPath.lineTo(x, longY);
      // short-run volatility around the long-run line.
      final osc = math.sin(tt * 22) * 0.18 +
          math.sin(tt * 53 + 1.3) * 0.10 +
          math.sin(tt * 9) * 0.07;
      final shortY = longY + r.height * osc * 0.9;
      i == 0 ? shortPath.moveTo(x, shortY) : shortPath.lineTo(x, shortY);
    }
    canvas.drawPath(
        shortPath,
        Paint()
          ..color = colors.textSecondary
          ..strokeWidth = 1.2
          ..style = PaintingStyle.stroke
          ..strokeJoin = StrokeJoin.round);
    canvas.drawPath(
        longPath,
        Paint()
          ..color = colors.accentGold
          ..strokeWidth = 2.4
          ..style = PaintingStyle.stroke
          ..strokeJoin = StrokeJoin.round
          ..strokeCap = StrokeCap.round);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _InflationHorizonPainter old) =>
      old.colors != colors;
}

class _LegendSwatch extends StatelessWidget {
  final Color color;
  final String label;
  final AppColors t;
  const _LegendSwatch(
      {required this.color, required this.label, required this.t});
  @override
  Widget build(BuildContext context) => Row(children: [
        Container(width: 22, height: 3, color: color),
        const SizedBox(width: 7),
        Flexible(
          child: Text(label,
              style: TextStyle(
                  fontSize: 11.5,
                  fontWeight: FontWeight.w300,
                  color: t.textTertiary)),
        ),
      ]);
}

// ════════════════════════ L · catalytic converter ═══════════════════════════

class _CatalystFigure extends StatelessWidget {
  const _CatalystFigure();
  @override
  Widget build(BuildContext context) {
    final t = AppColors.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 2.3,
            child: CustomPaint(painter: _CatalystPainter(colors: t)),
          ),
          const SizedBox(height: 6),
          Text(
            'Platin und Palladium reinigen Abgase im Katalysator — ihr größter industrieller Einsatz.',
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.w300, color: t.textMuted),
          ),
        ],
      ),
    );
  }
}

class _CatalystPainter extends CustomPainter {
  final AppColors colors;
  _CatalystPainter({required this.colors});

  // Cluster offsets reused for the dirty (left) and clean (right) gas dots.
  static const _cluster = <Offset>[
    Offset(0.04, -0.22),
    Offset(0.10, 0.10),
    Offset(0.16, -0.10),
    Offset(0.07, 0.26),
    Offset(0.18, 0.20),
    Offset(0.13, -0.30),
  ];

  @override
  void paint(Canvas canvas, Size size) {
    final cy = size.height * 0.46;
    final blockW = size.width * 0.30, blockH = size.height * 0.62;
    final blockLeft = size.width * 0.35;
    final block = Rect.fromLTWH(blockLeft, cy - blockH / 2, blockW, blockH);

    // Honeycomb interior.
    canvas.save();
    canvas.clipRRect(RRect.fromRectAndRadius(block, const Radius.circular(6)));
    final hexR = blockH * 0.13;
    final dx = hexR * 1.732;
    final hexPaint = Paint()
      ..color = _purple.withValues(alpha: 0.85)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2;
    final cols = (blockW / dx).ceil() + 2;
    final rows = (blockH / (hexR * 1.5)).ceil() + 2;
    for (var row = 0; row < rows; row++) {
      final yy = block.top + row * hexR * 1.5;
      final off = row.isEven ? 0.0 : dx / 2;
      for (var col = 0; col < cols; col++) {
        _hex(canvas, Offset(block.left + off + col * dx, yy), hexR, hexPaint);
      }
    }
    canvas.restore();
    canvas.drawRRect(RRect.fromRectAndRadius(block, const Radius.circular(6)),
        Paint()..color = _purple..style = PaintingStyle.stroke..strokeWidth = 1.4);
    _text(canvas, 'Pt / Pd', Offset(block.center.dx, block.bottom + 5),
        colors.textSecondary,
        size: 11.5, align: TextAlign.center, weight: FontWeight.w600);

    // Arrows in and out.
    final flow = Paint()
      ..color = colors.illusFaint
      ..strokeWidth = 1.6;
    canvas.drawLine(
        Offset(size.width * 0.24, cy), Offset(blockLeft - 3, cy), flow);
    canvas.drawPath(
        Path()
          ..moveTo(blockLeft - 3, cy)
          ..lineTo(blockLeft - 10, cy - 4)
          ..lineTo(blockLeft - 10, cy + 4)
          ..close(),
        Paint()..color = colors.illusFaint);
    final outStart = blockLeft + blockW + 3;
    canvas.drawLine(
        Offset(outStart, cy), Offset(size.width * 0.97 - 3, cy), flow);
    canvas.drawPath(
        Path()
          ..moveTo(size.width * 0.97, cy)
          ..lineTo(size.width * 0.97 - 7, cy - 4)
          ..lineTo(size.width * 0.97 - 7, cy + 4)
          ..close(),
        Paint()..color = colors.illusFaint);

    // Dirty cluster (left) and cleaner cluster (right).
    final dark = Paint()..color = colors.textSecondary;
    final faint = Paint()..color = colors.textMuted.withValues(alpha: 0.5);
    for (final o in _cluster) {
      canvas.drawCircle(
          Offset(size.width * 0.03 + o.dx * size.width, cy + blockH * o.dy),
          2.6,
          dark);
      canvas.drawCircle(
          Offset(outStart + 8 + o.dx * size.width, cy + blockH * o.dy), 2.0, faint);
    }
    _text(canvas, 'Abgas', Offset(size.width * 0.14, cy + blockH / 2 + 4),
        colors.textMuted,
        size: 10.5, align: TextAlign.center);
    _text(canvas, 'sauberer', Offset(outStart + blockW * 0.55, cy + blockH / 2 + 4),
        colors.textMuted,
        size: 10.5, align: TextAlign.center);
  }

  void _hex(Canvas canvas, Offset c, double r, Paint p) {
    final path = Path();
    for (var i = 0; i < 6; i++) {
      final a = (60 * i - 30) * math.pi / 180;
      final pt = c + Offset(r * math.cos(a), r * math.sin(a));
      i == 0 ? path.moveTo(pt.dx, pt.dy) : path.lineTo(pt.dx, pt.dy);
    }
    path.close();
    canvas.drawPath(path, p);
  }

  @override
  bool shouldRepaint(covariant _CatalystPainter old) => old.colors != colors;
}
