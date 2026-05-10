import 'dart:math';

class ObjectShuffleEngine {
  final Random _random = Random();

  /// Generates a shuffle sequence.
  /// Each entry is a pair of indexes to swap.
  List<List<int>> generateShuffles(int count, int shellCount) {
    List<List<int>> shuffles = [];
    for (int i = 0; i < count; i++) {
      int a = _random.nextInt(shellCount);
      int b = _random.nextInt(shellCount);
      while (a == b) {
        b = _random.nextInt(shellCount);
      }
      shuffles.add([a, b]);
    }
    return shuffles;
  }
}
