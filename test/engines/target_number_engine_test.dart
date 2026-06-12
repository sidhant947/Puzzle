import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/target_number/target_number_engine.dart';

void main() {
  group('TargetNumberEngine', () {
    late TargetNumberEngine engine;

    setUp(() {
      engine = TargetNumberEngine();
    });

    group('generatePuzzle', () {
      test('returns map with numbers and target keys', () {
        final puzzle = engine.generatePuzzle();
        expect(puzzle, contains('numbers'));
        expect(puzzle, contains('target'));
      });

      test('target is 24', () {
        final puzzle = engine.generatePuzzle();
        expect(puzzle['target'], 24);
      });

      test('numbers list has 4 items', () {
        final puzzle = engine.generatePuzzle();
        final numbers = puzzle['numbers'] as List<int>;
        expect(numbers.length, 4);
      });

      test('all numbers are between 1 and 9', () {
        final puzzle = engine.generatePuzzle();
        final numbers = puzzle['numbers'] as List<int>;
        for (final n in numbers) {
          expect(n, greaterThanOrEqualTo(1));
          expect(n, lessThanOrEqualTo(9));
        }
      });

      test('generated puzzle always has a solution', () {
        for (int i = 0; i < 10; i++) {
          final puzzle = engine.generatePuzzle();
          final numbers = puzzle['numbers'] as List<int>;
          expect(engine.hasSolution(numbers, 24), isTrue);
        }
      });
    });

    group('hasSolution', () {
      test('returns true for [6, 6, 6, 6] targeting 24', () {
        expect(engine.hasSolution([6, 6, 6, 6], 24), isTrue);
      });

      test('returns true for [1, 2, 3, 4] targeting 24', () {
        expect(engine.hasSolution([1, 2, 3, 4], 24), isTrue);
      });

      test('returns true for [3, 8, 8, 1] targeting 24', () {
        expect(engine.hasSolution([3, 8, 8, 1], 24), isTrue);
      });

      test('returns false for [1, 1, 1, 1] targeting 24', () {
        expect(engine.hasSolution([1, 1, 1, 1], 24), isFalse);
      });

      test('returns true for [1, 1, 1, 1] targeting 0', () {
        expect(engine.hasSolution([1, 1, 1, 1], 0), isTrue);
      });

      test('returns true for [2, 3, 6, 4] targeting 24', () {
        expect(engine.hasSolution([2, 3, 6, 4], 24), isTrue);
      });

      test('returns true for [8, 3, 8, 3] targeting 24', () {
        expect(engine.hasSolution([8, 3, 8, 3], 24), isTrue);
      });
    });
  });
}
