import 'dart:math';

enum AngleProblemType { triangle, supplementary, complementary, quadrilateral }

class AngleProblem {
  final String question;
  final String description;
  final int answer;
  final List<int> options;
  final AngleProblemType type;
  final List<int> givenAngles;

  AngleProblem({
    required this.question,
    required this.description,
    required this.answer,
    required this.options,
    required this.type,
    required this.givenAngles,
  });
}

class AngleFinderEngine {
  final Random _random = Random();

  AngleProblem generateProblem(int currentScore) {
    AngleProblemType type;
    if (currentScore < 3) {
      type = _random.nextBool() ? AngleProblemType.supplementary : AngleProblemType.complementary;
    } else if (currentScore < 8) {
      type = [AngleProblemType.supplementary, AngleProblemType.complementary, AngleProblemType.triangle][_random.nextInt(3)];
    } else {
      type = AngleProblemType.values[_random.nextInt(AngleProblemType.values.length)];
    }

    int answer;
    String question;
    String description;
    List<int> givenAngles = [];

    switch (type) {
      case AngleProblemType.supplementary:
        int x = _random.nextInt(150) + 15;
        answer = 180 - x;
        question = "180° - $x° = ?";
        description = "Find the supplementary angle.";
        givenAngles = [x];
        break;
      case AngleProblemType.complementary:
        int x = _random.nextInt(70) + 10;
        answer = 90 - x;
        question = "90° - $x° = ?";
        description = "Find the complementary angle.";
        givenAngles = [x];
        break;
      case AngleProblemType.triangle:
        int a = _random.nextInt(80) + 20;
        int b = _random.nextInt(180 - a - 40) + 20;
        answer = 180 - a - b;
        question = "$a°, $b°, ?";
        description = "Find the 3rd angle of the triangle.";
        givenAngles = [a, b];
        break;
      case AngleProblemType.quadrilateral:
        int a = _random.nextInt(100) + 40;
        int b = _random.nextInt(100) + 40;
        int c = _random.nextInt(360 - a - b - 60) + 30;
        answer = 360 - a - b - c;
        question = "$a°, $b°, $c°, ?";
        description = "Find the 4th angle of the quadrilateral.";
        givenAngles = [a, b, c];
        break;
    }

    // Generate options
    Set<int> optionsSet = {answer};
    while (optionsSet.length < 4) {
      int offset = (_random.nextInt(5) + 1) * (_random.nextBool() ? 1 : -1) * 5;
      int fake = answer + offset;
      if (fake > 0 && fake < 360 && fake != answer) {
        optionsSet.add(fake);
      }
    }

    List<int> options = optionsSet.toList()..shuffle(_random);

    return AngleProblem(
      question: question,
      description: description,
      answer: answer,
      options: options,
      type: type,
      givenAngles: givenAngles,
    );
  }
}
