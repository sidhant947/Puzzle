import 'dart:math';

class VigilanceTaskEngine {
  final Random _random = Random();
  final int totalPositions = 60;

  bool shouldSkip() {
    // 15% chance to skip a position
    return _random.nextDouble() < 0.15;
  }

  int getNextPosition(int currentPosition, bool isSkip) {
    int increment = isSkip ? 2 : 1;
    return (currentPosition + increment) % totalPositions;
  }
}
