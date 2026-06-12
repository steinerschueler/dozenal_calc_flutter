// The unit-converter screen: display over keypad, mirroring the main
// calculator's _CalcScaffold body layout (displayHeightFor + Expanded keypad,
// forced LTR). Pushed from "Theory and More"; the keypad's calculator icon
// pops back, the (i) button opens the Imperial-12 reference page.
//
// Owns its own ConverterState; a ListenableBuilder rebuilds display + keypad
// on every state change. Design: docs/unit-converter.md.

import 'package:flutter/material.dart';

import 'app_layout.dart';
import 'converter_display.dart';
import 'converter_keypad.dart';
import 'converter_state.dart';
import 'info_pages.dart';
import 'l10n/app_localizations.dart';
import 'logic/unit_data.dart';
import 'unit_descriptions/unit_descriptions.dart';
import 'unit_labels.dart';

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
    final langTag = Localizations.localeOf(context).toLanguageTag();
    // Background comes from the MaterialApp's scaffoldBackgroundColor
    // (palette-derived) — same convention as the themed info pages.
    return Scaffold(
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
                              builder: (_) => const InfoListPage(),
                            ),
                          ),
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
          ),
        ),
      ),
    );
  }
}
