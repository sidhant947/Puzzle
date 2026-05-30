import 'dart:math';

class BaseShiftLevel {
  final String expression;
  final int result;
  final String explanation;

  BaseShiftLevel({required this.expression, required this.result, required this.explanation});
}

class BaseShiftEngine {
  final Random _random = Random();

  BaseShiftLevel generateLevel() {
    int type = _random.nextInt(3);
    if (type == 0) {
      // Binary + Decimal
      int binVal = _random.nextInt(15) + 1;
      int decVal = _random.nextInt(20) + 1;
      return BaseShiftLevel(
        expression: '${binVal.toRadixString(2)} (bin) + $decVal (dec)',
        result: binVal + decVal,
        explanation: '${binVal.toRadixString(2)} in binary is $binVal',
      );
    } else if (type == 1) {
      // Hex + Decimal
      int hexVal = _random.nextInt(32) + 1;
      int decVal = _random.nextInt(50) + 1;
      return BaseShiftLevel(
        expression: '0x${hexVal.toRadixString(16).toUpperCase()} + $decVal',
        result: hexVal + decVal,
        explanation: '0x${hexVal.toRadixString(16).toUpperCase()} is $hexVal',
      );
    } else {
      // Binary + Hex
      int binVal = _random.nextInt(15) + 1;
      int hexVal = _random.nextInt(15) + 1;
      return BaseShiftLevel(
        expression: '${binVal.toRadixString(2)} (bin) + 0x${hexVal.toRadixString(16).toUpperCase()}',
        result: binVal + hexVal,
        explanation: '${binVal.toRadixString(2)} is $binVal, 0x${hexVal.toRadixString(16).toUpperCase()} is $hexVal',
      );
    }
  }
}
