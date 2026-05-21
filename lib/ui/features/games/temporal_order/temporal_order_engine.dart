import 'dart:math';

enum QuestionType { earlier, later }

class TemporalQuestion {
  final int indexA; // index of first icon option in the original sequence
  final int indexB; // index of second icon option in the original sequence
  final int itemA; // icon index A
  final int itemB; // icon index B
  final QuestionType type;
  final int correctItem;

  TemporalQuestion({
    required this.indexA,
    required this.indexB,
    required this.itemA,
    required this.itemB,
    required this.type,
    required this.correctItem,
  });
}

class TemporalOrderEngine {
  final Random _random = Random();

  // We can use integers from 0 to 14 to represent 15 distinct icons in the UI.
  List<int> generateSequence(int length) {
    final List<int> pool = List.generate(15, (i) => i);
    pool.shuffle(_random);
    return pool.take(length).toList();
  }

  TemporalQuestion generateQuestion(List<int> sequence) {
    // Select two random distinct indices from the sequence
    int idxA = _random.nextInt(sequence.length);
    int idxB;
    do {
      idxB = _random.nextInt(sequence.length);
    } while (idxA == idxB);

    // Keep idxA < idxB for easy comparison
    if (idxA > idxB) {
      final temp = idxA;
      idxA = idxB;
      idxB = temp;
    }

    final itemA = sequence[idxA];
    final itemB = sequence[idxB];

    // Randomly ask "earlier" or "later"
    final type = _random.nextBool() ? QuestionType.earlier : QuestionType.later;
    final int correctItem = (type == QuestionType.earlier) ? itemA : itemB;

    // Shuffle options when presenting to user
    final bool shuffleOptions = _random.nextBool();

    return TemporalQuestion(
      indexA: idxA,
      indexB: idxB,
      itemA: shuffleOptions ? itemB : itemA,
      itemB: shuffleOptions ? itemA : itemB,
      type: type,
      correctItem: correctItem,
    );
  }

  int getSequenceLengthForLevel(int level) {
    // Level 1: 4 icons, Level 2: 5 icons, Level 3: 6 icons, Level 4: 7 icons, Level 5: 8 icons
    return level + 3;
  }
}
