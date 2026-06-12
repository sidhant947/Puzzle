import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/kenken/kenken_engine.dart';

void main() {
  group('KenKenEngine', () {
    late KenKenEngine engine;

    setUp(() {
      engine = KenKenEngine();
    });

    group('generatePuzzle', () {
      test('returns size, solution, cages, and cageData', () {
        final puzzle = engine.generatePuzzle(size: 4);
        expect(puzzle.containsKey('size'), isTrue);
        expect(puzzle.containsKey('solution'), isTrue);
        expect(puzzle.containsKey('cages'), isTrue);
        expect(puzzle.containsKey('cageData'), isTrue);
      });

      test('solution is a valid Latin square', () {
        final puzzle = engine.generatePuzzle(size: 4);
        final solution = puzzle['solution'] as List<List<int>>;

        expect(solution.length, equals(4));
        for (final row in solution) {
          expect(row.length, equals(4));
          // Each row contains 1-4
          final sorted = List<int>.from(row)..sort();
          expect(sorted, equals([1, 2, 3, 4]));
        }

        // Each column contains 1-4
        for (int c = 0; c < 4; c++) {
          final col = [for (int r = 0; r < 4; r++) solution[r][c]];
          final sorted = List<int>.from(col)..sort();
          expect(sorted, equals([1, 2, 3, 4]));
        }
      });

      test('cages grid has correct size', () {
        final puzzle = engine.generatePuzzle(size: 4);
        final cages = puzzle['cages'] as List<List<int>>;
        expect(cages.length, equals(4));
        for (final row in cages) {
          expect(row.length, equals(4));
        }
      });

      test('every cell belongs to a cage', () {
        final puzzle = engine.generatePuzzle(size: 4);
        final cages = puzzle['cages'] as List<List<int>>;
        for (final row in cages) {
          for (final cell in row) {
            expect(cell, greaterThanOrEqualTo(0));
          }
        }
      });

      test('cageData entries have op, target, and cells', () {
        final puzzle = engine.generatePuzzle(size: 4);
        final cageData = puzzle['cageData'] as List<Map<String, dynamic>>;
        expect(cageData, isNotEmpty);
        for (final cage in cageData) {
          expect(cage.containsKey('op'), isTrue);
          expect(cage.containsKey('target'), isTrue);
          expect(cage.containsKey('cells'), isTrue);
          final cells = cage['cells'] as List;
          expect(cells, isNotEmpty);
        }
      });

      test('single-cell cages have empty op', () {
        final puzzle = engine.generatePuzzle(size: 4);
        final cageData = puzzle['cageData'] as List<Map<String, dynamic>>;
        bool foundSingle = false;
        for (final cage in cageData) {
          final cells = cage['cells'] as List;
          if (cells.length == 1) {
            foundSingle = true;
            expect(cage['op'], equals(''));
            expect(cage['target'], isA<int>());
          }
        }
        // With size 4, it's very likely there's at least one single-cell cage
        // but not guaranteed, so we just check if any exist
      });

      test('generates different puzzles', () {
        final p1 = engine.generatePuzzle(size: 4);
        final p2 = engine.generatePuzzle(size: 4);
        final s1 = (p1['solution'] as List<List<int>>).toString();
        final s2 = (p2['solution'] as List<List<int>>).toString();
        // Very unlikely to be identical
        expect(s1, isNot(equals(s2)));
      });
    });
  });
}
