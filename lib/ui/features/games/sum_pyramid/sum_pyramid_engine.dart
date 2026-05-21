import 'dart:math';

class SumPyramidLevel {
  final List<int> correctValues; // Length 10
  final List<bool> isHidden;     // Length 10, true if block is blank
  final List<String> initialValues; // Length 10, '' if hidden, else string representation

  SumPyramidLevel({
    required this.correctValues,
    required this.isHidden,
    required this.initialValues,
  });
}

class SumPyramidEngine {
  final Random _random = Random();

  SumPyramidLevel generateLevel(int score) {
    final List<int> values = List.filled(10, 0);

    // Determine base number range based on difficulty
    int maxBaseValue = 5;
    if (score >= 3 && score < 7) {
      maxBaseValue = 8;
    } else if (score >= 7) {
      maxBaseValue = 12;
    }

    // Generate base row: indices 0, 1, 2, 3
    for (int i = 0; i < 4; i++) {
      values[i] = _random.nextInt(maxBaseValue) + 1;
    }

    // Row 1: indices 4, 5, 6
    values[4] = values[0] + values[1];
    values[5] = values[1] + values[2];
    values[6] = values[2] + values[3];

    // Row 2: indices 7, 8
    values[7] = values[4] + values[5];
    values[8] = values[5] + values[6];

    // Row 3 (Apex): index 9
    values[9] = values[7] + values[8];

    // Now decide which indices to hide. We hide 3 blocks if score is low, 4 if medium, 5 if high.
    int hideCount = 3;
    if (score >= 4 && score < 9) {
      hideCount = 4;
    } else if (score >= 9) {
      hideCount = 5;
    }

    final List<bool> isHidden = List.filled(10, false);
    final Set<int> hiddenIndices = {};

    // Group rows to select hidden items dynamically
    final List<int> baseRow = [0, 1, 2, 3];
    final List<int> row1 = [4, 5, 6];
    final List<int> row2 = [7, 8];
    final List<int> row3 = [9];

    // Always hide at least one from base or row 1 to make it fun
    hiddenIndices.add(baseRow[_random.nextInt(baseRow.length)]);
    hiddenIndices.add(row1[_random.nextInt(row1.length)]);
    
    // Hide the apex or one from row 2
    if (_random.nextBool()) {
      hiddenIndices.add(row3[0]);
    } else {
      hiddenIndices.add(row2[_random.nextInt(row2.length)]);
    }

    // Fill remaining hides
    while (hiddenIndices.length < hideCount) {
      int idx = _random.nextInt(10);
      hiddenIndices.add(idx);
    }

    for (int idx in hiddenIndices) {
      isHidden[idx] = true;
    }

    // Prepare initial values strings
    final List<String> initialValues = List.filled(10, '');
    for (int i = 0; i < 10; i++) {
      if (!isHidden[i]) {
        initialValues[i] = '${values[i]}';
      }
    }

    return SumPyramidLevel(
      correctValues: values,
      isHidden: isHidden,
      initialValues: initialValues,
    );
  }
}
