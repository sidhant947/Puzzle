import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'typing_speed_engine.dart';

part 'typing_speed_provider.g.dart';

class TypingSpeedState {
  final String targetPhrase;
  final String currentInput;
  final int timeLeft;
  final double wpm;
  final bool isGameOver;
  final bool isGameWon;
  final bool isLoading;

  TypingSpeedState({
    required this.targetPhrase,
    this.currentInput = '',
    this.timeLeft = 30,
    this.wpm = 0.0,
    this.isGameOver = false,
    this.isGameWon = false,
    this.isLoading = true,
  });

  TypingSpeedState copyWith({
    String? targetPhrase,
    String? currentInput,
    int? timeLeft,
    double? wpm,
    bool? isGameOver,
    bool? isGameWon,
    bool? isLoading,
  }) {
    return TypingSpeedState(
      targetPhrase: targetPhrase ?? this.targetPhrase,
      currentInput: currentInput ?? this.currentInput,
      timeLeft: timeLeft ?? this.timeLeft,
      wpm: wpm ?? this.wpm,
      isGameOver: isGameOver ?? this.isGameOver,
      isGameWon: isGameWon ?? this.isGameWon,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class TypingSpeedNotifier extends _$TypingSpeedNotifier {
  final _engine = TypingSpeedEngine();
  Timer? _timer;
  int _startTime = 0;

  @override
  TypingSpeedState build() {
    return TypingSpeedState(targetPhrase: '');
  }

  void initGame() {
    _timer?.cancel();
    final phrase = _engine.getRandomPhrase();
    _startTime = 30;
    state = TypingSpeedState(
      targetPhrase: phrase,
      timeLeft: _startTime,
      isLoading: false,
    );
  }

  void startTimer() {
    if (_timer != null) return;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.timeLeft <= 0) {
        timer.cancel();
        _timer = null;
        _endGame(false);
      } else {
        state = state.copyWith(timeLeft: state.timeLeft - 1);
      }
    });
  }

  void onInputChange(String input) {
    if (state.isGameOver) return;
    if (_timer == null) startTimer();

    final inputUpper = input.toUpperCase();
    final targetUpper = state.targetPhrase.toUpperCase();

    if (inputUpper == targetUpper) {
      _endGame(true);
    } else {
      state = state.copyWith(currentInput: input);
    }
  }

  void _endGame(bool won) {
    _timer?.cancel();
    _timer = null;
    
    int elapsed = _startTime - state.timeLeft;
    if (elapsed == 0) elapsed = 1;
    
    final correctChars = _engine.countCorrectChars(state.currentInput, state.targetPhrase);
    final finalWPM = _engine.calculateWPM(won ? state.targetPhrase.length : correctChars, elapsed);

    state = state.copyWith(
      isGameOver: true,
      isGameWon: won,
      wpm: finalWPM,
    );
  }
}
