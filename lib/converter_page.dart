// The unit-converter screen: display over keypad, mirroring the main
// calculator's _CalcScaffold body layout (displayHeightFor + Expanded keypad,
// forced LTR).
//
// Since the pager rebuild the converter is page 2 of the calculator's
// horizontal PageView (swipe left from the main calculator); ConverterBody is
// the embeddable content for that. The ConverterPage route wrapper remains
// for standalone use (widget tests, preview) and owns a private state there;
// in the app the scaffold owns a long-lived ConverterState so input survives
// page swipes — and wires the Ans/CONV result bridge between the two
// calculators. Design: docs/unit-converter.md.

import 'package:flutter/material.dart';

import 'app_layout.dart';
import 'converter_display.dart';
import 'converter_keypad.dart';
import 'converter_state.dart';
import 'l10n/app_localizations.dart';
import 'logic/unit_data.dart';
import 'unit_descriptions/unit_descriptions.dart';
import 'unit_labels.dart';

/// Embeddable converter content: display + keypad, padded like the main
/// calculator body. Expects Scaffold/SafeArea/Directionality(ltr) from its
/// host (the calc pager or the ConverterPage route wrapper). Navigation
/// affordances live elsewhere since the system keys took the equals-row
/// flanks: back = swipe right (pager), info = the main calculator's (i).
class ConverterBody extends StatelessWidget {
  const ConverterBody({super.key, required this.state});

  final ConverterState state;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final langTag = Localizations.localeOf(context).toLanguageTag();
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
                    // The badge shows the BASE (the system shows itself via
                    // the coloured unit symbols + the met/imp keys).
                    worldLabel: state.base == 12 ? 'DOZ' : 'DEZ',
                    baseIsTen: state.base == 10,
                    systemIsTen: state.world == UnitWorld.metric,
                    inputCaret: state.inputLayout.caret,
                    onInputTapChar: state.handleInputTapAtChar,
                  ),
                ),
                const SizedBox(height: 14),
                Expanded(
                  child: ConverterKeypad(
                    state: state,
                    equalsHint: l.converterEqualsHint,
                    categoryLabelOf: (c) => converterCategoryLabel(c, l),
                    unitInfoOf: (cat, symbol) => (
                      desc: unitDescription(cat, symbol, langTag) ?? '',
                      // Pointer assembled from already-localized labels so
                      // the nav terms always match the app; only the
                      // lead-in (unitInfoMore) is translated per language.
                      more: '${l.unitInfoMore} → ${l.infoListUnitsExpansion}'
                          ' → ${l.conversionsTitle}'
                          ' → ${converterCategoryLabel(cat, l)}',
                    ),
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

/// Standalone route wrapper (widget tests, fallback without a calc scaffold):
/// owns a private ConverterState — without a bridge provider, so the Ans key
/// stays inert there.
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
    // Background comes from the MaterialApp's scaffoldBackgroundColor
    // (palette-derived) — same convention as the themed info pages.
    return Scaffold(
      body: SafeArea(
        // No AppBar here (it's a full-screen calculator), so the top inset
        // must be respected or the display slides under the status bar /
        // notch — unlike the AppBar'd info pages which use top: false.
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: ConverterBody(state: _state),
        ),
      ),
    );
  }
}
