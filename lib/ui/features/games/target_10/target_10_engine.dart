import 'dart:math';

class Target10Engine {
  final Random _random = Random();

  List<int> generateInitialGrid() {
    // Generate a 5x5 grid of random digits between 1 and 9
    return List.generate(25, (_) => getRandomDigit());
  }

  int getRandomDigit() {
    // Returns a random integer between 1 and 9 (inclusive)
    return _random.nextInt(9) + 1;
  }
}
