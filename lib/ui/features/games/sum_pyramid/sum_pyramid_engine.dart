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

  static const List<List<int>> _triplets = [
    [4, 0, 1], // values[4] = values[0] + values[1]
    [5, 1, 2], // values[5] = values[1] + values[2]
    [6, 2, 3], // values[6] = values[2] + values[3]
    [7, 4, 5], // values[7] = values[4] + values[5]
    [8, 5, 6], // values[8] = values[5] + values[6]
    [9, 7, 8], // values[9] = values[7] + values[8]
  ];

  bool isSolvable(List<bool> isHidden) {
    final known = List<bool>.generate(10, (i) => !isHidden[i]);
    bool progress = true;
    while (progress) {
      progress = false;
      for (final t in _triplets) {
        final top = t[0];
        final left = t[1];
        final right = t[2];

        final knownCount = (known[top] ? 1 : 0) + (known[left] ? 1 : 0) + (known[right] ? 1 : 0);
        if (knownCount >= 2) {
          if (!known[top]) {
            known[top] = true;
            progress = true;
          }
          if (!known[left]) {
            known[left] = true;
            progress = true;
          }
          if (!known[right]) {
            known[right] = true;
            progress = true;
          }
        }
      }
    }
    return known.every((k) => k);
  }

  SumPyramidLevel generateLevel(int score) {
    final List<int> values = List.filled(10, 0);

    int maxBaseValue = 5;
    if (score >= 3 && score < 7) {
      maxBaseValue = 8;
    } else if (score >= 7) {
      maxBaseValue = 12;
    }

    for (int i = 0; i < 4; i++) {
      values[i] = _random.nextInt(maxBaseValue) + 1;
    }

    values[4] = values[0] + values[1];
    values[5] = values[1] + values[2];
    values[6] = values[2] + values[3];

    values[7] = values[4] + values[5];
    values[8] = values[5] + values[6];

    values[9] = values[7] + values[8];

    int targetHideCount = 3;
    if (score >= 4 && score < 9) {
      targetHideCount = 4;
    } else if (score >= 9) {
      targetHideCount = 5;
    }

    final List<int> candidates = List.generate(10, (i) => i)..shuffle(_random);
    final List<bool> isHidden = List.filled(10, false);
    int currentHidden = 0;

    for (final idx in candidates) {
      if (currentHidden >= targetHideCount) break;
      isHidden[idx] = true;
      if (isSolvable(isHidden)) {
        currentHidden++;
      } else {
        isHidden[idx] = false;
      }
    }

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
