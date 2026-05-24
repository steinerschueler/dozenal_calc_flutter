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
              _section(l.conversionsLengthHeading, _lengthRows()),
              _section(l.conversionsCountingHeading, _countingRows()),
              _section(l.conversionsCurrencyHeading, _currencyRows()),
              _section(l.conversionsTimeHeading, _timeRows()),
              _section(l.conversionsAngleHeading, _angleRows()),
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
  // Conversion logic. Each section returns a small list of pre-formatted
  // monospace rows. Symbolic forms (ft, in, sh, d, h, min, s, °, £) are
  // kept in international notation across all locales for compactness.
  // ─────────────────────────────────────────────────────────────────────

  List<String> _lengthRows() {
    final n = _value;
    final neg = n < 0;
    final abs = neg ? -n : n;
    final ft = abs ~/ 12;
    final inches = abs % 12;
    final sign = neg ? '-' : '';
    return [
      '$sign$abs in  =  $sign$ft ft $inches in',
      '         in doz: ${_toDoz(n)} in  =  ${_toDoz(neg ? -ft : ft)} ft ${_toDoz(inches)} in',
    ];
  }

  List<String> _countingRows() {
    final n = _value;
    final neg = n < 0;
    final abs = neg ? -n : n;
    final ggr = abs ~/ 1728;
    final gr = (abs % 1728) ~/ 144;
    final dz = (abs % 144) ~/ 12;
    final it = abs % 12;
    final sign = neg ? '-' : '';
    return [
      '$sign$abs  =  $sign$ggr ggr · $gr gr · $dz dz · $it',
      '   in doz: ${_toDoz(n)}  =  ${_toDoz(neg ? -ggr : ggr)} ggr · ${_toDoz(gr)} gr · ${_toDoz(dz)} dz · ${_toDoz(it)}',
      '   (1 dz = 12 ; 1 gr = 144 ; 1 ggr = 1728)',
    ];
  }

  List<String> _currencyRows() {
    final n = _value;
    final neg = n < 0;
    final abs = neg ? -n : n;
    final pounds = abs ~/ 240;
    final shillings = (abs % 240) ~/ 12;
    final pence = abs % 12;
    final sign = neg ? '-' : '';
    return [
      '$sign$abs d  =  $sign£$pounds · $shillings sh · $pence d',
      '       in doz: ${_toDoz(n)} d  =  £${_toDoz(neg ? -pounds : pounds)} · ${_toDoz(shillings)} sh · ${_toDoz(pence)} d',
      '       (1 sh = 12 d ; 1 £ = 20 sh = 240 d)',
    ];
  }

  List<String> _timeRows() {
    final n = _value;
    final neg = n < 0;
    final abs = neg ? -n : n;
    final secMin = abs ~/ 60;
    final secRem = abs % 60;
    final hDay = abs ~/ 24;
    final hRem = abs % 24;
    final sign = neg ? '-' : '';
    return [
      '$sign$abs s    =  $sign$secMin min $secRem s',
      '$sign$abs min  =  $sign$secMin h $secRem min',
      '$sign$abs h    =  $sign$hDay d $hRem h',
      '(60 = 5·12 ; 24 = 2·12 ; clock cycles in 12-h)',
    ];
  }

  List<String> _angleRows() {
    final n = _value;
    final thirtieths = n / 30.0;
    return [
      '$n°  ÷  360°  =  ${(n / 360.0).toStringAsFixed(4)}',
      '$n°  ÷  30°   =  ${thirtieths.toStringAsFixed(2)}   (1/12 circle units)',
      '$n°  ÷  12    =  ${(n / 12.0).toStringAsFixed(2)}   (12° steps)',
      'clock-hand position: ${thirtieths.toStringAsFixed(2)} h',
      'in doz: ${_toDoz(n)}°',
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
