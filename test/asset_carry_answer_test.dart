// Arriving at the value calculator carries a new main-calculator answer over,
// without ever overriding what the user did with an answer already carried.

import 'package:dozenal_calc_flutter/asset_state.dart';
import 'package:dozenal_calc_flutter/logic/asset_data.dart';
import 'package:flutter_test/flutter_test.dart';

AssetState _withAnswer(double? Function() answer) =>
    AssetState()..calcAnsProvider = answer;

void main() {
  test('a new answer lands in the empty input', () {
    final s = _withAnswer(() => 13)..carryNewCalcAns();
    expect(s.topLine.number, '11'); // 13 in the default base 12
  });

  test('the entry counts as empty until something is entered', () {
    final s = _withAnswer(() => null);
    expect(s.isEntryEmpty, isTrue);
    s.inputDigit(5);
    expect(s.isEntryEmpty, isFalse);
  });

  test('without an answer the input stays empty', () {
    final s = _withAnswer(() => null)..carryNewCalcAns();
    expect(s.topLine.number, '0'); // the empty placeholder
  });

  test('AC stays empty when the same answer is still there', () {
    final s = _withAnswer(() => 13)
      ..carryNewCalcAns()
      ..allClear()
      ..carryNewCalcAns();
    expect(s.topLine.number, '0'); // the empty placeholder
  });

  test('an entry made here survives while the answer is unchanged', () {
    final s = _withAnswer(() => 13)
      ..carryNewCalcAns()
      ..allClear()
      ..inputDigit(5)
      ..carryNewCalcAns();
    expect(s.topLine.number, '5');
  });

  test('a newer answer replaces the entry and keeps the class', () {
    var answer = 13.0;
    final s = _withAnswer(() => answer)
      ..carryNewCalcAns()
      ..tapClass(AssetClass.metal);
    answer = 7;
    s.carryNewCalcAns();
    expect(s.topLine.number, '7');
    expect(s.activeClass, AssetClass.metal);
  });
}
