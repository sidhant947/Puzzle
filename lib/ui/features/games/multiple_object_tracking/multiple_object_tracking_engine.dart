import 'dart:math';
import 'package:flutter/material.dart';

class Ball {
  final int id;
  final Offset position;
  final Offset velocity;
  final bool isTarget;
  final bool isSelected;

  Ball({
    required this.id,
    required this.position,
    required this.velocity,
    required this.isTarget,
    this.isSelected = false,
  });

  Ball copyWith({
    Offset? position,
    Offset? velocity,
    bool? isSelected,
  }) {
    return Ball(
      id: id,
      position: position ?? this.position,
      velocity: velocity ?? this.velocity,
      isTarget: isTarget,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}

class MultipleObjectTrackingEngine {
  final Random _random = Random();
  final double ballRadius = 20.0;

  List<Ball> generateBalls(Size bounds, int totalCount, int targetCount, {double speedMultiplier = 1.0}) {
    List<Ball> balls = [];
    Set<int> targetIndices = {};
    while (targetIndices.length < targetCount) {
      targetIndices.add(_random.nextInt(totalCount));
    }

    for (int i = 0; i < totalCount; i++) {
      balls.add(Ball(
        id: i,
        position: Offset(
          _random.nextDouble() * (bounds.width - 2 * ballRadius) + ballRadius,
          _random.nextDouble() * (bounds.height - 2 * ballRadius) + ballRadius,
        ),
        velocity: _generateRandomVelocity(speedMultiplier: speedMultiplier),
        isTarget: targetIndices.contains(i),
      ));
    }
    return balls;
  }

  Offset _generateRandomVelocity({double speedMultiplier = 1.0}) {
    double speed = (2.0 + _random.nextDouble() * 2.0) * speedMultiplier;
    double angle = _random.nextDouble() * 2 * pi;
    return Offset(cos(angle) * speed, sin(angle) * speed);
  }

  List<Ball> updatePositions(List<Ball> balls, Size bounds) {
    return balls.map((ball) {
      Offset newPos = ball.position + ball.velocity;
      Offset newVel = ball.velocity;

      // Bounce off walls
      if (newPos.dx - ballRadius < 0 || newPos.dx + ballRadius > bounds.width) {
        newVel = Offset(-newVel.dx, newVel.dy);
        newPos = Offset(
          newPos.dx.clamp(ballRadius, bounds.width - ballRadius),
          newPos.dy,
        );
      }
      if (newPos.dy - ballRadius < 0 || newPos.dy + ballRadius > bounds.height) {
        newVel = Offset(newVel.dx, -newVel.dy);
        newPos = Offset(
          newPos.dx,
          newPos.dy.clamp(ballRadius, bounds.height - ballRadius),
        );
      }
      
      // Occasionally change direction slightly to make it more unpredictable
      if (_random.nextDouble() < 0.02) {
        double speed = newVel.distance;
        double currentAngle = atan2(newVel.dy, newVel.dx);
        double newAngle = currentAngle + (_random.nextDouble() - 0.5) * 0.5;
        newVel = Offset(cos(newAngle) * speed, sin(newAngle) * speed);
      }

      return ball.copyWith(position: newPos, velocity: newVel);
    }).toList();
  }
}
