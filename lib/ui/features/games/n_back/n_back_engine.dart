import 'dart:math';

class NBackEngine {
  final Random _random = Random();
  final List<String> symbols = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H'];

  String generateNextSymbol(List<String> history, int n) {
    if (history.length < n) {
      return symbols[_random.nextInt(symbols.length)];
    }

    // 33% chance to generate a match
    if (_random.nextDouble() < 0.33) {
      return history[history.length - n];
    } else {
      String next;
      do {
        next = symbols[_random.nextInt(symbols.length)];
      } while (next == history[history.length - n]);
      return next;
    }
  }
}
