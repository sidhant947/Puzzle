import 'dart:math' as math;

class Point3D {
  final double x, y, z;
  Point3D(this.x, this.y, this.z);
}

class Edge3D {
  final int from, to;
  Edge3D(this.from, this.to);
}

class WireframeRound {
  final List<Point3D> vertices;
  final List<Edge3D> edges;
  final double rotationAngleDeg;
  final int correctOptionIndex;

  WireframeRound({
    required this.vertices,
    required this.edges,
    required this.rotationAngleDeg,
    required this.correctOptionIndex,
  });
}

class Wireframe3DRotationEngine {
  static WireframeRound generateRound({math.Random? random}) {
    final rng = random ?? math.Random();

    // 3D Pyramid / Tetrahedron vertices
    final vertices = [
      Point3D(0, 1.0, 0),     // Apex (0)
      Point3D(-0.8, -0.6, -0.6), // Base left (1)
      Point3D(0.8, -0.6, -0.6),  // Base right (2)
      Point3D(0, -0.6, 0.9),    // Base front (3)
    ];

    final edges = [
      Edge3D(0, 1), Edge3D(0, 2), Edge3D(0, 3),
      Edge3D(1, 2), Edge3D(2, 3), Edge3D(3, 1),
    ];

    final angles = [60.0, 90.0, 120.0, 180.0];
    final angle = angles[rng.nextInt(angles.length)];
    final correctIdx = rng.nextInt(4);

    return WireframeRound(
      vertices: vertices,
      edges: edges,
      rotationAngleDeg: angle,
      correctOptionIndex: correctIdx,
    );
  }
}
