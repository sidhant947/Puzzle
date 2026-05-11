import 'dart:math';

class OperationSpanEngine {
  final Random _random = Random();
  final List<String> _letters = ['F', 'H', 'J', 'K', 'L', 'N', 'P', 'Q', 'R', 'S', 'T', 'Y'];

  Map<String, dynamic> generateProblem() {
    int a = _random.nextInt(9) + 1;
    int b = _random.nextInt(9) + 1;
    int c = _random.nextInt(9) + 1;
    
    bool isAddition = _random.nextBool();
    int actualResult = isAddition ? (a * b) + c : (a * b) - c;
    String operation = isAddition ? '+' : '-';
    
    bool isCorrect = _random.nextBool();
    int displayedResult = isCorrect ? actualResult : actualResult + (_random.nextInt(5) + 1) * (_random.nextBool() ? 1 : -1);
    
    return {
      'equation': '($a × $b) $operation $c = $displayedResult',
      'isCorrect': isCorrect,
    };
  }

  String getRandomLetter() {
    return _letters[_random.nextInt(_letters.length)];
  }
}
