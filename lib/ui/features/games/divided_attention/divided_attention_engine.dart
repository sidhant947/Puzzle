import 'dart:math';

enum DividedTaskType {
  shape,
  color,
}

class DividedAttentionItem {
  final String id;
  final String value; // e.g., "star", "square", "red", "blue"
  final bool isTarget;

  DividedAttentionItem({
    required this.id,
    required this.value,
    required this.isTarget,
  });
}

class DividedAttentionEngine {
  final Random _random = Random();
  int _idCounter = 0;

  DividedAttentionItem generateItem(bool isLeftSide) {
    final id = (_idCounter++).toString();
    
    if (isLeftSide) {
      // Left side: Shapes (Star is target)
      final shapes = ['star', 'square', 'circle', 'triangle'];
      final value = shapes[_random.nextInt(shapes.length)];
      return DividedAttentionItem(
        id: id,
        value: value,
        isTarget: value == 'star',
      );
    } else {
      // Right side: Colors (Red is target)
      final colors = ['red', 'blue', 'green', 'yellow'];
      final value = colors[_random.nextInt(colors.length)];
      return DividedAttentionItem(
        id: id,
        value: value,
        isTarget: value == 'red',
      );
    }
  }
}
