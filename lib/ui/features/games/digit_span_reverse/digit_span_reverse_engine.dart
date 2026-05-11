import 'dart:math';

class DigitSpanReverseEngine {
  final Random _random = Random();

  List<int> generateSequence({required int length}) {
    return List.generate(length, (_) => _random.nextInt(10));
  }

  bool validate(List<int> sequence, List<int> userInput) {
    if (sequence.length != userInput.length) return false;
    final reversedSequence = sequence.reversed.toList();
    for (int i = 0; i < reversedSequence.length; i++) {
      if (reversedSequence[i] != userInput[i]) return false;
    }
    return true;
  }
}
