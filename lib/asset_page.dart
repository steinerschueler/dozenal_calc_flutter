// The asset-converter screen (third calculator: precious metals & currencies):
// display over keypad, mirroring ConverterBody. Reuses ConverterDisplay (the
// display model is generic over ConverterLine). Since the pager rebuild this is
// page 3 of the calculator's horizontal PageView (swipe left twice from the
// main calculator); AssetBody is the embeddable content. AssetPage is the
// standalone route wrapper for widget tests / preview. Design:
// docs/asset-converter.md.

import 'package:dozenal_calc_flutter/app_layout.dart';
import 'package:dozenal_calc_flutter/app_theme.dart';
import 'package:dozenal_calc_flutter/asset_keypad.dart';
import 'package:dozenal_calc_flutter/asset_labels.dart';
import 'package:dozenal_calc_flutter/asset_state.dart';
import 'package:dozenal_calc_flutter/converter_display.dart';
import 'package:dozenal_calc_flutter/l10n/app_localizations.dart';
import 'package:dozenal_calc_flutter/logic/price_history.dart';
import 'package:dozenal_calc_flutter/logic/unit_data.dart';
import 'package:dozenal_calc_flutter/price_chart.dart';
import 'package:dozenal_calc_flutter/price_sources_page.dart';
import 'package:dozenal_calc_flutter/rates_page.dart';
import 'package:flutter/material.dart';

/// Embeddable asset-converter content: display + keypad, padded like the main
/// calculator body. Expects Scaffold/SafeArea/Directionality(ltr) from its host.
class AssetBody extends StatelessWidget {
  const AssetBody({
    required this.state,
    super.key,
    this.onMenuTap,
    this.onSwitchTap,
  });

  final AssetState state;
  final VoidCallback? onMenuTap;
  final VoidCallback? onSwitchTap;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return Padding(
      padding: calculatorPagePadding(context),
      child: LayoutBuilder(
        builder: (ctx, constraints) {
          final low = isLowScreen(ctx);
          final displayH = low
              ? lowDisplayHeightFor(constraints.maxHeight)
              : displayHeightFor(constraints.maxHeight);
          // Listen to the rate store too, so an edited rate updates the value
          // line immediately (the store is a separate ChangeNotifier).
          final rates = state.rates;
          final listenable = rates == null
              ? state
              : Listenable.merge([state, rates]);
          return ListenableBuilder(
            listenable: listenable,
            builder: (ctx, _) {
              final t = AppColors.of(ctx);
              // In value mode the result line shows the ≈ value in the chosen
              // target currency instead of the exact ladder, with a small
              // "≈ rate-based · as of <date>" note.
              final inValue = state.valueMode;
              final asOf = state.rateAsOf;
              final display = ConverterDisplay(
                topLine: state.topLine,
                resultLine: inValue ? state.valueLine : state.resultLine,
                resultPrefix: inValue ? '≈ ' : '= ',
                worldLabel: state.base == 12 ? 'DOZ' : 'DEZ',
                baseIsTen: state.base == 10,
                // Single-world genera (currencies) have no metric/
                // imperial axis, so their unit symbols must not flip hue
                // with a leftover (disabled) world toggle — pin them to
                // the Twelve-world violet (the duodecimal-money theme).
                systemIsTen:
                    state.worldToggleEnabled && state.world == UnitWorld.metric,
                inputCaret: state.inputLayout.caret,
                onInputTapChar: state.handleInputTapAtChar,
                emptyHint: state.isEntryEmpty ? l.converterEmptyHint : null,
                sideBySide: low,
              );
              // A low screen with the chart open: the chart takes the page,
              // and the display shares its top band with the series choice.
              if (low && state.chartOpen) {
                return _chart(
                  ctx,
                  l,
                  headerEnd: display,
                  headerHeight: displayH,
                );
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: displayH, child: display),
                  if (inValue && asOf != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 3, right: 2),
                      child: Text(
                        l.assetValueNote(asOf),
                        textAlign: TextAlign.end,
                        style: TextStyle(fontSize: 11, color: t.textFaint),
                      ),
                    ),
                  SizedBox(height: calculatorDisplayGap(context)),
                  Expanded(
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      child: state.chartOpen
                          ? _chart(ctx, l)
                          : AssetKeypad(
                              key: const ValueKey('keypad'),
                              state: state,
                              onMenuTap: onMenuTap,
                              onSwitchTap: onSwitchTap,
                              equalsHint: l.converterEqualsHint,
                              valueHint: l.assetValueHint,
                              valueLabel: l.assetValueKey,
                              ratesLabel: l.assetRatesKey,
                              chartLabel: l.assetChartKey,
                              onRatesTap: state.rates == null
                                  ? null
                                  : () => Navigator.of(ctx).push(
                                      MaterialPageRoute<void>(
                                        builder: (_) =>
                                            RatesPage(store: state.rates!),
                                      ),
                                    ),
                              classLabelOf: (c) => assetClassLabel(c, l),
                              genusLabelOf: (g) => assetGenusLabel(g, l),
                            ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }

  Widget _chart(
    BuildContext context,
    AppLocalizations l, {
    Widget? headerEnd,
    double? headerHeight,
  }) => PriceChart(
    key: const ValueKey('chart'),
    base: state.base,
    seriesLabel: (id) => _seriesLabel(id, l),
    unitLabel: (id) => _seriesRelLabel(id, l),
    readoutLabel: (id, value) => switch (id) {
      PriceSeriesId.gold => l.priceReadGold(value),
      PriceSeriesId.silver => l.priceReadSilver(value),
      PriceSeriesId.wheat => l.priceReadWheat(value),
    },
    epochLabel: (epoch) => switch (epoch) {
      ChartEpoch.antiquity => l.priceEpochAntiquity,
      ChartEpoch.middleAges => l.priceEpochMiddleAges,
      ChartEpoch.modern => l.priceEpochModern,
      ChartEpoch.present => l.priceEpochPresent,
    },
    allLabel: l.priceEpochAll,
    sourcesLabel: l.priceSourcesLabel,
    caption: l.priceChartCaption,
    eraReconstructedLabel: l.priceEraAnchor,
    onClose: state.toggleChart,
    onSourcesTap: () => Navigator.of(
      context,
    ).push(MaterialPageRoute<void>(builder: (_) => const PriceSourcesPage())),
    headerEnd: headerEnd,
    headerHeight: headerHeight,
  );
}

/// Localized toggle label for a price-chart series (short tab name).
String _seriesLabel(PriceSeriesId id, AppLocalizations l) => switch (id) {
  PriceSeriesId.gold => l.priceSeriesGold,
  PriceSeriesId.silver => l.priceSeriesSilver,
  PriceSeriesId.wheat => l.priceSeriesWheat,
};

/// Localized relationship caption (gold-referenced) for the value axis.
String _seriesRelLabel(PriceSeriesId id, AppLocalizations l) => switch (id) {
  PriceSeriesId.gold => l.priceRelGold,
  PriceSeriesId.silver => l.priceRelSilver,
  PriceSeriesId.wheat => l.priceRelWheat,
};

/// Standalone route wrapper (widget tests, preview): owns a private AssetState.
class AssetPage extends StatefulWidget {
  const AssetPage({super.key});

  @override
  State<AssetPage> createState() => _AssetPageState();
}

class _AssetPageState extends State<AssetPage> {
  final AssetState _state = AssetState();

  @override
  void dispose() {
    _state.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: AssetBody(state: _state),
        ),
      ),
    );
  }
}
