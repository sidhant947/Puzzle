import 'dart:math';

class DivisibilityProblem {
  final int number;
  final List<int> correctDivisors;

  DivisibilityProblem({required this.number, required this.correctDivisors});
}

class DivisibilityDashEngine {
  final Random _random = Random();

  DivisibilityProblem generateProblem() {
    // Generate a number that has at least 2 divisors between 2 and 9
    int number;
    List<int> divisors;
    
    do {
      number = _random.nextInt(899) + 100; // 100-998
      divisors = [];
      for (int i = 2; i <= 9; i++) {
        if (number % i == 0) {
          divisors.add(i);
        }
      }
    } while (divisors.length < 2);

    return DivisibilityProblem(number: number, correctDivisors: divisors);
  }
}
