import 'dart:math';

class FutoshikiLevel {
  final int size;
  final List<List<int>> solution;
  final List<List<int?>> clues;
  final List<List<String?>> hInequalities;
  final List<List<String?>> vInequalities;

  FutoshikiLevel({
    required this.size,
    required this.solution,
    required this.clues,
    required this.hInequalities,
    required this.vInequalities,
  });
}

class FutoshikiEngine {
  final Random _random = Random();

  FutoshikiLevel generateLevel({int size = 4}) {
    final solution = _generateLatinSquare(size);

    // Start with empty clues and inequalities
    final clues = List.generate(size, (_) => List<int?>.filled(size, null));
    final hInequalities = List.generate(size, (_) => List<String?>.filled(size - 1, null));
    final vInequalities = List.generate(size - 1, (_) => List<String?>.filled(size, null));

    // Add horizontal inequalities
    for (int r = 0; r < size; r++) {
      for (int c = 0; c < size - 1; c++) {
        if (_random.nextDouble() < 0.3) {
          final left = solution[r][c];
          final right = solution[r][c + 1];
          hInequalities[r][c] = left < right ? '<' : '>';
        }
      }
    }

    // Add vertical inequalities
    for (int r = 0; r < size - 1; r++) {
      for (int c = 0; c < size; c++) {
        if (_random.nextDouble() < 0.3) {
          final top = solution[r][c];
          final bottom = solution[r + 1][c];
          vInequalities[r][c] = top < bottom ? '^' : 'v';
        }
      }
    }

    // Add clues until puzzle has unique solution
    final cells = [
      for (int r = 0; r < size; r++)
        for (int c = 0; c < size; c++) Point(c, r)
    ]..shuffle(_random);

    for (final cell in cells) {
      if (_countSolutions(size, clues, hInequalities, vInequalities) == 1) break;
      clues[cell.y][cell.x] = solution[cell.y][cell.x];
    }

    return FutoshikiLevel(
      size: size,
      solution: solution,
      clues: clues,
      hInequalities: hInequalities,
      vInequalities: vInequalities,
    );
  }

  int _countSolutions(
    int size,
    List<List<int?>> clues,
    List<List<String?>> hIneq,
    List<List<String?>> vIneq,
  ) {
    final board = List.generate(size, (r) => List<int?>.filled(size, null));
    // Copy clues into board
    for (int r = 0; r < size; r++) {
      for (int c = 0; c < size; c++) {
        board[r][c] = clues[r][c];
      }
    }
    return _solve(board, size, hIneq, vIneq, 0);
  }

  int _solve(
    List<List<int?>> board,
    int size,
    List<List<String?>> hIneq,
    List<List<String?>> vIneq,
    int count,
  ) {
    if (count > 1) return count;

    for (int r = 0; r < size; r++) {
      for (int c = 0; c < size; c++) {
        if (board[r][c] == null) {
          for (int num = 1; num <= size; num++) {
            if (_isValidPlacement(board, size, r, c, num, hIneq, vIneq)) {
              board[r][c] = num;
              count = _solve(board, size, hIneq, vIneq, count);
              board[r][c] = null;
              if (count > 1) return count;
            }
          }
          return count;
        }
      }
    }
    return count + 1;
  }

  bool _isValidPlacement(
    List<List<int?>> board,
    int size,
    int row,
    int col,
    int num,
    List<List<String?>> hIneq,
    List<List<String?>> vIneq,
  ) {
    // Check row: no duplicate
    for (int i = 0; i < size; i++) {
      if (i != col && board[row][i] == num) return false;
    }
    // Check column: no duplicate
    for (int i = 0; i < size; i++) {
      if (i != row && board[i][col] == num) return false;
    }

    // Temporarily place the number
    board[row][col] = num;

    // Check horizontal inequalities involving this cell
    // Left neighbor: (row, col-1) < (row, col) means hIneq[row][col-1] == '<'
    if (col > 0 && hIneq[row][col - 1] != null && board[row][col - 1] != null) {
      if (hIneq[row][col - 1] == '<' && board[row][col - 1]! >= num) { board[row][col] = null; return false; }
      if (hIneq[row][col - 1] == '>' && board[row][col - 1]! <= num) { board[row][col] = null; return false; }
    }
    // Right neighbor: (row, col) < (row, col+1) means hIneq[row][col] == '<'
    if (col < size - 1 && hIneq[row][col] != null && board[row][col + 1] != null) {
      if (hIneq[row][col] == '<' && num >= board[row][col + 1]!) { board[row][col] = null; return false; }
      if (hIneq[row][col] == '>' && num <= board[row][col + 1]!) { board[row][col] = null; return false; }
    }

    // Check vertical inequalities involving this cell
    // Top neighbor: (row-1, col) < (row, col) means vIneq[row-1][col] == '^'
    if (row > 0 && vIneq[row - 1][col] != null && board[row - 1][col] != null) {
      if (vIneq[row - 1][col] == '^' && board[row - 1][col]! >= num) { board[row][col] = null; return false; }
      if (vIneq[row - 1][col] == 'v' && board[row - 1][col]! <= num) { board[row][col] = null; return false; }
    }
    // Bottom neighbor: (row, col) < (row+1, col) means vIneq[row][col] == '^'
    if (row < size - 1 && vIneq[row][col] != null && board[row + 1][col] != null) {
      if (vIneq[row][col] == '^' && num >= board[row + 1][col]!) { board[row][col] = null; return false; }
      if (vIneq[row][col] == 'v' && num <= board[row + 1][col]!) { board[row][col] = null; return false; }
    }

    board[row][col] = null;
    return true;
  }

  List<List<int>> _generateLatinSquare(int size) {
    final square = List.generate(size, (r) => List.generate(size, (c) => (c + r) % size + 1));

    final symbols = List.generate(size, (i) => i + 1)..shuffle(_random);
    for (int r = 0; r < size; r++) {
      for (int c = 0; c < size; c++) {
        square[r][c] = symbols[square[r][c] - 1];
      }
    }

    square.shuffle(_random);

    final transposed = _transpose(square, size);
    transposed.shuffle(_random);
    return _transpose(transposed, size);
  }

  List<List<int>> _transpose(List<List<int>> matrix, int size) {
    return List.generate(size, (r) => List.generate(size, (c) => matrix[c][r]));
  }
}
