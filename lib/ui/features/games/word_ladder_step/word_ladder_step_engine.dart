import 'dart:math' as math;

class WordLadderQuestion {
  final String startWord;
  final String endWord;
  final String correctMiddleWord;
  final List<String> choices;

  WordLadderQuestion({
    required this.startWord,
    required this.endWord,
    required this.correctMiddleWord,
    required this.choices,
  });
}

class WordLadderStepEngine {
  static final List<List<String>> _ladders = [
    ['COLD', 'CORD', 'WORD'],
    ['HEAD', 'HEAL', 'TEAL'],
    ['WARM', 'WORM', 'WORD'],
    ['CAT', 'COT', 'DOG'],
    ['FOUR', 'FOUL', 'FOOL'],
    ['BEST', 'BEAT', 'BOAT'],
    ['LEAD', 'LOAD', 'TOAD'],
    ['MORE', 'MARE', 'MAKE'],
  ];

  static WordLadderQuestion generateQuestion({math.Random? random}) {
    final rng = random ?? math.Random();
    final entry = _ladders[rng.nextInt(_ladders.length)];

    final start = entry[0];
    final mid = entry[1];
    final end = entry[2];

    final distractorSet = <String>{mid};
    while (distractorSet.length < 4) {
      final rand = _ladders[rng.nextInt(_ladders.length)];
      distractorSet.add(rand[1]);
    }

    final choices = distractorSet.toList()..shuffle(rng);

    return WordLadderQuestion(
      startWord: start,
      endWord: end,
      correctMiddleWord: mid,
      choices: choices,
    );
  }
}
