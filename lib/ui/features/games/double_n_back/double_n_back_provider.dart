import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'double_n_back_engine.dart';

part 'double_n_back_provider.g.dart';

class Stimulus {
  final int position;
  final String letter;

  Stimulus({required this.position, required this.letter});
}

class DoubleNBackState {
  final List<Stimulus> sequence;
  final int n;
  final int score;
  final int timeLeft;
  final bool isGameOver;
  final bool isLoading;
  final bool positionMatchPressed;
  final bool letterMatchPressed;

  DoubleNBackState({
    this.sequence = const [],
    this.n = 2,
    this.score = 0,
    this.timeLeft = 60,
    this.isGameOver = false,
    this.isLoading = true,
    this.positionMatchPressed = false,
    this.letterMatchPressed = false,
  });

  DoubleNBackState copyWith({
    List<Stimulus>? sequence,
    int? n,
    int? score,
    int? timeLeft,
    bool? isGameOver,
    bool? isLoading,
    bool? positionMatchPressed,
    bool? letterMatchPressed,
  }) {
    return DoubleNBackState(
      sequence: sequence ?? this.sequence,
      n: n ?? this.n,
      score: score ?? this.score,
      timeLeft: timeLeft ?? this.timeLeft,
      isGameOver: isGameOver ?? this.isGameOver,
      isLoading: isLoading ?? this.isLoading,
      positionMatchPressed: positionMatchPressed ?? this.positionMatchPressed,
      letterMatchPressed: letterMatchPressed ?? this.letterMatchPressed,
    );
  }
}

@riverpod
class DoubleNBackNotifier extends _$DoubleNBackNotifier {
  final _engine = DoubleNBackEngine();
  Timer? _timer;
  Timer? _stimulusTimer;

  @override
  DoubleNBackState build() {
    ref.onDispose(cleanUp);
    return DoubleNBackState();
  }

  void initGame() {
    _timer?.cancel();
    _stimulusTimer?.cancel();
    state = DoubleNBackState(isLoading: false);
    _startTimer();
    _nextStimulus();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.timeLeft <= 0) {
        timer.cancel();
        _stimulusTimer?.cancel();
        state = state.copyWith(isGameOver: true);
      } else {
        state = state.copyWith(timeLeft: state.timeLeft - 1);
      }
    });
  }

  void _nextStimulus() {
    _stimulusTimer?.cancel();
    
    // Check previous stimulus matches before moving to next
    _checkMatches();

    final newStim = _engine.generateStimulus();
    state = state.copyWith(
      sequence: [...state.sequence, Stimulus(position: newStim['position'], letter: newStim['letter'])],
      positionMatchPressed: false,
      letterMatchPressed: false,
    );

    _stimulusTimer = Timer(const Duration(milliseconds: 2500), () {
      _nextStimulus();
    });
  }

  void _checkMatches() {
    if (state.sequence.length <= state.n) return;

    final current = state.sequence.last;
    final backN = state.sequence[state.sequence.length - 1 - state.n];

    bool positionMatch = current.position == backN.position;
    bool letterMatch = current.letter == backN.letter;

    int roundScore = 0;
    if (state.positionMatchPressed == positionMatch) roundScore++;
    if (state.letterMatchPressed == letterMatch) roundScore++;
    
    // Penalize only if they pressed when no match
    if (state.positionMatchPressed && !positionMatch) roundScore -= 1;
    if (state.letterMatchPressed && !letterMatch) roundScore -= 1;

    state = state.copyWith(score: state.score + roundScore);
  }

  void pressPositionMatch() {
    state = state.copyWith(positionMatchPressed: true);
  }

  void pressLetterMatch() {
    state = state.copyWith(letterMatchPressed: true);
  }

  void cleanUp() {
    _timer?.cancel();
    _stimulusTimer?.cancel();
  }
}
