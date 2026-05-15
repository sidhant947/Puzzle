import 'dart:math';
import 'package:flutter/material.dart';

class MirrorShape {
  final List<Offset> points;
  MirrorShape({required this.points});
}

class MirrorImageLevel {
  final MirrorShape question;
  final List<MirrorShape> options;
  final int correctIndex;

  MirrorImageLevel({
    required this.question,
    required this.options,
    required this.correctIndex,
  });
}

class MirrorImageEngine {
  final Random _random = Random();

  MirrorImageLevel generateLevel() {
    final question = _generateRandomShape();
    final isVerticalMirror = _random.nextBool();
    
    final correct = _mirrorShape(question, isVerticalMirror);
    
    List<MirrorShape> options = [correct];
    
    // Generate 3 wrong options
    for (int i = 0; i < 3; i++) {
      if (_random.nextBool()) {
        options.add(_rotateShape(question, (i + 1) * pi / 2));
      } else {
        options.add(_distortShape(correct));
      }
    }

    options.shuffle();
    final correctIndex = options.indexOf(correct);

    return MirrorImageLevel(
      question: question,
      options: options,
      correctIndex: correctIndex,
    );
  }

  MirrorShape _generateRandomShape() {
    List<Offset> points = [];
    int numPoints = 5 + _random.nextInt(4);
    for (int i = 0; i < numPoints; i++) {
      points.add(Offset(_random.nextDouble(), _random.nextDouble()));
    }
    return MirrorShape(points: points);
  }

  MirrorShape _mirrorShape(MirrorShape shape, bool vertical) {
    return MirrorShape(
      points: shape.points.map((p) => Offset(vertical ? 1.0 - p.dx : p.dx, vertical ? p.dy : 1.0 - p.dy)).toList(),
    );
  }

  MirrorShape _rotateShape(MirrorShape shape, double angle) {
    return MirrorShape(
      points: shape.points.map((p) {
        double x = p.dx - 0.5;
        double y = p.dy - 0.5;
        double nx = x * cos(angle) - y * sin(angle);
        double ny = x * sin(angle) + y * cos(angle);
        return Offset(nx + 0.5, ny + 0.5);
      }).toList(),
    );
  }

  MirrorShape _distortShape(MirrorShape shape) {
    return MirrorShape(
      points: shape.points.map((p) => Offset(
        (p.dx + (_random.nextDouble() - 0.5) * 0.2).clamp(0.0, 1.0),
        (p.dy + (_random.nextDouble() - 0.5) * 0.2).clamp(0.0, 1.0),
      )).toList(),
    );
  }
}
