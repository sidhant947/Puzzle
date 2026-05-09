import 'dart:math';

class FlankerEngine {
  final Random _random = Random();

  Map<String, dynamic> generateTrial() {
    // 0 = Left, 1 = Right
    int targetDirection = _random.nextInt(2);
    
    // 50% congruent (flankers match target), 50% incongruent
    bool isCongruent = _random.nextBool();
    int flankerDirection = isCongruent ? targetDirection : (1 - targetDirection);

    String targetChar = targetDirection == 0 ? '<' : '>';
    String flankerChar = flankerDirection == 0 ? '<' : '>';

    // Sequence: Flanker Flanker TARGET Flanker Flanker
    String display = '$flankerChar $flankerChar $targetChar $flankerChar $flankerChar';

    return {
      'display': display,
      'target': targetDirection, // 0 for left, 1 for right
      'isCongruent': isCongruent,
    };
  }
}
