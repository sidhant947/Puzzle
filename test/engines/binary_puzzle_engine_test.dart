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
    });
  });
}
