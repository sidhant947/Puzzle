import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'semantic_link_engine.dart';

part 'semantic_link_provider.g.dart';

class SemanticLinkState {
  final SemanticLinkPuzzle? puzzle;
  final int score;
  final int timeLeft;
  final bool isGameOver;
  final bool? lastResult;

  SemanticLinkState({
    this.puzzle,
    this.score = 0,
    this.timeLeft = 60,
    this.isGameOver = false,
    this.lastResult,
  });

  SemanticLinkState copyWith({
    SemanticLinkPuzzle? puzzle,
    int? score,
    int? timeLeft,
    bool? isGameOver,
    bool? lastResult,
  }) {
    return SemanticLinkState(
      puzzle: puzzle ?? this.puzzle,
      score: score ?? this.score,
      timeLeft: timeLeft ?? this.timeLeft,
      isGameOver: isGameOver ?? this.isGameOver,
      lastResult: lastResult,
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

    final isCorrect = answer == state.puzzle!.answer;
    if (isCorrect) {
      state = state.copyWith(
        score: state.score + 1,
        puzzle: _engine.generatePuzzle(),
        lastResult: true,
      );
    } else {
      state = state.copyWith(
        puzzle: _engine.generatePuzzle(),
        lastResult: false,
      );
    }
  }
}
