import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/block_count_3d/block_count_3d_engine.dart';

void main() {
  group('BlockCount3DEngine', () {
    late BlockCount3DEngine engine;

    setUp(() {
      engine = BlockCount3DEngine();
    });

    group('generateLevel', () {
      test('returns a BlockCount3DLevel', () {
        final level = engine.generateLevel();
        expect(level, isA<BlockCount3DLevel>());
      });

      test('grid has correct size', () {
        final level = engine.generateLevel(size: 3);
        expect(level.grid.length, 3);
        for (final row in level.grid) {
          expect(row.length, 3);
        }
      });

      test('total blocks matches grid sum', () {
        final level = engine.generateLevel(size: 4);
        int sum = 0;
        for (final row in level.grid) {
          for (final cell in row) {
            sum += cell;
          }
        }
        expect(level.totalBlocks, sum);
      });

      test('grid cells are non-negative', () {
        final level = engine.generateLevel();
        for (final row in level.grid) {
          for (final cell in row) {
            expect(cell, greaterThanOrEqualTo(0));
          }
        }
      });

      test('total blocks is at least 3', () {
        for (int i = 0; i < 20; i++) {
          final level = engine.generateLevel(size: 3);
          expect(level.totalBlocks, greaterThanOrEqualTo(3));
        }
      });

      test('block heights are within maxHeight', () {
        final level = engine.generateLevel(size: 3, maxHeight: 2);
        for (final row in level.grid) {
          for (final cell in row) {
            expect(cell, lessThanOrEqualTo(2));
          }
        }
      });
    });
  });

  group('BlockCount3DLevel', () {
    test('stores grid and totalBlocks', () {
      final level = BlockCount3DLevel(
        grid: [[1, 2], [3, 0]],
        totalBlocks: 6,
      );
      expect(level.grid, [[1, 2], [3, 0]]);
      expect(level.totalBlocks, 6);
    });
  });
}
