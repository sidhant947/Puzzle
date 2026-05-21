import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../providers/user_providers.dart';
import 'factor_finder_engine.dart';

part 'factor_finder_provider.g.dart';

class FactorFinderState {
  final FactorFinderLevel? currentLevel;
  final int score;
  final int timeLeft;
  final Set<int> selectedIndices;
  final bool isGameOver;
  final bool isLoading;
  final int? wrongTapIndex; // Triggers a brief shaking/red animation for this index

  FactorFinderState({
    this.currentLevel,
    this.score = 0,
    this.timeLeft = 40,
    this.selectedIndices = const {},
    this.isGameOver = false,
    this.isLoading = true,
    this.wrongTapIndex,
  });

  FactorFinderState copyWith({
    FactorFinderLevel? currentLevel,
    int? score,
    int? timeLeft,
    Set<int>? selectedIndices,
    bool? isGameOver,
    bool? isLoading,
    int? wrongTapIndex,
  }) {
    return FactorFinderState(
      currentLevel: currentLevel ?? this.currentLevel,
      score: score ?? this.score,
      timeLeft: timeLeft ?? this.timeLeft,
      selectedIndices: selectedIndices ?? this.selectedIndices,
      isGameOver: isGameOver ?? this.isGameOver,
      isLoading: isLoading ?? this.isLoading,
      wrongTapIndex: wrongTapIndex,
    );
  }
}

@riverpod
class FactorFinderNotifier extends _$FactorFinderNotifier {
  final _engine = FactorFinderEngine();
  Timer? _timer;

  @override
  FactorFinderState build() {
    ref.onDispose(() {
      _timer?.cancel();
    });
    return FactorFinderState();
  }

  void initGame() {
    _timer?.cancel();
    final firstLevel = _engine.generateLevel(0);
    state = FactorFinderState(
      currentLevel: firstLevel,
      score: 0,
      timeLeft: 40,
      selectedIndices: {},
      isGameOver: false,
      isLoading: false,
      wrongTapIndex: null,
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
        ref.read(gameStreakNotifierProvider.notifier).completeGame('factor_finder', xpAmount: 25);
      }
    });
  }

  void tapNumber(int index) {
    if (state.isGameOver || state.isLoading || state.currentLevel == null) return;
    
    final level = state.currentLevel!;
    
    // If already tapped, ignore
    if (state.selectedIndices.contains(index)) return;

    final isCorrect = level.factorIndices.contains(index);

    if (isCorrect) {
      final newSelected = Set<int>.from(state.selectedIndices)..add(index);
      
      // Check if all factors are found
      final allFound = newSelected.containsAll(level.factorIndices);
      
      if (allFound) {
        // Clear level!
        final nextScore = state.score + 1;
        final nextLevel = _engine.generateLevel(nextScore);
        
        // Add 4 seconds bonus time (max 45s)
        final nextTime = (state.timeLeft + 4).clamp(0, 45);

        state = state.copyWith(
          score: nextScore,
          currentLevel: nextLevel,
          selectedIndices: {},
          timeLeft: nextTime,
          wrongTapIndex: null,
        );
      } else {
        state = state.copyWith(
          selectedIndices: newSelected,
          wrongTapIndex: null,
        );
      }
    } else {
      // Wrong tap! Deduct 3 seconds
      final penaltyTime = (state.timeLeft - 3).clamp(0, 45);
      
      state = state.copyWith(
        timeLeft: penaltyTime,
        wrongTapIndex: index,
      );

      if (penaltyTime == 0) {
        _timer?.cancel();
        state = state.copyWith(
          isGameOver: true,
        );
        ref.read(gameStreakNotifierProvider.notifier).completeGame('factor_finder', xpAmount: 25);
      } else {
        // Clear wrong indicator after 300ms
        Future.delayed(const Duration(milliseconds: 300), () {
          if (state.wrongTapIndex == index) {
            state = state.copyWith(wrongTapIndex: null);
          }
        });
      }
    }
  }

  void reset() {
    initGame();
  }
}
