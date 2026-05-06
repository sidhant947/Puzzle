import 'dart:math';

enum CellState { hidden, revealed, flagged }

class MinesweeperCell {
  final int row;
  final int col;
  final bool isMine;
  final int neighborMines;
  CellState state;

  MinesweeperCell({
    required this.row,
    required this.col,
    required this.isMine,
    this.neighborMines = 0,
    this.state = CellState.hidden,
  });

  MinesweeperCell copyWith({
    CellState? state,
  }) {
    return MinesweeperCell(
      row: row,
      col: col,
      isMine: isMine,
      neighborMines: neighborMines,
      state: state ?? this.state,
    );
  }
}

class MinesweeperEngine {
  final int rows;
  final int cols;
  final int mineCount;
  final Random _random = Random();

  MinesweeperEngine({
    this.rows = 10,
    this.cols = 8,
    this.mineCount = 12,
  });

  List<List<MinesweeperCell>> generateBoard({int? startRow, int? startCol}) {
    List<List<bool>> mineLocations = List.generate(rows, (_) => List.filled(cols, false));
    int minesPlaced = 0;

    // Place mines randomly, avoiding the starting cell and its neighbors if provided
    while (minesPlaced < mineCount) {
      int r = _random.nextInt(rows);
      int c = _random.nextInt(cols);

      if (mineLocations[r][c]) continue;
      
      if (startRow != null && startCol != null) {
        // Avoid 3x3 area around start
        if ((r - startRow).abs() <= 1 && (c - startCol).abs() <= 1) continue;
      }

      mineLocations[r][c] = true;
      minesPlaced++;
    }

    List<List<MinesweeperCell>> board = List.generate(rows, (r) {
      return List.generate(cols, (c) {
        int neighbors = 0;
        for (int i = -1; i <= 1; i++) {
          for (int j = -1; j <= 1; j++) {
            int nr = r + i;
            int nc = c + j;
            if (nr >= 0 && nr < rows && nc >= 0 && nc < cols) {
              if (mineLocations[nr][nc]) neighbors++;
            }
          }
        }
        return MinesweeperCell(
          row: r,
          col: c,
          isMine: mineLocations[r][c],
          neighborMines: neighbors,
        );
      });
    });

    return board;
  }

  void revealEmptyCells(List<List<MinesweeperCell>> board, int r, int c) {
    if (r < 0 || r >= rows || c < 0 || c >= cols) return;
    if (board[r][c].state != CellState.hidden || board[r][c].isMine) return;

    board[r][c].state = CellState.revealed;

    if (board[r][c].neighborMines == 0) {
      for (int i = -1; i <= 1; i++) {
        for (int j = -1; j <= 1; j++) {
          revealEmptyCells(board, r + i, c + j);
        }
      }
    }
  }

  bool checkWin(List<List<MinesweeperCell>> board) {
    for (var row in board) {
      for (var cell in row) {
        if (!cell.isMine && cell.state != CellState.revealed) {
          return false;
        }
      }
    }
    return true;
  }
}
