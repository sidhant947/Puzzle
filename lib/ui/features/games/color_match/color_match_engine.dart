import 'dart:math';
import 'package:flutter/material.dart';

class ColorMatchEngine {
  Color generateTargetColor() {
    final random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }

  double calculateSimilarity(Color target, Color current) {
    final dr = ((target.r * 255.0).round() - (current.r * 255.0).round()).abs();
    final dg = ((target.g * 255.0).round() - (current.g * 255.0).round()).abs();
    final db = ((target.b * 255.0).round() - (current.b * 255.0).round()).abs();
    
    // Max difference is 255 * 3 = 765
    final totalDiff = dr + dg + db;
    final percentage = (1 - (totalDiff / 765)) * 100;
    return percentage;
  }
}
