import 'dart:math';
import 'package:flutter/material.dart';
import '../../../../utils/design_system.dart';

enum ViewDirection { north, south, east, west, top }

class Cube {
  final int x;
  final int y;
  final int z;
  final Color color;

  Cube({required this.x, required this.y, required this.z, required this.color});
}

class PerspectiveTakingEngine {
  static const int gridSize = 3;
  static const List<Color> cubeColors = [
    DesignSystem.accentBerry,
    DesignSystem.accentEmerald,
    DesignSystem.accentAmber,
    DesignSystem.primary,
    DesignSystem.gameOrange,
    DesignSystem.gameTeal,
  ];

  List<Cube> generateLevel() {
    final random = Random();
    final List<Cube> cubes = [];
    final List<Color> availableColors = List.from(cubeColors)..shuffle();
    
    // Use a set to keep track of occupied positions
    final Set<String> occupied = {};

    int count = 4 + random.nextInt(2); // 4 or 5 cubes

    while (cubes.length < count) {
      int x = random.nextInt(gridSize);
      int z = random.nextInt(gridSize);
      
      // Ensure each (x, z) only has ONE cube so all colors are visible from top
      if (occupied.any((pos) => pos.startsWith('$x,') && pos.endsWith(',$z'))) {
        continue;
      }

      int y = random.nextInt(gridSize);
      cubes.add(Cube(
        x: x,
        y: y,
        z: z,
        color: availableColors[cubes.length % availableColors.length],
      ));
      occupied.add('$x,$y,$z');
    }

    return cubes;
  }

  /// Returns a 2D grid (gridSize x gridSize) representing the view from a direction.
  /// Null if no cube is visible at that (u, v) coordinate.
  List<List<Color?>> getView(List<Cube> cubes, ViewDirection direction) {
    final List<List<Color?>> view = List.generate(
      gridSize,
      (_) => List.filled(gridSize, null),
    );

    for (int u = 0; u < gridSize; u++) {
      for (int v = 0; v < gridSize; v++) {
        Cube? visibleCube;
        double minDepth = double.infinity;

        for (final cube in cubes) {
          int cu, cv;
          double depth;

          switch (direction) {
            case ViewDirection.top:
              // X horizontal, Z vertical (v=0 is far, v=2 is near)
              cu = cube.x;
              cv = cube.z;
              depth = -cube.y.toDouble(); // higher Y is closer
              break;
            case ViewDirection.south:
              // Looking from +Z towards -Z. 
              // X horizontal, Y vertical.
              cu = cube.x;
              cv = gridSize - 1 - cube.y; // Y=2 is top of grid
              depth = -cube.z.toDouble(); // higher Z is closer
              break;
            case ViewDirection.north:
              // Looking from -Z towards +Z.
              // X is inverted, Y vertical.
              cu = gridSize - 1 - cube.x;
              cv = gridSize - 1 - cube.y;
              depth = cube.z.toDouble(); // lower Z is closer
              break;
            case ViewDirection.east:
              // Looking from +X towards -X.
              // Z horizontal, Y vertical.
              cu = gridSize - 1 - cube.z;
              cv = gridSize - 1 - cube.y;
              depth = -cube.x.toDouble(); // higher X is closer
              break;
            case ViewDirection.west:
              // Looking from -X towards +X.
              // Z is inverted, Y vertical.
              cu = cube.z;
              cv = gridSize - 1 - cube.y;
              depth = cube.x.toDouble(); // lower X is closer
              break;
          }

          if (cu == u && cv == v) {
            if (depth < minDepth) {
              minDepth = depth;
              visibleCube = cube;
            }
          }
        }

        view[v][u] = visibleCube?.color;
      }
    }

    return view;
  }
}
