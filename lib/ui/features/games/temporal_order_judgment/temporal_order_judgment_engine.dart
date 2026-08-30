import 'dart:math' as math;

enum FlashSide { left, right }

class TemporalTrial {
  final FlashSide firstSide;
  final int soaMs; // Stimulus Onset Asynchrony (15ms to 80ms)

  TemporalTrial({
    required this.firstSide,
    required this.soaMs,
  });
}

class TemporalOrderJudgmentEngine {
  static TemporalTrial generateTrial({math.Random? random}) {
    final rng = random ?? math.Random();
    final first = rng.nextBool() ? FlashSide.left : FlashSide.right;
    final soa = 30 + rng.nextInt(50); // 30 to 80 ms

    return TemporalTrial(
      firstSide: first,
      soaMs: soa,
    );
  }
}
