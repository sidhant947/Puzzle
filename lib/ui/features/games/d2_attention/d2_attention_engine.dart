import 'dart:math';

class D2Item {
  final int id;
  final String letter; // 'd' or 'p'
  final int dashesAbove;
  final int dashesBelow;
  final bool isTarget;

  D2Item({
    required this.id,
    required this.letter,
    required this.dashesAbove,
    required this.dashesBelow,
  }) : isTarget = letter == 'd' && (dashesAbove + dashesBelow == 2);

  int get totalDashes => dashesAbove + dashesBelow;
}

class D2AttentionEngine {
  final Random _random = Random();
  static const int gridSize = 4; // 4x4 grid = 16 items
  static const int totalItems = gridSize * gridSize;

  List<D2Item> generateBoard() {
    final List<D2Item> items = [];

    // Ensure we have exactly 4 to 6 targets on the board
    final numTargets = 4 + _random.nextInt(3);
    
    // Generate targets
    for (int i = 0; i < numTargets; i++) {
      // Dash distribution for exactly 2 dashes: (2, 0), (0, 2), or (1, 1)
      final dist = _random.nextInt(3);
      int above = 0;
      int below = 0;
      if (dist == 0) {
        above = 2;
      } else if (dist == 1) {
        below = 2;
      } else {
        above = 1;
        below = 1;
      }

      items.add(D2Item(
        id: i,
        letter: 'd',
        dashesAbove: above,
        dashesBelow: below,
      ));
    }

    // Generate distractors for the remaining cells
    for (int i = numTargets; i < totalItems; i++) {
      final isD = _random.nextBool();
      final letter = isD ? 'd' : 'p';
      
      // Select dash count that is NOT 2, or make it 'p' with 2 dashes.
      // Dashes can be 0, 1, 3, or 4.
      int above = 0;
      int below = 0;
      
      if (letter == 'd') {
        // Must not have 2 dashes
        final dashCount = [0, 1, 3, 4][_random.nextInt(4)];
        if (dashCount == 1) {
          if (_random.nextBool()) {
            above = 1;
          } else {
            below = 1;
          }
        } else if (dashCount == 3) {
          above = 1 + _random.nextInt(2);
          below = 3 - above;
        } else if (dashCount == 4) {
          above = 2;
          below = 2;
        }
      } else {
        // If it's 'p', it can have any number of dashes (even 2) because it's a distractor anyway
        final dashCount = _random.nextInt(4); // 0 to 3 dashes
        if (dashCount == 1) {
          if (_random.nextBool()) {
            above = 1;
          } else {
            below = 1;
          }
        } else if (dashCount == 2) {
          above = 1; below = 1;
        } else if (dashCount == 3) {
          above = 2; below = 1;
        }
      }

      items.add(D2Item(
        id: i,
        letter: letter,
        dashesAbove: above,
        dashesBelow: below,
      ));
    }

    // Shuffle the items to distribute targets across the board
    items.shuffle(_random);
    
    // Re-assign ids based on shuffled order
    return List.generate(items.length, (idx) {
      final old = items[idx];
      return D2Item(
        id: idx,
        letter: old.letter,
        dashesAbove: old.dashesAbove,
        dashesBelow: old.dashesBelow,
      );
    });
  }
}
