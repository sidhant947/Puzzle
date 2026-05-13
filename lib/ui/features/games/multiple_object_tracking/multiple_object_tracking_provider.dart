import 'dart:async';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'multiple_object_tracking_engine.dart';
import '../../../../providers/user_providers.dart';

part 'multiple_object_tracking_provider.g.dart';

enum MOTPhase { initial, highlight, moving, selection, result }

class MOTState {
  final List<Ball> balls;
  final MOTPhase phase;
  final bool isLoading;
  final Size? bounds;

  MOTState({
    required this.balls,
    this.phase = MOTPhase.initial,
    this.isLoading = true,
    this.bounds,
  });

  MOTState copyWith({
    List<Ball>? balls,
    MOTPhase? phase,
    bool? isLoading,
    Size? bounds,
  }) {
    return MOTState(
      balls: balls ?? this.balls,
      phase: phase ?? this.phase,
      isLoading: isLoading ?? this.isLoading,
      bounds: bounds ?? this.bounds,
    );
  }
}

@riverpod
class MOTNotifier extends _$MOTNotifier {
  final _engine = MultipleObjectTrackingEngine();
  Timer? _gameTimer;

  @override
  MOTState build() {
    ref.onDispose(() => _gameTimer?.cancel());
    return MOTState(balls: []);
  }

  void initGame(Size bounds) {
    _startRound(bounds);
  }

  void resetGame() {
    if (state.bounds != null) {
      _startRound(state.bounds!);
    }
  }

  void nextRound() {
    if (state.bounds != null) {
      _startRound(state.bounds!);
    }
  }

  void _startRound(Size bounds) {
    _gameTimer?.cancel();
    
    // Fixed difficulty for "one time game" or simple loop
    const totalBalls = 8;
    const targetCount = 3;
    const speedMultiplier = 1.0;

    final balls = _engine.generateBalls(bounds, totalBalls, targetCount, speedMultiplier: speedMultiplier);
    
    state = MOTState(
      balls: balls,
      phase: MOTPhase.highlight,
      isLoading: false,
      bounds: bounds,
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
          final updatedBalls = _engine.updatePositions(state.balls, state.bounds!);
          state = state.copyWith(balls: updatedBalls);
        }
      }
    });
  }

  void toggleBallSelection(int id) {
    if (state.phase != MOTPhase.selection) return;

    final updatedBalls = state.balls.map((ball) {
      if (ball.id == id) {
        return ball.copyWith(isSelected: !ball.isSelected);
      }
      return ball;
    }).toList();

    state = state.copyWith(balls: updatedBalls);

    // Check if enough balls are selected
    final targetCount = state.balls.where((b) => b.isTarget).length;
    final selectedCount = updatedBalls.where((b) => b.isSelected).length;
    if (selectedCount == targetCount) {
      _checkResult();
    }
  }

  void _checkResult() {
    final targetCount = state.balls.where((b) => b.isTarget).length;
    final correctCount = state.balls.where((b) => b.isSelected && b.isTarget).length;
    final isVictory = correctCount == targetCount;
    
    if (isVictory) {
      ref.read(gameStreakNotifierProvider.notifier).completeGame('multiple_object_tracking', xpAmount: 10);
    }

    state = state.copyWith(
      phase: MOTPhase.result,
    );
  }
}
