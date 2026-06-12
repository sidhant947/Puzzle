import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/factor_finder/factor_finder_engine.dart';

void main() {
  group('FactorFinderEngine', () {
    late FactorFinderEngine engine;

    setUp(() {
      engine = FactorFinderEngine();
    });

    group('generateLevel', () {
      test('returns a FactorFinderLevel', () {
        final level = engine.generateLevel(0);
        expect(level, isA<FactorFinderLevel>());
      });

      test('grid has exactly 12 numbers', () {
        final level = engine.generateLevel(0);
        expect(level.gridNumbers.length, 12);
      });

      test('target number is positive', () {
        for (int i = 0; i < 20; i++) {
          final level = engine.generateLevel(i);
          expect(level.targetNumber, greaterThan(0));
        }
      });

      test('factorIndices only contain valid factors', () {
        for (int i = 0; i < 20; i++) {
          final level = engine.generateLevel(i);
          for (final idx in level.factorIndices) {
            expect(level.targetNumber % level.gridNumbers[idx], 0);
          }
        }
      });

      test('factor count is between 3 and 6', () {
        for (int i = 0; i < 20; i++) {
          final level = engine.generateLevel(i);
          expect(level.factorIndices.length, greaterThanOrEqualTo(3));
          expect(level.factorIndices.length, lessThanOrEqualTo(6));
        }
      });

      test('non-factor grid numbers are not divisible by target', () {
        final level = engine.generateLevel(0);
        final nonFactorIndices = List.generate(12, (i) => i)
            .where((i) => !level.factorIndices.contains(i))
            .toList();
        for (final idx in nonFactorIndices) {
          expect(level.targetNumber % level.gridNumbers[idx], isNot(0));
        }
      });

      test('easy targets are <= 24 for low score', () {
        for (int i = 0; i < 10; i++) {
          final level = engine.generateLevel(0);
          expect(level.targetNumber, lessThanOrEqualTo(24));
        }
      });

      test('hard targets are > 40 for high score', () {
        for (int i = 0; i < 10; i++) {
          final level = engine.generateLevel(10);
          expect(level.targetNumber, greaterThan(40));
        }
      });
    });
  });
}
