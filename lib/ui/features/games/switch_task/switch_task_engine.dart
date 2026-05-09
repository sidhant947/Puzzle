import 'dart:math';
import 'package:flutter/material.dart';

enum SwitchRule { color, shape }

class SwitchItem {
  final Color color;
  final String colorName;
  final IconData shape;
  final String shapeName;

  SwitchItem({
    required this.color,
    required this.colorName,
    required this.shape,
    required this.shapeName,
  });
}

class SwitchTaskEngine {
  final Random _random = Random();

  final List<Map<String, dynamic>> _colors = [
    {'color': Colors.blue, 'name': 'BLUE'},
    {'color': Colors.red, 'name': 'RED'},
  ];

  final List<Map<String, dynamic>> _shapes = [
    {'shape': Icons.circle, 'name': 'CIRCLE'},
    {'shape': Icons.square, 'name': 'SQUARE'},
  ];

  Map<String, dynamic> generateTrial(SwitchRule? previousRule) {
    // 70% chance to switch rule if previousRule is not null
    SwitchRule rule;
    if (previousRule == null) {
      rule = SwitchRule.values[_random.nextInt(2)];
    } else {
      if (_random.nextDouble() < 0.7) {
        rule = previousRule == SwitchRule.color ? SwitchRule.shape : SwitchRule.color;
      } else {
        rule = previousRule;
      }
    }

    final colorData = _colors[_random.nextInt(_colors.length)];
    final shapeData = _shapes[_random.nextInt(_shapes.length)];

    final item = SwitchItem(
      color: colorData['color'],
      colorName: colorData['name'],
      shape: shapeData['shape'],
      shapeName: shapeData['name'],
    );

    return {
      'rule': rule,
      'item': item,
      'expectedAnswer': rule == SwitchRule.color ? item.colorName : item.shapeName,
    };
  }

  List<String> getOptions(SwitchRule rule) {
    if (rule == SwitchRule.color) {
      return _colors.map((c) => c['name'] as String).toList();
    } else {
      return _shapes.map((s) => s['name'] as String).toList();
    }
  }
}
