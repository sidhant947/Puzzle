import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'mirror_tracing_engine.dart';

part 'mirror_tracing_provider.g.dart';

class MirrorTracingState {
  final List<Offset> targetPath;
  final List<Offset> userTrace;
  final bool isVictory;
  final bool isLoading;
  final Size canvasSize;
  final List<bool> segmentsVisited;
  final double errors;

  MirrorTracingState({
    required this.targetPath,
    required this.userTrace,
    this.isVictory = false,
    this.isLoading = true,
    this.canvasSize = Size.zero,
    required this.segmentsVisited,
    this.errors = 0,
  });

  MirrorTracingState copyWith({
    List<Offset>? targetPath,
    List<Offset>? userTrace,
    bool? isVictory,
    bool? isLoading,
    Size? canvasSize,
    List<bool>? segmentsVisited,
    double? errors,
  }) {
    return MirrorTracingState(
      targetPath: targetPath ?? this.targetPath,
      userTrace: userTrace ?? this.userTrace,
      isVictory: isVictory ?? this.isVictory,
      isLoading: isLoading ?? this.isLoading,
      canvasSize: canvasSize ?? this.canvasSize,
      segmentsVisited: segmentsVisited ?? this.segmentsVisited,
      errors: errors ?? this.errors,
    );
  }
}

@riverpod
class MirrorTracingNotifier extends _$MirrorTracingNotifier {
  final _engine = MirrorTracingEngine();
  static const double tolerance = 20.0;

  @override
  MirrorTracingState build() {
    return MirrorTracingState(
      targetPath: [],
      userTrace: [],
      segmentsVisited: [],
    );
  }

  void initGame(Size size) {
    final path = _engine.generateStarPath(size);
    state = MirrorTracingState(
      targetPath: path,
      userTrace: [],
      canvasSize: size,
      segmentsVisited: List.filled(path.length - 1, false),
      isLoading: false,
    );
  }

  void updateTrace(Offset touchPoint) {
    if (state.isVictory || state.isLoading) return;

    // Mirror the touch point
    // Mirroring both X and Y:
    final mirroredX = state.canvasSize.width - touchPoint.dx;
    final mirroredY = state.canvasSize.height - touchPoint.dy;
    final mirroredPoint = Offset(mirroredX, mirroredY);

    final newUserTrace = List<Offset>.from(state.userTrace)..add(mirroredPoint);
    
    // Check if on path
    bool onPath = _engine.isPointOnPath(mirroredPoint, state.targetPath, tolerance);
    double newErrors = state.errors + (onPath ? 0 : 1);

    // Update segments visited
    final newSegmentsVisited = List<bool>.from(state.segmentsVisited);
    for (int i = 0; i < state.targetPath.length - 1; i++) {
      if (_engine.isPointOnPath(mirroredPoint, [state.targetPath[i], state.targetPath[i+1]], tolerance)) {
        newSegmentsVisited[i] = true;
      }
    }

    state = state.copyWith(
      userTrace: newUserTrace,
      segmentsVisited: newSegmentsVisited,
      errors: newErrors,
    );

    _checkVictory();
  }

  void _checkVictory() {
    if (state.segmentsVisited.every((v) => v)) {
      state = state.copyWith(isVictory: true);
    }
  }

  void resetTrace() {
    state = state.copyWith(
      userTrace: [],
      segmentsVisited: List.filled(state.targetPath.length - 1, false),
      errors: 0,
      isVictory: false,
    );
  }
}
