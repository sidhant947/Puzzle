import 'dart:math';

class SudokuEngine {
  static const int size = 4;
  static const int boxSize = 2;

  List<List<int>> generateBoard() {
    List<List<int>> board = List.generate(size, (_) => List.filled(size, 0));
    _fillBoard(board);
    return board;
  }

  bool _fillBoard(List<List<int>> board) {
    for (int row = 0; row < size; row++) {
      for (int col = 0; col < size; col++) {
        if (board[row][col] == 0) {
          List<int> numbers = [1, 2, 3, 4]..shuffle();
          for (int num in numbers) {
            if (_isValid(board, row, col, num)) {
              board[row][col] = num;
              if (_fillBoard(board)) return true;
              board[row][col] = 0;
            }
          }
          return false;
        }
      }
    }
    return true;
  }

  bool _isValid(List<List<int>> board, int row, int col, int num) {
    // Check row
    for (int i = 0; i < size; i++) {
      if (board[row][i] == num) return false;
    }
    // Check column
    for (int i = 0; i < size; i++) {
      if (board[i][col] == num) return false;
    }
    // Check box
    int boxRow = (row ~/ boxSize) * boxSize;
    int boxCol = (col ~/ boxSize) * boxSize;
    for (int i = 0; i < boxSize; i++) {
      for (int j = 0; j < boxSize; j++) {
        if (board[boxRow + i][boxCol + j] == num) return false;
      }
    }
    return true;
  }

  List<List<int>> createPuzzle(List<List<int>> solvedBoard, int clues) {
    List<List<int>> puzzle =
        List.generate(size, (r) => List.from(solvedBoard[r]));
    int toRemove = (size * size) - clues;
    Random random = Random();
    while (toRemove > 0) {
      int r = random.nextInt(size);
      int c = random.nextInt(size);
      if (puzzle[r][c] != 0) {
        puzzle[r][c] = 0;
        toRemove--;
      }
    }
    return puzzle;
  }

  bool isComplete(List<List<int>> board) {
    for (int r = 0; r < size; r++) {
      for (int c = 0; c < size; c++) {
        if (board[r][c] == 0) return false;
      }
    }
    return true;
  }

  bool isCorrect(List<List<int>> board, List<List<int>> solvedBoard) {
    // A board is correct if it is completely filled and no rules are violated.
    if (!isComplete(board)) return false;

    for (int r = 0; r < size; r++) {
      for (int c = 0; c < size; c++) {
        int num = board[r][c];
        board[r][c] = 0; // Temporarily remove to check validity
        bool valid = _isValid(board, r, c, num);
        board[r][c] = num; // Restore
        if (!valid) return false;
      }
    }
    return true;
  }
}
