import 'dart:math';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../providers/user_providers.dart';
import 'dual_mirror_engine.dart';

part 'dual_mirror_provider.g.dart';

class DualMirrorState {
  final DualMirrorLevel? currentLevel;
  final Point<int> pos1;
  final Point<int> pos2;
  final bool isGameOver;
  final bool isLoading;

  DualMirrorState({
    this.currentLevel,
    this.pos1 = const Point(0, 0),
    this.pos2 = const Point(0, 0),
    this.isGameOver = false,
    this.isLoading = true,
  });

  DualMirrorState copyWith({
    DualMirrorLevel? currentLevel,
    Point<int>? pos1,
    Point<int>? pos2,
    bool? isGameOver,
    bool? isLoading,
  }) {
    return DualMirrorState(
      currentLevel: currentLevel ?? this.currentLevel,
      pos1: pos1 ?? this.pos1,
      pos2: pos2 ?? this.pos2,
      isGameOver: isGameOver ?? this.isGameOver,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class DualMirrorNotifier extends _$DualMirrorNotifier {
  final _engine = DualMirrorEngine();

  @override
  DualMirrorState build() {
    return DualMirrorState();
  }

  void initGame() {
    final level = _engine.generateLevel();
    state = DualMirrorState(
      currentLevel: level,
      pos1: level.start1,
      pos2: level.start2,
      isLoading: false,
    );
  }

  void move(String direction) {
    if (state.currentLevel == null || state.isGameOver) return;

    final npos1 = _engine.move(state.pos1, direction, state.currentLevel!.maze1, false);
    final npos2 = _engine.move(state.pos2, direction, state.currentLevel!.maze2, true);

    state = state.copyWith(pos1: npos1, pos2: npos2);

    if (npos1 == state.currentLevel!.target1 && npos2 == state.currentLevel!.target2) {
      state = state.copyWith(isGameOver: true);
      ref.read(gameStreakNotifierProvider.notifier).completeGame('dual_mirror', xpAmount: 30);
    }
  }

  void reset() {
    initGame();
  }
}
