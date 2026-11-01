// Editing paths of AssetState that decide which value a user ends up pricing:
// the memory register, compound terms, scalar operators and decimal entry.

import 'package:dozenal_calc_flutter/asset_state.dart';
import 'package:dozenal_calc_flutter/logic/asset_data.dart';
import 'package:dozenal_calc_flutter/logic/unit_data.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AssetState state;
  late Unit troyOunce;

  void enterDigits(List<int> digits) => digits.forEach(state.inputDigit);

  setUp(() {
    state = AssetState()..setBase(10);
    final gold = generaOf(
      AssetClass.metal,
    ).firstWhere((genus) => genus.key == 'gold');
    troyOunce = gold.unitBySymbol('oz t')!;
    state
      ..tapClass(AssetClass.metal)
      ..tapGenus(gold);
  });

  group('memory register', () {
    test('stores the typed number and recalls it', () {
      enterDigits([7]);
      state
        ..memStore()
        ..allClear()
        ..memRecall();
      expect(state.pendingInput, '7');
    });

    test('survives all clear but not memory clear', () {
      enterDigits([7]);
      state
        ..memStore()
        ..allClear();
      expect(state.memoryAvailable, isTrue);
      state.memClear();
      expect(state.memoryAvailable, isFalse);
    });

    test('recall without a stored value changes nothing', () {
      state.memRecall();
      expect(state.pendingInput, isEmpty);
    });
  });

  group('compound terms', () {
    test('a subtracted term lowers the total', () {
      enterDigits([3]);
      state
        ..tapMagnitude(troyOunce)
        ..setSubtract(true);
      enterDigits([1]);
      state.tapMagnitude(troyOunce);
      expect(troyOunce.fromBase(state.totalBase), closeTo(2, 1e-9));
    });

    test('delete reopens the last term without its last digit', () {
      enterDigits([1, 2]);
      state
        ..tapMagnitude(troyOunce)
        ..del();
      expect(state.termCount, 0);
      expect(state.pendingInput, '1');
    });
  });

  group('scalar operators', () {
    test('collapse a committed term into editable digits', () {
      enterDigits([3]);
      state
        ..tapMagnitude(troyOunce)
        ..inputScalarOp('×');
      expect(state.termCount, 0);
      expect(state.pendingInput, '3×');
    });

    test('do nothing on empty entry', () {
      state.inputScalarOp('×');
      expect(state.pendingInput, isEmpty);
    });
  });

  group('decimal entry', () {
    test('adds a leading zero to an empty number', () {
      state.inputDecimal();
      expect(state.pendingInput, '0.');
    });

    test('refuses a second point in one number', () {
      enterDigits([1]);
      state
        ..inputDecimal()
        ..inputDecimal();
      expect(state.pendingInput, '1.');
    });

    test('allows a point in each operand', () {
      enterDigits([1]);
      state
        ..inputDecimal()
        ..inputScalarOp('×')
        ..inputDecimal();
      expect(state.pendingInput, '1.×0.');
    });
  });
}
