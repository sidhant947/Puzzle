import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/binary_puzzle/binary_puzzle_engine.dart';

void main() {
  group('BinaryPuzzleEngine', () {
    late BinaryPuzzleEngine engine;

    setUp(() {
      engine = BinaryPuzzleEngine();
    });

    group('generateBoard', () {
      test('returns a BinaryPuzzleBoard', () {
        final board = engine.generateBoard();
        expect(board, isA<BinaryPuzzleBoard>());
      });

      test('board has correct size', () {
        final board = engine.generateBoard(size: 6);
        expect(board.size, 6);
        expect(board.grid.length, 6);
        for (final row in board.grid) {
          expect(row.length, 6);
        }
      });

      test('board has null values (puzzle cells)', () {
        final board = engine.generateBoard(size: 6);
        int nullCount = 0;
        for (final row in board.grid) {
          for (final cell in row) {
            if (cell == null) nullCount++;
          }
        }
        expect(nullCount, greaterThan(0));
      });

      test('filled cells are 0 or 1', () {
        final board = engine.generateBoard(size: 6);
        for (final row in board.grid) {
          for (final cell in row) {
            if (cell != null) {
              expect(cell == 0 || cell == 1, isTrue);
            }
          }
        }
      });
    });

    group('isCompleteAndValid', () {
      test('returns false for incomplete board', () {
        final board = engine.generateBoard(size: 6);
        expect(engine.isCompleteAndValid(board.grid, 6), isFalse);
      });

      test('returns true for valid completed board', () {
        final grid = <List<int?>>[
          [0, 1, 0, 1, 0, 1],
          [1, 0, 1, 0, 1, 0],
          [0, 1, 0, 1, 1, 0],
          [1, 0, 1, 0, 0, 1],
          [0, 1, 1, 0, 0, 1],
          [1, 0, 0, 1, 1, 0],
        ];
        expect(engine.isCompleteAndValid(grid, 6), isTrue);
      });

      test('returns false when three same values adjacent', () {
        final grid = <List<int?>>[
          [0, 0, 0, 1, 0, 1],
          [1, 1, 0, 0, 1, 0],
          [0, 1, 0, 1, 0, 1],
          [1, 0, 1, 0, 1, 0],
          [0, 0, 1, 1, 0, 1],
          [1, 1, 0, 0, 1, 0],
        ];
        expect(engine.isCompleteAndValid(grid, 6), isFalse);
      });

      test('returns false when row has unequal 0s and 1s', () {
        final grid = <List<int?>>[
          [0, 0, 0, 0, 1, 1],
          [1, 1, 0, 0, 1, 0],
          [0, 1, 0, 1, 0, 1],
          [1, 0, 1, 0, 1, 0],
          [0, 0, 1, 1, 0, 1],
          [1, 1, 0, 0, 1, 0],
        ];
        expect(engine.isCompleteAndValid(grid, 6), isFalse);
      });

      test('returns false when two columns are identical', () {
        final grid = <List<int?>>[
          [1, 0, 0, 1, 0, 1],
          [1, 0, 1, 1, 0, 0],
          [0, 1, 0, 0, 1, 1],
          [0, 1, 0, 1, 1, 0],
          [1, 0, 1, 0, 0, 1],
          [0, 1, 1, 0, 1, 0],
        ];
        expect(engine.isCompleteAndValid(grid, 6), isFalse);
      });

      test('accepts alternative valid solution dynamically', () {
        final grid = <List<int?>>[
          [1, 0, 0, 1, 1, 0],
          [1, 0, 1, 1, 0, 0],
          [0, 1, 0, 0, 1, 1],
          [0, 1, 0, 1, 1, 0],
          [1, 0, 1, 0, 0, 1],
          [0, 1, 1, 0, 0, 1],
        ];
        expect(engine.isCompleteAndValid(grid, 6), isTrue);
      });
    });

    group('getInvalidCells', () {
      test('returns all false for valid grid', () {
        final grid = <List<int?>>[
          [0, 1, 0, 1, 0, 1],
          [1, 0, 1, 0, 1, 0],
          [0, 1, 0, 1, 1, 0],
          [1, 0, 1, 0, 0, 1],
          [0, 1, 1, 0, 0, 1],
          [1, 0, 0, 1, 1, 0],
        ];
        final invalid = engine.getInvalidCells(grid, 6);
        for (final row in invalid) {
          for (final cell in row) {
            expect(cell, isFalse);
          }
        }
      });

      test('flags three adjacent identical numbers horizontally and vertically', () {
        final grid = List.generate(6, (_) => List<int?>.filled(6, null));
        grid[0][0] = 1;
        grid[0][1] = 1;
        grid[0][2] = 1;

        grid[2][4] = 0;
        grid[3][4] = 0;
        grid[4][4] = 0;

        final invalid = engine.getInvalidCells(grid, 6);
        expect(invalid[0][0], isTrue);
        expect(invalid[0][1], isTrue);
        expect(invalid[0][2], isTrue);
        expect(invalid[0][3], isFalse);

        expect(invalid[2][4], isTrue);
        expect(invalid[3][4], isTrue);
        expect(invalid[4][4], isTrue);
        expect(invalid[1][4], isFalse);
      });

      test('flags cells exceeding half count in row or column', () {
        final grid = List.generate(6, (_) => List<int?>.filled(6, null));
        grid[1][0] = 0;
        grid[1][1] = 0;
        grid[1][2] = 0;
        grid[1][3] = 0;
        grid[1][4] = 1;

        final invalid = engine.getInvalidCells(grid, 6);
        expect(invalid[1][0], isTrue);
        expect(invalid[1][1], isTrue);
        expect(invalid[1][2], isTrue);
        expect(invalid[1][3], isTrue);
        expect(invalid[1][4], isFalse);
      });

      test('flags identical completed columns', () {
        final grid = <List<int?>>[
          [1, 0, 0, 1, 0, 1],
          [1, 0, 1, 1, 0, 0],
          [0, 1, 0, 0, 1, 1],
          [0, 1, 0, 1, 1, 0],
          [1, 0, 1, 0, 0, 1],
          [0, 1, 1, 0, 1, 0],
        ];
        final invalid = engine.getInvalidCells(grid, 6);
        for (int r = 0; r < 6; r++) {
          expect(invalid[r][1], isTrue);
          expect(invalid[r][4], isTrue);
        }
      });
    });
  });
}
