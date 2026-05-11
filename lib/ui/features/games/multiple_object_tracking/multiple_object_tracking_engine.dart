import 'dart:math';
import 'package:flutter/material.dart';

class Ball {
  final int id;
  Offset position;
  Offset velocity;
  final bool isTarget;
  bool isSelected;

  Ball({
    required this.id,
    required this.position,
    required this.velocity,
    required this.isTarget,
    this.isSelected = false,
  });
}

class MultipleObjectTrackingEngine {
  final Random _random = Random();
  final double ballRadius = 20.0;

  List<Ball> generateBalls(Size bounds, int totalCount, int targetCount) {
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
        velocity: _generateRandomVelocity(),
        isTarget: targetIndices.contains(i),
      ));
    }
    return balls;
  }

  Offset _generateRandomVelocity() {
    double speed = 2.0 + _random.nextDouble() * 2.0;
    double angle = _random.nextDouble() * 2 * pi;
    return Offset(cos(angle) * speed, sin(angle) * speed);
  }

  void updatePositions(List<Ball> balls, Size bounds) {
    for (var ball in balls) {
      ball.position += ball.velocity;

      // Bounce off walls
      if (ball.position.dx - ballRadius < 0 || ball.position.dx + ballRadius > bounds.width) {
        ball.velocity = Offset(-ball.velocity.dx, ball.velocity.dy);
        ball.position = Offset(
          ball.position.dx.clamp(ballRadius, bounds.width - ballRadius),
          ball.position.dy,
        );
      }
      if (ball.position.dy - ballRadius < 0 || ball.position.dy + ballRadius > bounds.height) {
        ball.velocity = Offset(ball.velocity.dx, -ball.velocity.dy);
        ball.position = Offset(
          ball.position.dx,
          ball.position.dy.clamp(ballRadius, bounds.height - ballRadius),
        );
      }
      
      // Occasionally change direction slightly to make it more unpredictable
      if (_random.nextDouble() < 0.02) {
        double speed = ball.velocity.distance;
        double currentAngle = atan2(ball.velocity.dy, ball.velocity.dx);
        double newAngle = currentAngle + (_random.nextDouble() - 0.5) * 0.5;
        ball.velocity = Offset(cos(newAngle) * speed, sin(newAngle) * speed);
      }
    }
  }
}
