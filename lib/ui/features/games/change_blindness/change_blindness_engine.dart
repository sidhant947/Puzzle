import 'dart:math';
import 'package:flutter/material.dart';

class ChangeBlindnessEngine {
  final Random _random = Random();

  final List<IconData> _icons = [
    Icons.favorite, Icons.star, Icons.square, Icons.circle,
    Icons.change_history, Icons.pentagon, Icons.hexagon, Icons.diamond,
    Icons.cruelty_free, Icons.cloud, Icons.sunny, Icons.eco,
    Icons.face, Icons.home, Icons.notifications, Icons.settings,
  ];

  final List<Color> _colors = [
    Colors.red, Colors.blue, Colors.green, Colors.orange,
    Colors.purple, Colors.pink, Colors.teal, Colors.indigo,
  ];

  Map<String, dynamic> generateTrial(int gridSize) {
    int totalItems = gridSize * gridSize;
    List<Map<String, dynamic>> items = [];
    
    for (int i = 0; i < totalItems; i++) {
      items.add({
        'icon': _icons[_random.nextInt(_icons.length)],
        'color': _colors[_random.nextInt(_colors.length)],
      });
    }

    int changeIndex = _random.nextInt(totalItems);
    List<Map<String, dynamic>> changedItems = List.from(items.map((e) => Map<String, dynamic>.from(e)));
    
    // Randomly choose what to change: icon or color
    bool changeIcon = _random.nextBool();
    if (changeIcon) {
      IconData newIcon;
      do {
        newIcon = _icons[_random.nextInt(_icons.length)];
      } while (newIcon == items[changeIndex]['icon']);
      changedItems[changeIndex]['icon'] = newIcon;
    } else {
      Color newColor;
      do {
        newColor = _colors[_random.nextInt(_colors.length)];
      } while (newColor == items[changeIndex]['color']);
      changedItems[changeIndex]['color'] = newColor;
    }

    return {
      'original': items,
      'changed': changedItems,
      'changeIndex': changeIndex,
    };
  }
}
