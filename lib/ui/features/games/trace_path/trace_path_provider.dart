import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'trace_path_engine.dart';
import 'package:flutter/material.dart';

part 'trace_path_provider.g.dart';

class TracePathState {
  final List<Offset> targetPath;
  final List<Offset> userPath;
  final double accuracy;
  final bool isGameOver;
  final bool isLoading;
  final int score;

  TracePathState({
    required this.targetPath,
    this.userPath = const [],
    this.accuracy = 0,
    this.isGameOver = false,
    this.isLoading = true,
    this.score = 0,
  });

  TracePathState copyWith({
    List<Offset>? targetPath,
    List<Offset>? userPath,
    double? accuracy,
    bool? isGameOver,
    bool? isLoading,
    int? score,
  }) {
    return TracePathState(
      targetPath: targetPath ?? this.targetPath,
      userPath: userPath ?? this.userPath,
      accuracy: accuracy ?? this.accuracy,
      isGameOver: isGameOver ?? this.isGameOver,
      isLoading: isLoading ?? this.isLoading,
      score: score ?? this.score,
    );
  }
}

@riverpod
class TracePathNotifier extends _$TracePathNotifier {
  final _engine = TracePathEngine();

  @override
  TracePathState build() {
    return TracePathState(targetPath: []);
  }

  void initGame(Size size) {
    state = TracePathState(
      targetPath: _engine.generatePath(size),
      isLoading: false,
    );
  }

  void onPointerDown(Offset point) {
    if (state.isGameOver) return;
    state = state.copyWith(userPath: [point]);
  }

  void onPointerMove(Offset point) {
    if (state.isGameOver) return;
    state = state.copyWith(userPath: [...state.userPath, point]);
  }

  void onPointerUp() {
    if (state.isGameOver || state.userPath.isEmpty) return;

    final acc = _engine.calculateAccuracy(state.userPath, state.targetPath);

    state = state.copyWith(
      accuracy: acc,
      isGameOver: true,
      score: (acc * 100).toInt(),
    );
  }
}
