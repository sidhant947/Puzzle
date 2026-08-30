import 'dart:math' as math;
import 'package:flutter/material.dart';

class SearchItem {
  final IconData shape;
  final Color color;
  final bool isTarget;
  final double x; // 0.0 to 1.0
  final double y;

  SearchItem({
    required this.shape,
    required this.color,
    required this.isTarget,
    required this.x,
    required this.y,
  });
}

class VisualSearchRound {
  final IconData targetShape;
  final Color targetColor;
  final List<SearchItem> items;
  final bool targetPresent;

  VisualSearchRound({
    required this.targetShape,
    required this.targetColor,
    required this.items,
    required this.targetPresent,
  });
}

class VisualSearchConjunctionEngine {
  static const List<IconData> shapes = [Icons.square_rounded, Icons.circle_rounded];
  static final List<Color> colors = [const Color(0xFFEF4444), const Color(0xFF3B82F6)]; // Red and Blue

  static VisualSearchRound generateRound({int distractorCount = 16, math.Random? random}) {
    final rng = random ?? math.Random();
    
    // Target: e.g. Red Square
    final targetShape = Icons.square_rounded;
    final targetColor = colors[0]; // Red

    // Distractors: Red Circles and Blue Squares (Feature conjunction)
    final targetPresent = rng.nextBool();
    final items = <SearchItem>[];

    final totalCount = distractorCount + (targetPresent ? 1 : 0);
    final coords = <List<double>>[];

    // Generate random non-overlapping grid positions
    for (int i = 0; i < totalCount; i++) {
      double cx, cy;
      int attempts = 0;
      do {
        cx = 0.1 + rng.nextDouble() * 0.8;
        cy = 0.1 + rng.nextDouble() * 0.8;
        attempts++;
      } while (attempts < 50 && coords.any((pt) => (pt[0] - cx).abs() < 0.12 && (pt[1] - cy).abs() < 0.12));
      coords.add([cx, cy]);
    }

    int coordIdx = 0;
    if (targetPresent) {
      items.add(SearchItem(
        shape: targetShape,
        color: targetColor,
        isTarget: true,
        x: coords[coordIdx][0],
        y: coords[coordIdx][1],
      ));
      coordIdx++;
    }

    for (int i = coordIdx; i < totalCount; i++) {
      // 50% Red Circle, 50% Blue Square
      final isRedCircle = rng.nextBool();
      items.add(SearchItem(
        shape: isRedCircle ? Icons.circle_rounded : Icons.square_rounded,
        color: isRedCircle ? colors[0] : colors[1],
        isTarget: false,
        x: coords[i][0],
        y: coords[i][1],
      ));
    }

    return VisualSearchRound(
      targetShape: targetShape,
      targetColor: targetColor,
      items: items,
      targetPresent: targetPresent,
    );
  }
}
