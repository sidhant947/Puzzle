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
    
    // Randomize the order of initial folds
    final folds = [FoldType.vertical, FoldType.horizontal];
    folds.shuffle();

    // Optionally add a diagonal fold
    if (random.nextBool()) {
      folds.add(FoldType.diagonal);
    }

    // Determine the available area for the punch
    // After V/H: x in [0, 2], y in [0, 2] for gridSize 6
    // After Diagonal: must be in the active triangle.
    // Based on the painter (arrow from Top-Right to Bottom-Left), 
    // the active area is the Bottom-Left triangle: y >= x.
    
    List<Point<int>> availablePoints = [];
    final maxIdx = (gridSize / 2).floor() - 1;

    for (int x = 0; x <= maxIdx; x++) {
      for (int y = 0; y <= maxIdx; y++) {
        if (folds.contains(FoldType.diagonal)) {
          if (y >= x) {
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
    
    // For more interesting distractors, try to find different punch locations first
    List<Point<int>> distractorPunches = List.from(availablePoints)..remove(punch);
    distractorPunches.shuffle();

    for (final p in distractorPunches) {
      if (options.length >= 4) break;
      final otherHoles = getHoles(p, folds);
      if (!options.any((opt) => _areHolesSame(opt, otherHoles))) {
        options.add(otherHoles);
      }
    }
    
    // If we still don't have enough, we'll have to mutate (unlikely with gridSize 6)
    while (options.length < 4) {
      final base = options[random.nextInt(options.length)];
      final modifiedHoles = List<Point<int>>.from(base);
      if (modifiedHoles.isNotEmpty) {
        final i = random.nextInt(modifiedHoles.length);
        // Move one hole slightly
        final p = modifiedHoles[i];
        modifiedHoles[i] = Point((p.x + 1) % gridSize, p.y);
        if (!options.any((opt) => _areHolesSame(opt, modifiedHoles))) {
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
