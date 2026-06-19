// Rate editor for the value calculator (Werterechner, Phase 2). Lists the
// baked snapshot rates — currencies (per 1 pivot) and metal spot prices (per
// troy ounce) — each editable; edits persist as overrides in the RateStore.
// A per-row and a global reset return to the snapshot. The "Stand: <date>"
// header makes the snapshot's age explicit.
//
// This is a settings-style page (locale direction, an AppBar, a TextField for
// numeric entry) — unlike the custom-painted calculators it may use a plain
// text field. Pushed from the asset keypad's "Kurse" key.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_theme.dart';
import 'asset_labels.dart';
import 'l10n/app_localizations.dart';
import 'logic/asset_data.dart';
import 'rate_store.dart';

class RatesPage extends StatefulWidget {
  const RatesPage({super.key, required this.store});

  final RateStore store;

  @override
  State<RatesPage> createState() => _RatesPageState();
}

class _RatesPageState extends State<RatesPage> {
  final Map<String, TextEditingController> _cur = {};
  final Map<String, TextEditingController> _met = {};

  RateStore get _s => widget.store;

  @override
  void initState() {
    super.initState();
    for (final k in _s.currencyKeys) {
      _cur[k] = TextEditingController(text: _fmt(_s.currencyRate(k)));
    }
    for (final k in _s.metalKeys) {
      _met[k] = TextEditingController(text: _fmt(_s.metalSpot(k)));
    }
  }

  @override
  void dispose() {
    for (final c in _cur.values) {
      c.dispose();
    }
    for (final c in _met.values) {
      c.dispose();
    }
    super.dispose();
  }

  static String _fmt(double v) {
    if (!v.isFinite) return '';
    if (v == v.roundToDouble()) return v.toStringAsFixed(0);
    return v.toString();
  }

  /// Metal genus → localized name; currency → ISO code (international).
  String _metalLabel(String key, AppLocalizations l) {
    for (final g in generaOf(AssetClass.metal)) {
      if (g.key == key) return assetGenusLabel(g, l);
    }
    return key.toUpperCase();
  }

  String _currencySymbol(String key) {
    for (final g in generaOf(AssetClass.currency)) {
      if (g.key == key) return g.units.first.symbol;
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final t = AppColors.of(context);
    final pivot = _s.pivot.toUpperCase();
    return Scaffold(
      appBar: AppBar(title: Text(l.assetRatesTitle)),
      body: SafeArea(
        top: false,
        child: AnimatedBuilder(
          animation: _s,
          builder: (ctx, _) => ListView(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
            children: [
              Text(
                l.assetRatesAsOf(_s.asOf),
                style: TextStyle(
                    color: t.textSecondary,
                    fontSize: 13,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 6),
              Text(
                l.assetRatesSourceHint,
                style: TextStyle(color: t.textMuted, fontSize: 12, height: 1.35),
              ),
              const SizedBox(height: 18),
              _sectionHeader(l.assetRatesCurrencies(pivot), t),
              for (final k in _s.currencyKeys)
                _rateRow(
                  label: '${k.toUpperCase()}  ${_currencySymbol(k)}'.trim(),
                  controller: _cur[k]!,
                  overridden: _s.hasCurrencyOverride(k),
                  onChanged: (v) => _s.setCurrencyOverride(k, v),
                  onReset: () {
                    _s.clearCurrencyOverride(k);
                    _cur[k]!.text = _fmt(_s.snapshotCurrencyRate(k));
                  },
                  l: l,
                  t: t,
                ),
              const SizedBox(height: 18),
              _sectionHeader(l.assetRatesMetals(pivot), t),
              for (final k in _s.metalKeys)
                _rateRow(
                  label: _metalLabel(k, l),
                  controller: _met[k]!,
                  overridden: _s.hasMetalOverride(k),
                  onChanged: (v) => _s.setMetalOverride(k, v),
                  onReset: () {
                    _s.clearMetalOverride(k);
                    _met[k]!.text = _fmt(_s.snapshotMetalSpot(k));
                  },
                  l: l,
                  t: t,
                ),
              const SizedBox(height: 24),
              if (_s.hasAnyOverride)
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: TextButton.icon(
                    onPressed: () {
                      _s.clearAll();
                      for (final k in _s.currencyKeys) {
                        _cur[k]!.text = _fmt(_s.snapshotCurrencyRate(k));
                      }
                      for (final k in _s.metalKeys) {
                        _met[k]!.text = _fmt(_s.snapshotMetalSpot(k));
                      }
                    },
                    icon: Icon(Icons.restore, color: t.link),
                    label: Text(l.assetRatesResetAll,
                        style: TextStyle(color: t.link)),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionHeader(String text, AppColors t) => Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Text(
          text,
          style: TextStyle(
              color: t.textPrimary,
              fontSize: 15,
              fontWeight: FontWeight.bold),
        ),
      );

  Widget _rateRow({
    required String label,
    required TextEditingController controller,
    required bool overridden,
    required ValueChanged<double> onChanged,
    required VoidCallback onReset,
    required AppLocalizations l,
    required AppColors t,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                  color: overridden ? t.accentGold : t.textPrimary,
                  fontSize: 14),
            ),
          ),
          SizedBox(
            width: 120,
            child: TextField(
              controller: controller,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              textAlign: TextAlign.end,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9.,]')),
              ],
              style: TextStyle(color: t.textPrimary, fontSize: 14),
              decoration: InputDecoration(
                isDense: true,
                filled: true,
                fillColor: t.inputFill,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(color: t.cardBorder),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(
                      color: overridden ? t.accentGold : t.cardBorder),
                ),
              ),
              onChanged: (s) {
                final v = double.tryParse(s.replaceAll(',', '.'));
                if (v != null && v.isFinite && v > 0) onChanged(v);
              },
            ),
          ),
          SizedBox(
            width: 40,
            child: overridden
                ? IconButton(
                    tooltip: l.assetRatesReset,
                    icon: Icon(Icons.undo, size: 18, color: t.textMuted),
                    onPressed: onReset,
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
