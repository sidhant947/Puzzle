import 'dart:math';

enum PercentageQuestionType {
  calculateValue, // 15% of 120 = ?
  calculateTotal, // 12 is 20% of what?
  calculatePercentage, // What % of 50 is 10?
}

class PercentageQuestion {
  final String question;
  final int answer;
  final PercentageQuestionType type;

  PercentageQuestion({
    required this.question,
    required this.answer,
    required this.type,
  });
}

class PercentagePeakEngine {
  final Random _random = Random();

  PercentageQuestion generateQuestion() {
    final type = PercentageQuestionType.values[_random.nextInt(3)];

    switch (type) {
      case PercentageQuestionType.calculateValue:
        // x% of y = ?
        // Ensure x is a multiple of 5 or 10, and result is integer
        final x = (1 + _random.nextInt(19)) * 5; // 5, 10, ..., 95
        final y = (1 + _random.nextInt(20)) * 20; // 20, 40, ..., 400
        final answer = (x * y / 100).round();
        return PercentageQuestion(
          question: "$x% of $y",
          answer: answer,
          type: type,
        );

      case PercentageQuestionType.calculateTotal:
        // x is y% of ? => x / (y/100) => 100x / y
        // Ensure y is a multiple of 5 or 10, and result is integer
        final y = (1 + _random.nextInt(10)) * 10; // 10, 20, ..., 100
        final answer = (1 + _random.nextInt(10)) * 10; // 10, 20, ..., 100
        final x = (answer * y / 100).round();
        return PercentageQuestion(
          question: "$x is $y% of what?",
          answer: answer,
          type: type,
        );

      case PercentageQuestionType.calculatePercentage:
        // What % of x is y? => y / x * 100
        // Ensure result is clean multiple of 5
        final x = (1 + _random.nextInt(10)) * 20; // 20, 40, ..., 200
        final answer = (1 + _random.nextInt(19)) * 5; // 5, 10, ..., 95
        final y = (x * answer / 100).round();
        return PercentageQuestion(
          question: "What % of $x is $y?",
          answer: answer,
          type: type,
        );
    }
  }
}
