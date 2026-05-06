import 'dart:math';

class NonogramPuzzle {
  final List<List<bool>> solution;
  final List<List<int>> rowClues;
  final List<List<int>> colClues;

  NonogramPuzzle({
    required this.solution,
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
      solution: solution,
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

  bool isCorrect(List<List<int>> currentGrid, List<List<bool>> solution) {
    // 0: empty, 1: filled, 2: marked (X)
    for (int r = 0; r < solution.length; r++) {
      for (int c = 0; c < solution[r].length; c++) {
        final bool isFilled = currentGrid[r][c] == 1;
        if (isFilled != solution[r][c]) {
          return false;
        }
      }
    }
    return true;
  }
}
