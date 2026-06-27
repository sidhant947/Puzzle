import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/skyscrapers/skyscrapers_engine.dart';

void main() {
  group('SkyscrapersEngine', () {
    late SkyscrapersEngine engine;

    setUp(() {
      engine = SkyscrapersEngine();
    });

    group('generateLevel', () {
      test('returns all required keys', () {
        final level = engine.generateLevel(size: 4);
        expect(level.containsKey('solution'), isTrue);
        expect(level.containsKey('top'), isTrue);
        expect(level.containsKey('bottom'), isTrue);
        expect(level.containsKey('left'), isTrue);
        expect(level.containsKey('right'), isTrue);
      });

      test('solution is a valid Latin Square', () {
        final level = engine.generateLevel(size: 4);
        final solution = level['solution'] as List<List<int>>;
        for (final row in solution) {
          final values = row.toSet();
          expect(values.length, 4);
          for (final v in values) {
            expect(v, inInclusiveRange(1, 4));
          }
        }
        // Columns too
        for (int c = 0; c < 4; c++) {
          final col = [for (int r = 0; r < 4; r++) solution[r][c]];
          expect(col.toSet().length, 4);
        }
      });

      test('clue arrays have correct length', () {
        final level = engine.generateLevel(size: 4);
        expect((level['top'] as List).length, 4);
        expect((level['bottom'] as List).length, 4);
        expect((level['left'] as List).length, 4);
        expect((level['right'] as List).length, 4);
      });

      test('clue values are between 1 and size', () {
        final level = engine.generateLevel(size: 4);
        for (final side in ['top', 'bottom', 'left', 'right']) {
          for (final clue in level[side] as List<int>) {
            expect(clue, greaterThanOrEqualTo(1));
            expect(clue, lessThanOrEqualTo(4));
          }
        }
      });

      test('works with different sizes', () {
        final level3 = engine.generateLevel(size: 3);
        final sol3 = level3['solution'] as List<List<int>>;
        expect(sol3.length, 3);
        for (final row in sol3) {
          expect(row.length, 3);
        }
      });
    });

    group('checkVictoryWrapper', () {
      test('returns true for a valid solution', () {
        final level = engine.generateLevel(size: 4);
        final result = SkyscrapersEngine.checkVictoryWrapper({
          'grid': level['solution'],
          'top': level['top'],
          'bottom': level['bottom'],
          'left': level['left'],
          'right': level['right'],
        });
        expect(result, isTrue);
      });

      test('returns false for invalid grid with duplicate in row', () {
        final level = engine.generateLevel(size: 4);
        final grid = (level['solution'] as List<List<int>>)
            .map((r) => List<int>.from(r))
            .toList();
        grid[0][0] = grid[0][1];
        final result = SkyscrapersEngine.checkVictoryWrapper({
          'grid': grid,
          'top': level['top'],
          'bottom': level['bottom'],
          'left': level['left'],
          'right': level['right'],
        });
        expect(result, isFalse);
      });

      test('returns false for out-of-range values', () {
        final level = engine.generateLevel(size: 4);
        final grid = (level['solution'] as List<List<int>>)
            .map((r) => List<int>.from(r))
            .toList();
        grid[0][0] = 0;
        final result = SkyscrapersEngine.checkVictoryWrapper({
          'grid': grid,
          'top': level['top'],
          'bottom': level['bottom'],
          'left': level['left'],
          'right': level['right'],
        });
        expect(result, isFalse);
      });

      test('returns false when left clue is wrong', () {
        final level = engine.generateLevel(size: 4);
        final grid = level['solution'] as List<List<int>>;
        final left = List<int>.from(level['left'] as List<int>);
        left[0] = 99;
        final result = SkyscrapersEngine.checkVictoryWrapper({
          'grid': grid,
          'top': level['top'],
          'bottom': level['bottom'],
          'left': left,
          'right': level['right'],
        });
        expect(result, isFalse);
      });
    });
  });
}
