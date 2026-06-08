import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'vowel_reconstruct_engine.dart';

part 'vowel_reconstruct_provider.g.dart';

class VowelReconstructState {
  final VowelReconstructPuzzle? puzzle;
  final List<String> userVowels;
  final int score;
  final bool isGameOver;
  final int timeLeft;
  final bool? lastCheck;

  VowelReconstructState({
    this.puzzle,
    this.userVowels = const [],
    this.score = 0,
    this.isGameOver = false,
    this.timeLeft = 90,
    this.lastCheck,
  });

  VowelReconstructState copyWith({
    VowelReconstructPuzzle? puzzle,
    List<String>? userVowels,
    int? score,
    bool? isGameOver,
    int? timeLeft,
    bool? lastCheck,
  }) {
    return VowelReconstructState(
      puzzle: puzzle ?? this.puzzle,
      userVowels: userVowels ?? this.userVowels,
      score: score ?? this.score,
      isGameOver: isGameOver ?? this.isGameOver,
      timeLeft: timeLeft ?? this.timeLeft,
      lastCheck: lastCheck ?? this.lastCheck,
    );
  }
}

@riverpod
class VowelReconstructNotifier extends _$VowelReconstructNotifier {
  final _engine = VowelReconstructEngine();
  Timer? _timer;

  @override
  VowelReconstructState build() {
    ref.onDispose(() => _timer?.cancel());
    return VowelReconstructState();
  }

  void startGame() {
    _timer?.cancel();
    final puzzle = _engine.generatePuzzle();
    state = VowelReconstructState(
      puzzle: puzzle,
      userVowels: [],
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

  void addVowel(String vowel) {
    if (state.isGameOver || state.puzzle == null) return;
    if (state.userVowels.length >= state.puzzle!.vowels.length) return;

    final updatedVowels = [...state.userVowels, vowel];
    state = state.copyWith(userVowels: updatedVowels);

    if (updatedVowels.length == state.puzzle!.vowels.length) {
      _checkAnswer();
    }
  }

  void backspace() {
    if (state.isGameOver || state.userVowels.isEmpty) return;
    state = state.copyWith(
      userVowels: List.from(state.userVowels)..removeLast(),
      lastCheck: null,
    );
  }

  void _checkAnswer() {
    bool correct = true;
    for (int i = 0; i < state.userVowels.length; i++) {
      if (state.userVowels[i] != state.puzzle!.vowels[i]) {
        correct = false;
        break;
      }
    }

    if (correct) {
      state = state.copyWith(
        score: state.score + 15 + (state.timeLeft ~/ 5),
        lastCheck: true,
      );
      Future.delayed(const Duration(milliseconds: 600), () {
        _nextPuzzle();
      });
    } else {
      state = state.copyWith(lastCheck: false);
      // We don't auto-reset, let user backspace or see errors
    }
  }

  void _nextPuzzle() {
    if (state.isGameOver) return;
    final puzzle = _engine.generatePuzzle();
    state = state.copyWith(
      puzzle: puzzle,
      userVowels: [],
      lastCheck: null,
    );
  }
}
