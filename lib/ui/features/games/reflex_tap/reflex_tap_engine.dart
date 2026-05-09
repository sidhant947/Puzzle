import 'dart:math';

class ReflexTapEngine {
  final Random _random = Random();

  Point<double> getRandomTargetPosition() {
    // Return relative coordinates (0.0 to 1.0)
    return Point(_random.nextDouble() * 0.8 + 0.1, _random.nextDouble() * 0.8 + 0.1);
  }

  double calculateTargetSize(int score) {
    // Get smaller as score increases
    return (80.0 - (score * 2.0)).clamp(40.0, 80.0);
  }
}
