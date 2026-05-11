import 'dart:math';
import 'dart:collection';

class TowerOfLondonEngine {
  final Random _random = Random();

  // Returns a random valid configuration of beads on pegs
  // Peg 1: max 3, Peg 2: max 2, Peg 3: max 1
  List<List<int>> generateRandomConfig() {
    List<int> beads = [1, 2, 3]; // 1: Red, 2: Green, 3: Blue
    beads.shuffle(_random);
    
    List<List<int>> config = [[], [], []];
    
    // Shuffle beads and then try to place them randomly in valid slots
    for (int bead in beads) {
      List<int> pegs = [0, 1, 2];
      pegs.shuffle(_random);
      for (int peg in pegs) {
        int max = peg == 0 ? 3 : (peg == 1 ? 2 : 1);
        if (config[peg].length < max) {
          config[peg].add(bead);
          break;
        }
      }
    }
    return config;
  }

  // Generates a puzzle with a minimum move count requirement
  Map<String, List<List<int>>> generatePuzzle({int minMoves = 5, int maxAttempts = 100}) {
    for (int i = 0; i < maxAttempts; i++) {
      final start = generateRandomConfig();
      final target = generateRandomConfig();
      
      final moves = solve(start, target);
      if (moves >= minMoves) {
        return {
          'start': start,
          'target': target,
        };
      }
    }
    
    // Fallback: just return something different if we can't find a hard one
    final start = generateRandomConfig();
    var target = generateRandomConfig();
    while (isSolved(start, target)) {
      target = generateRandomConfig();
    }
    return {'start': start, 'target': target};
  }

  // Uses BFS to find the minimum number of moves to solve
  int solve(List<List<int>> start, List<List<int>> target) {
    if (isSolved(start, target)) return 0;

    final queue = Queue<MapEntry<List<List<int>>, int>>();
    queue.add(MapEntry(start, 0));
    
    final visited = <String>{_configToString(start)};

    while (queue.isNotEmpty) {
      final entry = queue.removeFirst();
      final current = entry.key;
      final dist = entry.value;

      if (dist >= 15) continue; // Safety break

      for (int from = 0; from < 3; from++) {
        for (int to = 0; to < 3; to++) {
          if (canMove(current, from, to)) {
            final next = move(current, from, to);
            final nextStr = _configToString(next);
            
            if (isSolved(next, target)) return dist + 1;
            
            if (!visited.contains(nextStr)) {
              visited.add(nextStr);
              queue.add(MapEntry(next, dist + 1));
            }
          }
        }
      }
    }

    return -1; // Unsolvable (shouldn't happen in ToL)
  }

  String _configToString(List<List<int>> config) {
    return config.map((p) => p.join(',')).join('|');
  }

  bool isSolved(List<List<int>> current, List<List<int>> target) {
    for (int i = 0; i < 3; i++) {
      if (current[i].length != target[i].length) return false;
      for (int j = 0; j < current[i].length; j++) {
        if (current[i][j] != target[i][j]) return false;
      }
    }
    return true;
  }

  bool canMove(List<List<int>> config, int from, int to) {
    if (from == to) return false;
    if (config[from].isEmpty) return false;
    int maxTo = to == 0 ? 3 : (to == 1 ? 2 : 1);
    if (config[to].length >= maxTo) return false;
    return true;
  }

  List<List<int>> move(List<List<int>> config, int from, int to) {
    List<List<int>> next = config.map((e) => List<int>.from(e)).toList();
    int bead = next[from].removeLast();
    next[to].add(bead);
    return next;
  }
}
