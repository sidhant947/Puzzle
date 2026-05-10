import 'dart:math';

class MagicSquaresEngine {
  final Random _random = Random();

  /// Generates a 3x3 magic square.
  /// The most common one uses numbers 1-9 and sum 15.
  /// We can rotate and reflect it to get variations.
  Map<String, dynamic> generatePuzzle({int difficulty = 1}) {
    List<List<int>> baseSquare = [
      [8, 1, 6],
      [3, 5, 7],
      [4, 9, 2],
    ];

    // Random rotations and reflections
    int rotations = _random.nextInt(4);
    for (int i = 0; i < rotations; i++) {
      baseSquare = _rotate(baseSquare);
    }
    if (_random.nextBool()) {
      baseSquare = _reflect(baseSquare);
    }

    // Hide some cells
    int cellsToHide = 3 + difficulty + _random.nextInt(2);
    List<List<int?>> puzzle = baseSquare.map((row) => row.map<int?>((val) => val).toList()).toList();
    List<List<bool>> fixed = List.generate(3, (_) => List.filled(3, true));

    int hiddenCount = 0;
    while (hiddenCount < cellsToHide) {
      int r = _random.nextInt(3);
      int c = _random.nextInt(3);
      if (puzzle[r][c] != null) {
        puzzle[r][c] = null;
        fixed[r][c] = false;
        hiddenCount++;
      }
    }

    return {
      'solution': baseSquare,
      'puzzle': puzzle,
      'fixed': fixed,
      'targetSum': 15,
    };
  }

  List<List<int>> _rotate(List<List<int>> square) {
    List<List<int>> result = List.generate(3, (_) => List.filled(3, 0));
    for (int r = 0; r < 3; r++) {
      for (int c = 0; c < 3; c++) {
        result[c][2 - r] = square[r][c];
      }
    }
    return result;
  }

  List<List<int>> _reflect(List<List<int>> square) {
    return square.map((row) => row.reversed.toList()).toList();
  }
}
