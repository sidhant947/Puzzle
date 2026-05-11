import 'dart:math';

enum FoldType { vertical, horizontal, diagonal }

class PaperFold {
  final FoldType type;
  // For vertical/horizontal, it's always the middle.
  // For diagonal, it's y=x in the current active area.
  PaperFold(this.type);
}

class PaperFoldingEngine {
  static const int gridSize = 6;

  List<Point<int>> getHoles(Point<int> punch, List<FoldType> folds) {
    List<Point<int>> holes = [punch];

    // Unfold in reverse order
    for (final foldType in folds.reversed) {
      List<Point<int>> newHoles = [];
      for (final hole in holes) {
        Point<int>? reflected;
        switch (foldType) {
          case FoldType.vertical:
            reflected = Point(gridSize - 1 - hole.x, hole.y);
            break;
          case FoldType.horizontal:
            reflected = Point(hole.x, gridSize - 1 - hole.y);
            break;
          case FoldType.diagonal:
            reflected = Point(hole.y, hole.x);
            break;
        }
        if (!holes.contains(reflected)) {
          newHoles.add(reflected);
        }
      }
      holes.addAll(newHoles);
    }

    return holes;
  }

  Map<String, dynamic> generateLevel() {
    final random = Random();
    
    // We'll use a fixed sequence of folds for simplicity in visualization
    // But we can randomize which ones are used.
    // Let's always do Vertical, then Horizontal, maybe Diagonal.
    final folds = [FoldType.vertical, FoldType.horizontal];
    if (random.nextBool()) {
      folds.add(FoldType.diagonal);
    }

    // Determine the available area for the punch
    // After V: x in [0, 2]
    // After H: x in [0, 2], y in [0, 2]
    // After D: x in [0, 2], y in [0, 2], y <= x
    
    List<Point<int>> availablePoints = [];
    for (int x = 0; x <= 2; x++) {
      for (int y = 0; y <= 2; y++) {
        if (folds.contains(FoldType.diagonal)) {
          if (y <= x) {
            availablePoints.add(Point(x, y));
          }
        } else {
          availablePoints.add(Point(x, y));
        }
      }
    }

    final punch = availablePoints[random.nextInt(availablePoints.length)];
    final correctHoles = getHoles(punch, folds);

    // Generate 3 distractors
    final List<List<Point<int>>> options = [correctHoles];
    
    while (options.length < 4) {
      // Create a distractor by picking a different punch or slightly modifying the holes
      final otherPunch = availablePoints[random.nextInt(availablePoints.length)];
      final otherHoles = getHoles(otherPunch, folds);
      
      bool exists = false;
      for (final opt in options) {
        if (_areHolesSame(opt, otherHoles)) {
          exists = true;
          break;
        }
      }
      
      if (!exists) {
        options.add(otherHoles);
      } else {
        // If we can't find a different punch, just randomly add/remove a hole (unlikely to be needed)
        // Or just move one hole.
        final modifiedHoles = List<Point<int>>.from(otherHoles);
        if (modifiedHoles.isNotEmpty) {
           final i = random.nextInt(modifiedHoles.length);
           modifiedHoles[i] = Point((modifiedHoles[i].x + 1) % gridSize, modifiedHoles[i].y);
           options.add(modifiedHoles);
        }
      }
    }

    final List<int> indices = [0, 1, 2, 3];
    indices.shuffle();
    final shuffledOptions = indices.map((i) => options[i]).toList();
    final correctIndex = indices.indexOf(0);

    return {
      'folds': folds,
      'punch': punch,
      'options': shuffledOptions,
      'correctIndex': correctIndex,
    };
  }

  bool _areHolesSame(List<Point<int>> a, List<Point<int>> b) {
    if (a.length != b.length) return false;
    final setA = a.map((p) => '${p.x},${p.y}').toSet();
    final setB = b.map((p) => '${p.x},${p.y}').toSet();
    return setA.intersection(setB).length == a.length;
  }
}
