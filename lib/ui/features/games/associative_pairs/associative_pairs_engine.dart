import 'dart:math';

enum AssocShape { circle, square, triangle, star, diamond, hexagon, heart }
enum AssocColor { amber, teal, berry, indigo, emerald, orange, purple }

class AssociationPair {
  final AssocShape shape;
  final AssocColor color;

  AssociationPair({required this.shape, required this.color});
}

enum AssociativeQuestionType { shapeToColor, colorToShape }

class AssociativeQuestion {
  final AssociationPair target;
  final AssociativeQuestionType type;
  final List<dynamic> options; // AssocColor list if shapeToColor, else AssocShape list
  final dynamic correctOption; // AssocColor or AssocShape

  AssociativeQuestion({
    required this.target,
    required this.type,
    required this.options,
    required this.correctOption,
  });
}

class AssociativePairsEngine {
  final Random _random = Random();

  List<AssociationPair> generatePairs(int count) {
    final List<AssocShape> shapes = AssocShape.values.toList()..shuffle(_random);
    final List<AssocColor> colors = AssocColor.values.toList()..shuffle(_random);

    final List<AssociationPair> pairs = [];
    for (int i = 0; i < count; i++) {
      pairs.add(AssociationPair(shape: shapes[i], color: colors[i]));
    }
    return pairs;
  }

  List<AssociativeQuestion> generateQuestions(List<AssociationPair> pairs) {
    final List<AssociativeQuestion> questions = [];

    // Create a question for each pair in the set
    for (final pair in pairs) {
      final type = _random.nextBool() ? AssociativeQuestionType.shapeToColor : AssociativeQuestionType.colorToShape;

      if (type == AssociativeQuestionType.shapeToColor) {
        final correctOption = pair.color;
        final Set<AssocColor> optionSet = {correctOption};
        while (optionSet.length < 4) {
          optionSet.add(AssocColor.values[_random.nextInt(AssocColor.values.length)]);
        }
        final List<AssocColor> options = optionSet.toList()..shuffle(_random);
        questions.add(AssociativeQuestion(
          target: pair,
          type: type,
          options: options,
          correctOption: correctOption,
        ));
      } else {
        final correctOption = pair.shape;
        final Set<AssocShape> optionSet = {correctOption};
        while (optionSet.length < 4) {
          optionSet.add(AssocShape.values[_random.nextInt(AssocShape.values.length)]);
        }
        final List<AssocShape> options = optionSet.toList()..shuffle(_random);
        questions.add(AssociativeQuestion(
          target: pair,
          type: type,
          options: options,
          correctOption: correctOption,
        ));
      }
    }

    questions.shuffle(_random);
    return questions;
  }

  int getPairsCountForLevel(int level) {
    // Level 1: 3 pairs, Level 2: 4 pairs, Level 3: 5 pairs, Level 4: 6 pairs, Level 5: 7 pairs
    return level + 2;
  }
}
