import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'path_recall_engine.dart';

part 'path_recall_provider.g.dart';

enum PathRecallPhase { playback, input, result }

class PathRecallState {
  final int gridSize;
  final List<int> targetPath;
  final List<int> userPath;
  final int currentPlaybackIndex;
  final PathRecallPhase phase;
  final int level;
  final bool isGameOver;
  final bool isLoading;

  PathRecallState({
    required this.gridSize,
    this.targetPath = const [],
    this.userPath = const [],
    this.currentPlaybackIndex = -1,
    this.phase = PathRecallPhase.playback,
    this.level = 1,
    this.isGameOver = false,
    this.isLoading = true,
  });

  PathRecallState copyWith({
    int? gridSize,
    List<int>? targetPath,
    List<int>? userPath,
    int? currentPlaybackIndex,
    PathRecallPhase? phase,
    int? level,
    bool? isGameOver,
    bool? isLoading,
  }) {
    return PathRecallState(
      gridSize: gridSize ?? this.gridSize,
      targetPath: targetPath ?? this.targetPath,
      userPath: userPath ?? this.userPath,
      currentPlaybackIndex: currentPlaybackIndex ?? this.currentPlaybackIndex,
      phase: phase ?? this.phase,
      level: level ?? this.level,
      isGameOver: isGameOver ?? this.isGameOver,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class PathRecallNotifier extends _$PathRecallNotifier {
  final _engine = PathRecallEngine();
  Timer? _playbackTimer;
  static const int _targetLength = 10;
  static const int _gridSize = 5;

  @override
  PathRecallState build() {
    return PathRecallState(gridSize: _gridSize);
  }

  void initGame() {
    _startRound();
  }

  void _startRound() {
    _playbackTimer?.cancel();
    final path = _engine.generatePath(_targetLength, _gridSize);

    state = PathRecallState(
      gridSize: _gridSize,
      targetPath: path,
      level: 1, // Static level 1
      isLoading: false,
      phase: PathRecallPhase.playback,
      currentPlaybackIndex: 0,
    );

    _startPlayback();
  }

  void _startPlayback() {
    _playbackTimer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      if (state.currentPlaybackIndex < state.targetPath.length - 1) {
        state = state.copyWith(currentPlaybackIndex: state.currentPlaybackIndex + 1);
      } else {
        timer.cancel();
        state = state.copyWith(phase: PathRecallPhase.input, currentPlaybackIndex: -1);
      }
    });
  }

  void onCellTap(int index) {
    if (state.phase != PathRecallPhase.input || state.isGameOver) return;

    final nextExpected = state.targetPath[state.userPath.length];
    
    if (index == nextExpected) {
      final newUserPath = [...state.userPath, index];
      if (newUserPath.length == state.targetPath.length) {
        // Round Complete -> Win
        state = state.copyWith(userPath: newUserPath, isGameOver: true, phase: PathRecallPhase.result);
      } else {
        state = state.copyWith(userPath: newUserPath);
      }
    } else {
      // Game Over -> Loss
      state = state.copyWith(isGameOver: true, phase: PathRecallPhase.result);
    }
  }
}
