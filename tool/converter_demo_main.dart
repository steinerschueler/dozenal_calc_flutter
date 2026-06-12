// Throwaway demo entrypoint for eyeballing the converter on a real device /
// simulator (real fonts + Material icons, which the flutter_test preview can't
// show). Boots straight into the converter UI seeded to dist / ft so the
// screen is interesting on first frame; still fully live (tap to drive it).
//
//   flutter run -t tool/converter_demo_main.dart -d <device-id>

import 'package:flutter/material.dart';

import 'package:dozenal_calc_flutter/app_layout.dart';
import 'package:dozenal_calc_flutter/converter_display.dart';
import 'package:dozenal_calc_flutter/converter_keypad.dart';
import 'package:dozenal_calc_flutter/converter_state.dart';
import 'package:dozenal_calc_flutter/logic/unit_data.dart';

void main() {
  final state = ConverterState()
    ..inputDigit(1)
    ..inputDigit(0)
    ..inputDigit(0)
    ..tapCategory(UnitCategory.dist);
  state.tapMagnitude(
      state.magnitudeUnits.firstWhere((u) => u.symbol == 'ft'));

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(brightness: Brightness.dark),
    home: Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: LayoutBuilder(
              builder: (ctx, c) {
                final displayH = displayHeightFor(c.maxHeight);
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
                          worldLabel: state.world == UnitWorld.imperial
                              ? 'DOZ'
                              : 'DEZ',
                        ),
                      ),
                      const SizedBox(height: 14),
                      Expanded(
                        child: ConverterKeypad(state: state),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    ),
  ));
}
