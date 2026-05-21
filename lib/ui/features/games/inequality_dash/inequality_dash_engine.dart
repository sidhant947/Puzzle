import 'dart:math';

class InequalityQuestion {
  final String leftFormula;
  final String rightFormula;
  final double leftValue;
  final double rightValue;
  final String correctOperator; // '<', '=', '>'

  InequalityQuestion({
    required this.leftFormula,
    required this.rightFormula,
    required this.leftValue,
    required this.rightValue,
    required this.correctOperator,
  });
}

class InequalityDashEngine {
  final Random _random = Random();

  InequalityQuestion generateQuestion(int score) {
    // Generate left and right values and formulas
    final double leftVal;
    final String leftForm;
    final double rightVal;
    final String rightForm;

    // Determine difficulty level
    final int level = (score ~/ 5) + 1; // Level increases every 5 correct answers

    final leftData = _generateFormula(level);
    leftVal = leftData['value'] as double;
    leftForm = leftData['formula'] as String;

    // Sometimes we want to force equality (approx 25% chance)
    if (_random.nextDouble() < 0.25) {
      final rightData = _generateFormulaWithTargetValue(level, leftVal);
      rightVal = rightData['value'] as double;
      rightForm = rightData['formula'] as String;
    } else {
      final rightData = _generateFormula(level);
      rightVal = rightData['value'] as double;
      rightForm = rightData['formula'] as String;
    }

    String op = '=';
    if (leftVal < rightVal) {
      op = '<';
    } else if (leftVal > rightVal) {
      op = '>';
    }

    return InequalityQuestion(
      leftFormula: leftForm,
      rightFormula: rightForm,
      leftValue: leftVal,
      rightValue: rightVal,
      correctOperator: op,
    );
  }

  Map<String, dynamic> _generateFormula(int level) {
    if (level == 1) {
      // Simple addition / subtraction (1 to 20)
      final int op = _random.nextInt(2);
      final int a = _random.nextInt(15) + 1;
      final int b = _random.nextInt(15) + 1;
      if (op == 0) {
        return {'value': (a + b).toDouble(), 'formula': '$a + $b'};
      } else {
        final int maxVal = a > b ? a : b;
        final int minVal = a > b ? b : a;
        return {'value': (maxVal - minVal).toDouble(), 'formula': '$maxVal - $minVal'};
      }
    } else if (level == 2) {
      // Addition, subtraction, simple multiplication
      final int op = _random.nextInt(3);
      if (op == 0) {
        final int a = _random.nextInt(30) + 5;
        final int b = _random.nextInt(30) + 5;
        return {'value': (a + b).toDouble(), 'formula': '$a + $b'};
      } else if (op == 1) {
        final int a = _random.nextInt(40) + 10;
        final int b = _random.nextInt(30) + 1;
        return {'value': (a - b).toDouble(), 'formula': '$a - $b'};
      } else {
        final int a = _random.nextInt(8) + 2;
        final int b = _random.nextInt(8) + 2;
        return {'value': (a * b).toDouble(), 'formula': '$a × $b'};
      }
    } else if (level == 3) {
      // Three-term arithmetic or division
      final int op = _random.nextInt(3);
      if (op == 0) {
        // e.g. a * b + c
        final int a = _random.nextInt(6) + 2;
        final int b = _random.nextInt(6) + 2;
        final int c = _random.nextInt(15) + 1;
        return {'value': (a * b + c).toDouble(), 'formula': '$a × $b + $c'};
      } else if (op == 1) {
        // e.g. a + b - c
        final int a = _random.nextInt(25) + 10;
        final int b = _random.nextInt(25) + 10;
        final int c = _random.nextInt(20) + 5;
        return {'value': (a + b - c).toDouble(), 'formula': '$a + $b - $c'};
      } else {
        // Division (exact)
        final int b = _random.nextInt(8) + 2;
        final int val = _random.nextInt(10) + 2;
        final int a = val * b;
        return {'value': val.toDouble(), 'formula': '$a ÷ $b'};
      }
    } else {
      // Level 4+ complex expressions
      final int op = _random.nextInt(3);
      if (op == 0) {
        // Parenthesis e.g. (a + b) * c
        final int a = _random.nextInt(6) + 1;
        final int b = _random.nextInt(6) + 1;
        final int c = _random.nextInt(4) + 2;
        return {'value': ((a + b) * c).toDouble(), 'formula': '($a + $b) × $c'};
      } else if (op == 1) {
        // a * b - c * d
        final int a = _random.nextInt(6) + 3;
        final int b = _random.nextInt(6) + 2;
        final int c = _random.nextInt(4) + 2;
        final int d = _random.nextInt(4) + 1;
        final int val = (a * b) - (c * d);
        return {'value': val.toDouble(), 'formula': '$a × $b - $c × $d'};
      } else {
        // division and addition
        final int b = _random.nextInt(6) + 2;
        final int quotient = _random.nextInt(8) + 2;
        final int a = quotient * b;
        final int c = _random.nextInt(15) + 5;
        return {'value': (quotient + c).toDouble(), 'formula': '$a ÷ $b + $c'};
      }
    }
  }

  Map<String, dynamic> _generateFormulaWithTargetValue(int level, double target) {
    // Generate a formula that results in the exact target value, if possible
    // Otherwise fallback to generating a normal formula
    final int targetInt = target.round();
    if (targetInt <= 0) return _generateFormula(level);

    final int op = _random.nextInt(3);
    if (op == 0 && targetInt > 2) {
      // a + b = target
      final int a = _random.nextInt(targetInt - 1) + 1;
      final int b = targetInt - a;
      return {'value': target, 'formula': '$a + $b'};
    } else if (op == 1) {
      // a - b = target
      final int b = _random.nextInt(15) + 1;
      final int a = targetInt + b;
      return {'value': target, 'formula': '$a - $b'};
    } else {
      // Try to make a multiplication or exact division, or default to addition
      for (int i = 2; i <= 10; i++) {
        if (targetInt % i == 0 && targetInt ~/ i > 1) {
          final int factor = targetInt ~/ i;
          return {'value': target, 'formula': '$i × $factor'};
        }
      }
      // Fallback
      final int b = _random.nextInt(10) + 1;
      final int a = targetInt + b;
      return {'value': target, 'formula': '$a - $b'};
    }
  }
}
