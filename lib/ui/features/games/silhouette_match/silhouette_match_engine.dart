import 'dart:math';
import 'package:flutter/material.dart';

class ProjectedCube {
  final List<Offset> vertices;
  final List<List<int>> edges;
  final List<List<int>> faces;

  ProjectedCube({required this.vertices, required this.edges, required this.faces});
}

class SilhouetteMatchEngine {
  ProjectedCube _generateCube(double x, double y, double z, double size, double angleX, double angleY) {
    // 8 vertices of a cube
    List<List<double>> localVertices = [
      [-1, -1, -1], [1, -1, -1], [1, 1, -1], [-1, 1, -1],
      [-1, -1, 1], [1, -1, 1], [1, 1, 1], [-1, 1, 1],
    ];

    List<Offset> projected = [];
    for (var v in localVertices) {
      double vx = v[0] * size / 2;
      double vy = v[1] * size / 2;
      double vz = v[2] * size / 2;

      // Rotate Y
      double rx1 = vx * cos(angleY) + vz * sin(angleY);
      double rz1 = -vx * sin(angleY) + vz * cos(angleY);

      // Rotate X
      double ry2 = vy * cos(angleX) - rz1 * sin(angleX);
      
      // Project (Simple parallel projection with slight offset for 3D look)
      projected.add(Offset(x + rx1, y + ry2));
    }

    return ProjectedCube(
      vertices: projected,
      edges: [
        [0, 1], [1, 2], [2, 3], [3, 0],
        [4, 5], [5, 6], [6, 7], [7, 4],
        [0, 4], [1, 5], [2, 6], [3, 7],
      ],
      faces: [
        [0, 1, 2, 3], [4, 5, 6, 7], [0, 1, 5, 4],
        [1, 2, 6, 5], [2, 3, 7, 6], [3, 0, 4, 7],
      ],
    );
  }

  List<ProjectedCube> generateObject(double angleX, double angleY) {
    final random = Random();
    int count = 3 + random.nextInt(2); // 3-4 cubes
    List<ProjectedCube> cubes = [];
    
    for (int i = 0; i < count; i++) {
      double ox = (random.nextDouble() - 0.5) * 60;
      double oy = (random.nextDouble() - 0.5) * 60;
      double oz = (random.nextDouble() - 0.5) * 60;
      cubes.add(_generateCube(ox, oy, oz, 40, angleX, angleY));
    }
    return cubes;
  }

  Map<String, dynamic> generateLevel() {
    return _generateLevelFixed();
  }

  Map<String, dynamic> _generateLevelFixed() {
    final random = Random();
    int count = 3;
    List<Map<String, double>> offsets = List.generate(count, (_) => {
      'x': (random.nextDouble() - 0.5) * 80,
      'y': (random.nextDouble() - 0.5) * 80,
      'z': (random.nextDouble() - 0.5) * 80,
      'size': 40.0 + random.nextDouble() * 20,
    });

    double angleX = random.nextDouble() * pi;
    double angleY = random.nextDouble() * pi;

    List<ProjectedCube> getProjected(double ax, double ay) {
      return offsets.map((o) => _generateCube(o['x']!, o['y']!, o['z']!, o['size']!, ax, ay)).toList();
    }

    final target = getProjected(angleX, angleY);
    final List<List<ProjectedCube>> options = [target];

    while (options.length < 4) {
      double ax = random.nextDouble() * pi * 2;
      double ay = random.nextDouble() * pi * 2;
      // Ensure it's sufficiently different
      options.add(getProjected(ax, ay));
    }

    final List<int> indices = [0, 1, 2, 3];
    indices.shuffle();
    final shuffledOptions = indices.map((i) => options[i]).toList();
    final correctIndex = indices.indexOf(0);

    return {
      'target': target,
      'options': shuffledOptions,
      'correctIndex': correctIndex,
    };
  }
}
