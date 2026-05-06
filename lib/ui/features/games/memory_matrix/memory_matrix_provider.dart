import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../providers/user_providers.dart';
import 'memory_matrix_engine.dart';

part 'memory_matrix_provider.g.dart';

enum MemoryMatrixStatus { memorizing, playing, success, failure, completed }

class MemoryMatrixState {
  final int currentLevel;
  final Set<int> targetPattern;
  final Set<int> selectedPattern;
  final MemoryMatrixStatus status;
  final int boardSize;
  final bool isWon;

  MemoryMatrixState({
    this.currentLevel = 1,
    this.targetPattern = const {},
    this.selectedPattern = const {},
    this.status = MemoryMatrixStatus.memorizing,
    this.boardSize = 3,
    this.isWon = false,
  });

  MemoryMatrixState copyWith({
    int? currentLevel,
    Set<int>? targetPattern,
    Set<int>? selectedPattern,
    MemoryMatrixStatus? status,
    int? boardSize,
    bool? isWon,
  }) {
    return MemoryMatrixState(
      currentLevel: currentLevel ?? this.currentLevel,
      targetPattern: targetPattern ?? this.targetPattern,
      selectedPattern: selectedPattern ?? this.selectedPattern,
      status: status ?? this.status,
      boardSize: boardSize ?? this.boardSize,
      isWon: isWon ?? this.isWon,
    );
  }
}

@riverpod
class MemoryMatrixNotifier extends _$MemoryMatrixNotifier {
  final _engine = MemoryMatrixEngine();
  Timer? _timer;

  @override
  MemoryMatrixState build() {
    // Start first level automatically
    Future.microtask(() => startLevel(1));
    return MemoryMatrixState();
  }

  void startLevel(int level) {
    _timer?.cancel();
    final config = _engine.getLevel(level);
    final pattern = _engine.generatePattern(config.size, config.tileCount);

    state = state.copyWith(
      currentLevel: level,
      targetPattern: pattern,
      selectedPattern: {},
      status: MemoryMatrixStatus.memorizing,
      boardSize: config.size,
    );

    _timer = Timer(config.showDuration, () {
      state = state.copyWith(status: MemoryMatrixStatus.playing);
    });
  }

  void selectTile(int index) {
    if (state.status != MemoryMatrixStatus.playing) return;
    if (state.selectedPattern.contains(index)) return;

    if (!state.targetPattern.contains(index)) {
      // Wrong tile - failure
      state = state.copyWith(status: MemoryMatrixStatus.failure);
      return;
    }

    final newSelected = {...state.selectedPattern, index};
    state = state.copyWith(selectedPattern: newSelected);

    if (newSelected.length == state.targetPattern.length) {
      // Level success
      state = state.copyWith(status: MemoryMatrixStatus.success);
      
      if (state.currentLevel >= 5) {
        // Daily goal reached
        completeGame();
      } else {
        Future.delayed(const Duration(milliseconds: 1000), () {
          startLevel(state.currentLevel + 1);
        });
      }
    }
  }

  void completeGame() {
    state = state.copyWith(status: MemoryMatrixStatus.completed, isWon: true);
    ref.read(gameStreakNotifierProvider.notifier).completeGame('memory_matrix', xpAmount: 25);
  }

  void reset() {
    _timer?.cancel();
    startLevel(1);
  }
}
