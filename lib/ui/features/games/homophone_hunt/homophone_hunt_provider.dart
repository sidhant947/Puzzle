import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'homophone_hunt_engine.dart';

part 'homophone_hunt_provider.g.dart';

class HomophoneHuntState {
  final HomophonePuzzle? puzzle;
  final List<String> options;
  final bool isGameOver;
  final bool? isCorrect;
  final String? selectedAnswer;

  HomophoneHuntState({
    this.puzzle,
    this.options = const [],
    this.isGameOver = false,
    this.isCorrect,
    this.selectedAnswer,
  });

  HomophoneHuntState copyWith({
    HomophonePuzzle? puzzle,
    List<String>? options,
    bool? isGameOver,
    bool? isCorrect,
    String? selectedAnswer,
  }) {
    return HomophoneHuntState(
      puzzle: puzzle ?? this.puzzle,
      options: options ?? this.options,
      isGameOver: isGameOver ?? this.isGameOver,
      isCorrect: isCorrect ?? this.isCorrect,
      selectedAnswer: selectedAnswer ?? this.selectedAnswer,
    );
  }
}

@riverpod
class HomophoneHuntNotifier extends _$HomophoneHuntNotifier {
  final _engine = HomophoneHuntEngine();

  @override
  HomophoneHuntState build() {
    return HomophoneHuntState();
  }

  void startGame() {
    final puzzle = _engine.generatePuzzle();
    final options = [puzzle.correctAnswer, puzzle.wrongAnswer]..shuffle();
    state = HomophoneHuntState(
      puzzle: puzzle,
      options: options,
      isGameOver: false,
    );
  }

  void checkAnswer(String answer) {
    if (state.isGameOver || state.selectedAnswer != null) return;

    final isCorrect = answer == state.puzzle!.correctAnswer;
    state = state.copyWith(
      selectedAnswer: answer,
      isCorrect: isCorrect,
    );

    Future.delayed(const Duration(milliseconds: 1000), () {
      state = state.copyWith(isGameOver: true);
    });
  }
}
