import 'dart:math';

class NumericalEstimationEngine {
  final Random _random = Random();

  NumericalEstimationPuzzle generatePuzzle() {
    final int type = _random.nextInt(3); // 0: Mult, 1: Add, 2: Sub
    int n1, n2, actual;
    String op;

    switch (type) {
      case 0:
        // Multiplication: Harder ranges
        n1 = _random.nextInt(150) + 11; // 11-160
        n2 = _random.nextInt(80) + 11;  // 11-90
        actual = n1 * n2;
        op = '×';
        break;
      case 1:
        // Addition: Larger numbers
        n1 = _random.nextInt(9000) + 1000;
        n2 = _random.nextInt(9000) + 1000;
        actual = n1 + n2;
        op = '+';
        break;
      default:
        // Subtraction: Larger numbers
        n1 = _random.nextInt(9000) + 1000;
        n2 = _random.nextInt(n1 - 500) + 500;
        actual = n1 - n2;
        op = '-';
        break;
    }

    final Set<int> options = {actual};
    
    // User requested specific hard offsets: ±2, ±3, ±10 etc.
    final List<int> hardOffsets = [2, -2, 3, -3, 10, -10, 1, -1, 5, -5, 12, -12];
    hardOffsets.shuffle(_random);

    for (final offset in hardOffsets) {
      if (options.length >= 4) break;
      final wrong = actual + offset;
      if (wrong > 0 && wrong != actual) {
        options.add(wrong);
      }
    }

    // Fallback if somehow we don't have enough options (unlikely with 12 offsets)
    while (options.length < 4) {
      final wrong = actual + _random.nextInt(40) - 20;
      if (wrong > 0 && wrong != actual) {
        options.add(wrong);
      }
    }

    final shuffledOptions = options.toList()..shuffle(_random);

    return NumericalEstimationPuzzle(
      question: '$n1 $op $n2',
      answer: actual,
      options: shuffledOptions,
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
