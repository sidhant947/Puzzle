import 'dart:math';

class SimonSequenceEngine {
  final int gridSize = 3; // 3x3 grid
  final Random _random = Random();

  List<int> generateFixedSequence(int length) {
    return List.generate(length, (_) => _random.nextInt(gridSize * gridSize));
  }
}
