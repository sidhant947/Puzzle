import 'dart:math';

class SchulteTableEngine {
  final int size;
  final Random _random = Random();

  SchulteTableEngine({this.size = 5});

  List<int> generateGrid() {
    final int count = size * size;
    final List<int> numbers = List.generate(count, (i) => i + 1);
    numbers.shuffle(_random);
    return numbers;
  }

  bool isCorrectTap(int value, int expectedValue) {
    return value == expectedValue;
  }
}
