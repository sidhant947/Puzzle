import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'semantic_link_engine.dart';

part 'semantic_link_provider.g.dart';

class SemanticLinkState {
  final SemanticLinkPuzzle? puzzle;
  final int score;
  final int timeLeft;
  final bool isGameOver;
  final Set<String> wrongAttempts;

  SemanticLinkState({
    this.puzzle,
    this.score = 0,
    this.timeLeft = 60,
    this.isGameOver = false,
    this.wrongAttempts = const {},
  });

  SemanticLinkState copyWith({
    SemanticLinkPuzzle? puzzle,
    int? score,
    int? timeLeft,
    bool? isGameOver,
    Set<String>? wrongAttempts,
  }) {
    return SemanticLinkState(
      puzzle: puzzle ?? this.puzzle,
      score: score ?? this.score,
      timeLeft: timeLeft ?? this.timeLeft,
      isGameOver: isGameOver ?? this.isGameOver,
      wrongAttempts: wrongAttempts ?? this.wrongAttempts,
    );
  }
}

@riverpod
class SemanticLinkNotifier extends _$SemanticLinkNotifier {
  final _engine = SemanticLinkEngine();
  Timer? _timer;

  @override
  SemanticLinkState build() {
    ref.onDispose(() {
      _timer?.cancel();
    });
    return SemanticLinkState();
  }

  void startGame() {
    _timer?.cancel();
    state = SemanticLinkState(
      puzzle: _engine.generatePuzzle(),
      score: 0,
      timeLeft: 60,
      isGameOver: false,
      wrongAttempts: {},
    );
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.timeLeft > 0) {
        state = state.copyWith(timeLeft: state.timeLeft - 1);
      } else {
        timer.cancel();
        state = state.copyWith(isGameOver: true);
      }
    });
  }

  void submitAnswer(String answer) {
    if (state.isGameOver || state.puzzle == null) return;
    if (state.wrongAttempts.contains(answer)) return;

    final isCorrect = answer == state.puzzle!.answer;
    if (isCorrect) {
      // Correct answer: +1 point, clear wrong attempts, get next puzzle
      state = state.copyWith(
        score: state.score + 1,
        puzzle: _engine.generatePuzzle(),
        wrongAttempts: {},
      );
    } else {
      // Incorrect answer: -1 point, add to wrong attempts, keep same puzzle
      state = state.copyWith(
        score: state.score - 1,
        wrongAttempts: {...state.wrongAttempts, answer},
      );
    }
  }
}

