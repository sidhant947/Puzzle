import 'dart:math';

class AkariEngine {
  final Random _random = Random();

  // 0-4: Number of adjacent bulbs
  // -1: Wall without number
  // -2: White cell
  
  static const List<Map<String, dynamic>> _levels = [
    {
      'grid': [
        [-2, -2, -1, -2, -2],
        [-2, -2, -2, -2, -2],
        [ 1, -2, -1, -2,  1],
        [-2, -2, -2, -2, -2],
        [-2, -2, -1, -2, -2],
      ],
    },
    {
      'grid': [
        [-2, -1, -2, -2, -2],
        [-1, -2, -2, -2, -2],
        [-2, -2,  2, -2, -2],
        [-2, -2, -2, -2, -1],
        [-2, -2, -2, -1, -2],
      ],
    },
    {
      'grid': [
        [-2, -2, -2, -2, -2],
        [-2,  1, -2,  0, -2],
        [-2, -2, -1, -2, -2],
        [-2,  2, -2, -1, -2],
        [-2, -2, -2, -2, -2],
      ],
    },
  ];

  Map<String, dynamic> generateLevel() {
    final level = _levels[_random.nextInt(_levels.length)];
    return {
      'grid': (level['grid'] as List<List<int>>).map((r) => List<int>.from(r)).toList(),
    };
  }
}
