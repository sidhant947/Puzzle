import 'dart:math';

class MathDistractor {
  final String question;
  final int correctAnswer;
  final List<int> options;

  MathDistractor({
    required this.question,
    required this.correctAnswer,
    required this.options,
  });
}

class DistractorMatrixEngine {
  final Random _random = Random();

  List<int> generatePattern(int boardSize, int tileCount) {
    final List<int> indices = List.generate(boardSize * boardSize, (i) => i);
    indices.shuffle(_random);
    return indices.take(tileCount).toList();
  }

  MathDistractor generateMathQuestion() {
    final int a = _random.nextInt(10) + 2;
    final int b = _random.nextInt(10) + 2;
    final bool isAddition = _random.nextBool();
    
    final int answer = isAddition ? a + b : a * b;
    final String operatorStr = isAddition ? '+' : '×';
    final String question = '$a $operatorStr $b = ?';

    final Set<int> optionSet = {answer};
    while (optionSet.length < 3) {
      final int offset = _random.nextInt(7) - 3;
      final int fake = answer + (offset == 0 ? 4 : offset);
      if (fake > 0) {
        optionSet.add(fake);
      }
    }

    final List<int> options = optionSet.toList()..shuffle(_random);
    return MathDistractor(
      question: question,
      correctAnswer: answer,
      options: options,
    );
  }

  int getTileCountForLevel(int level) {
    return level + 2;
  }
}
