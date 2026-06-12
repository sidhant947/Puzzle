import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/prime_hunter/prime_hunter_engine.dart';

void main() {
  group('PrimeHunterEngine', () {
    late PrimeHunterEngine engine;

    setUp(() {
      engine = PrimeHunterEngine();
    });

    group('generateLevel', () {
      test('returns a PrimeHunterLevel', () {
        final level = engine.generateLevel(0);
        expect(level, isA<PrimeHunterLevel>());
      });

      test('number is positive', () {
        for (int score = 0; score < 30; score += 5) {
          final level = engine.generateLevel(score);
          expect(level.number, greaterThan(0));
        }
      });

      test('isPrime field matches actual primality', () {
        for (int score = 0; score < 30; score += 3) {
          final level = engine.generateLevel(score);
          final expected = _isPrime(level.number);
          expect(level.isPrime, equals(expected),
              reason: 'For number ${level.number}, isPrime should be $expected');
        }
      });

      test('generates both prime and composite numbers', () {
        int primeCount = 0;
        int compositeCount = 0;
        for (int i = 0; i < 40; i++) {
          final level = engine.generateLevel(5);
          if (level.isPrime) {
            primeCount++;
          } else {
            compositeCount++;
          }
        }
        expect(primeCount, greaterThan(0));
        expect(compositeCount, greaterThan(0));
      });
    });
  });

  group('PrimeHunterLevel', () {
    test('stores values correctly', () {
      final level = PrimeHunterLevel(number: 17, isPrime: true);
      expect(level.number, equals(17));
      expect(level.isPrime, isTrue);
    });

    test('stores composite correctly', () {
      final level = PrimeHunterLevel(number: 12, isPrime: false);
      expect(level.number, equals(12));
      expect(level.isPrime, isFalse);
    });
  });
}

bool _isPrime(int n) {
  if (n < 2) return false;
  for (int i = 2; i <= _sqrt(n); i++) {
    if (n % i == 0) return false;
  }
  return true;
}

int _sqrt(int n) {
  int x = n;
  int y = (x + 1) ~/ 2;
  while (y < x) {
    x = y;
    y = (x + n ~/ x) ~/ 2;
  }
  return x;
}
