import 'dart:math';

class NumericalEstimationEngine {
  final Random _random = Random();

  NumericalEstimationPuzzle generatePuzzle() {
    final int type = _random.nextInt(3); // 0: Mult, 1: Add, 2: Sub
    int n1, n2, actual;
    String op;

    switch (type) {
      case 0:
        n1 = _random.nextInt(90) + 10;
        n2 = _random.nextInt(90) + 10;
        actual = n1 * n2;
        op = '×';
        break;
      case 1:
        n1 = _random.nextInt(900) + 100;
        n2 = _random.nextInt(900) + 100;
        actual = n1 + n2;
        op = '+';
        break;
      default:
        n1 = _random.nextInt(900) + 100;
        n2 = _random.nextInt(n1 - 50) + 50;
        actual = n1 - n2;
        op = '-';
        break;
    }

    final List<int> options = [actual];
    
    // Generate wrong options that are "plausible" (nearby round numbers or common errors)
    while (options.length < 4) {
      int variation = (actual * 0.2).round();
      if (variation < 10) variation = 10;
      int wrong = actual + _random.nextInt(variation * 2) - variation;
      
      // Round to nearest 10 or 50 to make it look like an "estimate"
      if (actual > 500) {
        wrong = (wrong ~/ 50) * 50;
      } else {
        wrong = (wrong ~/ 10) * 10;
      }

      if (wrong != actual && !options.contains(wrong) && wrong > 0) {
        options.add(wrong);
      }
    }

    // Sort options so the actual answer might be replaced by a rounded version for "estimation"
    // Actually, let's just use the actual answer as one of the choices for now to be precise,
    // but the task is "estimation" so maybe I should round the actual answer too?
    // Let's keep one "correct" and others "distractors".

    options.shuffle(_random);

    return NumericalEstimationPuzzle(
      question: '$n1 $op $n2',
      answer: actual,
      options: options,
    );
  }
}

class NumericalEstimationPuzzle {
  final String question;
  final int answer;
  final List<int> options;

  NumericalEstimationPuzzle({
    required this.question,
    required this.answer,
    required this.options,
  });
}
