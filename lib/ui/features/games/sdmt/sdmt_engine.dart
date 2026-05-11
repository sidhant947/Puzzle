import 'dart:math';
import 'package:flutter/material.dart';

class SDMTEngine {
  final Random _random = Random();
  final List<IconData> symbols = [
    Icons.star_rounded,
    Icons.favorite_rounded,
    Icons.square_rounded,
    Icons.circle_rounded,
    Icons.change_history_rounded,
    Icons.pentagon_rounded,
    Icons.hexagon_rounded,
    Icons.diamond_rounded,
    Icons.cloud_rounded,
  ];

  Map<IconData, int> generateKey() {
    List<int> digits = List.generate(9, (i) => i + 1)..shuffle(_random);
    Map<IconData, int> key = {};
    for (int i = 0; i < symbols.length; i++) {
      key[symbols[i]] = digits[i];
    }
    return key;
  }

  IconData getRandomSymbol() {
    return symbols[_random.nextInt(symbols.length)];
  }
}
