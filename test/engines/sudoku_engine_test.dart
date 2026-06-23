import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/sudoku/sudoku_engine.dart';

void main() {
  group('SudokuEngine', () {
    late SudokuEngine engine;

    setUp(() {
      engine = SudokuEngine();
    });

    group('generateBoard', () {
      test('generates a 9x9 board', () {
        final board = engine.generateBoard();
        expect(board.length, 9);
        for (final row in board) {
          expect(row.length, 9);
        }
      });

      test('board contains only digits 1-9', () {
        final board = engine.generateBoard();
        for (final row in board) {
          for (final cell in row) {
            expect(cell, greaterThanOrEqualTo(1));
            expect(cell, lessThanOrEqualTo(9));
          }
        }
      });

      test('board has no zeros', () {
        final board = engine.generateBoard();
        for (final row in board) {
          for (final cell in row) {
            expect(cell, isNot(equals(0)));
          }
        }
      });

      test('board is a valid Sudoku solution', () {
        final board = engine.generateBoard();
        expect(engine.isComplete(board), isTrue);
        expect(engine.isCorrect(board, board), isTrue);
      });
    });

    group('isValid', () {
      test('returns true for valid placement on empty board', () {
        final board = List.generate(9, (_) => List.filled(9, 0));
        expect(SudokuEngine.isValid(board, 0, 0, 1), isTrue);
      });

      test('returns false for duplicate in row', () {
        final board = List.generate(9, (_) => List.filled(9, 0));
        board[0][1] = 5;
        expect(SudokuEngine.isValid(board, 0, 0, 5), isFalse);
      });

      test('returns false for duplicate in column', () {
        final board = List.generate(9, (_) => List.filled(9, 0));
        board[1][0] = 5;
        expect(SudokuEngine.isValid(board, 0, 0, 5), isFalse);
      });

      test('returns false for duplicate in 3x3 box', () {
        final board = List.generate(9, (_) => List.filled(9, 0));
        board[1][1] = 5;
        expect(SudokuEngine.isValid(board, 0, 0, 5), isFalse);
      });

      test('returns true for different numbers in same row', () {
        final board = List.generate(9, (_) => List.filled(9, 0));
        board[0][1] = 1;
        board[0][2] = 2;
        expect(SudokuEngine.isValid(board, 0, 0, 3), isTrue);
      });
    });

    group('createPuzzle', () {
      test('creates puzzle with correct number of clues', () {
        final solved = engine.generateBoard();
        final puzzle = engine.createPuzzle(solved, 30);

        int clueCount = 0;
        for (final row in puzzle) {
          for (final cell in row) {
            if (cell != 0) clueCount++;
          }
        }
        expect(clueCount, greaterThanOrEqualTo(17));
        expect(clueCount, lessThanOrEqualTo(81));
      });

      test('puzzle preserves original solved cells', () {
        final solved = engine.generateBoard();
        final puzzle = engine.createPuzzle(solved, 30);

        for (int r = 0; r < 9; r++) {
          for (int c = 0; c < 9; c++) {
            if (puzzle[r][c] != 0) {
              expect(puzzle[r][c], equals(solved[r][c]));
            }
          }
        }
      });
    });

    group('isComplete', () {
      test('returns true for complete board', () {
        final board = engine.generateBoard();
        expect(engine.isComplete(board), isTrue);
      });

      test('returns false for incomplete board', () {
        final board = engine.generateBoard();
        board[0][0] = 0;
        expect(engine.isComplete(board), isFalse);
      });

      test('returns false for empty board', () {
        final board = List.generate(9, (_) => List.filled(9, 0));
        expect(engine.isComplete(board), isFalse);
      });
    });

    group('isCorrect', () {
      test('returns true for valid complete board', () {
        final board = engine.generateBoard();
        expect(engine.isCorrect(board, board), isTrue);
      });

      test('returns false for incomplete board', () {
        final board = engine.generateBoard();
        board[0][0] = 0;
        expect(engine.isCorrect(board, board), isFalse);
      });

      test('returns false for board with duplicate in row', () {
        final board = engine.generateBoard();
        // Create a duplicate by swapping two values in same row
        final temp = board[0][0];
        board[0][0] = board[0][1];
        board[0][1] = temp;
        // Now both might have duplicates
        expect(engine.isCorrect(board, board), isFalse);
      });
    });
  });
}
