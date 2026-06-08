import 'dart:math';

class AffixFactoryEngine {
  final List<AffixTask> _tasks = [
    AffixTask(root: 'HAPPY', affixes: ['UN', 'NESS', 'LY'], distractor: 'PRE', description: 'UNHAPPY, HAPPINESS, HAPPILY are valid.'),
    AffixTask(root: 'ACT', affixes: ['RE', 'ION', 'IVE'], distractor: 'DIS', description: 'REACT, ACTION, ACTIVE are valid.'),
    AffixTask(root: 'FRIEND', affixes: ['UN', 'LY', 'SHIP'], distractor: 'MIS', description: 'UNFRIEND, FRIENDLY, FRIENDSHIP are valid.'),
    AffixTask(root: 'UNDERSTAND', affixes: ['MIS', 'ING', 'ABLE'], distractor: 'NON', description: 'MISUNDERSTAND, UNDERSTANDING, UNDERSTANDABLE are valid.'),
    AffixTask(root: 'FAITH', affixes: ['UN', 'FUL', 'LESS'], distractor: 'DE', description: 'UNFAITHFUL, FAITHFUL, FAITHLESS are valid.'),
    AffixTask(root: 'PLACE', affixes: ['RE', 'MENT', 'ABLE'], distractor: 'SUB', description: 'REPLACE, PLACEMENT, PLACEABLE are valid.'),
    AffixTask(root: 'POWER', affixes: ['EM', 'FUL', 'LESS'], distractor: 'OVER', description: 'EMPOWER, POWERFUL, POWERLESS are valid. (OVERPOWER is also valid but we use distractors)'),
    AffixTask(root: 'COMFORT', affixes: ['UN', 'ABLE', 'ING'], distractor: 'IN', description: 'UNCOMFORTABLE, COMFORTABLE, COMFORTING are valid.'),
    AffixTask(root: 'SUCCESS', affixes: ['UN', 'FUL', 'IVE'], distractor: 'DE', description: 'UNSUCCESSFUL, SUCCESSFUL, SUCCESSIVE are valid.'),
    AffixTask(root: 'CARE', affixes: ['FUL', 'LESS', 'FREE'], distractor: 'NON', description: 'CAREFUL, CARELESS, CAREFREE are valid.'),
  ];

  AffixTask getRandomTask() {
    final task = _tasks[Random().nextInt(_tasks.length)];
    final allOptions = [...task.affixes, task.distractor]..shuffle();
    return AffixTask(
      root: task.root,
      affixes: task.affixes,
      distractor: task.distractor,
      description: task.description,
      options: allOptions,
    );
  }

  bool checkAnswer(List<String> selected, List<String> correct) {
    if (selected.length != correct.length) return false;
    return selected.every((s) => correct.contains(s));
  }
}

class AffixTask {
  final String root;
  final List<String> affixes;
  final String distractor;
  final String description;
  final List<String>? options;

  AffixTask({
    required this.root,
    required this.affixes,
    required this.distractor,
    required this.description,
    this.options,
  });
}
