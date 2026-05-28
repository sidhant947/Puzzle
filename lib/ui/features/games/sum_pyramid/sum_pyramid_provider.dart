import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../providers/user_providers.dart';
import 'sum_pyramid_engine.dart';

part 'sum_pyramid_provider.g.dart';

class SumPyramidState {
  final SumPyramidLevel? currentLevel;
  final int score;
  final int timeLeft;
  final int? selectedBlockIndex;
  final List<String> userValues; // Length 10
  final Set<int> wrongBlocks;    // Indices of incorrectly filled blocks
  final bool isGameOver;
  final bool isLoading;

  SumPyramidState({
    this.currentLevel,
    this.score = 0,
    this.timeLeft = 60,
    this.selectedBlockIndex,
    this.userValues = const [],
    this.wrongBlocks = const {},
    this.isGameOver = false,
    this.isLoading = true,
  });

  SumPyramidState copyWith({
    SumPyramidLevel? currentLevel,
    int? score,
    int? timeLeft,
    int? selectedBlockIndex,
    List<String>? userValues,
    Set<int>? wrongBlocks,
    bool? isGameOver,
    bool? isLoading,
  }) {
    return SumPyramidState(
      currentLevel: currentLevel ?? this.currentLevel,
      score: score ?? this.score,
      timeLeft: timeLeft ?? this.timeLeft,
      selectedBlockIndex: selectedBlockIndex ?? this.selectedBlockIndex,
      userValues: userValues ?? this.userValues,
      wrongBlocks: wrongBlocks ?? this.wrongBlocks,
      isGameOver: isGameOver ?? this.isGameOver,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class SumPyramidNotifier extends _$SumPyramidNotifier {
  final _engine = SumPyramidEngine();
  Timer? _timer;

  @override
  SumPyramidState build() {
    ref.onDispose(() {
      _timer?.cancel();
    });
    return SumPyramidState();
  }

  void initGame() {
    _timer?.cancel();
    final firstLevel = _engine.generateLevel(0);
    state = SumPyramidState(
      currentLevel: firstLevel,
      score: 0,
      timeLeft: 60,
      selectedBlockIndex: _firstHiddenIndex(firstLevel),
      userValues: List<String>.from(firstLevel.initialValues),
      wrongBlocks: {},
      isGameOver: false,
      isLoading: false,
    );
    _startTimer();
  }

  int? _firstHiddenIndex(SumPyramidLevel level) {
    for (int i = 0; i < 10; i++) {
      if (level.isHidden[i]) return i;
    }
    return null;
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
        ref.read(gameStreakNotifierProvider.notifier).completeGame('sum_pyramid', xpAmount: 25);
      }
    });
  }

  void selectBlock(int index) {
    if (state.isGameOver || state.isLoading || state.currentLevel == null) return;
    if (!state.currentLevel!.isHidden[index]) return;

    state = state.copyWith(
      selectedBlockIndex: index,
    );
  }

  void enterDigit(String digit) {
    if (state.selectedBlockIndex == null || state.isGameOver) return;
    
    final idx = state.selectedBlockIndex!;
    final currentVal = state.userValues[idx];
    
    // Prevent extremely large numbers
    if (currentVal.length >= 4) return;

    final newValues = List<String>.from(state.userValues);
    newValues[idx] = currentVal + digit;

    // Clear wrong indicator for this block once user starts typing
    final newWrong = Set<int>.from(state.wrongBlocks)..remove(idx);

    state = state.copyWith(
      userValues: newValues,
      wrongBlocks: newWrong,
    );
  }

  void deleteDigit() {
    if (state.selectedBlockIndex == null || state.isGameOver) return;

    final idx = state.selectedBlockIndex!;
    final currentVal = state.userValues[idx];
    if (currentVal.isEmpty) return;

    final newValues = List<String>.from(state.userValues);
    newValues[idx] = currentVal.substring(0, currentVal.length - 1);

    final newWrong = Set<int>.from(state.wrongBlocks)..remove(idx);

    state = state.copyWith(
      userValues: newValues,
      wrongBlocks: newWrong,
    );
  }

  void clearBlock() {
    if (state.selectedBlockIndex == null || state.isGameOver) return;

    final idx = state.selectedBlockIndex!;
    final newValues = List<String>.from(state.userValues);
    newValues[idx] = '';

    final newWrong = Set<int>.from(state.wrongBlocks)..remove(idx);

    state = state.copyWith(
      userValues: newValues,
      wrongBlocks: newWrong,
    );
  }

  bool submitAnswers() {
    if (state.isGameOver || state.isLoading || state.currentLevel == null) return false;

    final level = state.currentLevel!;
    final Set<int> wrongIndices = {};
    bool allFilled = true;

    for (int i = 0; i < 10; i++) {
      if (level.isHidden[i]) {
        final valStr = state.userValues[i];
        if (valStr.isEmpty) {
          allFilled = false;
          wrongIndices.add(i);
        } else {
          final userNum = int.tryParse(valStr);
          if (userNum != level.correctValues[i]) {
            wrongIndices.add(i);
          }
        }
      }
    }

    if (!allFilled) {
      // Not fully filled yet, just highlight missing/wrong
      state = state.copyWith(wrongBlocks: wrongIndices);
      return false;
    }

    if (wrongIndices.isEmpty) {
      // Success! Level cleared.
      final newScore = state.score + 1;
      final nextLevel = _engine.generateLevel(newScore);
      final nextTime = state.timeLeft;

      state = state.copyWith(
        score: newScore,
        currentLevel: nextLevel,
        selectedBlockIndex: _firstHiddenIndex(nextLevel),
        userValues: List<String>.from(nextLevel.initialValues),
        wrongBlocks: {},
        timeLeft: nextTime,
      );
      return true;
    } else {
      // Wrong answers present
      // Apply 5-second penalty
      final nextTime = (state.timeLeft - 5).clamp(0, 99);
      state = state.copyWith(
        wrongBlocks: wrongIndices,
        timeLeft: nextTime,
      );
      
      if (nextTime == 0) {
        _timer?.cancel();
        state = state.copyWith(isGameOver: true);
        ref.read(gameStreakNotifierProvider.notifier).completeGame('sum_pyramid', xpAmount: 25);
      }
      return false;
    }
  }

  void reset() {
    initGame();
  }
}
