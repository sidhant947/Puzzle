import 'dart:math';
import 'package:flutter/material.dart';

class OddOneOutLevel {
  final List<Color> colors;
  final int oddOneIndex;
  final double difficulty;

  OddOneOutLevel({
    required this.colors,
    required this.oddOneIndex,
    required this.difficulty,
  });
}

class OddOneOutEngine {
  final Random _random = Random();

  OddOneOutLevel generateLevel(int score) {
    // Determine grid size based on score
    int count;
    if (score < 3) {
      count = 4; // 2x2
    } else if (score < 8) {
      count = 9; // 3x3
    } else if (score < 15) {
      count = 16; // 4x4
    } else if (score < 25) {
      count = 25; // 5x5
    } else if (score < 40) {
      count = 36; // 6x6
    } else if (score < 60) {
      count = 49; // 7x7
    } else {
      count = 64; // 8x8
    }

    // Determine color difference using exponential decay
    // Starts at 0.15 (15% lightness/sat difference) and decays
    // Human threshold is around 0.01-0.02 for lightness
    double diff = 0.18 * pow(0.94, score);
    diff = diff.clamp(0.008, 0.2); // Never impossible, but very hard
    
    // Generate base color - avoid extreme blacks/whites where diff is invisible
    final baseColor = Color.fromARGB(
      255,
      40 + _random.nextInt(175),
      40 + _random.nextInt(175),
      40 + _random.nextInt(175),
    );

    // Generate odd color using HSL for more subtle control
    final oddColor = _generateSimilarColorHSL(baseColor, diff);

    int oddIndex = _random.nextInt(count);
    List<Color> colors = List.generate(count, (i) => i == oddIndex ? oddColor : baseColor);

    return OddOneOutLevel(
      colors: colors,
      oddOneIndex: oddIndex,
      difficulty: diff,
    );
  }

  Color _generateSimilarColorHSL(Color base, double diff) {
    final hsl = HSLColor.fromColor(base);
    
    // Randomly decide to adjust Lightness or Saturation (Lightness is usually harder)
    bool adjustLightness = _random.nextBool();
    
    double newLightness = hsl.lightness;
    double newSaturation = hsl.saturation;
    double newHue = hsl.hue;

    if (adjustLightness) {
      int sign = hsl.lightness > 0.5 ? -1 : 1;
      newLightness = (hsl.lightness + (diff * sign)).clamp(0.1, 0.9);
    } else {
      int sign = hsl.saturation > 0.5 ? -1 : 1;
      newSaturation = (hsl.saturation + (diff * sign)).clamp(0.1, 0.9);
      // Also add a tiny hue shift to make it even more confusing
      newHue = (hsl.hue + (_random.nextDouble() * 2.0 - 1.0)).clamp(0.0, 360.0);
    }

    return hsl
        .withLightness(newLightness)
        .withSaturation(newSaturation)
        .withHue(newHue)
        .toColor();
  }
}
