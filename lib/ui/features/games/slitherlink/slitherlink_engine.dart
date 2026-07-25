import 'dart:math';

class SlitherlinkLevel {
  final int size;
  final List<List<int?>> clues;
  final List<List<bool>> solutionHEdges;
  final List<List<bool>> solutionVEdges;

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
      final result = _tryGenerate(size);
      if (result != null) return result;
    }
  }

  SlitherlinkLevel? _tryGenerate(int size) {
    // 1. Generate a valid loop solution
    final cells = List.generate(size, (_) => List.filled(size, false));
    _generateConnectedCellSubset(cells, size);

    final hEdges = List.generate(size + 1, (_) => List.filled(size, false));
    final vEdges = List.generate(size, (_) => List.filled(size + 1, false));

    for (int r = 0; r <= size; r++) {
      for (int c = 0; c < size; c++) {
        if ((r > 0 ? cells[r - 1][c] : false) != (r < size ? cells[r][c] : false)) {
          hEdges[r][c] = true;
        }
      }
    }

    for (int r = 0; r < size; r++) {
      for (int c = 0; c <= size; c++) {
        if ((c > 0 ? cells[r][c - 1] : false) != (c < size ? cells[r][c] : false)) {
          vEdges[r][c] = true;
        }
      }
    }

    if (!isValidSingleLoop(size, hEdges, vEdges)) return null;

    // 2. Calculate clues
    final clues = List.generate(size, (r) => List<int?>.filled(size, null));
    for (int r = 0; r < size; r++) {
      for (int c = 0; c < size; c++) {
        int count = 0;
        if (hEdges[r][c]) count++;
        if (hEdges[r + 1][c]) count++;
        if (vEdges[r][c]) count++;
        if (vEdges[r][c + 1]) count++;
        clues[r][c] = count;
      }
    }

    // 3. Hide clues one by one, checking unique solution each time
    final positions = [
      for (int r = 0; r < size; r++)
        for (int c = 0; c < size; c++) [r, c]
    ]..shuffle(_random);

    for (final pos in positions) {
      final r = pos[0], c = pos[1];
      if (clues[r][c] == null || clues[r][c] == 0) continue;

      final backup = clues[r][c];
      clues[r][c] = null;

      if (_countSolutions(size, clues) != 1) {
        clues[r][c] = backup;
      }
    }

    if (_countSolutions(size, clues) != 1) return null;

    return SlitherlinkLevel(
      size: size,
      clues: clues,
      solutionHEdges: hEdges,
      solutionVEdges: vEdges,
    );
  }

  int _countSolutions(int size, List<List<int?>> clues) {
    final allEdges = _getAllEdges(size);
    final hEdges = List.generate(size + 1, (_) => List.filled(size, false));
    final vEdges = List.generate(size, (_) => List.filled(size + 1, false));
    return _solveEdges(size, clues, allEdges, 0, hEdges, vEdges, 0);
  }

  List<List<int>> _getAllEdges(int size) {
    final edges = <List<int>>[];
    // Horizontal edges: [0, r, c] means hEdges[r][c]
    for (int r = 0; r <= size; r++) {
      for (int c = 0; c < size; c++) {
        edges.add([0, r, c]);
      }
    }
    // Vertical edges: [1, r, c] means vEdges[r][c]
    for (int r = 0; r < size; r++) {
      for (int c = 0; c <= size; c++) {
        edges.add([1, r, c]);
      }
    }
    return edges;
  }

  int _solveEdges(
    int size,
    List<List<int?>> clues,
    List<List<int>> allEdges,
    int edgeIdx,
    List<List<bool>> hEdges,
    List<List<bool>> vEdges,
    int count,
  ) {
    if (count > 1) return count;

    // Skip to next undetermined edge
    while (edgeIdx < allEdges.length) {
      final e = allEdges[edgeIdx];
      final isSet = e[0] == 0 ? hEdges[e[1]][e[2]] : vEdges[e[1]][e[2]];
      if (!isSet) break;
      edgeIdx++;
    }

    if (edgeIdx >= allEdges.length) {
      // All edges determined — check validity
      if (isValidSingleLoop(size, hEdges, vEdges) && _matchesClues(size, clues, hEdges, vEdges)) {
        return count + 1;
      }
      return count;
    }

    final e = allEdges[edgeIdx];

    // Try edge OFF
    count = _solveEdges(size, clues, allEdges, edgeIdx + 1, hEdges, vEdges, count);
    if (count > 1) return count;

    // Try edge ON (with pruning)
    if (e[0] == 0) {
      hEdges[e[1]][e[2]] = true;
    } else {
      vEdges[e[1]][e[2]] = true;
    }

    if (_isPartialValid(size, clues, hEdges, vEdges)) {
      count = _solveEdges(size, clues, allEdges, edgeIdx + 1, hEdges, vEdges, count);
    }

    if (e[0] == 0) {
      hEdges[e[1]][e[2]] = false;
    } else {
      vEdges[e[1]][e[2]] = false;
    }

    return count;
  }

  bool _isPartialValid(
    int size,
    List<List<int?>> clues,
    List<List<bool>> hEdges,
    List<List<bool>> vEdges,
  ) {
    // Check degree constraints: no vertex can have degree > 2
    final degrees = List.generate(size + 1, (_) => List.filled(size + 1, 0));

    for (int r = 0; r <= size; r++) {
      for (int c = 0; c < size; c++) {
        if (hEdges[r][c]) {
          degrees[r][c]++;
          degrees[r][c + 1]++;
        }
      }
    }

    for (int r = 0; r < size; r++) {
      for (int c = 0; c <= size; c++) {
        if (vEdges[r][c]) {
          degrees[r][c]++;
          degrees[r + 1][c]++;
        }
      }
    }

    for (int r = 0; r <= size; r++) {
      for (int c = 0; c <= size; c++) {
        if (degrees[r][c] > 2) return false;
      }
    }

    // Check clue constraints
    for (int r = 0; r < size; r++) {
      for (int c = 0; c < size; c++) {
        if (clues[r][c] == null) continue;
        int count = 0;
        int unknown = 0;
        if (hEdges[r][c]) { count++; } else { unknown++; }
        if (hEdges[r + 1][c]) { count++; } else { unknown++; }
        if (vEdges[r][c]) { count++; } else { unknown++; }
        if (vEdges[r][c + 1]) { count++; } else { unknown++; }
        if (count > clues[r][c]!) return false;
        if (count + unknown < clues[r][c]!) return false;
      }
    }

    return true;
  }

  bool _matchesClues(
    int size,
    List<List<int?>> clues,
    List<List<bool>> hEdges,
    List<List<bool>> vEdges,
  ) {
    for (int r = 0; r < size; r++) {
      for (int c = 0; c < size; c++) {
        if (clues[r][c] == null) continue;
        int count = 0;
        if (hEdges[r][c]) count++;
        if (hEdges[r + 1][c]) count++;
        if (vEdges[r][c]) count++;
        if (vEdges[r][c + 1]) count++;
        if (count != clues[r][c]) return false;
      }
    }
    return true;
  }

  void _generateConnectedCellSubset(List<List<bool>> cells, int size) {
    final startR = _random.nextInt(size);
    final startC = _random.nextInt(size);
    cells[startR][startC] = true;

    final targetSize = 2 + _random.nextInt(size * size - 3);
    var currentSize = 1;

    final List<Point<int>> frontier = [];
    void addNeighbors(int r, int c) {
      for (var d in [Point(0, 1), Point(1, 0), Point(0, -1), Point(-1, 0)]) {
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

    Point<int>? startVertex;
    for (int r = 0; r <= size; r++) {
      for (int c = 0; c <= size; c++) {
        final deg = degrees[r][c];
        if (deg != 0 && deg != 2) return false;
        if (deg == 2 && startVertex == null) startVertex = Point(c, r);
      }
    }

    if (startVertex == null) return false;

    int visitedEdges = 0;
    var current = startVertex;
    Point<int>? prev;

    do {
      Point<int>? next;
      if (current.y > 0 && vEdges[current.y - 1][current.x]) {
        final candidate = Point(current.x, current.y - 1);
        if (candidate != prev) next = candidate;
      }
      if (current.y < size && vEdges[current.y][current.x]) {
        final candidate = Point(current.x, current.y + 1);
        if (candidate != prev && next == null) next = candidate;
      }
      if (current.x > 0 && hEdges[current.y][current.x - 1]) {
        final candidate = Point(current.x - 1, current.y);
        if (candidate != prev && next == null) next = candidate;
      }
      if (current.x < size && hEdges[current.y][current.x]) {
        final candidate = Point(current.x + 1, current.y);
        if (candidate != prev && next == null) next = candidate;
      }

      if (next == null) return false;
      visitedEdges++;
      prev = current;
      current = next;
    } while (current != startVertex);

    return visitedEdges == totalActiveEdges;
  }
}
