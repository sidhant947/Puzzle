import 'dart:math';

class KenKenEngine {
  final Random _random = Random();

  Map<String, dynamic> generatePuzzle({int size = 4}) {
    List<List<int>> solution = _generateLatinSquare(size);
    List<List<int>> cages = List.generate(size, (_) => List.filled(size, -1));
    List<Map<String, dynamic>> cageData = [];

    int cageCount = 0;
    List<Point<int>> cells = [];
    for (int r = 0; r < size; r++) {
      for (int c = 0; c < size; c++) {
        cells.add(Point(r, c));
      }
    }
    cells.shuffle();

    for (var cell in cells) {
      if (cages[cell.y][cell.x] != -1) continue;

      List<Point<int>> currentCage = [cell];
      cages[cell.y][cell.x] = cageCount;

      // Try to add 1-2 neighbors
      int neighborsToAdd = _random.nextInt(3); 
      for (int i = 0; i < neighborsToAdd; i++) {
        Point<int>? neighbor = _getRandomNeighbor(currentCage, cages, size);
        if (neighbor != null) {
          currentCage.add(neighbor);
          cages[neighbor.y][neighbor.x] = cageCount;
        }
      }

      // Calculate op and target for the cage
      cageData.add(_calculateCageGoal(currentCage, solution));
      cageCount++;
    }

    return {
      'size': size,
      'solution': solution,
      'cages': cages,
      'cageData': cageData,
    };
  }

  List<List<int>> _generateLatinSquare(int size) {
    List<int> firstRow = List.generate(size, (i) => i + 1)..shuffle();
    List<List<int>> square = [firstRow];

    for (int r = 1; r < size; r++) {
      List<int> row = List.from(square[r - 1]);
      // Simple shift for a quick Latin square (can be more random)
      int shift = 1;
      square.add(List.generate(size, (i) => row[(i + shift) % size]));
    }
    
    // Shuffle rows and columns to make it more random
    square.shuffle();
    for (int c = 0; c < size; c++) {
      int c2 = _random.nextInt(size);
      for (int r = 0; r < size; r++) {
        int temp = square[r][c];
        square[r][c] = square[r][c2];
        square[r][c2] = temp;
      }
    }

    return square;
  }

  Point<int>? _getRandomNeighbor(List<Point<int>> cage, List<List<int>> cages, int size) {
    List<Point<int>> candidates = [];
    for (var cell in cage) {
      final dirs = [Point(0, 1), Point(0, -1), Point(1, 0), Point(-1, 0)];
      for (var d in dirs) {
        int nx = cell.x + d.x;
        int ny = cell.y + d.y;
        if (nx >= 0 && nx < size && ny >= 0 && ny < size && cages[ny][nx] == -1) {
          candidates.add(Point(nx, ny));
        }
      }
    }
    if (candidates.isEmpty) return null;
    return candidates[_random.nextInt(candidates.length)];
  }

  Map<String, dynamic> _calculateCageGoal(List<Point<int>> cage, List<List<int>> solution) {
    List<int> values = cage.map((p) => solution[p.y][p.x]).toList();
    
    if (cage.length == 1) {
      return {'op': '', 'target': values[0], 'cells': cage};
    }

    if (cage.length == 2) {
      int a = values[0];
      int b = values[1];
      int type = _random.nextInt(4);
      if (type == 0) return {'op': '+', 'target': a + b, 'cells': cage};
      if (type == 1) return {'op': '-', 'target': (a - b).abs(), 'cells': cage};
      if (type == 2) return {'op': '×', 'target': a * b, 'cells': cage};
      if (a % b == 0) return {'op': '÷', 'target': a ~/ b, 'cells': cage};
      if (b % a == 0) return {'op': '÷', 'target': b ~/ a, 'cells': cage};
      // Fallback
      return {'op': '+', 'target': a + b, 'cells': cage};
    }

    // Larger cages usually only + or *
    if (_random.nextBool()) {
      int sum = values.reduce((a, b) => a + b);
      return {'op': '+', 'target': sum, 'cells': cage};
    } else {
      int prod = values.reduce((a, b) => a * b);
      return {'op': '×', 'target': prod, 'cells': cage};
    }
  }
}
