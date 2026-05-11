import 'dart:math';

class DoubleNBackEngine {
  final Random _random = Random();
  final List<String> _letters = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H'];

  Map<String, dynamic> generateStimulus() {
    return {
      'position': _random.nextInt(9),
      'letter': _letters[_random.nextInt(_letters.length)],
    };
  }
}
