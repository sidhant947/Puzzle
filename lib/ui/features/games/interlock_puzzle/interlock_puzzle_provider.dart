import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'interlock_puzzle_engine.dart';
import '../../../../providers/user_providers.dart';

part 'interlock_puzzle_provider.g.dart';

class InterlockPuzzleState {
  final IList<int> shapeA;
  final IList<int> shapeB;
  final bool shouldFit;
  final bool? userChoice;
  final bool isSolved;
  final bool isCorrect;
  final bool isLoading;

  InterlockPuzzleState({
    this.shapeA = const IListConst([]),
    this.shapeB = const IListConst([]),
    this.shouldFit = false,
    this.userChoice,
    this.isSolved = false,
    this.isCorrect = false,
    this.isLoading = true,
  });

  InterlockPuzzleState copyWith({
    IList<int>? shapeA,
    IList<int>? shapeB,
    bool? shouldFit,
    bool? userChoice,
    bool? isSolved,
    bool? isCorrect,
    bool? isLoading,
  }) {
    return InterlockPuzzleState(
      shapeA: shapeA ?? this.shapeA,
      shapeB: shapeB ?? this.shapeB,
      shouldFit: shouldFit ?? this.shouldFit,
      userChoice: userChoice ?? this.userChoice,
      isSolved: isSolved ?? this.isSolved,
      isCorrect: isCorrect ?? this.isCorrect,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class InterlockPuzzleNotifier extends _$InterlockPuzzleNotifier {
  @override
  InterlockPuzzleState build() {
    return InterlockPuzzleState(isLoading: true);
  }

  Future<void> initGame() async {
    state = state.copyWith(isLoading: true, isSolved: false, isCorrect: false, userChoice: null);
    
    final level = await compute(InterlockPuzzleEngine.generateLevelWrapper, null);
    
    state = InterlockPuzzleState(
      shapeA: (level['shapeA'] as List<int>).lock,
      shapeB: (level['shapeB'] as List<int>).lock,
      shouldFit: level['shouldFit'],
      isLoading: false,
    );
  }

  void submitAnswer(bool choice) {
    if (state.isLoading || state.isSolved) return;
    
    final bool correct = choice == state.shouldFit;
    
    state = state.copyWith(
      userChoice: choice,
      isSolved: true,
      isCorrect: correct,
    );

    if (correct) {
      ref.read(gameStreakNotifierProvider.notifier).completeGame('interlock_puzzle');
    }
  }
}
