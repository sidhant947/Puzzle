import 'dart:math';
import 'dart:collection';

class CollatzLevel {
  final int startNumber;
  final int target;
  final int minSteps;

  CollatzLevel({required this.startNumber, required this.target, required this.minSteps});
}

class CollatzEngine {
  final Random _random = Random();

  CollatzLevel generateLevel() {
    // Generate a level with a start number between 50 and 150
    int start = 50 + _random.nextInt(101);
    int minSteps = _findMinSteps(start);
    
    // Ensure it's not too short (at least 5 steps)
    if (minSteps < 5) return generateLevel();

    return CollatzLevel(startNumber: start, target: 1, minSteps: minSteps);
  }

  int _findMinSteps(int start) {
    if (start == 1) return 0;
    
    final Queue<MapEntry<int, int>> queue = Queue();
    queue.add(MapEntry(start, 0));
    final Set<int> visited = {start};

    while (queue.isNotEmpty) {
      final current = queue.removeFirst();
      final n = current.key;
      final steps = current.value;

      final neighbors = <int>[];
      if (n % 2 == 0) neighbors.add(n ~/ 2);
      neighbors.add(n * 3 + 1);
      neighbors.add(n + 1);

      for (final next in neighbors) {
        if (next == 1) return steps + 1;
        // Limit search space to prevent infinite loops/too large numbers
        if (next > 0 && next < 10000 && !visited.contains(next)) {
          visited.add(next);
          queue.add(MapEntry(next, steps + 1));
        }
      }
    }
    return 99; // Should not happen
  }

  int applyOp(int n, int opIndex) {
    switch (opIndex) {
      case 0: // /2
        return (n % 2 == 0) ? n ~/ 2 : n;
      case 1: // 3n+1
        return n * 3 + 1;
      case 2: // n+1
        return n + 1;
      default:
        return n;
    }
  }
}
