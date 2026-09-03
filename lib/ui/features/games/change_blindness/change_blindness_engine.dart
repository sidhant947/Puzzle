import 'dart:math';
import 'package:flutter/material.dart';

import '../../../../utils/design_system.dart';

class ChangeBlindnessEngine {
  final Random _random = Random();

  final List<IconData> _icons = [
    Icons.favorite, Icons.star, Icons.square, Icons.circle,
    Icons.change_history, Icons.pentagon, Icons.hexagon, Icons.diamond,
    Icons.cruelty_free, Icons.cloud, Icons.sunny, Icons.eco,
    Icons.face, Icons.home, Icons.notifications, Icons.settings,
  ];

  final List<Color> _colors = [
    DesignSystem.gameRose,
    DesignSystem.gameBlue,
    DesignSystem.gameGreen,
    DesignSystem.gameOrange,
    DesignSystem.gamePurple,
    DesignSystem.gamePink,
    DesignSystem.gameTeal,
    DesignSystem.gameIndigo,
  ];

  Map<String, dynamic> generateTrial(int gridSize, {int score = 0}) {
    int totalItems = gridSize * gridSize;
    List<Map<String, dynamic>> items = [];
    
    for (int i = 0; i < totalItems; i++) {
      items.add({
        'icon': _icons[_random.nextInt(_icons.length)],
        'color': _colors[_random.nextInt(_colors.length)],
        'rotation': 0.0,
        'scale': 1.0,
        'visible': true,
      });
    }

    int changeIndex = _random.nextInt(totalItems);
    List<Map<String, dynamic>> changedItems = List.from(items.map((e) => Map<String, dynamic>.from(e)));
    
    if (score < 3) {
      // Early boards: very pronounced change (distinct shape + high contrast color change)
      IconData newIcon;
      do {
        newIcon = _icons[_random.nextInt(_icons.length)];
      } while (newIcon == items[changeIndex]['icon']);
      changedItems[changeIndex]['icon'] = newIcon;

      Color newColor;
      do {
        newColor = _colors[_random.nextInt(_colors.length)];
      } while (newColor == items[changeIndex]['color']);
      changedItems[changeIndex]['color'] = newColor;
    } else {
      // Pick randomly from 5 distinct cognitive change types:
      // 0: Icon swap
      // 1: Color swap
      // 2: Rotation (90 or 180 deg)
      // 3: Size scale (shrink/grow)
      // 4: Disappearance (vanishes)
      int changeType = _random.nextInt(5);
      switch (changeType) {
        case 0:
          IconData newIcon;
          do {
            newIcon = _icons[_random.nextInt(_icons.length)];
          } while (newIcon == items[changeIndex]['icon']);
          changedItems[changeIndex]['icon'] = newIcon;
          break;
        case 1:
          Color newColor;
          do {
            newColor = _colors[_random.nextInt(_colors.length)];
          } while (newColor == items[changeIndex]['color']);
          changedItems[changeIndex]['color'] = newColor;
          break;
        case 2:
          // Rotation shift
          final rotations = [0.5 * pi, 1.0 * pi, 1.5 * pi];
          changedItems[changeIndex]['rotation'] = rotations[_random.nextInt(rotations.length)];
          break;
        case 3:
          // Size shift
          changedItems[changeIndex]['scale'] = _random.nextBool() ? 0.6 : 1.4;
          break;
        case 4:
          // Disappearance
          changedItems[changeIndex]['visible'] = false;
          break;
      }
    }

    return {
      'original': items,
      'changed': changedItems,
      'changeIndex': changeIndex,
    };
  }
}
