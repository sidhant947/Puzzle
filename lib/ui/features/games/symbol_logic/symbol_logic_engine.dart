import 'dart:math';
import 'package:flutter/material.dart';

class SymbolEquation {
  final List<IconData> symbols;
  final List<int> coefficients;
  final int result;
  final bool isQuestion;

  SymbolEquation({
    required this.symbols,
    required this.coefficients,
    required this.result,
    this.isQuestion = false,
  });
}

class SymbolLogicEngine {
  final List<IconData> allIcons = [
    Icons.apple_rounded,
    Icons.lunch_dining_rounded,
    Icons.icecream_rounded,
    Icons.cookie_rounded,
    Icons.egg_alt_rounded,
    Icons.local_pizza_rounded,
    Icons.bakery_dining_rounded,
    Icons.breakfast_dining_rounded,
  ];

  Map<String, dynamic> generatePuzzle() {
    final random = Random();
    final selectedIcons = (List.from(allIcons)..shuffle()).take(3).toList();
    
    final val1 = random.nextInt(9) + 1; // 1-9
    final val2 = random.nextInt(9) + 1;
    final val3 = random.nextInt(9) + 1;

    final equations = [
      // Eq 1: A + A = X
      SymbolEquation(
        symbols: [selectedIcons[0], selectedIcons[0]],
        coefficients: [1, 1],
        result: val1 + val1,
      ),
      // Eq 2: A + B = Y
      SymbolEquation(
        symbols: [selectedIcons[0], selectedIcons[1]],
        coefficients: [1, 1],
        result: val1 + val2,
      ),
      // Eq 3: B + C = Z
      SymbolEquation(
        symbols: [selectedIcons[1], selectedIcons[2]],
        coefficients: [1, 1],
        result: val2 + val3,
      ),
      // Question: A + C = ?
      SymbolEquation(
        symbols: [selectedIcons[0], selectedIcons[2]],
        coefficients: [1, 1],
        result: val1 + val3,
        isQuestion: true,
      ),
    ];

    return {
      'equations': equations,
      'answer': val1 + val3,
    };
  }
}
