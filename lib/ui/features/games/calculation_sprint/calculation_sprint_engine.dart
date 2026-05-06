import 'dart:math';

class MathProblem {
  final String equation;
  final int answer;
  final List<int> options;

  MathProblem({
    required this.equation,
    required this.answer,
    required this.options,
  });
}

class CalculationSprintEngine {
  final Random _random = Random();

  MathProblem generateProblem(int currentScore) {
    // Difficulty increases with score
    int difficulty = (currentScore ~/ 5) + 1;
    int maxNum = 10 * difficulty;
    
    // Choose operation: 0: +, 1: -, 2: *
    int op = _random.nextInt(min(3, difficulty)); // Only add/sub initially, multiply later
    
    int a, b, answer;
    String symbol;

    if (op == 2 && difficulty >= 3) {
      // Multiplication
      a = _random.nextInt(12) + 2;
      b = _random.nextInt(12) + 2;
      answer = a * b;
      symbol = '×';
    } else if (op == 1) {
      // Subtraction
      a = _random.nextInt(maxNum) + 5;
      b = _random.nextInt(a - 1) + 1; // Ensure positive answer
      answer = a - b;
      symbol = '-';
    } else {
      // Addition
      a = _random.nextInt(maxNum) + 2;
      b = _random.nextInt(maxNum) + 2;
      answer = a + b;
      symbol = '+';
    }

    String equation = '$a $symbol $b';
    
    // Generate 3 fake options
    Set<int> optionsSet = {answer};
    while (optionsSet.length < 4) {
      int offset = _random.nextInt(11) - 5;
      if (offset == 0) offset = 1;
      int fake = answer + offset;
      if (fake >= 0) {
        optionsSet.add(fake);
      }
    }

    List<int> options = optionsSet.toList()..shuffle(_random);

    return MathProblem(
      equation: equation,
      answer: answer,
      options: options,
    );
  }
}
