import 'dart:math';

enum ShapeType {
  circle,
  square,
  triangle,
  star;

  String get label => name.toUpperCase();
}

enum ColorType {
  red,
  blue,
  green,
  amber;

  String get label => name.toUpperCase();
}

class SearchItem {
  final ShapeType shape;
  final ColorType color;
  final bool isTarget;
  final int id;

  SearchItem({
    required this.shape,
    required this.color,
    required this.isTarget,
    required this.id,
  });
}

class ConjunctionSearchEngine {
  final Random _random = Random();
  static const int gridSize = 6;
  static const int totalCells = gridSize * gridSize;

  // Generates a level given the round number.
  // Returns the target item and the list of 36 items in random order.
  Map<String, dynamic> generateLevel() {
    // 1. Pick a random target shape and color
    final targetShape = ShapeType.values[_random.nextInt(ShapeType.values.length)];
    final targetColor = ColorType.values[_random.nextInt(ColorType.values.length)];

    final targetItem = SearchItem(
      shape: targetShape,
      color: targetColor,
      isTarget: true,
      id: 0,
    );

    // 2. Generate distractors.
    // In Conjunction Search, distractors MUST share one feature with the target (shape or color) but not both,
    // to make the search effortful (pre-attentive feature search vs attentive conjunction search).
    final List<SearchItem> items = [];
    items.add(targetItem);

    for (int i = 1; i < totalCells; i++) {
      // 50% chance of sharing color, 50% chance of sharing shape
      final shareColor = _random.nextBool();
      ShapeType distractorShape;
      ColorType distractorColor;

      if (shareColor) {
        distractorColor = targetColor;
        // Find a shape that is not the target shape
        final otherShapes = ShapeType.values.where((s) => s != targetShape).toList();
        distractorShape = otherShapes[_random.nextInt(otherShapes.length)];
      } else {
        distractorShape = targetShape;
        // Find a color that is not the target color
        final otherColors = ColorType.values.where((c) => c != targetColor).toList();
        distractorColor = otherColors[_random.nextInt(otherColors.length)];
      }

      items.add(SearchItem(
        shape: distractorShape,
        color: distractorColor,
        isTarget: false,
        id: i,
      ));
    }

    // Shuffle the items
    items.shuffle(_random);

    return {
      'target': targetItem,
      'items': items,
    };
  }
}
