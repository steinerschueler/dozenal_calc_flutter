// Arriving at the unit converter carries a new main-calculator answer over,
// without ever overriding what the user did with an answer already carried.

import 'package:dozenal_calc_flutter/converter_state.dart';
import 'package:dozenal_calc_flutter/logic/unit_data.dart';
import 'package:flutter_test/flutter_test.dart';

ConverterState _withAnswer(double? Function() answer) =>
    ConverterState()..calcAnsProvider = answer;

void main() {
  test('a new answer lands in the empty input', () {
    final s = _withAnswer(() => 13)..carryNewCalcAns();
    expect(s.topLine.number, '11'); // 13 in the default base 12
    expect(s.isEntryEmpty, isFalse);
  });

  test('without an answer the converter stays empty', () {
    final s = _withAnswer(() => null)..carryNewCalcAns();
    expect(s.isEntryEmpty, isTrue);
  });

  test('AC stays empty when the same answer is still there', () {
    final s = _withAnswer(() => 13)
      ..carryNewCalcAns()
      ..allClear()
      ..carryNewCalcAns();
    expect(s.isEntryEmpty, isTrue);
  });

  test('an entry made here survives while the answer is unchanged', () {
    final s = _withAnswer(() => 13)
      ..carryNewCalcAns()
      ..allClear()
      ..inputDigit(5)
      ..carryNewCalcAns();
    expect(s.topLine.number, '5');
  });

  test('a newer answer replaces the entry and keeps the category', () {
    var answer = 13.0;
    final s = _withAnswer(() => answer)
      ..carryNewCalcAns()
      ..tapCategory(UnitCategory.dist);
    answer = 7;
    s.carryNewCalcAns();
    expect(s.topLine.number, '7');
    expect(s.activeCategory, UnitCategory.dist);
  });
}
