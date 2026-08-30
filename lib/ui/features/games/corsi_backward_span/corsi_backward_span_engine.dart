import 'dart:math' as math;

class CorsiBackwardRound {
  final List<int> blockSequence; // Indices from 0 to 8
  CorsiBackwardRound(this.blockSequence);
}

class CorsiBackwardSpanEngine {
  static CorsiBackwardRound generateRound({int length = 4, math.Random? random}) {
    final rng = random ?? math.Random();
    final blocks = <int>[];

    while (blocks.length < length) {
      final b = rng.nextInt(9);
      if (blocks.isEmpty || blocks.last != b) {
        blocks.add(b);
      }
    }

    return CorsiBackwardRound(blocks);
  }
}
