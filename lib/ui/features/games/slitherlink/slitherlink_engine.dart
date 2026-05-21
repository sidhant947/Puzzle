import 'dart:math';

class SlitherlinkLevel {
  final int size; // e.g., 3 for 3x3 cells
  final List<List<int?>> clues; // size x size clues
  final List<List<bool>> solutionHEdges; // (size + 1) x size
  final List<List<bool>> solutionVEdges; // size x (size + 1)

  SlitherlinkLevel({
    required this.size,
    required this.clues,
    required this.solutionHEdges,
    required this.solutionVEdges,
  });
}

class SlitherlinkEngine {
  final Random _random = Random();

  SlitherlinkLevel generateLevel({int size = 3}) {
    while (true) {
      // Step 1: Pick a random non-empty connected subset of cells
      final List<List<bool>> cells = List.generate(size, (_) => List.filled(size, false));
      _generateConnectedCellSubset(cells, size);

      // Step 2: Extract boundary edges
      final hEdges = List.generate(size + 1, (_) => List.filled(size, false));
      final vEdges = List.generate(size, (_) => List.filled(size + 1, false));

      for (int r = 0; r <= size; r++) {
        for (int c = 0; c < size; c++) {
          final topCell = r > 0 ? cells[r - 1][c] : false;
          final bottomCell = r < size ? cells[r][c] : false;
          if (topCell != bottomCell) {
            hEdges[r][c] = true;
          }
        }
      }

      for (int r = 0; r < size; r++) {
        for (int c = 0; c <= size; c++) {
          final leftCell = c > 0 ? cells[r][c - 1] : false;
          final rightCell = c < size ? cells[r][c] : false;
          if (leftCell != rightCell) {
            vEdges[r][c] = true;
          }
        }
      }

      // Step 3: Verify if it forms a single valid loop
      if (isValidSingleLoop(size, hEdges, vEdges)) {
        // Step 4: Calculate clues based on active boundary edges
        final clues = List.generate(size, (r) => List<int?>.filled(size, null));
        for (int r = 0; r < size; r++) {
          for (int c = 0; c < size; c++) {
            int count = 0;
            if (hEdges[r][c]) count++;       // Top
            if (hEdges[r + 1][c]) count++;   // Bottom
            if (vEdges[r][c]) count++;       // Left
            if (vEdges[r][c + 1]) count++;   // Right
            clues[r][c] = count;
          }
        }

        // Hide some clues randomly to make it a puzzle
        // We'll leave around 5-7 clues for a 3x3 grid
        final cluesCountToKeep = size == 3 ? 5 + _random.nextInt(3) : 9;
        var hiddenCount = (size * size) - cluesCountToKeep;
        final positions = [
          for (int r = 0; r < size; r++)
            for (int c = 0; c < size; c++) Point(c, r)
        ]..shuffle(_random);

        for (var p in positions) {
          if (hiddenCount <= 0) break;
          // Don't hide clue if it is a 0, 0s are extremely helpful
          if (clues[p.y][p.x] != 0) {
            clues[p.y][p.x] = null;
            hiddenCount--;
          }
        }

        return SlitherlinkLevel(
          size: size,
          clues: clues,
          solutionHEdges: hEdges,
          solutionVEdges: vEdges,
        );
      }
    }
  }

  void _generateConnectedCellSubset(List<List<bool>> cells, int size) {
    // Start with a random cell
    final startR = _random.nextInt(size);
    final startC = _random.nextInt(size);
    cells[startR][startC] = true;

    final targetSize = 2 + _random.nextInt(size * size - 3); // between 2 and size^2 - 2 cells
    var currentSize = 1;

    final List<Point<int>> frontier = [];
    void addNeighbors(int r, int c) {
      final dirs = [Point(0, 1), Point(1, 0), Point(0, -1), Point(-1, 0)];
      for (var d in dirs) {
        final nr = r + d.y;
        final nc = c + d.x;
        if (nr >= 0 && nr < size && nc >= 0 && nc < size && !cells[nr][nc]) {
          final pt = Point(nc, nr);
          if (!frontier.contains(pt)) frontier.add(pt);
        }
      }
    }

    addNeighbors(startR, startC);

    while (currentSize < targetSize && frontier.isNotEmpty) {
      final index = _random.nextInt(frontier.length);
      final nextCell = frontier.removeAt(index);
      cells[nextCell.y][nextCell.x] = true;
      currentSize++;
      addNeighbors(nextCell.y, nextCell.x);
    }
  }

  bool isValidSingleLoop(int size, List<List<bool>> hEdges, List<List<bool>> vEdges) {
    // Calculate degree for each vertex (dots)
    // Vertices are from (0,0) to (size, size)
    final degrees = List.generate(size + 1, (_) => List.filled(size + 1, 0));
    int totalActiveEdges = 0;

    for (int r = 0; r <= size; r++) {
      for (int c = 0; c < size; c++) {
        if (hEdges[r][c]) {
          degrees[r][c]++;
          degrees[r][c + 1]++;
          totalActiveEdges++;
        }
      }
    }

    for (int r = 0; r < size; r++) {
      for (int c = 0; c <= size; c++) {
        if (vEdges[r][c]) {
          degrees[r][c]++;
          degrees[r + 1][c]++;
          totalActiveEdges++;
        }
      }
    }

    if (totalActiveEdges == 0) return false;

    // Check if degrees of all vertices are either 0 or 2
    Point<int>? startVertex;
    for (int r = 0; r <= size; r++) {
      for (int c = 0; c <= size; c++) {
        final deg = degrees[r][c];
        if (deg != 0 && deg != 2) {
          return false; // Degree must be exactly 0 or 2 for a single loop
        }
        if (deg == 2 && startVertex == null) {
          startVertex = Point(c, r);
        }
      }
    }

    if (startVertex == null) return false;

    // Verify connectivity - trace the loop and count visited active edges
    int visitedEdges = 0;
    var current = startVertex;
    Point<int>? prev;

    do {
      Point<int>? next;
      // Search neighbors (up, down, left, right)
      // Up
      if (current.y > 0 && vEdges[current.y - 1][current.x]) {
        final candidate = Point(current.x, current.y - 1);
        if (candidate != prev) {
          next = candidate;
        }
      }
      // Down
      if (current.y < size && vEdges[current.y][current.x]) {
        final candidate = Point(current.x, current.y + 1);
        if (candidate != prev && next == null) {
          next = candidate;
        }
      }
      // Left
      if (current.x > 0 && hEdges[current.y][current.x - 1]) {
        final candidate = Point(current.x - 1, current.y);
        if (candidate != prev && next == null) {
          next = candidate;
        }
      }
      // Right
      if (current.x < size && hEdges[current.y][current.x]) {
        final candidate = Point(current.x + 1, current.y);
        if (candidate != prev && next == null) {
          next = candidate;
        }
      }

      if (next == null) return false; // Dead end or error in trace
      visitedEdges++;
      prev = current;
      current = next;
    } while (current != startVertex);

    return visitedEdges == totalActiveEdges;
  }
}
