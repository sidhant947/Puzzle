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
