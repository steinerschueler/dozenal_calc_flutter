// The asset-converter screen (third calculator: precious metals & currencies):
// display over keypad, mirroring ConverterBody. Reuses ConverterDisplay (the
// display model is generic over ConverterLine). Since the pager rebuild this is
// page 3 of the calculator's horizontal PageView (swipe left twice from the
// main calculator); AssetBody is the embeddable content. AssetPage is the
// standalone route wrapper for widget tests / preview. Design:
// docs/asset-converter.md.

import 'package:flutter/material.dart';

import 'app_layout.dart';
import 'asset_keypad.dart';
import 'asset_labels.dart';
import 'asset_state.dart';
import 'converter_display.dart';
import 'l10n/app_localizations.dart';
import 'logic/unit_data.dart';

/// Embeddable asset-converter content: display + keypad, padded like the main
/// calculator body. Expects Scaffold/SafeArea/Directionality(ltr) from its host.
class AssetBody extends StatelessWidget {
  const AssetBody({super.key, required this.state});

  final AssetState state;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.all(12),
      child: LayoutBuilder(
        builder: (ctx, constraints) {
          final displayH = displayHeightFor(constraints.maxHeight);
          return ListenableBuilder(
            listenable: state,
            builder: (ctx, _) => Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: displayH,
                  child: ConverterDisplay(
                    topLine: state.topLine,
                    resultLine: state.resultLine,
                    worldLabel: state.base == 12 ? 'DOZ' : 'DEZ',
                    baseIsTen: state.base == 10,
                    // Single-world genera (currencies) have no metric/imperial
                    // axis, so their unit symbols must not flip hue with a
                    // leftover (disabled) world toggle — pin them to the
                    // Twelve-world violet (the duodecimal-money theme).
                    systemIsTen:
                        state.worldToggleEnabled && state.world == UnitWorld.metric,
                    inputCaret: state.inputLayout.caret,
                    onInputTapChar: state.handleInputTapAtChar,
                  ),
                ),
                const SizedBox(height: 14),
                Expanded(
                  child: AssetKeypad(
                    state: state,
                    equalsHint: l.converterEqualsHint,
                    valueHint: l.assetValueHint,
                    classLabelOf: (c) => assetClassLabel(c, l),
                    genusLabelOf: (g) => assetGenusLabel(g, l),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

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
