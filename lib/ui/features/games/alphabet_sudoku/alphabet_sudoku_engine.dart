import 'dart:math';

class AlphabetSudokuEngine {
  final int size;
  final int boxSize;
  final List<String> alphabets;

  AlphabetSudokuEngine({this.size = 9})
      : boxSize = sqrt(size).toInt(),
        alphabets = List.generate(size, (i) => String.fromCharCode(82 + i));

  static List<List<int>> generateFullBoard(int size) {
    return AlphabetSudokuEngine(size: size).generateBoard();
  }

  static List<List<int>> generateInitialPuzzle(Map<String, dynamic> params) {
    final size = params['size'] as int;
    final clues = params['clues'] as int?;
    final solved = params['solved'] as List<List<int>>;
    return AlphabetSudokuEngine(size: size).createPuzzle(solved, clues: clues);
  }

  List<List<int>> generateBoard() {
    List<List<int>> board = List.generate(size, (_) => List.filled(size, 0));
    _fillBoard(board);
    return board;
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

  bool isValid(List<List<int>> board, int row, int col, int num) {
    for (int i = 0; i < size; i++) {
      if (i != col && board[row][i] == num) return false;
    }
    for (int i = 0; i < size; i++) {
      if (i != row && board[i][col] == num) return false;
    }
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

  bool _isValid(List<List<int>> board, int row, int col, int num) {
    return isValid(board, row, col, num);
  }

  List<List<int>> createPuzzle(List<List<int>> solvedBoard, {int? clues}) {
    List<List<int>> puzzle = List.generate(size, (r) => List.from(solvedBoard[r]));
    int totalCells = size * size;
    int targetClues = clues ?? (size == 9 ? 35 : (size == 4 ? 6 : 30));
    int toRemove = totalCells - targetClues;

    int minClues = size == 9 ? 17 : (size == 4 ? 4 : 10);
    toRemove = toRemove.clamp(0, totalCells - minClues);

    Random random = Random();
    List<List<int>> candidates = [];
    for (int r = 0; r < size; r++) {
      for (int c = 0; c < size; c++) {
        candidates.add([r, c]);
      }
    }
    candidates.shuffle(random);

    int removed = 0;
    for (var candidate in candidates) {
      if (removed >= toRemove) break;
      int r = candidate[0];
      int c = candidate[1];
      if (puzzle[r][c] == 0) continue;

      int backup = puzzle[r][c];
      puzzle[r][c] = 0;

      if (_countSolutions(puzzle) == 1) {
        removed++;
      } else {
        puzzle[r][c] = backup;
      }
    }
    return puzzle;
  }

  int _countSolutions(List<List<int>> board) {
    return _solve(board, 0);
  }

  int _solve(List<List<int>> board, int count) {
    if (count > 1) return count;

    for (int row = 0; row < size; row++) {
      for (int col = 0; col < size; col++) {
        if (board[row][col] == 0) {
          for (int num = 1; num <= size; num++) {
            if (_isValid(board, row, col, num)) {
              board[row][col] = num;
              count = _solve(board, count);
              board[row][col] = 0;
              if (count > 1) return count;
            }
          }
          return count;
        }
      }
    }
    return count + 1;
  }

  String getLetter(int value) {
    if (value <= 0 || value > size) return '';
    return alphabets[value - 1];
  }

  bool isComplete(List<List<int>> board) {
    for (int r = 0; r < size; r++) {
      for (int c = 0; c < size; c++) {
        if (board[r][c] == 0) return false;
      }
    }
    return true;
  }

  bool isCorrect(List<List<int>> board) {
    if (!isComplete(board)) return false;
    for (int r = 0; r < size; r++) {
      for (int c = 0; c < size; c++) {
        int num = board[r][c];
        board[r][c] = 0;
        bool valid = _isValid(board, r, c, num);
        board[r][c] = num;
        if (!valid) return false;
      }
    }
    return true;
  }
}
