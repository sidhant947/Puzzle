import 'dart:math' as math;

enum OddballType { standardA, oddballB }

class ABReversalTrial {
  final OddballType stimulus;
  final bool ruleReversed; // When true: B is target instead of A
  final bool isTarget;

  ABReversalTrial({
    required this.stimulus,
    required this.ruleReversed,
    required this.isTarget,
  });
}

class ABReversalOddballEngine {
  static ABReversalTrial generateTrial({bool ruleReversed = false, math.Random? random}) {
    final rng = random ?? math.Random();
    // 80% standard, 20% oddball
    final isOddball = rng.nextDouble() < 0.25;
    final stimulus = isOddball ? OddballType.oddballB : OddballType.standardA;

    final isTarget = ruleReversed ? (stimulus == OddballType.oddballB) : (stimulus == OddballType.standardA);

    return ABReversalTrial(
      stimulus: stimulus,
      ruleReversed: ruleReversed,
      isTarget: isTarget,
    );
  }
}
