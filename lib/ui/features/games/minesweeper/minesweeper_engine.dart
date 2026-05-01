import 'dart:math';

enum CellType { empty, mine }

class MinesweeperCell {
  final int row;
  final int col;
  bool isMine;
  bool isRevealed;
  bool isFlagged;
  int neighborMines;

  MinesweeperCell({
    required this.row,
    required this.col,
    this.isMine = false,
    this.isRevealed = false,
    this.isFlagged = false,
    this.neighborMines = 0,
  });
}

class MinesweeperEngine {
  final int rows;
  final int cols;
  final int mines;

  MinesweeperEngine({required this.rows, required this.cols, required this.mines});

  List<List<MinesweeperCell>> generateBoard() {
    List<List<MinesweeperCell>> board = List.generate(
      rows,
      (r) => List.generate(cols, (c) => MinesweeperCell(row: r, col: c)),
    );

    // Place mines
    int placedMines = 0;
    Random random = Random();
    while (placedMines < mines) {
      int r = random.nextInt(rows);
      int c = random.nextInt(cols);
      if (!board[r][c].isMine) {
        board[r][c].isMine = true;
        placedMines++;
      }
    }

    // Calculate neighbors
    for (int r = 0; r < rows; r++) {
      for (int c = 0; c < cols; c++) {
        if (!board[r][c].isMine) {
          board[r][c].neighborMines = _countNeighborMines(board, r, c);
        }
      }
    }

    return board;
  }

  int _countNeighborMines(List<List<MinesweeperCell>> board, int row, int col) {
    int count = 0;
    for (int i = -1; i <= 1; i++) {
      for (int j = -1; j <= 1; j++) {
        int nr = row + i;
        int nc = col + j;
        if (nr >= 0 && nr < rows && nc >= 0 && nc < cols) {
          if (board[nr][nc].isMine) count++;
        }
      }
    }
    return count;
  }
}
