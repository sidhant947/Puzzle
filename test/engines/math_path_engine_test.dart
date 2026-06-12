import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/math_path/math_path_engine.dart';

void main() {
  group('MathPathEngine', () {
    late MathPathEngine engine;

    setUp(() {
      engine = MathPathEngine();
    });

    group('generateLevel', () {
      test('returns level with correct fields', () {
        final level = engine.generateLevel(size: 5);
        expect(level.size, equals(5));
        expect(level.grid.length, equals(5));
        expect(level.targetSum, greaterThan(0));
        expect(level.solutionPath, isNotEmpty);
      });

      test('grid has correct dimensions', () {
        final level = engine.generateLevel(size: 5);
        expect(level.grid.length, equals(5));
        for (final row in level.grid) {
          expect(row.length, equals(5));
        }
      });

      test('grid values are between 1 and 9', () {
        final level = engine.generateLevel(size: 5);
        for (final row in level.grid) {
          for (final cell in row) {
            expect(cell, greaterThanOrEqualTo(1));
            expect(cell, lessThanOrEqualTo(9));
          }
        }
      });

      test('solution path starts at (0,0)', () {
        final level = engine.generateLevel(size: 5);
        expect(level.solutionPath.first.x, equals(0));
        expect(level.solutionPath.first.y, equals(0));
      });

      test('solution path ends at bottom-right', () {
        final level = engine.generateLevel(size: 5);
        expect(level.solutionPath.last.x, equals(4));
        expect(level.solutionPath.last.y, equals(4));
      });

      test('path length is size*2-1', () {
        final level = engine.generateLevel(size: 5);
        expect(level.solutionPath.length, equals(9)); // 5+5-1
      });

      test('targetSum matches sum of path cells', () {
        final level = engine.generateLevel(size: 5);
        int sum = 0;
        for (final p in level.solutionPath) {
          sum += level.grid[p.y][p.x];
        }
        expect(sum, equals(level.targetSum));
      });

      test('path only moves right or down', () {
        final level = engine.generateLevel(size: 5);
        for (int i = 1; i < level.solutionPath.length; i++) {
          final prev = level.solutionPath[i - 1];
          final curr = level.solutionPath[i];
          final dx = curr.x - prev.x;
          final dy = curr.y - prev.y;
          expect(dx + dy, equals(1), reason: 'Path should only move right or down');
        }
      });
    });
  });
}
