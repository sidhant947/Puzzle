import 'dart:math';

class SymbolicFlankerEngine {
  final Random _random = Random();
  final List<String> symbols = ['★', '◆'];

  Map<String, dynamic> generateTrial() {
    bool isCongruent = _random.nextBool();
    int targetIndex = _random.nextInt(2);
    int flankerIndex = isCongruent ? targetIndex : (targetIndex + 1) % 2;

    String target = symbols[targetIndex];
    String flanker = symbols[flankerIndex];

    return {
      'display': '$flanker$flanker$target$flanker$flanker',
      'target': target,
      'isCongruent': isCongruent,
    };
  }
}
