import 'dart:math';
import 'package:flutter/material.dart';

class WeightEquation {
  final Map<IconData, int> left;
  final Map<IconData, int> right;
  final bool isQuestion;

  WeightEquation({required this.left, required this.right, this.isQuestion = false});
}

class BalanceScaleEngine {
  final List<IconData> allIcons = [
    Icons.star_rounded,
    Icons.square_rounded,
    Icons.change_history_rounded, // Triangle
    Icons.circle_rounded,
    Icons.pentagon_rounded,
  ];

  Map<String, dynamic> generatePuzzle() {
    final random = Random();
    final icons = (List.from(allIcons)..shuffle()).take(4).toList();
    
    // Hidden values
    final valB = random.nextInt(2) + 2; // 2-3
    final valC = random.nextInt(2) + 2; // 2-3
    final valD = (valB * 2) + valC; // Complex sum

    final equations = [
      // Eq 1: valB * A = B
      WeightEquation(
        left: {icons[0]: valB},
        right: {icons[1]: 1},
      ),
      // Eq 2: valC * A = C
      WeightEquation(
        left: {icons[0]: valC},
        right: {icons[2]: 1},
      ),
      // Eq 3: 2B + C = D
      WeightEquation(
        left: {icons[1]: 2, icons[2]: 1},
        right: {icons[3]: 1},
      ),
      // Question: D = ? * A
      WeightEquation(
        left: {icons[3]: 1},
        right: {icons[0]: 0}, 
        isQuestion: true,
      ),
    ];

    return {
      'equations': equations,
      'answer': valD,
      'unitIcon': icons[0],
    };
  }
}
