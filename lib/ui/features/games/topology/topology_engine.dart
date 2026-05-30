import 'dart:math';

class TopologyLevel {
  final String char1;
  final String char2;
  final bool areEquivalent;

  TopologyLevel({required this.char1, required this.char2, required this.areEquivalent});
}

class TopologyEngine {
  final Random _random = Random();

  static const Map<String, int> _holes = {
    'C': 0, 'E': 0, 'F': 0, 'G': 0, 'H': 0, 'I': 0, 'J': 0, 'K': 0, 'L': 0, 'M': 0, 'N': 0, 'S': 0, 'T': 0, 'U': 0, 'V': 0, 'W': 0, 'X': 0, 'Y': 0, 'Z': 0,
    'A': 1, 'D': 1, 'O': 1, 'P': 1, 'Q': 1, 'R': 1,
    'B': 2,
  };

  TopologyLevel generateLevel() {
    final chars = _holes.keys.toList();
    final char1 = chars[_random.nextInt(chars.length)];
    final char2 = chars[_random.nextInt(chars.length)];

    return TopologyLevel(
      char1: char1,
      char2: char2,
      areEquivalent: _holes[char1] == _holes[char2],
    );
  }
}
