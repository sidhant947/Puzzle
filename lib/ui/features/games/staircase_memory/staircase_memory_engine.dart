import 'dart:math';
import 'package:flutter/material.dart';

class StaircaseMemoryEngine {
  final Random _random = Random();

  final List<IconData> _icons = [
    Icons.star,
    Icons.favorite,
    Icons.bolt,
    Icons.celebration,
    Icons.pets,
    Icons.sunny,
    Icons.cloud,
    Icons.ac_unit,
    Icons.local_fire_department,
    Icons.water_drop,
  ];

  List<IconData> get allIcons => _icons;

  IconData getRandomIcon() {
    return _icons[_random.nextInt(_icons.length)];
  }

  /// Generates a sequence where some items are "matches" (N-back) and some are not.
  List<IconData> generateSequence(int length, int n) {
    List<IconData> sequence = [];
    for (int i = 0; i < length; i++) {
      if (i >= n && _random.nextDouble() < 0.3) {
        // 30% chance to force a match
        sequence.add(sequence[i - n]);
      } else {
        sequence.add(getRandomIcon());
      }
    }
    return sequence;
  }
}
