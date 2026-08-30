import 'dart:math' as math;

class ModularClockQuestion {
  final int currentHour; // 1 to 12
  final int addHours; // 1 to 30
  final int modulus; // 12
  final int resultHour;
  final List<int> choices;

  ModularClockQuestion({
    required this.currentHour,
    required this.addHours,
    required this.modulus,
    required this.resultHour,
    required this.choices,
  });

  String get formula => '$currentHour + $addHours (mod $modulus)';
}

class ModularClockArithmeticEngine {
  static ModularClockQuestion generateQuestion({math.Random? random}) {
    final rng = random ?? math.Random();
    final currentHour = rng.nextInt(12) + 1; // 1-12
    final addHours = rng.nextInt(28) + 3; // 3-30

    final raw = (currentHour + addHours) % 12;
    final result = raw == 0 ? 12 : raw;

    final distractorSet = <int>{result};
    while (distractorSet.length < 4) {
      final fake = rng.nextInt(12) + 1;
      distractorSet.add(fake);
    }

    final choices = distractorSet.toList()..shuffle(rng);

    return ModularClockQuestion(
      currentHour: currentHour,
      addHours: addHours,
      modulus: 12,
      resultHour: result,
      choices: choices,
    );
  }
}
