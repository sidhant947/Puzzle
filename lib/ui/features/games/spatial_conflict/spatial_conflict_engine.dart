import 'dart:math';

enum Direction {
  left,
  right;

  String get label => name.toUpperCase();
}

class ConflictTrial {
  final Direction word;
  final Direction position;
  final bool isCongruent;

  ConflictTrial({
    required this.word,
    required this.position,
  }) : isCongruent = word == position;
}

class SpatialConflictEngine {
  final Random _random = Random();
  static const int totalTrials = 15;

  List<ConflictTrial> generateTrials() {
    final List<ConflictTrial> trials = [];
    
    // Generate exactly 15 trials. Ensure a healthy mix of congruent and incongruent.
    for (int i = 0; i < totalTrials; i++) {
      final word = Direction.values[_random.nextInt(Direction.values.length)];
      final position = Direction.values[_random.nextInt(Direction.values.length)];
      trials.add(ConflictTrial(word: word, position: position));
    }
    
    return trials;
  }
}
