import 'dart:math';

class Point2D {
  final double x;
  final double y;

  const Point2D(this.x, this.y);

  double distanceTo(Point2D other) {
    final dx = x - other.x;
    final dy = y - other.y;
    return sqrt(dx * dx + dy * dy);
  }
}

class TrackingLevel {
  final List<Point2D> objectPath;
  final List<Point2D> spotlightPath;
  final double spotlightRadius; // Normalized radius (e.g., 0.15)

  TrackingLevel({
    required this.objectPath,
    required this.spotlightPath,
    required this.spotlightRadius,
  });

  Point2D get finalPosition => objectPath.last;
}

class SpotlightTrackEngine {
  final Random _random = Random();
  static const double targetRadius = 0.04;

  TrackingLevel generateLevel(int round) {
    // Generate object path of 5 connected points
    final List<Point2D> objectPath = [];
    double currX = 0.2 + _random.nextDouble() * 0.6;
    double currY = 0.2 + _random.nextDouble() * 0.6;
    objectPath.add(Point2D(currX, currY));

    for (int i = 0; i < 4; i++) {
      // Find a point that is sufficiently far away but within boundaries [0.1, 0.9]
      double nextX = 0.1 + _random.nextDouble() * 0.8;
      double nextY = 0.1 + _random.nextDouble() * 0.8;
      while (Point2D(currX, currY).distanceTo(Point2D(nextX, nextY)) < 0.2) {
        nextX = 0.1 + _random.nextDouble() * 0.8;
        nextY = 0.1 + _random.nextDouble() * 0.8;
      }
      currX = nextX;
      currY = nextY;
      objectPath.add(Point2D(currX, currY));
    }

    // Spotlight Path: Simple horizontal/vertical sweeps to illuminate slices of the screen
    final List<Point2D> spotlightPath = [];
    final sweepType = _random.nextInt(3);
    if (sweepType == 0) {
      // Sweep horizontally left to right
      spotlightPath.add(const Point2D(0.0, 0.5));
      spotlightPath.add(const Point2D(0.3, 0.3));
      spotlightPath.add(const Point2D(0.6, 0.7));
      spotlightPath.add(const Point2D(1.0, 0.5));
    } else if (sweepType == 1) {
      // Sweep vertically top to bottom
      spotlightPath.add(const Point2D(0.5, 0.0));
      spotlightPath.add(const Point2D(0.3, 0.3));
      spotlightPath.add(const Point2D(0.7, 0.6));
      spotlightPath.add(const Point2D(0.5, 1.0));
    } else {
      // Circle sweep
      spotlightPath.add(const Point2D(0.5, 0.5));
      spotlightPath.add(const Point2D(0.2, 0.2));
      spotlightPath.add(const Point2D(0.8, 0.8));
      spotlightPath.add(const Point2D(0.5, 0.5));
    }

    // Higher rounds have smaller spotlight radius (harder visibility)
    final double radius = (0.16 - (round * 0.02)).clamp(0.08, 0.18);

    return TrackingLevel(
      objectPath: objectPath,
      spotlightPath: spotlightPath,
      spotlightRadius: radius,
    );
  }

  // Linear interpolation between points
  Point2D getPositionOnPath(List<Point2D> path, double t) {
    if (path.isEmpty) return const Point2D(0.5, 0.5);
    if (t <= 0.0) return path.first;
    if (t >= 1.0) return path.last;

    final double segmentCount = (path.length - 1).toDouble();
    final double scaledT = t * segmentCount;
    final int index = scaledT.floor();
    final double fraction = scaledT - index;

    if (index >= path.length - 1) return path.last;

    final p1 = path[index];
    final p2 = path[index + 1];

    final double x = p1.x + (p2.x - p1.x) * fraction;
    final double y = p1.y + (p2.y - p1.y) * fraction;
    return Point2D(x, y);
  }

  // Check if target is inside spotlight at a given state
  bool isVisible(Point2D objPos, Point2D spotPos, double radius) {
    return objPos.distanceTo(spotPos) <= radius;
  }

  // Check if user tap is correct (within threshold)
  bool isCorrectTap(Point2D tapPos, Point2D finalPos) {
    // 0.08 normalized distance threshold is very reasonable (about 25-30px on typical screens)
    return tapPos.distanceTo(finalPos) <= 0.09;
  }
}
