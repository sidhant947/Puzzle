import 'dart:math';
import 'package:flutter/material.dart';

class ColorFloodEngine {
  final Random _random = Random();
  static const List<Color> colors = [
    Color(0xFF3B82F6), // Blue
    Color(0xFFEC4899), // Pink
    Color(0xFF22C55E), // Green
    Color(0xFFF97316), // Orange
    Color(0xFFEF4444), // Red
    Color(0xFFEAB308), // Yellow
  ];

  List<List<int>> generateGrid(int size) {
    return List.generate(
      size,
      (_) => List.generate(size, (_) => _random.nextInt(colors.length)),
    );
  }

  void floodFill(List<List<int>> grid, int r, int c, int targetColor, int replacementColor) {
    if (targetColor == replacementColor) return;
    if (r < 0 || r >= grid.length || c < 0 || c >= grid[0].length) return;
    if (grid[r][c] != targetColor) return;

    grid[r][c] = replacementColor;

    floodFill(grid, r + 1, c, targetColor, replacementColor);
    floodFill(grid, r - 1, c, targetColor, replacementColor);
    floodFill(grid, r, c + 1, targetColor, replacementColor);
    floodFill(grid, r, c - 1, targetColor, replacementColor);
  }

  bool isSolved(List<List<int>> grid) {
    final firstColor = grid[0][0];
    for (var row in grid) {
      for (var cell in row) {
        if (cell != firstColor) return false;
      }
    }
    return true;
  }
}
