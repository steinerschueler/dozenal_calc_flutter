// The unit-converter screen: display over keypad, mirroring the main
// calculator's _CalcScaffold body layout (displayHeightFor + Expanded keypad,
// forced LTR). Pushed from "Theory and More"; the keypad's calculator icon
// pops back, the (i) button opens the Imperial-12 reference page.
//
// Owns its own ConverterState; a ListenableBuilder rebuilds display + keypad
// on every state change. Design: docs/unit-converter.md.

import 'package:flutter/material.dart';

import 'app_layout.dart';
import 'conversions_page.dart';
import 'converter_display.dart';
import 'converter_keypad.dart';
import 'converter_state.dart';
import 'l10n/app_localizations.dart';
import 'logic/unit_data.dart';

/// Localized label for a unit category (the keypad's Set 3/4/8/9 tiles).
String converterCategoryLabel(UnitCategory c, AppLocalizations l) {
  switch (c) {
    case UnitCategory.count:
      return l.unitCatCount;
    case UnitCategory.dist:
      return l.unitCatDist;
    case UnitCategory.area:
      return l.unitCatArea;
    case UnitCategory.space:
      return l.unitCatSpace;
    case UnitCategory.weight:
      return l.unitCatWeight;
    case UnitCategory.time:
      return l.unitCatTime;
    case UnitCategory.angle:
      return l.unitCatAngle;
    case UnitCategory.price:
      return l.unitCatPrice;
    case UnitCategory.temp:
      return l.unitCatTemp;
    case UnitCategory.press:
      return l.unitCatPress;
    case UnitCategory.force:
      return l.unitCatForce;
    case UnitCategory.work:
      return l.unitCatWork;
    case UnitCategory.power:
      return l.unitCatPower;
    case UnitCategory.cook:
      return l.unitCatCook;
    case UnitCategory.liquid:
      return l.unitCatLiquid;
    case UnitCategory.moment:
      return l.unitCatMoment;
  }
}

class ConverterPage extends StatefulWidget {
  const ConverterPage({super.key});

  @override
  State<ConverterPage> createState() => _ConverterPageState();
}

class _ConverterPageState extends State<ConverterPage> {
  final ConverterState _state = ConverterState();

  @override
  void dispose() {
    _state.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      body: SafeArea(
        // No AppBar here (it's a full-screen calculator), so the top inset
        // must be respected or the display slides under the status bar /
        // notch — unlike the AppBar'd info pages which use top: false.
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: LayoutBuilder(
              builder: (ctx, constraints) {
                final displayH = displayHeightFor(constraints.maxHeight);
                return ListenableBuilder(
                  listenable: _state,
                  builder: (ctx, _) => Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: displayH,
                        child: ConverterDisplay(
                          topLine: _state.topLine,
                          resultLine: _state.resultLine,
                          worldLabel: _state.world == UnitWorld.imperial
                              ? 'DOZ'
                              : 'DEZ',
                          inputCaret: _state.inputLayout.caret,
                          onInputTapChar: _state.handleInputTapAtChar,
                        ),
                      ),
                      const SizedBox(height: 14),
                      Expanded(
                        child: ConverterKeypad(
                          state: _state,
                          onBack: () => Navigator.of(context).pop(),
                          onInfo: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => const ConversionsPage(),
                            ),
                          ),
                          categoryLabelOf: (c) => converterCategoryLabel(c, l),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
