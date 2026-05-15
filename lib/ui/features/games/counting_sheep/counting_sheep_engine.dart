import 'dart:math';

enum Difficulty { easy, medium, hard }

class Sheep {
  final int id;
  final double startY;
  final double speed; // seconds to cross
  final double delay; // seconds before starting

  Sheep({
    required this.id,
    required this.startY,
    required this.speed,
    required this.delay,
  });

  double get totalTime => delay + speed;
}

class CountingSheepEngine {
  final Random _random = Random();

  List<Sheep> generateSheep(Difficulty difficulty) {
    int count;
    switch (difficulty) {
      case Difficulty.easy:
        count = _random.nextInt(4) + 5; // 5-8
        break;
      case Difficulty.medium:
        count = _random.nextInt(6) + 10; // 10-15
        break;
      case Difficulty.hard:
        count = _random.nextInt(11) + 20; // 20-30
        break;
    }

    return List.generate(count, (index) {
      return Sheep(
        id: index,
        startY: _random.nextDouble(),
        speed: _random.nextDouble() * 2 + 3, // 3-5 seconds
        delay: _random.nextDouble() * 8, // 0-8 seconds delay spread
      );
    });
  }
}
