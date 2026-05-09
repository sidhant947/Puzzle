import 'dart:math';

class MathProblem {
  final String equation;
  final int answer;

  MathProblem({required this.equation, required this.answer});
}

class QuickMathEngine {
  final Random _random = Random();

  MathProblem generateProblem() {
    int type = _random.nextInt(3); // 0: +, 1: -, 2: *
    int a, b, answer;
    String op;

    switch (type) {
      case 0:
        a = _random.nextInt(50) + 10;
        b = _random.nextInt(50) + 10;
        answer = a + b;
        op = "+";
        break;
      case 1:
        a = _random.nextInt(100) + 20;
        b = _random.nextInt(a - 10) + 5;
        answer = a - b;
        op = "-";
        break;
      case 2:
      default:
        a = _random.nextInt(12) + 2;
        b = _random.nextInt(12) + 2;
        answer = a * b;
        op = "×";
        break;
    }

    return MathProblem(equation: "$a $op $b", answer: answer);
  }
}
