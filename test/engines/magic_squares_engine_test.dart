import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/magic_squares/magic_squares_engine.dart';

void main() {
  group('MagicSquaresEngine', () {
    late MagicSquaresEngine engine;

    setUp(() {
      engine = MagicSquaresEngine();
    });

    group('generatePuzzle', () {
      test('returns solution, puzzle, fixed, and targetSum', () {
        final result = engine.generatePuzzle();
        expect(result.containsKey('solution'), isTrue);
        expect(result.containsKey('puzzle'), isTrue);
        expect(result.containsKey('fixed'), isTrue);
        expect(result.containsKey('targetSum'), isTrue);
      });

      test('solution is a 3x3 grid', () {
        final result = engine.generatePuzzle();
        final solution = result['solution'] as List<List<int>>;
        expect(solution.length, equals(3));
        for (final row in solution) {
          expect(row.length, equals(3));
        }
      });

      test('solution contains numbers 1-9 exactly once', () {
        final result = engine.generatePuzzle();
        final solution = result['solution'] as List<List<int>>;
        final flat = solution.expand((r) => r).toList()..sort();
        expect(flat, equals([1, 2, 3, 4, 5, 6, 7, 8, 9]));
      });

      test('each row sums to targetSum', () {
        final result = engine.generatePuzzle();
        final solution = result['solution'] as List<List<int>>;
        final targetSum = result['targetSum'] as int;
        for (final row in solution) {
          expect(row.reduce((a, b) => a + b), equals(targetSum));
        }
      });

      test('each column sums to targetSum', () {
        final result = engine.generatePuzzle();
        final solution = result['solution'] as List<List<int>>;
        final targetSum = result['targetSum'] as int;
        for (int c = 0; c < 3; c++) {
          int colSum = 0;
          for (int r = 0; r < 3; r++) {
            colSum += solution[r][c];
          }
          expect(colSum, equals(targetSum));
        }
      });

      test('both diagonals sum to targetSum', () {
        final result = engine.generatePuzzle();
        final solution = result['solution'] as List<List<int>>;
        final targetSum = result['targetSum'] as int;

        int diag1 = solution[0][0] + solution[1][1] + solution[2][2];
        int diag2 = solution[0][2] + solution[1][1] + solution[2][0];
        expect(diag1, equals(targetSum));
        expect(diag2, equals(targetSum));
      });

      test('targetSum is 15', () {
        final result = engine.generatePuzzle();
        expect(result['targetSum'], equals(15));
      });

      test('puzzle has hidden cells', () {
        final result = engine.generatePuzzle(difficulty: 2);
        final puzzle = result['puzzle'] as List<List<int?>>;
        int nullCount = 0;
        for (final row in puzzle) {
          for (final cell in row) {
            if (cell == null) nullCount++;
          }
        }
        expect(nullCount, greaterThanOrEqualTo(1));
      });

      test('fixed cells match puzzle cells', () {
        final result = engine.generatePuzzle();
        final puzzle = result['puzzle'] as List<List<int?>>;
        final fixed = result['fixed'] as List<List<bool>>;
        for (int r = 0; r < 3; r++) {
          for (int c = 0; c < 3; c++) {
            if (fixed[r][c]) {
              expect(puzzle[r][c], isNotNull);
            }
          }
        }
      });
    });
  });
}
