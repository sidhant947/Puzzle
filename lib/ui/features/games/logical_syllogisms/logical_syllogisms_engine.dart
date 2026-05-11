import 'dart:math';

class LogicalSyllogismsEngine {
  final Random _random = Random();

  final List<String> _subjects = ['Cats', 'Dogs', 'Birds', 'Mammals', 'Fish', 'Reptiles', 'Trees', 'Flowers', 'Fruits', 'Vegetables'];
  final List<String> _attributes = ['Friendly', 'Loud', 'Fast', 'Green', 'Alive', 'Growing', 'Breathing', 'Moving', 'Hungry', 'Sleepy'];

  LogicalSyllogismPuzzle generatePuzzle() {
    final bool isTrue = _random.nextBool();
    final s1 = _subjects[_random.nextInt(_subjects.length)];
    String s2;
    do {
      s2 = _subjects[_random.nextInt(_subjects.length)];
    } while (s2 == s1);
    
    final attr = _attributes[_random.nextInt(_attributes.length)];

    String premise1;
    String premise2;
    String conclusion;

    if (isTrue) {
      // Type 1: All A are B. All B are C. -> All A are C.
      premise1 = 'All $s1 are $s2.';
      premise2 = 'All $s2 are $attr.';
      conclusion = 'Therefore, all $s1 are $attr.';
    } else {
      // Type 1 False: Some A are B. All B are C. -> All A are C. (False, should be Some)
      if (_random.nextBool()) {
        premise1 = 'Some $s1 are $s2.';
        premise2 = 'All $s2 are $attr.';
        conclusion = 'Therefore, all $s1 are $attr.';
      } else {
        // Type 2 False: All A are B. Some B are C. -> All A are C.
        premise1 = 'All $s1 are $s2.';
        premise2 = 'Some $s2 are $attr.';
        conclusion = 'Therefore, all $s1 are $attr.';
      }
    }

    return LogicalSyllogismPuzzle(
      premise1: premise1,
      premise2: premise2,
      conclusion: conclusion,
      isValid: isTrue,
    );
  }
}

class LogicalSyllogismPuzzle {
  final String premise1;
  final String premise2;
  final String conclusion;
  final bool isValid;

  LogicalSyllogismPuzzle({
    required this.premise1,
    required this.premise2,
    required this.conclusion,
    required this.isValid,
  });
}
