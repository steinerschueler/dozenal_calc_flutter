// Unit-theory page (upgraded from the old Imperial-12 conversions page).
// One scrollable tab per area (count, dist, area, space, weight, time, angle,
// price, temp): the live conversion as before, plus long-form theory prose
// (history, usage, decimal incompatibility, religious/cultural, worldwide …).
//
// Reached from the Info list. Independent of the main calculator state: shared
// number input + Doz/Dez toggle at the top, the tab selects the area. Forced
// LTR for the monospace conversion rows so the symbolic notation stays readable
// in RTL locales. Theory text comes from unit_theory.dart (German first).

import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_theme.dart';
import 'l10n/app_localizations.dart';
import 'license_page.dart' show openExternalLink;
import 'logic/unit_data.dart';
import 'unit_labels.dart';
import 'theory/chapter_image_view.dart';
import 'theory/chapter_images.dart';
import 'theory/unit_theory.dart';

class ConversionsPage extends StatefulWidget {
  const ConversionsPage({super.key});

  @override
  State<ConversionsPage> createState() => _ConversionsPageState();
}

enum _NumSys { dez, doz }

class _ConversionsPageState extends State<ConversionsPage> {
  int _value = 144;
  _NumSys _system = _NumSys.dez;
  late final TextEditingController _controller =
      TextEditingController(text: _format(_value, _system));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  static String _format(int n, _NumSys sys) =>
      sys == _NumSys.dez ? n.toString() : _toDoz(n);

  /// Decimal int → dozenal string with A/B for 10/11. Handles negatives.
  static String _toDoz(int n) {
    if (n == 0) return '0';
    final neg = n < 0;
    var x = neg ? -n : n;
    final digits = <String>[];
    while (x > 0) {
      final r = x % 12;
      digits.add(r < 10 ? '$r' : (r == 10 ? 'A' : 'B'));
      x ~/= 12;
    }
    return (neg ? '-' : '') + digits.reversed.join();
  }

  static int? _parse(String s, _NumSys sys) {
    if (s.isEmpty) return null;
    if (sys == _NumSys.dez) return int.tryParse(s);
    var i = 0;
    var neg = false;
    if (s.startsWith('-')) {
      neg = true;
      i = 1;
    }
    if (i >= s.length) return null;
    var v = 0;
    for (; i < s.length; i++) {
      final c = s[i].toUpperCase();
      int? digit;
      if (c.codeUnitAt(0) >= 0x30 && c.codeUnitAt(0) <= 0x39) {
        digit = c.codeUnitAt(0) - 0x30;
      } else if (c == 'A') {
        digit = 10;
      } else if (c == 'B') {
        digit = 11;
      }
      if (digit == null) return null;
      v = v * 12 + digit;
      if (v > 1 << 30) return null;
    }
    return neg ? -v : v;
  }

  void _onInputChanged(String text) {
    final parsed = _parse(text, _system);
    if (parsed != null) setState(() => _value = parsed);
  }

  void _switchSystem(_NumSys s) {
    if (s == _system) return;
    setState(() {
      _system = s;
      _controller.text = _format(_value, _system);
    });
  }

