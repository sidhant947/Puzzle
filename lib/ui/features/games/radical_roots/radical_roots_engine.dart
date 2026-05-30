import 'dart:math';

class RadicalProblem {
  final String question;
  final int answer;
  final List<int> options;

  RadicalProblem({
    required this.question,
    required this.answer,
    required this.options,
  });
}

class RadicalRootsEngine {
  final Random _random = Random();

  RadicalProblem generateProblem(int currentScore) {
    bool isCubeRoot = _random.nextBool();
    
    int number;
    int answer;
    String question;

    if (isCubeRoot) {
      // Cube roots up to 20^3
      answer = _random.nextInt(19) + 2; // 2 to 20
      number = answer * answer * answer;
      question = '∛$number';
    } else {
      // Square roots up to 50^2
      answer = _random.nextInt(49) + 2; // 2 to 50
      number = answer * answer;
      question = '√$number';
    }

    // Generate options
    Set<int> optionsSet = {answer};
    while (optionsSet.length < 4) {
      int offset = _random.nextInt(5) - 2;
      if (offset == 0) offset = _random.nextBool() ? 3 : -3;
      int fake = answer + offset;
      if (fake > 0) {
        optionsSet.add(fake);
      }
    }

    List<int> options = optionsSet.toList()..shuffle(_random);

    return RadicalProblem(
      question: question,
      answer: answer,
      options: options,
    );
  }
}
