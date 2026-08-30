import 'dart:math' as math;

class PrimeGapQuestion {
  final int p1;
  final int p2;
  final int correctGap;
  final List<int> choices;

  PrimeGapQuestion({
    required this.p1,
    required this.p2,
    required this.correctGap,
    required this.choices,
  });
}

class PrimeGapHuntEngine {
  static const List<int> _primes = [
    2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113
  ];

  static PrimeGapQuestion generateQuestion({math.Random? random}) {
    final rng = random ?? math.Random();
    
    // Choose two consecutive primes
    final idx = rng.nextInt(_primes.length - 1);
    final p1 = _primes[idx];
    final p2 = _primes[idx + 1];
    final gap = p2 - p1;

    final distractorSet = <int>{gap};
    while (distractorSet.length < 4) {
      final fake = gap + (rng.nextInt(7) - 3) * 2;
      if (fake > 0 && fake != gap) {
        distractorSet.add(fake);
      } else {
        distractorSet.add(rng.nextInt(12) + 1);
      }
    }

    final choices = distractorSet.toList()..shuffle(rng);

    return PrimeGapQuestion(
      p1: p1,
      p2: p2,
      correctGap: gap,
      choices: choices,
    );
  }
}
