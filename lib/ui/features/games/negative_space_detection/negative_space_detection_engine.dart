import 'dart:math';

enum NegativeSpaceShape {
  star,
  heart,
  moon,
  triangle,
  circle,
  cross,
  diamond,
  pentagon,
  hexagon,
  octagon
}

class NegativeSpaceLevel {
  final NegativeSpaceShape target;
  final List<NegativeSpaceShape> options;
  final int correctIndex;

  NegativeSpaceLevel({
    required this.target,
    required this.options,
    required this.correctIndex,
  });
}

class NegativeSpaceDetectionEngine {
  final Random _random = Random();

  NegativeSpaceLevel generateLevel() {
    final shapes = NegativeSpaceShape.values.toList();
    shapes.shuffle(_random);

    final target = shapes[0];
    final options = shapes.sublist(0, 4);
    options.shuffle(_random);

    return NegativeSpaceLevel(
      target: target,
      options: options,
      correctIndex: options.indexOf(target),
    );
  }
}
