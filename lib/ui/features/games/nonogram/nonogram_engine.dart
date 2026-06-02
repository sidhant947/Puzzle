import 'dart:math';

class NonogramPuzzle {
  final List<List<int>> rowClues;
  final List<List<int>> colClues;

  NonogramPuzzle({
    required this.rowClues,
    required this.colClues,
  });
}

class NonogramEngine {
  final Random _random = Random();

  NonogramPuzzle generatePuzzle(int size) {
    // 1. Generate a random grid
    // For a better experience, we can weight it towards being filled
    final List<List<bool>> solution = List.generate(
      size,
      (_) => List.generate(size, (_) => _random.nextDouble() > 0.45),
    );

    // 2. Generate row clues
    final List<List<int>> rowClues = [];
    for (int r = 0; r < size; r++) {
      rowClues.add(_calculateClues(solution[r]));
    }

    // 3. Generate col clues
    final List<List<int>> colClues = [];
    for (int c = 0; c < size; c++) {
      final List<bool> column = [];
      for (int r = 0; r < size; r++) {
        column.add(solution[r][c]);
      }
      colClues.add(_calculateClues(column));
    }

    return NonogramPuzzle(
      rowClues: rowClues,
      colClues: colClues,
    );
  }

  List<int> _calculateClues(List<bool> line) {
    final List<int> clues = [];
    int currentRun = 0;
    for (bool cell in line) {
      if (cell) {
        currentRun++;
      } else if (currentRun > 0) {
        clues.add(currentRun);
        currentRun = 0;
      }
    }
    if (currentRun > 0) {
      clues.add(currentRun);
    }
    return clues.isEmpty ? [0] : clues;
  }

  static bool isCorrect(List<List<int>> currentGrid, List<List<int>> rowClues, List<List<int>> colClues) {
    final size = currentGrid.length;
    final engine = NonogramEngine();

    // Check rows
    for (int r = 0; r < size; r++) {
      final List<bool> row = currentGrid[r].map((e) => e == 1).toList();
      final calculatedClues = engine._calculateClues(row);
      if (!engine._listEquals(calculatedClues, rowClues[r])) return false;
    }

    // Check columns
    for (int c = 0; c < size; c++) {
      final List<bool> column = [];
      for (int r = 0; r < size; r++) {
        column.add(currentGrid[r][c] == 1);
      }
      final calculatedClues = engine._calculateClues(column);
      if (!engine._listEquals(calculatedClues, colClues[c])) return false;
    }

    return true;
  }

  bool _listEquals(List<int> a, List<int> b) {
    if (a.length != b.length) return false;
    for (int i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }

  static NonogramPuzzle generatePuzzleWrapper(int size) {
    return NonogramEngine().generatePuzzle(size);
  }

  static bool isCorrectWrapper(Map<String, dynamic> params) {
    return isCorrect(
      params['grid'] as List<List<int>>,
      params['rowClues'] as List<List<int>>,
      params['colClues'] as List<List<int>>,
    );
  }
}
