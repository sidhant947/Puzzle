import 'dart:math';

enum SwitchRule { number, color }

class RuleSwitcherEngine {
  final Random _random = Random();

  Map<String, dynamic> generateTrial() {
    SwitchRule rule = _random.nextBool() ? SwitchRule.number : SwitchRule.color;
    int number = _random.nextInt(9) + 1; // 1-9
    String colorName = _random.nextBool() ? 'Red' : 'Green';
    
    bool isCorrect;
    if (rule == SwitchRule.number) {
      isCorrect = number % 2 == 0; // Even
    } else {
      isCorrect = colorName == 'Red';
    }

    return {
      'rule': rule,
      'number': number,
      'colorName': colorName,
      'isCorrect': isCorrect, // This is just one way, better to let UI decide based on buttons
    };
  }
}
