import 'dart:math';

class MathGuessEngine {
  final Random _random = Random();

  int generateTargetNumber() {
    return _random.nextInt(10000) + 1; // 1 to 10000 inclusive
  }
}
