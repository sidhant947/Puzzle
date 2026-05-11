import 'dart:async';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'multiple_object_tracking_engine.dart';

part 'multiple_object_tracking_provider.g.dart';

enum MOTPhase { initial, highlight, moving, selection, result }

class MOTState {
  final List<Ball> balls;
  final MOTPhase phase;
  final int score;
  final bool isLoading;
  final Size? bounds;

  MOTState({
    required this.balls,
    this.phase = MOTPhase.initial,
    this.score = 0,
    this.isLoading = true,
    this.bounds,
  });

  MOTState copyWith({
    List<Ball>? balls,
    MOTPhase? phase,
    int? score,
    bool? isLoading,
    Size? bounds,
  }) {
    return MOTState(
      balls: balls ?? this.balls,
      phase: phase ?? this.phase,
      score: score ?? this.score,
      isLoading: isLoading ?? this.isLoading,
      bounds: bounds ?? this.bounds,
    );
  }
}

@riverpod
class MOTNotifier extends _$MOTNotifier {
  final _engine = MultipleObjectTrackingEngine();
  Timer? _gameTimer;
  static const int totalBalls = 8;
  static const int targetCount = 3;

  @override
  MOTState build() {
    return MOTState(balls: []);
  }

  void initGame(Size bounds) {
    _gameTimer?.cancel();
    final balls = _engine.generateBalls(bounds, totalBalls, targetCount);
    state = MOTState(
      balls: balls,
      phase: MOTPhase.highlight,
      isLoading: false,
      bounds: bounds,
      score: state.score,
    );

    // Highlight for 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      if (state.phase == MOTPhase.highlight) {
        state = state.copyWith(phase: MOTPhase.moving);
        _startMoving();
      }
    });
  }

  void _startMoving() {
    const fps = 60;
    const duration = Duration(seconds: 6);
    final startTime = DateTime.now();

    _gameTimer = Timer.periodic(const Duration(milliseconds: 1000 ~/ fps), (timer) {
      if (DateTime.now().difference(startTime) > duration) {
        timer.cancel();
        state = state.copyWith(phase: MOTPhase.selection);
      } else {
        if (state.bounds != null) {
          _engine.updatePositions(state.balls, state.bounds!);
          state = state.copyWith(balls: List.from(state.balls));
        }
      }
    });
  }

  void toggleBallSelection(int id) {
    if (state.phase != MOTPhase.selection) return;

    final updatedBalls = state.balls.map((ball) {
      if (ball.id == id) {
        ball.isSelected = !ball.isSelected;
      }
      return ball;
    }).toList();

    state = state.copyWith(balls: updatedBalls);

    // Check if enough balls are selected
    final selectedCount = updatedBalls.where((b) => b.isSelected).length;
    if (selectedCount == targetCount) {
      _checkResult();
    }
  }

  void _checkResult() {
    final correctCount = state.balls.where((b) => b.isSelected && b.isTarget).length;
    final isVictory = correctCount == targetCount;
    
    state = state.copyWith(
      phase: MOTPhase.result,
      score: isVictory ? state.score + 1 : state.score,
    );
  }
}
