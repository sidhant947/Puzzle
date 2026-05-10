import 'dart:math';

class FractionMatchLevel {
  final int numerator;
  final int denominator;
  final List<String> options;
  final String correctAnswer;

  FractionMatchLevel({
    required this.numerator,
    required this.denominator,
    required this.options,
    required this.correctAnswer,
  });
}

class FractionMatchEngine {
  final Random _random = Random();

  FractionMatchLevel generateLevel(int score) {
    int denominator;
    if (score < 5) {
      denominator = [2, 3, 4][_random.nextInt(3)];
    } else if (score < 15) {
      denominator = [2, 3, 4, 5, 6, 8][_random.nextInt(6)];
    } else {
      denominator = [2, 3, 4, 5, 6, 7, 8, 9, 10, 12][_random.nextInt(10)];
    }

    int numerator = _random.nextInt(denominator - 1) + 1;
    String correctAnswer = '$numerator/$denominator';

    List<String> options = [correctAnswer];
    while (options.length < 4) {
      int d = [2, 3, 4, 5, 6, 8, 10, 12][_random.nextInt(8)];
      int n = _random.nextInt(d - 1) + 1;
      String opt = '$n/$d';
      if (!options.contains(opt)) {
        options.add(opt);
      }
    }
    options.shuffle(_random);

    return FractionMatchLevel(
      numerator: numerator,
      denominator: denominator,
      options: options,
      correctAnswer: correctAnswer,
    );
  }
}
