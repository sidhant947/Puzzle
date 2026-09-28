import 'dart:math';
import 'package:flutter/material.dart';

class MirrorTracingEngine {
  List<Offset> generateStarPath(Size size) {
    final double cx = size.width / 2;
    final double cy = size.height / 2;
    final double outerRadius = min(size.width, size.height) * 0.4;
    final double innerRadius = outerRadius * 0.4;
    const int numPoints = 5;

    final List<Offset> points = [];
    for (int i = 0; i < numPoints * 2; i++) {
      final double radius = i % 2 == 0 ? outerRadius : innerRadius;
      final double angle = (i * pi / numPoints) - pi / 2;
      points.add(Offset(cx + radius * cos(angle), cy + radius * sin(angle)));
    }
    // Close the path
    points.add(points.first);
    return points;
  }

  List<Offset> generateDiamondPath(Size size) {
    final double cx = size.width / 2;
    final double cy = size.height / 2;
    final double r = min(size.width, size.height) * 0.38;
    return [
      Offset(cx, cy - r),
      Offset(cx + r, cy),
      Offset(cx, cy + r),
      Offset(cx - r, cy),
      Offset(cx, cy - r),
    ];
  }

  List<Offset> generateHexagonPath(Size size) {
    final double cx = size.width / 2;
    final double cy = size.height / 2;
    final double r = min(size.width, size.height) * 0.38;
    final List<Offset> points = [];
    for (int i = 0; i < 6; i++) {
      final double angle = (i * pi / 3) - pi / 6;
      points.add(Offset(cx + r * cos(angle), cy + r * sin(angle)));
    }
    points.add(points.first);
    return points;
  }

  List<Offset> generateTrianglePath(Size size) {
    final double cx = size.width / 2;
    final double cy = size.height / 2;
    final double r = min(size.width, size.height) * 0.4;
    final List<Offset> points = [];
    for (int i = 0; i < 3; i++) {
      final double angle = (i * 2 * pi / 3) - pi / 2;
      points.add(Offset(cx + r * cos(angle), cy + r * sin(angle)));
    }
    points.add(points.first);
    return points;
  }

  List<Offset> generateCrossPath(Size size) {
    final double cx = size.width / 2;
    final double cy = size.height / 2;
    final double r = min(size.width, size.height) * 0.38;
    final double inner = r * 0.35;
    return [
      Offset(cx - inner, cy - r),
      Offset(cx + inner, cy - r),
      Offset(cx + inner, cy - inner),
      Offset(cx + r, cy - inner),
      Offset(cx + r, cy + inner),
      Offset(cx + inner, cy + inner),
      Offset(cx + inner, cy + r),
      Offset(cx - inner, cy + r),
      Offset(cx - inner, cy + inner),
      Offset(cx - r, cy + inner),
      Offset(cx - r, cy - inner),
      Offset(cx - inner, cy - inner),
      Offset(cx - inner, cy - r),
    ];
  }

  List<Offset> generateHeartPath(Size size) {
    final double cx = size.width / 2;
    final double cy = size.height / 2;
    final double r = min(size.width, size.height) * 0.38;
    final List<Offset> points = [];
    const int steps = 16;
    for (int i = 0; i < steps; i++) {
      final double t = i * 2 * pi / steps;
      final double x = 16 * pow(sin(t), 3).toDouble();
      final double y = -(13 * cos(t) - 5 * cos(2 * t) - 2 * cos(3 * t) - cos(4 * t));
      points.add(Offset(cx + (x / 17) * r, cy + (y / 17) * r));
    }
    points.add(points.first);
    return points;
  }

  List<Offset> generateOctagonPath(Size size) {
    final double cx = size.width / 2;
    final double cy = size.height / 2;
    final double r = min(size.width, size.height) * 0.38;
    final List<Offset> points = [];
    for (int i = 0; i < 8; i++) {
      final double angle = (i * pi / 4) - pi / 8;
      points.add(Offset(cx + r * cos(angle), cy + r * sin(angle)));
    }
    points.add(points.first);
    return points;
  }

  List<Offset> generatePath(Size size, int levelIndex) {
    final generators = [
      generateStarPath,
      generateDiamondPath,
      generateHexagonPath,
      generateTrianglePath,
      generateCrossPath,
      generateHeartPath,
      generateOctagonPath,
    ];
    return generators[levelIndex % generators.length](size);
  }

  List<Offset> generateRandomPath(Size size, [Random? random]) {
    final rng = random ?? Random();
    final generators = [
      generateStarPath,
      generateDiamondPath,
      generateHexagonPath,
      generateTrianglePath,
      generateCrossPath,
      generateHeartPath,
      generateOctagonPath,
    ];
    return generators[rng.nextInt(generators.length)](size);
  }

  bool isPointOnPath(Offset point, List<Offset> path, double tolerance) {
    for (int i = 0; i < path.length - 1; i++) {
      if (_distanceToSegment(point, path[i], path[i + 1]) <= tolerance) {
        return true;
      }
    }
    return false;
  }

  double _distanceToSegment(Offset p, Offset a, Offset b) {
    final double l2 = (a - b).distanceSquared;
    if (l2 == 0.0) return (p - a).distance;
    final double t = max(0, min(1, (p - a).dot(b - a) / l2));
    final Offset projection = a + (b - a) * t;
    return (p - projection).distance;
  }
}

extension OffsetExtension on Offset {
  double dot(Offset other) => dx * other.dx + dy * other.dy;
}
