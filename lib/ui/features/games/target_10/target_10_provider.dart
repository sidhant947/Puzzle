import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../providers/user_providers.dart';
import 'target_10_engine.dart';

part 'target_10_provider.g.dart';

class Target10State {
  final List<int> grid; // 25 elements
  final Set<int> selectedIndices;
  final int score;
  final int timeLeft;
  final bool isGameOver;
  final bool isLoading;

  Target10State({
    this.grid = const [],
    this.selectedIndices = const {},
    this.score = 0,
    this.timeLeft = 45,
    this.isGameOver = false,
    this.isLoading = true,
  });

  Target10State copyWith({
    List<int>? grid,
    Set<int>? selectedIndices,
    int? score,
    int? timeLeft,
    bool? isGameOver,
    bool? isLoading,
  }) {
    return Target10State(
      grid: grid ?? this.grid,
      selectedIndices: selectedIndices ?? this.selectedIndices,
      score: score ?? this.score,
      timeLeft: timeLeft ?? this.timeLeft,
      isGameOver: isGameOver ?? this.isGameOver,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class Target10Notifier extends _$Target10Notifier {
  final _engine = Target10Engine();
  Timer? _timer;

  @override
  Target10State build() {
    ref.onDispose(() {
      _timer?.cancel();
    });
    return Target10State();
  }

  void initGame() {
    _timer?.cancel();
    final initialGrid = _engine.generateInitialGrid();
    state = Target10State(
      grid: initialGrid,
      selectedIndices: {},
      score: 0,
      timeLeft: 45,
      isGameOver: false,
      isLoading: false,
    );
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.timeLeft > 1) {
        state = state.copyWith(timeLeft: state.timeLeft - 1);
      } else {
        timer.cancel();
        state = state.copyWith(
          timeLeft: 0,
          isGameOver: true,
        );
        ref.read(gameStreakNotifierProvider.notifier).completeGame('target_10', xpAmount: 25);
      }
    });
  }

  void tapTile(int index) {
    if (state.isGameOver || state.isLoading || state.grid.isEmpty) return;

    final newSelected = Set<int>.from(state.selectedIndices);
    
    if (newSelected.contains(index)) {
      newSelected.remove(index);
      state = state.copyWith(selectedIndices: newSelected);
      return;
    }

    newSelected.add(index);
    
    // Calculate sum of selected numbers
    int currentSum = 0;
    for (int idx in newSelected) {
      currentSum += state.grid[idx];
    }

    if (currentSum < 10) {
      state = state.copyWith(selectedIndices: newSelected);
    } else if (currentSum == 10) {
      // Correct Match!
      final newGrid = List<int>.from(state.grid);
      
      // Replace matching indices with new random digits
      for (int idx in newSelected) {
        newGrid[idx] = _engine.getRandomDigit();
      }

      final scoreGain = newSelected.length; // more tiles = more score
      final nextTime = (state.timeLeft + 2).clamp(0, 45); // +2s bonus

      state = state.copyWith(
        grid: newGrid,
        selectedIndices: {},
        score: state.score + scoreGain,
        timeLeft: nextTime,
      );
    } else {
      // Sum > 10: Overflow!
      // Deduct 2 seconds
      final nextTime = (state.timeLeft - 2).clamp(0, 45);
      
      state = state.copyWith(
        selectedIndices: {},
        timeLeft: nextTime,
      );

      if (nextTime == 0) {
        _timer?.cancel();
        state = state.copyWith(isGameOver: true);
        ref.read(gameStreakNotifierProvider.notifier).completeGame('target_10', xpAmount: 25);
      }
    }
  }

  void reset() {
    initGame();
  }
}
