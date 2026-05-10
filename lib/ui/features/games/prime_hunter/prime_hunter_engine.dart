import 'dart:math';

class PrimeHunterLevel {
  final int number;
  final bool isPrime;

  PrimeHunterLevel({
    required this.number,
    required this.isPrime,
  });
}

class PrimeHunterEngine {
  final Random _random = Random();

  final List<int> _primes = [
    2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97,
    101, 103, 107, 109, 113, 127, 131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199
  ];

  PrimeHunterLevel generateLevel(int score) {
    bool shouldBePrime = _random.nextBool();
    int number;

    if (shouldBePrime) {
      // Pick a prime based on score (larger primes for higher scores)
      int maxIndex = (score + 5).clamp(5, _primes.length);
      number = _primes[_random.nextInt(maxIndex)];
    } else {
      // Generate a composite number
      int maxVal = (score * 5 + 20).clamp(20, 200);
      do {
        number = _random.nextInt(maxVal) + 4;
      } while (_isPrime(number));
    }

    return PrimeHunterLevel(
      number: number,
      isPrime: _isPrime(number),
    );
  }

  bool _isPrime(int n) {
    if (n < 2) return false;
    for (int i = 2; i <= sqrt(n); i++) {
      if (n % i == 0) return false;
    }
    return true;
  }
}
