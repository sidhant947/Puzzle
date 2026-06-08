import 'dart:math';

class CompoundConnectEngine {
  final List<CompoundTask> _tasks = [
    CompoundTask(prefix: 'SUN', suffix: 'FLOWER', result: 'SUNFLOWER'),
    CompoundTask(prefix: 'BACK', suffix: 'PACK', result: 'BACKPACK'),
    CompoundTask(prefix: 'FIRE', suffix: 'FLY', result: 'FIREFLY'),
    CompoundTask(prefix: 'WATER', suffix: 'FALL', result: 'WATERFALL'),
    CompoundTask(prefix: 'RAIN', suffix: 'BOW', result: 'RAINBOW'),
    CompoundTask(prefix: 'KEY', suffix: 'BOARD', result: 'KEYBOARD'),
    CompoundTask(prefix: 'DRAGON', suffix: 'FLY', result: 'DRAGONFLY'),
    CompoundTask(prefix: 'NOTE', suffix: 'BOOK', result: 'NOTEBOOK'),
    CompoundTask(prefix: 'TOOTH', suffix: 'BRUSH', result: 'TOOTHBRUSH'),
    CompoundTask(prefix: 'STAR', suffix: 'FISH', result: 'STARFISH'),
    CompoundTask(prefix: 'EAR', suffix: 'RING', result: 'EARRING'),
    CompoundTask(prefix: 'PAN', suffix: 'CAKE', result: 'PANCAKE'),
    CompoundTask(prefix: 'BASKET', suffix: 'BALL', result: 'BASKETBALL'),
    CompoundTask(prefix: 'SNOW', suffix: 'MAN', result: 'SNOWMAN'),
    CompoundTask(prefix: 'HAND', suffix: 'SHAKE', result: 'HANDSHAKE'),
  ];

  CompoundTask getRandomTask() {
    return _tasks[Random().nextInt(_tasks.length)];
  }

  List<String> getOptions(CompoundTask task) {
    final options = [task.suffix];
    final otherSuffixes = _tasks.where((t) => t.suffix != task.suffix).map((t) => t.suffix).toList();
    otherSuffixes.shuffle();
    options.addAll(otherSuffixes.take(3));
    options.shuffle();
    return options;
  }

  bool checkAnswer(String selected, String correct) {
    return selected == correct;
  }
}

class CompoundTask {
  final String prefix;
  final String suffix;
  final String result;

  CompoundTask({
    required this.prefix,
    required this.suffix,
    required this.result,
  });
}
