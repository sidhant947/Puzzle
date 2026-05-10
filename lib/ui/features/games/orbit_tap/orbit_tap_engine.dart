import 'dart:math';

class OrbitTapEngine {
  final Random _random = Random();

  /// Generates a new gate position (angle in radians)
  double generateGateAngle() {
    return _random.nextDouble() * 2 * pi;
  }

  /// Checks if the current angle is within the gate
  bool isTargetInGate(double currentAngle, double gateAngle, double tolerance) {
    double diff = (currentAngle - gateAngle).abs();
    // Handle wrap around
    if (diff > pi) {
      diff = 2 * pi - diff;
    }
    return diff < tolerance;
  }
}
