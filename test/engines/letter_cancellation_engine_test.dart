import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/letter_cancellation/letter_cancellation_engine.dart';

void main() {
  group('LetterCancellationEngine', () {
    late LetterCancellationEngine engine;

    setUp(() {
      engine = LetterCancellationEngine();
    });

    group('generateGrid', () {
      test('returns target, grid, targetCount, rows, and cols', () {
        final result = engine.generateGrid(rows: 5, cols: 4);
        expect(result.containsKey('target'), isTrue);
        expect(result.containsKey('grid'), isTrue);
        expect(result.containsKey('targetCount'), isTrue);
        expect(result.containsKey('rows'), isTrue);
        expect(result.containsKey('cols'), isTrue);
      });

      test('grid has correct number of cells', () {
        final result = engine.generateGrid(rows: 5, cols: 4);
        final grid = result['grid'] as List<String>;
        expect(grid.length, equals(20));
      });

      test('target is a single uppercase letter', () {
        for (int i = 0; i < 20; i++) {
          final result = engine.generateGrid();
          final target = result['target'] as String;
          expect(target.length, equals(1));
          expect(target, matches(RegExp(r'[A-Z]')));
        }
      });

      test('all grid cells are single uppercase letters', () {
        final result = engine.generateGrid(rows: 3, cols: 3);
        final grid = result['grid'] as List<String>;
        for (final cell in grid) {
          expect(cell.length, equals(1));
          expect(cell, matches(RegExp(r'[A-Z]')));
        }
      });

      test('targetCount matches actual count of target in grid', () {
        final result = engine.generateGrid(rows: 6, cols: 6);
        final grid = result['grid'] as List<String>;
        final target = result['target'] as String;
        final reportedCount = result['targetCount'] as int;
        final actualCount = grid.where((c) => c == target).length;
        expect(reportedCount, equals(actualCount));
      });

      test('targetCount is at least 1', () {
        for (int i = 0; i < 20; i++) {
          final result = engine.generateGrid();
          expect(result['targetCount'], greaterThanOrEqualTo(1));
        }
      });

      test('grid contains the target letter', () {
        final result = engine.generateGrid(rows: 4, cols: 4);
        final grid = result['grid'] as List<String>;
        final target = result['target'] as String;
        expect(grid.contains(target), isTrue);
      });

      test('no non-target cells equal the target', () {
        final result = engine.generateGrid(rows: 8, cols: 6);
        final grid = result['grid'] as List<String>;
        final target = result['target'] as String;
        int count = 0;
        for (final cell in grid) {
          if (cell == target) count++;
        }
        expect(count, equals(result['targetCount']));
      });

      test('uses default dimensions', () {
        final result = engine.generateGrid();
        expect(result['rows'], equals(8));
        expect(result['cols'], equals(6));
        final grid = result['grid'] as List<String>;
        expect(grid.length, equals(48));
      });
    });
  });
}
