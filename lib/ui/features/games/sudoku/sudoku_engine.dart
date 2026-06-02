import 'dart:math';

class SudokuEngine {
  static const int size = 9;
  static const int boxSize = 3;

  List<List<int>> generateBoard() {
    List<List<int>> board = List.generate(size, (_) => List.filled(size, 0));
    _fillBoard(board);
    return board;
  }

  static List<List<int>> generateFullBoard([dynamic _]) {
    return SudokuEngine().generateBoard();
  }

  static List<List<int>> generateInitialPuzzle(Map<String, dynamic> params) {
    final solved = params['solved'] as List<List<int>>;
    final clues = params['clues'] as int;
    return SudokuEngine().createPuzzle(solved, clues);
  }

  bool _fillBoard(List<List<int>> board) {
    for (int row = 0; row < size; row++) {
      for (int col = 0; col < size; col++) {
        if (board[row][col] == 0) {
          List<int> numbers = List.generate(size, (i) => i + 1)..shuffle();
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

  bool isValid(dynamic board, int row, int col, int num) {
    // Check row
    for (int i = 0; i < size; i++) {
      if (i != col && board[row][i] == num) return false;
    }
    // Check column
    for (int i = 0; i < size; i++) {
      if (i != row && board[i][col] == num) return false;
    }
    // Check box
    int boxRow = (row ~/ boxSize) * boxSize;
    int boxCol = (col ~/ boxSize) * boxSize;
    for (int i = 0; i < boxSize; i++) {
      for (int j = 0; j < boxSize; j++) {
        int r = boxRow + i;
        int c = boxCol + j;
        if ((r != row || c != col) && board[r][c] == num) return false;
      }
    }
    return true;
  }

  bool _isValid(dynamic board, int row, int col, int num) {
    return isValid(board, row, col, num);
  }

  List<List<int>> createPuzzle(List<List<int>> solvedBoard, int clues) {
    List<List<int>> puzzle =
        List.generate(size, (r) => List.from(solvedBoard[r]));
    int totalCells = size * size;
    int toRemove = totalCells - clues;
    
    // Ensure we don't remove more than possible
    toRemove = toRemove.clamp(0, totalCells - 17); // 17 is minimum for unique 9x9 Sudoku
    
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

  static bool isCorrectWrapper(Map<String, dynamic> params) {
    final engine = SudokuEngine();
    final board = params['board'] as List<List<int>>;
    final solvedBoard = params['solvedBoard'] as List<List<int>>;
    return engine.isCorrect(board, solvedBoard);
  }
}
