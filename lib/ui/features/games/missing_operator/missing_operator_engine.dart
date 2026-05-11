import 'dart:math';

class MissingOperatorProblem {
  final List<int> operands;
  final List<String> operators;
  final int result;

  MissingOperatorProblem({
    required this.operands,
    required this.operators,
    required this.result,
  });
}

class MissingOperatorEngine {
  final Random _random = Random();
  final List<String> _allOperators = ["+", "-", "*", "/"];

  MissingOperatorProblem generateProblem() {
    while (true) {
      final operands = [
        _random.nextInt(12) + 1,
        _random.nextInt(12) + 1,
        _random.nextInt(12) + 1,
      ];
      final ops = [
        _allOperators[_random.nextInt(_allOperators.length)],
        _allOperators[_random.nextInt(_allOperators.length)],
      ];

      try {
        final result = _calculate(operands, ops);
        // Only accept integer results and non-negative results for simplicity
        if (result == result.toInt() && result >= 0 && result <= 100) {
          return MissingOperatorProblem(
            operands: operands,
            operators: ops,
            result: result.toInt(),
          );
        }
      } catch (e) {
        // Division by zero or other errors
        continue;
      }
    }
  }

  double _calculate(List<int> operands, List<String> ops) {
    // Follow order of operations (PEMDAS)
    // First pass for * and /
    List<double> newOperands = [operands[0].toDouble()];
    List<String> newOps = [];

    for (int i = 0; i < ops.length; i++) {
      if (ops[i] == "*" || ops[i] == "/") {
        double last = newOperands.removeLast();
        if (ops[i] == "*") {
          newOperands.add(last * operands[i + 1]);
        } else {
          if (operands[i + 1] == 0 || last % operands[i + 1] != 0) throw Exception("Invalid division");
          newOperands.add(last / operands[i + 1]);
        }
      } else {
        newOperands.add(operands[i + 1].toDouble());
        newOps.add(ops[i]);
      }
    }

    // Second pass for + and -
    double result = newOperands[0];
    for (int i = 0; i < newOps.length; i++) {
      if (newOps[i] == "+") {
        result += newOperands[i + 1];
      } else {
        result -= newOperands[i + 1];
      }
    }

    return result;
  }

  bool check(List<int> operands, List<String> userOps, int targetResult) {
    try {
      final result = _calculate(operands, userOps);
      return result.toInt() == targetResult;
    } catch (e) {
      return false;
    }
  }
}
