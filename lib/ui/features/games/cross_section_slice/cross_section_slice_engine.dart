import 'dart:math';

enum SolidType {
  sphere,
  cube,
  cylinder,
  cone,
  pyramid,
}

enum CutOrientation {
  horizontal,
  vertical,
  diagonal,
}

enum SectionShape {
  circle,
  square,
  triangle,
  rectangle,
  ellipse,
  trapezoid,
}

class CrossSectionSliceChallenge {
  final SolidType solid;
  final CutOrientation orientation;
  final SectionShape correctShape;
  final List<SectionShape> options;

  CrossSectionSliceChallenge({
    required this.solid,
    required this.orientation,
    required this.correctShape,
    required this.options,
  });
}

class CrossSectionSliceEngine {
  final Random _random = Random();

  CrossSectionSliceChallenge generateChallenge() {
    final solid = SolidType.values[_random.nextInt(SolidType.values.length)];
    final orientation = CutOrientation.values[_random.nextInt(CutOrientation.values.length)];

    final correctShape = _getCorrectShape(solid, orientation);
    final options = _generateOptions(correctShape);

    return CrossSectionSliceChallenge(
      solid: solid,
      orientation: orientation,
      correctShape: correctShape,
      options: options,
    );
  }

  SectionShape _getCorrectShape(SolidType solid, CutOrientation orientation) {
    switch (solid) {
      case SolidType.sphere:
        return SectionShape.circle;
      case SolidType.cube:
        if (orientation == CutOrientation.horizontal || orientation == CutOrientation.vertical) {
          return SectionShape.square;
        } else {
          return SectionShape.rectangle;
        }
      case SolidType.cylinder:
        if (orientation == CutOrientation.horizontal) {
          return SectionShape.circle;
        } else if (orientation == CutOrientation.vertical) {
          return SectionShape.rectangle;
        } else {
          return SectionShape.ellipse;
        }
      case SolidType.cone:
        if (orientation == CutOrientation.horizontal) {
          return SectionShape.circle;
        } else if (orientation == CutOrientation.vertical) {
          return SectionShape.triangle;
        } else {
          return SectionShape.ellipse;
        }
      case SolidType.pyramid:
        if (orientation == CutOrientation.horizontal) {
          return SectionShape.square;
        } else if (orientation == CutOrientation.vertical) {
          return SectionShape.triangle;
        } else {
          return SectionShape.trapezoid;
        }
    }
  }

  List<SectionShape> _generateOptions(SectionShape correctShape) {
    final List<SectionShape> options = [correctShape];
    final List<SectionShape> allShapes = List.from(SectionShape.values);
    allShapes.remove(correctShape);
    allShapes.shuffle(_random);
    options.addAll(allShapes.take(3));
    options.shuffle(_random);
    return options;
  }
}
