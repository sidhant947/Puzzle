import 'dart:math' as math;

class ProbeDigitTrial {
  final List<int> digits; // Stream of 6 to 9 single digits
  final int probeDigit; // One digit that appeared before the end
  final int targetNextDigit; // The digit that immediately followed the probe

  ProbeDigitTrial({
    required this.digits,
    required this.probeDigit,
    required this.targetNextDigit,
  });
}

class ProbeDigitSpanEngine {
  static ProbeDigitTrial generateTrial({int length = 7, math.Random? random}) {
    final rng = random ?? math.Random();
    
    // Generate sequence with distinct digits to avoid ambiguous duplicate probes
    final digits = <int>[];
    final pool = List.generate(10, (i) => i)..shuffle(rng);
    digits.addAll(pool.take(length));

    // Choose probe from index 0 to length - 2
    final probeIdx = rng.nextInt(length - 1);
    final probe = digits[probeIdx];
    final nextDigit = digits[probeIdx + 1];

    return ProbeDigitTrial(
      digits: digits,
      probeDigit: probe,
      targetNextDigit: nextDigit,
    );
  }
}