  String _f(int n) => _system == _NumSys.dez ? n.toString() : _toDoz(n);

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final langTag = Localizations.localeOf(context).toLanguageTag();
    final t = AppColors.of(context);
    return DefaultTabController(
      length: kTheoryAreas.length + 1,
      child: Scaffold(
        appBar: AppBar(
          title: Text(l.conversionsTitle, style: const TextStyle(fontSize: 14)),
          bottom: TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            tabs: [
              Tab(text: l.infoListConverterEntry),
              for (final cat in kTheoryAreas)
                Tab(text: converterCategoryLabel(cat, l)),
            ],
          ),
        ),
        body: SafeArea(
          top: false,
          child: Column(
            children: [
              // The shared number-input card drives the per-category conversion
              // rows; it is meaningless on the converter-intro tab (index 0), so
              // hide it there.
              Builder(
                builder: (context) {
                  final controller = DefaultTabController.of(context);
                  return AnimatedBuilder(
                    animation: controller,
                    builder: (context, _) => controller.index == 0
                        ? const SizedBox.shrink()
                        : Padding(
                            padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
                            child: _inputCard(l, t),
                          ),
                  );
                },
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    _converterIntroTab(langTag, l, t),
                    for (final cat in kTheoryAreas) _areaTab(cat, langTag, t),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _areaTab(UnitCategory cat, String langTag, AppColors t) {
    final sections = unitTheory(cat, langTag);
    final sources = unitSources(cat, langTag);
    final image = theoryImageFor('unit/${cat.name}');
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _conversionRows(_rowsFor(cat), t),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Divider(color: t.cardBorder, height: 1),
          ),
          if (image != null) ChapterImageView(image),
          if (sections.isEmpty)
            Text(
              'Theorie folgt in Kürze.',
              style: TextStyle(color: t.textFaint, fontSize: 13),
            )
          else
            for (final s in sections) _theorySection(s, t),
          if (sources.isNotEmpty) _UnitSourceList(sources: sources),
        ],
      ),
    );
  }

  Widget _converterIntroTab(String langTag, AppLocalizations l, AppColors t) {
    final sections = converterIntro(langTag);
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (final s in sections) _theorySection(s, t),
          _conversionRows(_converterExampleRows(l), t),
        ],
      ),
    );
  }

  /// A small, mostly language-neutral worked example for the converter-intro
  /// tab: enter 1 ft 6 in and read it in both worlds (the { } bracket shows the
  /// counterpart). Only the leading category label is localized.
  List<String> _converterExampleRows(AppLocalizations l) {
    final length = converterCategoryLabel(UnitCategory.dist, l);
    return [
      '$length  →  ft 1   in 6',
      'DOZ   1 ft 6 in      { 457.2 mm }',
      'DEZ   457.2 mm       { 1 ft 6 in }',
    ];
  }

  Widget _theorySection(UnitTheorySection s, AppColors t) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            s.heading,
            style: TextStyle(
              color: t.textPrimary,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            s.body,
            style: TextStyle(
              color: t.textTertiary,
              fontSize: 13.5,
              height: 1.45,
            ),
          ),
        ],
      ),
    );
  }

  Widget _conversionRows(List<String> rows, AppColors t) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (final row in rows)
            Padding(
              padding: const EdgeInsets.only(bottom: 3),
              child: Text(
                row,
                style: TextStyle(
                  fontFamily: 'JetBrainsMono',
                  fontSize: 13,
                  height: 1.4,
                  color: t.textSecondary,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _inputCard(AppLocalizations l, AppColors t) {
    return Container(
      decoration: BoxDecoration(
        color: t.cardFill,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l.conversionsInputLabel,
              style: TextStyle(color: t.textMuted, fontSize: 12)),
          const SizedBox(height: 8),
          Directionality(
            textDirection: TextDirection.ltr,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    onChanged: _onInputChanged,
                    keyboardType: TextInputType.text,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        _system == _NumSys.dez
                            ? RegExp(r'[0-9\-]')
                            : RegExp(r'[0-9aAbB\-]'),
                      ),
                    ],
                    style: TextStyle(
                      fontFamily: 'JetBrainsMono',
                      fontSize: 18,
                      color: t.textPrimary,
                    ),
                    decoration: InputDecoration(
                      isDense: true,
                      filled: true,
                      fillColor: t.inputFill,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: t.cardBorder),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: t.cardBorder),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                _SystemToggle(selected: _system, onChanged: _switchSystem),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────────────
  // Conversion rows per area (symbolic notation stays international).
  // ─────────────────────────────────────────────────────────────────────

  List<String> _rowsFor(UnitCategory cat) {
    switch (cat) {
      case UnitCategory.count:
        return _countingRows();
      case UnitCategory.dist:
        return _lengthRows();
      case UnitCategory.area:
        return _areaRows();
      case UnitCategory.space:
        return _spaceRows();
      case UnitCategory.weight:
        return _weightRows();
      case UnitCategory.time:
        return _timeRows();
      case UnitCategory.angle:
        return _angleRows();
      case UnitCategory.price:
        return _currencyRows();
      case UnitCategory.temp:
        return _tempRows();
      default:
        return const [];
    }
  }

  List<String> _countingRows() {
    final n = _value;
    return [
      '${_f(n)} items  =  ${_f(n ~/ 12)} dz ${_f(n % 12)}',
      '${_f(n)} dz     =  ${_f(n ~/ 12)} gr ${_f(n % 12)} dz',
      '${_f(n)} gr     =  ${_f(n ~/ 12)} ggr ${_f(n % 12)} gr',
      '(1 dz = 12 ; 1 gr = 144 ; 1 ggr = 1728)',
    ];
  }

  List<String> _lengthRows() {
    final n = _value;
    return [
      '${_f(n)} in  =  ${_f(n ~/ 12)} ft ${_f(n % 12)} in       (× 12  dozenal ✓)',
      '${_f(n)} ft  =  ${_f(n ~/ 3)} yd ${_f(n % 3)} ft        (× 3)',
      '${_f(n)} yd  =  ${_f(n ~/ 1760)} mi ${_f(n % 1760)} yd  (× 1760)',
      '${_f(n)} ft  =  ${_f(n ~/ 6)} fathom ${_f(n % 6)} ft    (× 6 = ½ dz)',
      '(1 ft = 12 in ; 1 yd = 3 ft ; 1 mi = 1760 yd = 5280 ft)',
    ];
  }

  List<String> _areaRows() {
    final n = _value;
    return [
      '${_f(n)} sq ft   =  ${_f(n * 144)} sq in       (× 144)',
      '${_f(n)} sq yd   =  ${_f(n * 9)} sq ft         (× 9)',
      '${_f(n)} acre    =  ${_f(n * 43560)} sq ft     (× 43560)',
      '(1 sq ft = 144 sq in ; 1 sq yd = 9 sq ft ; 1 acre = 4840 sq yd)',
    ];
  }

  List<String> _spaceRows() {
    final n = _value;
    return [
      '${_f(n)} cu yd  =  ${_f(n * 27)} cu ft         (× 27)',
      '${_f(n)} cu ft  =  ${_f(n * 1728)} cu in       (× 1728 = 12³)',
      '(1 cu yd = 27 cu ft ; 1 cu ft = 1728 cu in)',
    ];
  }

  List<String> _weightRows() {
    final n = _value;
    return [
      '${_f(n)} oz tr  =  ${_f(n ~/ 12)} lb tr ${_f(n % 12)} oz tr   (× 12  dozenal ✓ ; troy)',
      '${_f(n)} lb     =  ${_f(n ~/ 14)} st ${_f(n % 14)} lb           (× 14)',
      '${_f(n)} st     =  ${_f(n ~/ 8)} cwt ${_f(n % 8)} st           (× 8)',
      '(1 lb tr = 12 oz tr · troy ; 1 st = 14 lb ; 1 cwt = 8 st = 112 lb)',
    ];
  }

  List<String> _timeRows() {
    final n = _value;
    return [
      '${_f(n)} s    =  ${_f(n ~/ 60)} min ${_f(n % 60)} s',
      '${_f(n)} min  =  ${_f(n ~/ 60)} h ${_f(n % 60)} min',
      '${_f(n)} h    =  ${_f(n ~/ 24)} d ${_f(n % 24)} h',
      '(60 = 5·12 ; 24 = 2·12 ; 12-h clock cycle)',
    ];
  }

  List<String> _angleRows() {
    final n = _value;
    final clockH = n ~/ 30;
    final clockMin = ((n % 30) * 2).toString().padLeft(2, '0');
    final rows = [
      '${_f(n)}°  =  ${_f(n ~/ 12)} × 12°  + ${_f(n % 12)}°',
      '${_f(n)}°  =  ${_f(n ~/ 30)} × 30°  + ${_f(n % 30)}°   (zodiac/clock-hour)',
      '${_f(n)}°  ÷  360°  =  ${(n / 360.0).toStringAsFixed(4)}',
      'clock-face position: $clockH:$clockMin (1 h = 30°)',
    ];
    // Slope / grade in percent — only meaningful for 0–90° (tan·100):
    // 0° = 0 %, 45° = 100 %, 90° = vertical (∞).
    if (n >= 0 && n <= 90) {
      final slope = n == 90
          ? '∞'
          : '${(math.tan(n * math.pi / 180) * 100).toStringAsFixed(1)} %';
      rows.add('${_f(n)}°  →  slope  =  $slope   (tan·100; 45° = 100 %)');
    } else {
      rows.add('slope (%)  →  for 0–90° only  (45° = 100 %)');
    }
    rows.add('(360 = 30·12)');
    return rows;
  }

  List<String> _currencyRows() {
    final n = _value;
    return [
      '${_f(n)} d   =  ${_f(n ~/ 12)} sh ${_f(n % 12)} d',
      '${_f(n)} sh  =  £${_f(n ~/ 20)}  ${_f(n % 20)} sh',
      '(1 sh = 12 d ; 1 £ = 20 sh = 240 d)',
    ];
  }

  List<String> _tempRows() {
    final c = _value.toDouble();
    return [
      '$_value °C  =  ${(c * 9 / 5 + 32).toStringAsFixed(1)} °F',
      '$_value °C  =  ${(c + 273.15).toStringAsFixed(2)} K',
      '(°F = °C · 9/5 + 32 ; K = °C + 273.15)',
    ];
  }
}

/// Tight Doz/Dez toggle for the input row — a 2-pill custom row matching the
/// dark theme better than Material's SegmentedButton.
class _SystemToggle extends StatelessWidget {
  final _NumSys selected;
  final ValueChanged<_NumSys> onChanged;

  const _SystemToggle({required this.selected, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final t = AppColors.of(context);
    Widget pill(_NumSys s, String label) {
      final active = s == selected;
      return GestureDetector(
        onTap: () => onChanged(s),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: active ? t.cardBorder : Colors.transparent,
            border: Border.all(
              color: active ? t.textFaint : t.cardBorder,
            ),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            label,
            style: TextStyle(
              fontFamily: 'JetBrainsMono',
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: active ? t.textPrimary : t.textFaint,
            ),
          ),
        ),
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        pill(_NumSys.dez, 'Dez'),
        const SizedBox(width: 4),
        pill(_NumSys.doz, 'Doz'),
      ],
    );
  }
}

/// The "Quellen" block at the foot of a unit-theory tab. Mirrors the chapter
/// source list: tappable title (opens in browser) + the two-axis rating in
/// words. Sources come from unitSources() / the dossiers in docs/research/.
class _UnitSourceList extends StatelessWidget {
  final List<Source> sources;
  const _UnitSourceList({required this.sources});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final t = AppColors.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(color: t.cardBorder, height: 24),
          Text(
            l.sourcesSectionTitle,
            style: TextStyle(
              color: t.textPrimary,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          for (final s in sources)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () => openExternalLink(context, s.url),
                    child: Text(
                      s.title,
                      style: TextStyle(
                        color: t.link,
                        fontSize: 13.5,
                        height: 1.35,
                        decoration: TextDecoration.underline,
                        decorationColor: t.link,
                      ),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '${reliabilityLabel(l, s.reliability)} · ${accessLabel(l, s.access)}',
                    style: TextStyle(
                      color: t.textFaint,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
