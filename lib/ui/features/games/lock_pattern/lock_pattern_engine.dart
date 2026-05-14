import 'dart:math';

class LockPatternEngine {
  static const int gridSize = 3;
  static const int defaultLength = 5;

  /// Returns the indices of dots that are skipped when moving from [from] to [to].
  /// On a grid, we check if the path is a straight line (horizontal, vertical, or 45deg diagonal)
  /// and identify all intermediate dots.
  List<int> _getSkippedDots(int from, int to) {
    final int x1 = from % gridSize;
    final int y1 = from ~/ gridSize;
    final int x2 = to % gridSize;
    final int y2 = to ~/ gridSize;

    final int dx = x2 - x1;
    final int dy = y2 - y1;

    // Check if it's a straight line (horizontal, vertical, or 45-degree diagonal)
    if (dx == 0 || dy == 0 || dx.abs() == dy.abs()) {
      final int stepX = dx == 0 ? 0 : dx ~/ dx.abs();
      final int stepY = dy == 0 ? 0 : dy ~/ dy.abs();

      final List<int> skipped = [];
      int currX = x1 + stepX;
      int currY = y1 + stepY;

      while (currX != x2 || currY != y2) {
        skipped.add(currX + currY * gridSize);
        currX += stepX;
        currY += stepY;
      }
      return skipped;
    }
    return [];
  }

  /// Generates a random valid pattern of the given length.
  List<int> generatePattern(int length) {
    final List<int> pattern = [];
    final Random random = Random();

    // Start with a random dot
    int current = random.nextInt(gridSize * gridSize);
    pattern.add(current);

    while (pattern.length < length) {
      final List<int> candidates = [];
      for (int i = 0; i < gridSize * gridSize; i++) {
        if (!pattern.contains(i)) {
          // Check if moving to 'i' would jump over unactivated dots
          final List<int> skipped = _getSkippedDots(current, i);
          if (skipped.isEmpty || skipped.every((s) => pattern.contains(s))) {
            candidates.add(i);
          }
        }
      }

      if (candidates.isEmpty) {
        // Dead end, restart generation
        return generatePattern(length);
      }

      current = candidates[random.nextInt(candidates.length)];
      pattern.add(current);
    }

    return pattern;
  }

  /// Checks a guess against the secret pattern.
  /// Returns [bulls, cows]
  /// Bulls: Correct dot at correct position.
  /// Cows: Correct dot but at wrong position.
  List<int> checkGuess(List<int> guess, List<int> target) {
    int bulls = 0;
    int cows = 0;

    final List<bool> targetUsed = List.filled(target.length, false);
    final List<bool> guessUsed = List.filled(guess.length, false);

    // First pass: Bulls
    for (int i = 0; i < guess.length && i < target.length; i++) {
      if (guess[i] == target[i]) {
        bulls++;
        targetUsed[i] = true;
        guessUsed[i] = true;
      }
    }

    // Second pass: Cows
    for (int i = 0; i < guess.length; i++) {
      if (guessUsed[i]) continue;
      for (int j = 0; j < target.length; j++) {
        if (!targetUsed[j] && guess[i] == target[j]) {
          cows++;
          targetUsed[j] = true;
          break;
        }
      }
    }

    return [bulls, cows];
  }

  /// Normalizes a path by adding skipped dots if necessary.
  /// This is used when the user draws a pattern.
  List<int> normalizePath(List<int> currentPath, int newDot) {
    if (currentPath.isEmpty) return [newDot];
    if (currentPath.contains(newDot)) return currentPath;

    final int last = currentPath.last;
    final List<int> skipped = _getSkippedDots(last, newDot);

    final List<int> result = List.from(currentPath);
    for (final dot in skipped) {
      if (!result.contains(dot)) {
        result.add(dot);
      }
    }
    result.add(newDot);
    return result;
  }
}
