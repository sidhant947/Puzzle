import 'dart:math';

class BoxCompletionPuzzle {
  final List<int?> net; // 3x4 grid representing the net, null if empty
  final List<List<int>> options; // Each option is a list of 3 symbols [Top, Front, Right]
  final int correctOptionIndex;

  BoxCompletionPuzzle({
    required this.net,
    required this.options,
    required this.correctOptionIndex,
  });
}

class BoxCompletionEngine {
  final Random _random = Random();

  final List<BoxCompletionPuzzle> _puzzles = [
    BoxCompletionPuzzle(
      net: [
        null, 1, null, null,
        2, 3, 4, 5,
        null, 6, null, null,
      ],
      options: [
        [1, 3, 4], // Correct
        [1, 3, 5], // Wrong
        [6, 3, 2], // Wrong
      ],
      correctOptionIndex: 0,
    ),
    BoxCompletionPuzzle(
      net: [
        1, 2, null, null,
        null, 3, 4, 5,
        null, null, 6, null,
      ],
      options: [
        [1, 2, 3], // Wrong
        [3, 4, 6], // Correct
        [2, 3, 5], // Wrong
      ],
      correctOptionIndex: 1,
    ),
    // Add more if needed
  ];

  BoxCompletionPuzzle generatePuzzle() {
    return _puzzles[_random.nextInt(_puzzles.length)];
  }
}
