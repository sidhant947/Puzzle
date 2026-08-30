import 'dart:math' as math;

enum LandoltOrientation { up, right, down, left }

class VisualCrowdingTrial {
  final LandoltOrientation targetOrientation;
  final LandoltOrientation flankerLeft;
  final LandoltOrientation flankerRight;
  final double flankerSpacing; // Pixel spacing

  VisualCrowdingTrial({
    required this.targetOrientation,
    required this.flankerLeft,
    required this.flankerRight,
    required this.flankerSpacing,
  });
}

class VisualCrowdingAcuityEngine {
  static VisualCrowdingTrial generateTrial({math.Random? random}) {
    final rng = random ?? math.Random();
    const orientations = LandoltOrientation.values;

    final target = orientations[rng.nextInt(orientations.length)];
    final leftFlank = orientations[rng.nextInt(orientations.length)];
    final rightFlank = orientations[rng.nextInt(orientations.length)];

    return VisualCrowdingTrial(
      targetOrientation: target,
      flankerLeft: leftFlank,
      flankerRight: rightFlank,
      flankerSpacing: 40.0 + rng.nextInt(30),
    );
  }
}
