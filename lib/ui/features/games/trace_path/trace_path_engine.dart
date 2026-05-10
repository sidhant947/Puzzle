import 'dart:math';
import 'package:flutter/material.dart';

class TracePathEngine {
  final Random _random = Random();

  List<Offset> generatePath(Size size) {
    final List<Offset> points = [];
    final int segments = 6;
    
    // Start point
    points.add(Offset(size.width * 0.1, size.height * 0.5));
    
    for (int i = 1; i <= segments; i++) {
      double x = size.width * (0.1 + (i * 0.8 / segments));
      double y = size.height * (0.2 + _random.nextDouble() * 0.6);
      points.add(Offset(x, y));
    }
    
    return points;
  }

  double calculateAccuracy(List<Offset> userPath, List<Offset> targetPath) {
    if (userPath.isEmpty) return 0.0;
    
    double totalError = 0.0;
    int count = 0;
    
    for (var userPoint in userPath) {
      double minDistance = double.infinity;
      for (int i = 0; i < targetPath.length - 1; i++) {
        double dist = _distanceToSegment(userPoint, targetPath[i], targetPath[i + 1]);
        if (dist < minDistance) minDistance = dist;
      }
      totalError += minDistance;
      count++;
    }
    
    double avgError = totalError / count;
    // Normalize accuracy: 100% at 0 error, 0% at 50 units error
    return (1.0 - (avgError / 50.0)).clamp(0.0, 1.0);
  }

  double _distanceToSegment(Offset p, Offset v, Offset w) {
    double l2 = (v.dx - w.dx) * (v.dx - w.dx) + (v.dy - w.dy) * (v.dy - w.dy);
    if (l2 == 0.0) return (p - v).distance;
    double t = ((p.dx - v.dx) * (w.dx - v.dx) + (p.dy - v.dy) * (w.dy - v.dy)) / l2;
    t = t.clamp(0.0, 1.0);
    return (p - Offset(v.dx + t * (w.dx - v.dx), v.dy + t * (w.dy - v.dy))).distance;
  }
}
