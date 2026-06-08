import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'consonant_reconstruct_engine.dart';

part 'consonant_reconstruct_provider.g.dart';

class ConsonantReconstructState {
  final ConsonantReconstructPuzzle? puzzle;
  final List<String> userConsonants;
  final int score;
  final bool isGameOver;
  final int timeLeft;
  final bool? lastCheck;

  ConsonantReconstructState({
    this.puzzle,
    this.userConsonants = const [],
    this.score = 0,
    this.isGameOver = false,
    this.timeLeft = 90,
    this.lastCheck,
  });

  ConsonantReconstructState copyWith({
    ConsonantReconstructPuzzle? puzzle,
    List<String>? userConsonants,
    int? score,
    bool? isGameOver,
    int? timeLeft,
    bool? lastCheck,
  }) {
    return ConsonantReconstructState(
      puzzle: puzzle ?? this.puzzle,
      userConsonants: userConsonants ?? this.userConsonants,
      score: score ?? this.score,
      isGameOver: isGameOver ?? this.isGameOver,
      timeLeft: timeLeft ?? this.timeLeft,
      lastCheck: lastCheck ?? this.lastCheck,
    );
  }
}

@riverpod
class ConsonantReconstructNotifier extends _$ConsonantReconstructNotifier {
  final _engine = ConsonantReconstructEngine();
  Timer? _timer;

  @override
  ConsonantReconstructState build() {
    ref.onDispose(() => _timer?.cancel());
    return ConsonantReconstructState();
  }

  void startGame() {
    _timer?.cancel();
    final puzzle = _engine.generatePuzzle();
    state = ConsonantReconstructState(
      puzzle: puzzle,
      userConsonants: [],
      score: 0,
      isGameOver: false,
      timeLeft: 90,
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

  void addConsonant(String consonant) {
    if (state.isGameOver || state.puzzle == null) return;
    if (state.userConsonants.length >= state.puzzle!.consonants.length) return;

    final updatedConsonants = [...state.userConsonants, consonant];
    state = state.copyWith(userConsonants: updatedConsonants);

    if (updatedConsonants.length == state.puzzle!.consonants.length) {
      _checkAnswer();
    }
  }

  void backspace() {
    if (state.isGameOver || state.userConsonants.isEmpty) return;
    state = state.copyWith(
      userConsonants: List.from(state.userConsonants)..removeLast(),
      lastCheck: null,
    );
  }

  void _checkAnswer() {
    bool correct = true;
    for (int i = 0; i < state.userConsonants.length; i++) {
      if (state.userConsonants[i] != state.puzzle!.consonants[i]) {
        correct = false;
        break;
      }
    }

    if (correct) {
      state = state.copyWith(
        score: state.score + 25 + (state.timeLeft ~/ 4),
        lastCheck: true,
      );
      Future.delayed(const Duration(milliseconds: 600), () {
        _nextPuzzle();
      });
    } else {
      state = state.copyWith(lastCheck: false);
    }
  }

  void _nextPuzzle() {
    if (state.isGameOver) return;
    final puzzle = _engine.generatePuzzle();
    state = state.copyWith(
      puzzle: puzzle,
      userConsonants: [],
      lastCheck: null,
    );
  }
}
