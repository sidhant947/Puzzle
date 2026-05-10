import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'orbit_tap_engine.dart';
import 'dart:math';

part 'orbit_tap_provider.g.dart';

class OrbitTapState {
  final double currentAngle;
  final double gateAngle;
  final double gateWidth;
  final int score;
  final int lives;
  final bool isGameOver;
  final bool isLoading;
  final double speed;

  OrbitTapState({
    required this.currentAngle,
    required this.gateAngle,
    required this.gateWidth,
    this.score = 0,
    this.lives = 3,
    this.isGameOver = false,
    this.isLoading = true,
    this.speed = 1.0,
  });

  OrbitTapState copyWith({
    double? currentAngle,
    double? gateAngle,
    double? gateWidth,
    int? score,
    int? lives,
    bool? isGameOver,
    bool? isLoading,
    double? speed,
  }) {
    return OrbitTapState(
      currentAngle: currentAngle ?? this.currentAngle,
      gateAngle: gateAngle ?? this.gateAngle,
      gateWidth: gateWidth ?? this.gateWidth,
      score: score ?? this.score,
      lives: lives ?? this.lives,
      isGameOver: isGameOver ?? this.isGameOver,
      isLoading: isLoading ?? this.isLoading,
      speed: speed ?? this.speed,
    );
  }
}

@riverpod
class OrbitTapNotifier extends _$OrbitTapNotifier {
  final _engine = OrbitTapEngine();

  @override
  OrbitTapState build() {
    return OrbitTapState(
      currentAngle: 0,
      gateAngle: 0,
      gateWidth: 0.3,
    );
  }

  void initGame() {
    state = OrbitTapState(
      currentAngle: 0,
      gateAngle: _engine.generateGateAngle(),
      gateWidth: 0.3,
      isLoading: false,
    );
  }

  void updateAngle(double angle) {
    state = state.copyWith(currentAngle: angle);
  }

  void onTap() {
    if (state.isGameOver) return;

    if (_engine.isTargetInGate(state.currentAngle, state.gateAngle, state.gateWidth)) {
      final newScore = state.score + 1;
      state = state.copyWith(
        score: newScore,
        gateAngle: _engine.generateGateAngle(),
        speed: 1.0 + (newScore * 0.05), // Increase speed as score goes up
        gateWidth: max(0.15, 0.3 - (newScore * 0.005)), // Narrower gate
      );
    } else {
      final newLives = state.lives - 1;
      if (newLives <= 0) {
        state = state.copyWith(lives: 0, isGameOver: true);
      } else {
        state = state.copyWith(lives: newLives);
      }
    }
  }
}
