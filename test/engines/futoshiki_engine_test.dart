import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/futoshiki/futoshiki_engine.dart';

void main() {
  group('FutoshikiEngine', () {
    late FutoshikiEngine engine;

    setUp(() {
      engine = FutoshikiEngine();
    });

    group('generateLevel', () {
      test('returns a FutoshikiLevel', () {
        final level = engine.generateLevel(size: 4);
        expect(level, isA<FutoshikiLevel>());
      });

      test('solution is a valid Latin Square', () {
        final level = engine.generateLevel(size: 4);
        final solution = level.solution;

        for (int r = 0; r < 4; r++) {
          final rowValues = solution[r].toSet();
          expect(rowValues.length, 4);
          for (final v in rowValues) {
            expect(v, greaterThanOrEqualTo(1));
            expect(v, lessThanOrEqualTo(4));
          }
        }

        for (int c = 0; c < 4; c++) {
          final colValues = <int>{};
          for (int r = 0; r < 4; r++) {
            colValues.add(solution[r][c]);
          }
          expect(colValues.length, 4);
        }
      });

      test('clues matrix has correct dimensions', () {
        final level = engine.generateLevel(size: 4);
        expect(level.clues.length, 4);
        expect(level.clues[0].length, 4);
      });

      test('hInequalities has correct dimensions', () {
        final level = engine.generateLevel(size: 4);
        expect(level.hInequalities.length, 4);
        expect(level.hInequalities[0].length, 3);
      });

      test('vInequalities has correct dimensions', () {
        final level = engine.generateLevel(size: 4);
        expect(level.vInequalities.length, 3);
        expect(level.vInequalities[0].length, 4);
      });

      test('horizontal inequalities are consistent with solution', () {
        final level = engine.generateLevel(size: 4);
        for (int r = 0; r < 4; r++) {
          for (int c = 0; c < 3; c++) {
            final ineq = level.hInequalities[r][c];
            if (ineq != null) {
              final left = level.solution[r][c];
              final right = level.solution[r][c + 1];
              if (ineq == '<') {
                expect(left, lessThan(right));
              } else {
                expect(left, greaterThan(right));
              }
            }
          }
        }
      });

      test('vertical inequalities are consistent with solution', () {
        final level = engine.generateLevel(size: 4);
        for (int r = 0; r < 3; r++) {
          for (int c = 0; c < 4; c++) {
            final ineq = level.vInequalities[r][c];
            if (ineq != null) {
              final top = level.solution[r][c];
              final bottom = level.solution[r + 1][c];
              if (ineq == '^') {
                expect(top, lessThan(bottom));
              } else {
                expect(top, greaterThan(bottom));
              }
            }
          }
        }
      });

      test('exposed clues match solution values', () {
        final level = engine.generateLevel(size: 4);
        for (int r = 0; r < 4; r++) {
          for (int c = 0; c < 4; c++) {
            if (level.clues[r][c] != null) {
              expect(level.clues[r][c], level.solution[r][c]);
            }
          }
        }
      });
    });
  });
}
