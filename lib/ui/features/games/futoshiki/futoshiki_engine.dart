import 'dart:math';

class FutoshikiLevel {
  final int size; // e.g., 4
  final List<List<int>> solution; // size x size
  final List<List<int?>> clues; // size x size, starting number clues
  final List<List<String?>> hInequalities; // size x (size - 1), can be "<" or ">"
  final List<List<String?>> vInequalities; // (size - 1) x size, can be "^" (less than) or "v" (greater than)

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
    // 1. Generate random valid Latin Square of size 4x4
    final solution = _generateLatinSquare(size);

    // 2. Add starting clues
    final clues = List.generate(size, (_) => List<int?>.filled(size, null));
    // Let's expose around 3 starting clues
    int cluesCount = 3;
    final cells = [
      for (int r = 0; r < size; r++)
        for (int c = 0; c < size; c++) Point(c, r)
    ]..shuffle(_random);

    for (int i = 0; i < cluesCount; i++) {
      final cell = cells[i];
      clues[cell.y][cell.x] = solution[cell.y][cell.x];
    }

    // 3. Generate horizontal inequalities
    // Between (r, c) and (r, c+1)
    final hInequalities = List.generate(size, (_) => List<String?>.filled(size - 1, null));
    for (int r = 0; r < size; r++) {
      for (int c = 0; c < size - 1; c++) {
        // 25% chance of adding inequality
        if (_random.nextDouble() < 0.25) {
          final left = solution[r][c];
          final right = solution[r][c + 1];
          hInequalities[r][c] = left < right ? '<' : '>';
        }
      }
    }

    // 4. Generate vertical inequalities
    // Between (r, c) and (r+1, c).
    // Let's use "^" to mean (r, c) < (r+1, c) and "v" to mean (r, c) > (r+1, c)
    final vInequalities = List.generate(size - 1, (_) => List<String?>.filled(size, null));
    for (int r = 0; r < size - 1; r++) {
      for (int c = 0; c < size; c++) {
        // 25% chance of adding inequality
        if (_random.nextDouble() < 0.25) {
          final top = solution[r][c];
          final bottom = solution[r + 1][c];
          vInequalities[r][c] = top < bottom ? '^' : 'v';
        }
      }
    }

    return FutoshikiLevel(
      size: size,
      solution: solution,
      clues: clues,
      hInequalities: hInequalities,
      vInequalities: vInequalities,
    );
  }

  List<List<int>> _generateLatinSquare(int size) {
    var square = [
      [1, 2, 3, 4],
      [2, 3, 4, 1],
      [3, 4, 1, 2],
      [4, 1, 2, 3],
    ];

    // Shuffling symbols: map 1,2,3,4 to random permutation of 1,2,3,4
    final symbols = [1, 2, 3, 4]..shuffle(_random);
    for (int r = 0; r < size; r++) {
      for (int c = 0; c < size; c++) {
        square[r][c] = symbols[square[r][c] - 1];
      }
    }

    // Shuffle rows
    square.shuffle(_random);

    // Shuffle columns by transposing, shuffling, and transposing back
    square = _transpose(square, size);
    square.shuffle(_random);
    square = _transpose(square, size);

    return square;
  }

  List<List<int>> _transpose(List<List<int>> matrix, int size) {
    return List.generate(size, (r) => List.generate(size, (c) => matrix[c][r]));
  }
}
