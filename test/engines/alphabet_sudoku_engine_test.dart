import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/alphabet_sudoku/alphabet_sudoku_engine.dart';

void main() {
  group('AlphabetSudokuEngine', () {
    late AlphabetSudokuEngine engine;

    setUp(() {
      engine = AlphabetSudokuEngine();
    });

    group('constructor', () {
      test('defaults to size 9', () {
        expect(engine.size, 9);
        expect(engine.boxSize, 3);
      });

      test('generates alphabets list', () {
        expect(engine.alphabets.length, 9);
        expect(engine.alphabets.first, 'A');
        expect(engine.alphabets.last, 'I');
      });
    });

    group('generateBoard', () {
      test('generates a 9x9 board', () {
        final board = engine.generateBoard();
        expect(board.length, 9);
        for (final row in board) {
          expect(row.length, 9);
        }
      });

      test('board contains only values 1-9', () {
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
    });

    group('isValid', () {
      test('returns true for valid placement on empty board', () {
        final board = List.generate(9, (_) => List.filled(9, 0));
        expect(engine.isValid(board, 0, 0, 1), isTrue);
      });

      test('returns false for duplicate in row', () {
        final board = List.generate(9, (_) => List.filled(9, 0));
        board[0][1] = 5;
        expect(engine.isValid(board, 0, 0, 5), isFalse);
      });

      test('returns false for duplicate in column', () {
        final board = List.generate(9, (_) => List.filled(9, 0));
        board[1][0] = 5;
        expect(engine.isValid(board, 0, 0, 5), isFalse);
      });

      test('returns false for duplicate in 3x3 box', () {
        final board = List.generate(9, (_) => List.filled(9, 0));
        board[1][1] = 5;
        expect(engine.isValid(board, 0, 0, 5), isFalse);
      });
    });

    group('createPuzzle', () {
      test('creates puzzle from solved board', () {
        final solved = engine.generateBoard();
        final puzzle = engine.createPuzzle(solved, clues: 35);
        expect(puzzle.length, 9);
        for (final row in puzzle) {
          expect(row.length, 9);
        }
      });

      test('puzzle preserves original solved cells', () {
        final solved = engine.generateBoard();
        final puzzle = engine.createPuzzle(solved, clues: 35);
        for (int r = 0; r < 9; r++) {
          for (int c = 0; c < 9; c++) {
            if (puzzle[r][c] != 0) {
              expect(puzzle[r][c], equals(solved[r][c]));
            }
          }
        }
      });
    });

    group('getLetter', () {
      test('returns correct letter for value', () {
        expect(engine.getLetter(1), 'A');
        expect(engine.getLetter(9), 'I');
      });

      test('returns empty for out of range', () {
        expect(engine.getLetter(0), '');
        expect(engine.getLetter(10), '');
        expect(engine.getLetter(-1), '');
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
    });

    group('isCorrect', () {
      test('returns true for valid complete board', () {
        final board = engine.generateBoard();
        expect(engine.isCorrect(board), isTrue);
      });

      test('returns false for incomplete board', () {
        final board = engine.generateBoard();
        board[0][0] = 0;
        expect(engine.isCorrect(board), isFalse);
      });
    });

    group('static methods', () {
      test('generateFullBoard creates valid board', () {
        final board = AlphabetSudokuEngine.generateFullBoard(4);
        expect(board.length, 4);
        for (final row in board) {
          expect(row.length, 4);
        }
      });
    });
  });
}
