import 'dart:math';

class AbacusProblem {
  final int value1;
  final int value2;
  final String operator;
  final int result;

  AbacusProblem({
    required this.value1,
    required this.value2,
    required this.operator,
    required this.result,
  });
}

class MentalAbacusEngine {
  final Random _random = Random();

  AbacusProblem generateProblem() {
    final operator = _random.nextBool() ? "+" : "-";
    int v1, v2, result;

    if (operator == "+") {
      v1 = _random.nextInt(500);
      v2 = _random.nextInt(499) + 1;
      result = v1 + v2;
    } else {
      v1 = _random.nextInt(900) + 100;
      v2 = _random.nextInt(v1);
      result = v1 - v2;
    }

    return AbacusProblem(
      value1: v1,
      value2: v2,
      operator: operator,
      result: result,
    );
  }
}
