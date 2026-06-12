import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/divisibility_dash/divisibility_dash_engine.dart';

void main() {
  group('DivisibilityDashEngine', () {
    late DivisibilityDashEngine engine;

    setUp(() {
      engine = DivisibilityDashEngine();
    });

    group('generateProblem', () {
      test('returns a DivisibilityProblem', () {
        final problem = engine.generateProblem();
        expect(problem, isA<DivisibilityProblem>());
      });

      test('number is between 100 and 998', () {
        for (int i = 0; i < 20; i++) {
          final problem = engine.generateProblem();
          expect(problem.number, greaterThanOrEqualTo(100));
          expect(problem.number, lessThanOrEqualTo(998));
        }
      });

      test('has at least 2 divisors between 2 and 9', () {
        for (int i = 0; i < 20; i++) {
          final problem = engine.generateProblem();
          expect(problem.correctDivisors.length, greaterThanOrEqualTo(2));
        }
      });

      test('all listed divisors actually divide the number', () {
        for (int i = 0; i < 20; i++) {
          final problem = engine.generateProblem();
          for (final d in problem.correctDivisors) {
            expect(problem.number % d, 0);
          }
        }
      });

      test('all listed divisors are in range 2-9', () {
        for (int i = 0; i < 20; i++) {
          final problem = engine.generateProblem();
          for (final d in problem.correctDivisors) {
            expect(d, greaterThanOrEqualTo(2));
            expect(d, lessThanOrEqualTo(9));
          }
        }
      });
    });
  });
}
