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

  static const List<IconData> _rotatableIcons = [
    Icons.favorite,
    Icons.change_history,
    Icons.pentagon,
    Icons.cruelty_free,
    Icons.cloud,
    Icons.eco,
    Icons.face,
    Icons.home,
    Icons.notifications,
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
      int changeType = _random.nextInt(4);
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
          if (!_rotatableIcons.contains(items[changeIndex]['icon'])) {
            final rotatable = _rotatableIcons[_random.nextInt(_rotatableIcons.length)];
            items[changeIndex]['icon'] = rotatable;
            changedItems[changeIndex]['icon'] = rotatable;
          }
          final rotations = [0.5 * pi, 1.0 * pi, 1.5 * pi];
          changedItems[changeIndex]['rotation'] = rotations[_random.nextInt(rotations.length)];
          break;
        case 3:
          changedItems[changeIndex]['scale'] = _random.nextBool() ? 0.6 : 1.4;
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
