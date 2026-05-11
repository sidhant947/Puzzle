import 'dart:math';

class ChoiceReactionTimeEngine {
  final Random _random = Random();

  int generateTarget() {
    return _random.nextInt(4); // 0: TL, 1: TR, 2: BL, 3: BR
  }

  int getDelay() {
    return 500 + _random.nextInt(1500); // 500ms to 2000ms delay
  }
}
