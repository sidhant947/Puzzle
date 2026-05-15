import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'vocabulary_builder_engine.dart';

part 'vocabulary_builder_provider.g.dart';

class VocabularyBuilderState {
  final VocabularyQuestion? currentQuestion;
  final int score;
  final int timeLeft;
  final bool isGameOver;
  final String difficulty;
  final bool? lastAnswerCorrect;

  VocabularyBuilderState({
    this.currentQuestion,
    this.score = 0,
    this.timeLeft = 60,
    this.isGameOver = false,
    this.difficulty = 'Medium',
    this.lastAnswerCorrect,
  });

  VocabularyBuilderState copyWith({
    VocabularyQuestion? currentQuestion,
    int? score,
    int? timeLeft,
    bool? isGameOver,
    String? difficulty,
    bool? lastAnswerCorrect,
  }) {
    return VocabularyBuilderState(
      currentQuestion: currentQuestion ?? this.currentQuestion,
      score: score ?? this.score,
      timeLeft: timeLeft ?? this.timeLeft,
      isGameOver: isGameOver ?? this.isGameOver,
      difficulty: difficulty ?? this.difficulty,
      lastAnswerCorrect: lastAnswerCorrect,
    );
  }
}

@riverpod
class VocabularyBuilderNotifier extends _$VocabularyBuilderNotifier {
  Timer? _timer;

  @override
  VocabularyBuilderState build() {
    ref.onDispose(() => _timer?.cancel());
    return VocabularyBuilderState();
  }

  void startGame([String difficulty = 'Medium']) {
    _timer?.cancel();
    state = VocabularyBuilderState(
      difficulty: difficulty,
      currentQuestion: VocabularyBuilderEngine.generateQuestion(difficulty),
    );
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.timeLeft > 0) {
        state = state.copyWith(timeLeft: state.timeLeft - 1);
      } else {
        _timer?.cancel();
        state = state.copyWith(isGameOver: true);
      }
    });
  }

  void submitAnswer(String answer) {
    if (state.isGameOver) return;

    final isCorrect = answer == state.currentQuestion?.correctAnswer;
    
    if (isCorrect) {
      state = state.copyWith(
        score: state.score + 10,
        currentQuestion: VocabularyBuilderEngine.generateQuestion(state.difficulty),
        lastAnswerCorrect: true,
      );
    } else {
      _timer?.cancel();
      state = state.copyWith(
        isGameOver: true,
        lastAnswerCorrect: false,
        timeLeft: 0,
      );
    }
  }
}
