import 'dart:math' as math;

class DotCoordinate {
  final double x;
  final double y;
  final double radius;

  DotCoordinate({required this.x, required this.y, required this.radius});
}

class SubitizingRound {
  final int count;
  final List<DotCoordinate> dots;
  final List<int> options;

  SubitizingRound({
    required this.count,
    required this.dots,
    required this.options,
  });
}

class SubitizingRushEngine {
  static SubitizingRound generateRound({math.Random? random}) {
    final rng = random ?? math.Random();
    
    final count = rng.nextInt(7) + 3; // 3 to 9 dots
    final dots = <DotCoordinate>[];
    
    int attempts = 0;
    while (dots.length < count && attempts < 200) {
      attempts++;
      final x = 0.15 + rng.nextDouble() * 0.70;
      final y = 0.15 + rng.nextDouble() * 0.70;
      final r = 12.0 + rng.nextDouble() * 4.0;
      
      bool overlap = false;
      for (final existing in dots) {
        final dx = (existing.x - x) * 300;
        final dy = (existing.y - y) * 300;
        final dist = math.sqrt(dx * dx + dy * dy);
        if (dist < (existing.radius + r + 16)) {
          overlap = true;
          break;
        }
      }
      
      if (!overlap) {
        dots.add(DotCoordinate(x: x, y: y, radius: r));
      }
    }

    final optionsSet = <int>{count};
    while (optionsSet.length < 4) {
      final delta = (rng.nextBool() ? 1 : -1) * (rng.nextInt(3) + 1);
      final opt = count + delta;
      if (opt >= 1 && opt <= 12) {
        optionsSet.add(opt);
      }
    }

    final optionsList = optionsSet.toList()..shuffle(rng);

    return SubitizingRound(
      count: dots.length,
      dots: dots,
      options: optionsList,
    );
  }
}
