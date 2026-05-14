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
  final int activeSegmentIndex;
  final List<bool> segmentsVisited;
  final double errors;

  MirrorTracingState({
    required this.targetPath,
    required this.userTrace,
    this.isVictory = false,
    this.isLoading = true,
    this.canvasSize = Size.zero,
    this.activeSegmentIndex = 0,
    required this.segmentsVisited,
    this.errors = 0,
  });

  MirrorTracingState copyWith({
    List<Offset>? targetPath,
    List<Offset>? userTrace,
    bool? isVictory,
    bool? isLoading,
    Size? canvasSize,
    int? activeSegmentIndex,
    List<bool>? segmentsVisited,
    double? errors,
  }) {
    return MirrorTracingState(
      targetPath: targetPath ?? this.targetPath,
      userTrace: userTrace ?? this.userTrace,
      isVictory: isVictory ?? this.isVictory,
      isLoading: isLoading ?? this.isLoading,
      canvasSize: canvasSize ?? this.canvasSize,
      activeSegmentIndex: activeSegmentIndex ?? this.activeSegmentIndex,
      segmentsVisited: segmentsVisited ?? this.segmentsVisited,
      errors: errors ?? this.errors,
    );
  }
}

@riverpod
class MirrorTracingNotifier extends _$MirrorTracingNotifier {
  final _engine = MirrorTracingEngine();
  static const double tolerance = 35.0; // Increased tolerance for better mobile feel

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
      activeSegmentIndex: 0,
      segmentsVisited: List.filled(path.length - 1, false),
      isLoading: false,
    );
  }

  void updateTrace(Offset touchPoint) {
    if (state.isVictory || state.isLoading) return;

    // Standard Mirroring: Flip X, keep Y
    final mirroredX = state.canvasSize.width - touchPoint.dx;
    final mirroredY = touchPoint.dy;
    final mirroredPoint = Offset(mirroredX, mirroredY);

    final newUserTrace = List<Offset>.from(state.userTrace)..add(mirroredPoint);
    
    // Check if on current active segment
    final int activeIdx = state.activeSegmentIndex;
    if (activeIdx < state.targetPath.length - 1) {
      final p1 = state.targetPath[activeIdx];
      final p2 = state.targetPath[activeIdx + 1];
      
      bool onActiveSegment = _engine.isPointOnPath(mirroredPoint, [p1, p2], tolerance);
      
      if (onActiveSegment) {
        // If near the end of the current segment, move to next
        final distToEnd = (mirroredPoint - p2).distance;
        if (distToEnd < tolerance) {
          final newSegments = List<bool>.from(state.segmentsVisited);
          newSegments[activeIdx] = true;
          
          if (activeIdx == state.targetPath.length - 2) {
            // Last segment finished
            state = state.copyWith(
              userTrace: newUserTrace,
              segmentsVisited: newSegments,
              activeSegmentIndex: activeIdx + 1,
              isVictory: true,
            );
            return;
          } else {
            state = state.copyWith(
              userTrace: newUserTrace,
              segmentsVisited: newSegments,
              activeSegmentIndex: activeIdx + 1,
            );
            return;
          }
        }
      }
    }

    state = state.copyWith(
      userTrace: newUserTrace,
    );
  }

  void resetTrace() {
    state = MirrorTracingState(
      targetPath: state.targetPath,
      userTrace: [],
      canvasSize: state.canvasSize,
      activeSegmentIndex: 0,
      segmentsVisited: List.filled(state.targetPath.length - 1, false),
      isLoading: false,
    );
  }
}
