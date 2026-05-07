import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'color_match_engine.dart';

part 'color_match_provider.g.dart';

class ColorMatchState {
  final Color targetColor;
  final Color currentColor;
  final bool isGameOver;
  final double score;

  ColorMatchState({
    required this.targetColor,
    required this.currentColor,
    this.isGameOver = false,
    this.score = 0,
  });

  ColorMatchState copyWith({
    Color? targetColor,
    Color? currentColor,
    bool? isGameOver,
    double? score,
  }) {
    return ColorMatchState(
      targetColor: targetColor ?? this.targetColor,
      currentColor: currentColor ?? this.currentColor,
      isGameOver: isGameOver ?? this.isGameOver,
      score: score ?? this.score,
    );
  }
}

@riverpod
class ColorMatchNotifier extends _$ColorMatchNotifier {
  final _engine = ColorMatchEngine();

  @override
  ColorMatchState build() {
    final target = _engine.generateTargetColor();
    return ColorMatchState(
      targetColor: target,
      currentColor: const Color(0xFF808080),
    );
  }

  void updateColor(double r, double g, double b) {
    if (state.isGameOver) return;
    final newColor = Color.fromARGB(255, r.toInt(), g.toInt(), b.toInt());
    state = state.copyWith(currentColor: newColor);
  }

  void submit() {
    final score = _engine.calculateSimilarity(state.targetColor, state.currentColor);
    state = state.copyWith(isGameOver: true, score: score);
  }

  void reset() {
    final target = _engine.generateTargetColor();
    state = ColorMatchState(
      targetColor: target,
      currentColor: const Color(0xFF808080),
    );
  }
}
