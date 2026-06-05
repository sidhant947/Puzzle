import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'grammar_police_engine.dart';

part 'grammar_police_provider.g.dart';

class GrammarPoliceState {
  final GrammarSentence? currentSentence;
  final int score;
  final int lives;
  final bool isGameOver;
  final bool? lastAnswerWasCorrect;

  GrammarPoliceState({
    this.currentSentence,
    this.score = 0,
    this.lives = 1,
    this.isGameOver = false,
    this.lastAnswerWasCorrect,
  });

  GrammarPoliceState copyWith({
    GrammarSentence? currentSentence,
    int? score,
    int? lives,
    bool? isGameOver,
    bool? lastAnswerWasCorrect,
  }) {
    return GrammarPoliceState(
      currentSentence: currentSentence ?? this.currentSentence,
      score: score ?? this.score,
      lives: lives ?? this.lives,
      isGameOver: isGameOver ?? this.isGameOver,
      lastAnswerWasCorrect: lastAnswerWasCorrect ?? this.lastAnswerWasCorrect,
    );
  }
}

@riverpod
class GrammarPoliceNotifier extends _$GrammarPoliceNotifier {
  @override
  GrammarPoliceState build() {
    return GrammarPoliceState();
  }

  void startGame() {
    state = GrammarPoliceState(
      currentSentence: GrammarPoliceEngine.generateSentence(),
    );
  }

  void submitAnswer(bool isCorrect) {
    if (state.isGameOver || state.currentSentence == null) return;

    final sentence = state.currentSentence!;
    final isActuallyCorrect = !sentence.hasError;
    final answeredCorrectly = (isCorrect == isActuallyCorrect);

    if (answeredCorrectly) {
      state = state.copyWith(
        score: state.score + 10,
        lastAnswerWasCorrect: true,
        currentSentence: GrammarPoliceEngine.generateSentence(),
      );
    } else {
      state = state.copyWith(
        lives: 0,
        isGameOver: true,
        lastAnswerWasCorrect: false,
      );
    }
  }
}
