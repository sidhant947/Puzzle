import 'dart:math';

class CorsiBlocksEngine {
  final Random _random = Random();

  List<int> generateSequence(int length, int maxIndex) {
    List<int> sequence = [];
    for (int i = 0; i < length; i++) {
      sequence.add(_random.nextInt(maxIndex));
    }
    return sequence;
  }
}
