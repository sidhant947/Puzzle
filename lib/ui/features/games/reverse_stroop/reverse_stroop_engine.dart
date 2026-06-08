import 'dart:math';
import 'package:flutter/material.dart';

import '../../../../utils/design_system.dart';

enum StroopRule { text, color }

class StroopStimulus {
  final String word;
  final Color color;
  final String colorName;
  final StroopRule rule;
  final List<String> options;
  final String correctAnswer;

  StroopStimulus({
    required this.word,
    required this.color,
    required this.colorName,
    required this.rule,
    required this.options,
    required this.correctAnswer,
  });
}

class ReverseStroopEngine {
  static final Random _random = Random();

  static const Map<String, Color> _colors = {
    'RED': DesignSystem.gameRose,
    'GREEN': DesignSystem.gameGreen,
    'BLUE': DesignSystem.gameBlue,
    'YELLOW': DesignSystem.gameAmber,
    'PURPLE': DesignSystem.gamePurple,
    'ORANGE': DesignSystem.gameOrange,
    'PINK': DesignSystem.gamePink,
  };

  static StroopStimulus generateStimulus(String difficulty) {
    final colorNames = _colors.keys.toList();
    final rule = _random.nextBool() ? StroopRule.text : StroopRule.color;
    
    final wordIndex = _random.nextInt(colorNames.length);
    final colorIndex = _random.nextInt(colorNames.length);
    
    final word = colorNames[wordIndex];
    final colorName = colorNames[colorIndex];
    final color = _colors[colorName]!;

    final correctAnswer = rule == StroopRule.text ? word : colorName;

    List<String> options = [correctAnswer];
    while (options.length < 4) {
      final randomName = colorNames[_random.nextInt(colorNames.length)];
      if (!options.contains(randomName)) {
        options.add(randomName);
      }
    }
    options.shuffle();

    return StroopStimulus(
      word: word,
      color: color,
      colorName: colorName,
      rule: rule,
      options: options,
      correctAnswer: correctAnswer,
    );
  }
}
