import 'dart:math' as math;

enum CueType { valid, invalid, neutral }
enum TargetSide { left, right }

class PosnerTrial {
  final CueType cueType;
  final TargetSide cueSide;
  final TargetSide targetSide;
  final int cueDurationMs;
  final int targetDelayMs;

  PosnerTrial({
    required this.cueType,
    required this.cueSide,
    required this.targetSide,
    required this.cueDurationMs,
    required this.targetDelayMs,
  });
}

class PosnerSpatialCueingEngine {
  static PosnerTrial generateTrial({math.Random? random}) {
    final rng = random ?? math.Random();
    
    // 70% valid, 20% invalid, 10% neutral
    final roll = rng.nextDouble();
    CueType cueType;
    if (roll < 0.70) {
      cueType = CueType.valid;
    } else if (roll < 0.90) {
      cueType = CueType.invalid;
    } else {
      cueType = CueType.neutral;
    }

    final targetSide = rng.nextBool() ? TargetSide.left : TargetSide.right;
    TargetSide cueSide;

    if (cueType == CueType.valid) {
      cueSide = targetSide;
    } else if (cueType == CueType.invalid) {
      cueSide = targetSide == TargetSide.left ? TargetSide.right : TargetSide.left;
    } else {
      cueSide = targetSide; // Both will be lit
    }

    return PosnerTrial(
      cueType: cueType,
      cueSide: cueSide,
      targetSide: targetSide,
      cueDurationMs: 250,
      targetDelayMs: 150 + rng.nextInt(200),
    );
  }
}
