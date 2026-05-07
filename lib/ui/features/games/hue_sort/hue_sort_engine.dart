import 'dart:math';
import 'package:flutter/material.dart';

class HueSortLevel {
  final int size;
  final List<Color> colors;
  final List<Color> solution;
  final List<int> fixedIndices;

  HueSortLevel({
    required this.size,
    required this.colors,
    required this.solution,
    required this.fixedIndices,
  });
}

class HueSortEngine {
  final Random _random = Random();

  HueSortLevel generateLevel({int size = 5}) {
    // Pick 4 corner colors
    final corners = List.generate(4, (_) => Color.fromARGB(
      255,
      _random.nextInt(256),
      _random.nextInt(256),
      _random.nextInt(256),
    ));

    List<Color> solution = List.filled(size * size, Colors.black);
    
    // Bilinear interpolation for the gradient
    for (int y = 0; y < size; y++) {
      double tY = y / (size - 1);
      for (int x = 0; x < size; x++) {
        double tX = x / (size - 1);
        
        final top = Color.lerp(corners[0], corners[1], tX)!;
        final bottom = Color.lerp(corners[2], corners[3], tX)!;
        solution[y * size + x] = Color.lerp(top, bottom, tY)!;
      }
    }

    // Corners are fixed
    final fixedIndices = [0, size - 1, size * (size - 1), size * size - 1];
    
    // Shuffle the non-fixed colors
    List<int> movableIndices = [];
    for (int i = 0; i < size * size; i++) {
      if (!fixedIndices.contains(i)) movableIndices.add(i);
    }
    
    List<Color> shuffled = List.from(solution);
    List<int> shuffledIndices = List.from(movableIndices)..shuffle(_random);
    
    for (int i = 0; i < movableIndices.length; i++) {
      shuffled[movableIndices[i]] = solution[shuffledIndices[i]];
    }

    return HueSortLevel(
      size: size,
      colors: shuffled,
      solution: solution,
      fixedIndices: fixedIndices,
    );
  }
}
