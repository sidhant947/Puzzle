import 'dart:math';

class PangramSprintEngine {
  final List<PangramTask> _tasks = [
    PangramTask(
      sentence: 'The quick brown fox jumps over the lazy dog',
      words: ['THE', 'QUICK', 'BROWN', 'FOX', 'JUMPS', 'OVER', 'THE', 'LAZY', 'DOG'],
    ),
    PangramTask(
      sentence: 'Pack my box with five dozen liquor jugs',
      words: ['PACK', 'MY', 'BOX', 'WITH', 'FIVE', 'DOZEN', 'LIQUOR', 'JUGS'],
    ),
    PangramTask(
      sentence: 'Sphinx of black quartz judge my vow',
      words: ['SPHINX', 'OF', 'BLACK', 'QUARTZ', 'JUDGE', 'MY', 'VOW'],
    ),
    PangramTask(
      sentence: 'How vexingly quick balthazar bolden jumps gazing',
      words: ['HOW', 'VEXINGLY', 'QUICK', 'BALTHAZAR', 'BOLDEN', 'JUMPS', 'GAZING'],
    ),
    PangramTask(
      sentence: 'Two driven jocks help fax my big quiz',
      words: ['TWO', 'DRIVEN', 'JOCKS', 'HELP', 'FAX', 'MY', 'BIG', 'QUIZ'],
    ),
  ];

  PangramTask getRandomTask() {
    return _tasks[Random().nextInt(_tasks.length)];
  }

  bool isPangram(String text) {
    final letters = text.toLowerCase().replaceAll(RegExp(r'[^a-z]'), '').split('');
    return Set.from(letters).length == 26;
  }
}

class PangramTask {
  final String sentence;
  final List<String> words;

  PangramTask({
    required this.sentence,
    required this.words,
  });
}
