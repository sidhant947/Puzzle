import 'dart:math';

enum VennRegion {
  aOnly,
  bOnly,
  both,
  neither,
}

abstract class VennRule {
  String get description;
  bool test(int n);
}

class MultiplesRule extends VennRule {
  final int factor;
  MultiplesRule(this.factor);
  @override
  String get description => "Multiples of $factor";
  @override
  bool test(int n) => n % factor == 0;
}

class PrimesRule extends VennRule {
  @override
  String get description => "Prime Numbers";
  @override
  bool test(int n) {
    if (n < 2) return false;
    for (int i = 2; i <= sqrt(n).toInt(); i++) {
      if (n % i == 0) return false;
    }
    return true;
  }
}

class EvenOddRule extends VennRule {
  final bool even;
  EvenOddRule({required this.even});
  @override
  String get description => even ? "Even Numbers" : "Odd Numbers";
  @override
  bool test(int n) => even ? n % 2 == 0 : n % 2 != 0;
}

class PerfectSquareRule extends VennRule {
  @override
  String get description => "Perfect Squares";
  @override
  bool test(int n) {
    int s = sqrt(n).toInt();
    return s * s == n;
  }
}

class ComparisonRule extends VennRule {
  final int threshold;
  final bool greater;
  ComparisonRule(this.threshold, {required this.greater});
  @override
  String get description => greater ? "Greater than $threshold" : "Less than $threshold";
  @override
  bool test(int n) => greater ? n > threshold : n < threshold;
}

class VennProblem {
  final int number;
  final VennRule ruleA;
  final VennRule ruleB;
  final VennRegion correctRegion;

  VennProblem({
    required this.number,
    required this.ruleA,
    required this.ruleB,
    required this.correctRegion,
  });
}

class VennNumbersEngine {
  final Random _random = Random();

  VennProblem generateProblem() {
    final rules = _getTwoDistinctRules();
    final ruleA = rules[0];
    final ruleB = rules[1];

    // Try to find a number that fits some regions
    int number;
    VennRegion region;
    
    // We try to pick a region first to ensure distribution
    final targetRegion = VennRegion.values[_random.nextInt(4)];
    int attempts = 0;
    
    while (true) {
      number = _random.nextInt(100) + 1;
      bool inA = ruleA.test(number);
      bool inB = ruleB.test(number);
      
      if (inA && inB) {
        region = VennRegion.both;
      } else if (inA) {
        region = VennRegion.aOnly;
      } else if (inB) {
        region = VennRegion.bOnly;
      } else {
        region = VennRegion.neither;
      }
      
      if (region == targetRegion) {
        break;
      }
      
      attempts++;
      if (attempts > 50) {
        break;
      } // Fallback
    }

    return VennProblem(
      number: number,
      ruleA: ruleA,
      ruleB: ruleB,
      correctRegion: region,
    );
  }

  List<VennRule> _getTwoDistinctRules() {
    final allRules = [
      MultiplesRule(2),
      MultiplesRule(3),
      MultiplesRule(5),
      PrimesRule(),
      EvenOddRule(even: true),
      EvenOddRule(even: false),
      PerfectSquareRule(),
      ComparisonRule(20, greater: true),
      ComparisonRule(50, greater: false),
    ];
    
    allRules.shuffle(_random);
    return allRules.sublist(0, 2);
  }
}
