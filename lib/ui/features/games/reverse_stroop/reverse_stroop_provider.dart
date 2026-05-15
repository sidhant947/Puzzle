import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'reverse_stroop_engine.dart';

part 'reverse_stroop_provider.g.dart';

class ReverseStroopState {
  final StroopStimulus? currentStimulus;
  final int score;
  final int timeLeft;
  final bool isGameOver;
  final String difficulty;
  final bool? lastAnswerCorrect;

  ReverseStroopState({
    this.currentStimulus,
    this.score = 0,
    this.timeLeft = 60,
    this.isGameOver = false,
    this.difficulty = 'Medium',
    this.lastAnswerCorrect,
  });

  ReverseStroopState copyWith({
    StroopStimulus? currentStimulus,
    int? score,
    int? timeLeft,
    bool? isGameOver,
    String? difficulty,
    bool? lastAnswerCorrect,
  }) {
    return ReverseStroopState(
      currentStimulus: currentStimulus ?? this.currentStimulus,
      score: score ?? this.score,
      timeLeft: timeLeft ?? this.timeLeft,
      isGameOver: isGameOver ?? this.isGameOver,
      difficulty: difficulty ?? this.difficulty,
      lastAnswerCorrect: lastAnswerCorrect,
    );
  }
}

@riverpod
class ReverseStroopNotifier extends _$ReverseStroopNotifier {
  Timer? _timer;

  @override
  ReverseStroopState build() {
    ref.onDispose(() => _timer?.cancel());
    return ReverseStroopState();
  }

  void startGame([String difficulty = 'Medium']) {
    _timer?.cancel();
    state = ReverseStroopState(
      difficulty: difficulty,
      currentStimulus: ReverseStroopEngine.generateStimulus(difficulty),
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

    final isCorrect = answer == state.currentStimulus?.correctAnswer;
    
    if (isCorrect) {
      state = state.copyWith(
        score: state.score + 10,
        currentStimulus: ReverseStroopEngine.generateStimulus(state.difficulty),
        lastAnswerCorrect: true,
      );
    } else {
      state = state.copyWith(
        score: (state.score - 5).clamp(0, 9999),
        currentStimulus: ReverseStroopEngine.generateStimulus(state.difficulty),
        lastAnswerCorrect: false,
        timeLeft: (state.timeLeft - 3).clamp(0, 60),
      );
    }
  }
}
