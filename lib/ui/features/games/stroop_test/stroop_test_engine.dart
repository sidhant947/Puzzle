import 'dart:math';
import 'package:flutter/material.dart';

import '../../../../utils/design_system.dart';

class StroopItem {
  final String text;
  final Color color;
  final String colorName;

  StroopItem({required this.text, required this.color, required this.colorName});
}

class StroopTestEngine {
  final Random _random = Random();
  final Map<String, Color> _colorData = {
    'RED': DesignSystem.gameRose,
    'BLUE': DesignSystem.gameBlue,
    'GREEN': DesignSystem.gameGreen,
    'YELLOW': DesignSystem.gameAmber,
    'PURPLE': DesignSystem.gamePurple,
    'ORANGE': DesignSystem.gameOrange,
  };

  StroopItem generateItem() {
    List<String> names = _colorData.keys.toList();
    String text = names[_random.nextInt(names.length)];
    
    // 80% chance of being incongruent
    String colorName;
    if (_random.nextDouble() < 0.8) {
      do {
        colorName = names[_random.nextInt(names.length)];
      } while (colorName == text);
    } else {
      colorName = text;
    }

    return StroopItem(
      text: text,
      color: _colorData[colorName]!,
      colorName: colorName,
    );
  }

  List<String> getAllColorNames() {
    return _colorData.keys.toList();
  }

  Color getColorByName(String name) {
    return _colorData[name] ?? Colors.black;
  }
}
