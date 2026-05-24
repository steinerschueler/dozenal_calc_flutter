// Tool page: shows how a numeric input decomposes into the classic
// imperial-12 unit systems (length, counting, currency, time, angle).
// Accessible from the Info list. The pedagogical pitch: these units are
// historical fossils of a culture that counted in dozens — and they
// become round numbers when written in base 12.
//
// Independent of the main calculator state: the page has its own input
// field with a Doz/Dez toggle, default value 144 (= 12² = 1 gross).
// Forces LTR for the section bodies so the symbolic unit notation
// (ft, in, sh, d, …) stays readable in RTL locales like Persian/Arabic.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'l10n/app_localizations.dart';

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

  static String _format(int n, _NumSys sys) {
    if (sys == _NumSys.dez) return n.toString();
    return _toDoz(n);
  }

  /// Decimal int → dozenal string with A/B for 10/11. Handles negatives.
  static String _toDoz(int n) {
    if (n == 0) return '0';
    final neg = n < 0;
    var x = neg ? -n : n;
    final buf = StringBuffer();
    final digits = <String>[];
    while (x > 0) {
      final r = x % 12;
      digits.add(r < 10 ? '$r' : (r == 10 ? 'A' : 'B'));
      x ~/= 12;
    }
    if (neg) buf.write('-');
    for (final d in digits.reversed) {
      buf.write(d);
    }
    return buf.toString();
  }

  static int? _parse(String s, _NumSys sys) {
    if (s.isEmpty) return null;
    if (sys == _NumSys.dez) return int.tryParse(s);
    // Dozenal: 0-9, A, B (case-insensitive)
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
      if (v > 1 << 30) return null; // soft overflow guard
    }
    return neg ? -v : v;
  }

  void _onInputChanged(String text) {
    final parsed = _parse(text, _system);
    if (parsed != null) {
      setState(() => _value = parsed);
    }
  }

  void _switchSystem(_NumSys s) {
    if (s == _system) return;
    setState(() {
      _system = s;
      _controller.text = _format(_value, _system);
    });
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(l.conversionsTitle,
            style: const TextStyle(fontSize: 14)),
        backgroundColor: const Color(0xFF1A1A1A),
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l.conversionsIntro,
                style: const TextStyle(
                  fontSize: 13.5,
                  height: 1.45,
                  color: Color(0xFFC8C8C8),
                ),
              ),
              const SizedBox(height: 16),
              _inputCard(l),
              const SizedBox(height: 8),
              _section(l.conversionsCountingHeading, _countingRows()),
              _section(l.conversionsLengthHeading, _lengthRows()),
              _section(l.conversionsWeightHeading, _weightRows()),
              _section(l.conversionsTimeHeading, _timeRows()),
              _section(l.conversionsAngleHeading, _angleRows()),
              const Padding(
                padding: EdgeInsets.only(top: 28, bottom: 4),
                child: Divider(color: Color(0xFF3C3C3C), height: 1),
              ),
              _section(l.conversionsCurrencyHeading, _currencyRows()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _inputCard(AppLocalizations l) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l.conversionsInputLabel,
            style: const TextStyle(color: Color(0xFFA0A0A0), fontSize: 12),
          ),
          const SizedBox(height: 8),
          // Force LTR so the digits and toggle stay in their expected
          // visual order even in RTL locales.
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
                    style: const TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 18,
                      color: Colors.white,
                    ),
                    decoration: const InputDecoration(
                      isDense: true,
                      filled: true,
                      fillColor: Color(0xFF1F1F1F),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF3C3C3C)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF3C3C3C)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                _SystemToggle(
                  selected: _system,
                  onChanged: _switchSystem,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _section(String title, List<String> rows) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Directionality(
            textDirection: TextDirection.ltr,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (final row in rows)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 3),
                    child: Text(
                      row,
                      style: const TextStyle(
                        fontFamily: 'monospace',
                        fontSize: 13,
                        height: 1.4,
                        color: Color(0xFFD8D8D8),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────────────
  // Conversion logic. Each section returns a list of monospace rows in
  // the multi-magnitude pattern: the input value is interpreted as
  // successive unit names along the 12-based ladder, each line
  // decomposing to the next higher unit. The Doz/Dez toggle drives both
  // input parsing and all output numbers, so flipping to Doz makes the
  // dozenal cleanness of these units immediately visible. Symbolic forms
  // (ft, in, sh, d, h, min, s, °, £, ggr, gr, dz, oz tr, lb tr) stay in
  // international notation across all locales for compactness.
  // ─────────────────────────────────────────────────────────────────────

  /// Format an int per the current Doz/Dez toggle.
  String _f(int n) =>
      _system == _NumSys.dez ? n.toString() : _toDoz(n);

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
      '(1 ft = 12 in ; 1 yd = 3 ft ; 1 mi = 1760 yd = 5280 ft ; 1 fathom = 6 ft)',
    ];
  }

  List<String> _weightRows() {
    final n = _value;
    return [
      '${_f(n)} oz tr  =  ${_f(n ~/ 12)} lb tr ${_f(n % 12)} oz tr   (× 12  dozenal ✓ ; troy)',
      '${_f(n)} lb     =  ${_f(n ~/ 14)} st ${_f(n % 14)} lb           (× 14 ; avoirdupois)',
      '${_f(n)} st     =  ${_f(n ~/ 8)} cwt ${_f(n % 8)} st           (× 8)',
      '${_f(n)} cwt    =  ${_f(n ~/ 20)} long ton ${_f(n % 20)} cwt    (× 20)',
      '(1 lb tr = 12 oz tr · troy/precious ; 1 st = 14 lb ; 1 cwt = 8 st = 112 lb ; 1 long ton = 20 cwt = 2240 lb)',
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
    // Clock position is always read in decimal (universal convention):
    // each clock-hour = 30°, each clock-minute = 0.5° of arc.
    final clockH = n ~/ 30;
    final clockMin = ((n % 30) * 2).toString().padLeft(2, '0');
    return [
      '${_f(n)}°  =  ${_f(n ~/ 12)} × 12°  + ${_f(n % 12)}°',
      '${_f(n)}°  =  ${_f(n ~/ 30)} × 30°  + ${_f(n % 30)}°   (zodiac/clock-hour units)',
      '${_f(n)}°  ÷  360°  =  ${(n / 360.0).toStringAsFixed(4)}',
      'clock-face position: $clockH:$clockMin (1 h = 30°)',
      '(360 = 30·12)',
    ];
  }

  List<String> _currencyRows() {
    final n = _value;
    return [
      '${_f(n)} d   =  ${_f(n ~/ 12)} sh ${_f(n % 12)} d',
      '${_f(n)} sh  =  £${_f(n ~/ 20)}  ${_f(n % 20)} sh',
      '(1 sh = 12 d ; 1 £ = 20 sh = 240 d ; £/sh ratio is not 12-based)',
    ];
  }
}

/// Tight Doz/Dez toggle for the input row. Material's SegmentedButton is
/// heavyweight here; this is a 2-pill custom row that matches the dark
/// theme better.
class _SystemToggle extends StatelessWidget {
  final _NumSys selected;
  final ValueChanged<_NumSys> onChanged;

  const _SystemToggle({required this.selected, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    Widget pill(_NumSys s, String label) {
      final active = s == selected;
      return GestureDetector(
        onTap: () => onChanged(s),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: active ? const Color(0xFF3C3C3C) : Colors.transparent,
            border: Border.all(
              color: active
                  ? const Color(0xFF8C8C8C)
                  : const Color(0xFF3C3C3C),
            ),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            label,
            style: TextStyle(
              fontFamily: 'monospace',
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: active ? Colors.white : const Color(0xFF8C8C8C),
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
