import 'dart:math';

enum GoNoGoSymbol {
  go,
  noGo,
}

class GoNoGoLevel {
  final GoNoGoSymbol symbol;
  final Duration duration;

  GoNoGoLevel({
    required this.symbol,
    required this.duration,
  });
}

class GoNoGoEngine {
  final Random _random = Random();

  GoNoGoLevel generateLevel(int score) {
    // 70% chance of 'Go' to build a habit/reflex
    final symbol = _random.nextDouble() < 0.7 ? GoNoGoSymbol.go : GoNoGoSymbol.noGo;
    
    // Duration decreases as score increases
    int ms = (1000 * pow(0.97, score)).toInt();
    ms = ms.clamp(400, 1000);

    return GoNoGoLevel(
      symbol: symbol,
      duration: Duration(milliseconds: ms),
    );
  }
}
