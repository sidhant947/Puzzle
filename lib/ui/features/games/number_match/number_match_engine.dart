import 'dart:math';

class NumberMatchEngine {
  static const int columns = 9;

  List<int> generateInitialBoard() {
    // Standard starting board: 1-9, then 11-19 (omitting 10)
    return [
      1, 2, 3, 4, 5, 6, 7, 8, 9,
      1, 1, 1, 2, 1, 3, 1, 4, 1,
      5, 1, 6, 1, 7, 1, 8, 1, 9,
    ];
  }

  bool isValidPair(int index1, int index2, List<int> numbers, List<bool> cleared) {
    if (index1 == index2) return false;
    if (cleared[index1] || cleared[index2]) return false;

    int n1 = numbers[index1];
    int n2 = numbers[index2];

    // Numbers must be the same OR sum to 10
    if (n1 != n2 && n1 + n2 != 10) return false;

    int minIdx = min(index1, index2);
    int maxIdx = max(index1, index2);

    // 1. Sequence/Horizontal Adjacency
    // (Numbers are adjacent in the 1D sequence, ignoring cleared cells)
    bool validSequence = true;
    for (int i = minIdx + 1; i < maxIdx; i++) {
      if (!cleared[i]) {
        validSequence = false;
        break;
      }
    }
    if (validSequence) return true;

    // 2. Vertical Adjacency
    // (Numbers are in the same column and separated only by cleared cells)
    int c1 = index1 % columns;
    int c2 = index2 % columns;

    if (c1 == c2) {
      bool validVertical = true;
      int step = columns;
      for (int i = minIdx + step; i < maxIdx; i += step) {
        if (!cleared[i]) {
          validVertical = false;
          break;
        }
      }
      if (validVertical) return true;
    }

    return false;
  }

  bool hasPossibleMoves(List<int> numbers, List<bool> cleared) {
    for (int i = 0; i < numbers.length; i++) {
      if (cleared[i]) continue;
      for (int j = i + 1; j < numbers.length; j++) {
        if (isValidPair(i, j, numbers, cleared)) {
          return true;
        }
      }
    }
    return false;
  }
}
