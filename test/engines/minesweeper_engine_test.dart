import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/minesweeper/minesweeper_engine.dart';

void main() {
  group('MinesweeperEngine', () {
    late MinesweeperEngine engine;

    setUp(() {
      engine = MinesweeperEngine(rows: 5, cols: 5, mineCount: 5);
    });

    group('generateBoard', () {
      test('returns board with correct dimensions', () {
        final board = engine.generateBoard();
        expect(board.length, equals(5));
        for (final row in board) {
          expect(row.length, equals(5));
        }
      });

      test('board contains correct number of mines', () {
        final board = engine.generateBoard();
        int mineCount = 0;
        for (final row in board) {
          for (final cell in row) {
            if (cell.isMine) mineCount++;
          }
        }
        expect(mineCount, equals(5));
      });

      test('all cells are initially hidden', () {
        final board = engine.generateBoard();
        for (final row in board) {
          for (final cell in row) {
            expect(cell.state, equals(CellState.hidden));
          }
        }
      });

      test('neighbor counts are correct', () {
        final board = engine.generateBoard();
        for (int r = 0; r < 5; r++) {
          for (int c = 0; c < 5; c++) {
            int expected = 0;
            for (int dr = -1; dr <= 1; dr++) {
              for (int dc = -1; dc <= 1; dc++) {
                int nr = r + dr, nc = c + dc;
                if (nr >= 0 && nr < 5 && nc >= 0 && nc < 5) {
                  if (board[nr][nc].isMine) expected++;
                }
              }
            }
            expect(board[r][c].neighborMines, equals(expected),
                reason: 'Wrong count at ($r,$c)');
          }
        }
      });

      test('avoids mines near start position', () {
        final board = engine.generateBoard(startRow: 2, startCol: 2);
        for (int dr = -1; dr <= 1; dr++) {
          for (int dc = -1; dc <= 1; dc++) {
            expect(board[2 + dr][2 + dc].isMine, isFalse,
                reason: 'Mine near start at (${2 + dr},${2 + dc})');
          }
        }
      });
    });

    group('revealEmptyCells', () {
      test('reveals the target cell', () {
        final board = engine.generateBoard();
        // Find a cell with 0 neighbor mines
        for (int r = 0; r < 5; r++) {
          for (int c = 0; c < 5; c++) {
            if (!board[r][c].isMine && board[r][c].neighborMines == 0) {
              engine.revealEmptyCells(board, r, c);
              expect(board[r][c].state, equals(CellState.revealed));
              return;
            }
          }
        }
      });

      test('does not reveal mine cells', () {
        final board = engine.generateBoard();
        for (int r = 0; r < 5; r++) {
          for (int c = 0; c < 5; c++) {
            if (board[r][c].isMine) {
              engine.revealEmptyCells(board, r, c);
              expect(board[r][c].state, equals(CellState.hidden));
            }
          }
        }
      });

      test('flood fill reveals connected empty cells', () {
        final board = engine.generateBoard();
        // Find a 0-cell and reveal
        for (int r = 0; r < 5; r++) {
          for (int c = 0; c < 5; c++) {
            if (!board[r][c].isMine && board[r][c].neighborMines == 0) {
              engine.revealEmptyCells(board, r, c);
              // At least the target cell should be revealed
              expect(board[r][c].state, equals(CellState.revealed));
              // Adjacent cells with 0 should also be revealed
              bool foundRevealed = false;
              for (int dr = -1; dr <= 1; dr++) {
                for (int dc = -1; dc <= 1; dc++) {
                  int nr = r + dr, nc = c + dc;
                  if (nr >= 0 && nr < 5 && nc >= 0 && nc < 5) {
                    if (board[nr][nc].state == CellState.revealed) foundRevealed = true;
                  }
                }
              }
              expect(foundRevealed, isTrue);
              return;
            }
          }
        }
      });
    });

    group('checkWin', () {
      test('returns true when all non-mine cells are revealed', () {
        final board = engine.generateBoard();
        for (int r = 0; r < 5; r++) {
          for (int c = 0; c < 5; c++) {
            if (!board[r][c].isMine) {
              board[r][c] = board[r][c].copyWith(state: CellState.revealed);
            }
          }
        }
        expect(engine.checkWin(board), isTrue);
      });

      test('returns false when some non-mine cells are hidden', () {
        final board = engine.generateBoard();
        expect(engine.checkWin(board), isFalse);
      });

      test('returns false when all cells are hidden', () {
        final board = engine.generateBoard();
        expect(engine.checkWin(board), isFalse);
      });
    });

    group('MinesweeperCell', () {
      test('copyWith preserves fields', () {
        final cell = MinesweeperCell(
          row: 1, col: 2, isMine: true, neighborMines: 3, state: CellState.hidden,
        );
        final copy = cell.copyWith(state: CellState.revealed);
        expect(copy.row, equals(1));
        expect(copy.col, equals(2));
        expect(copy.isMine, isTrue);
        expect(copy.neighborMines, equals(3));
        expect(copy.state, equals(CellState.revealed));
      });
    });
  });
}
