import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../providers/user_providers.dart';
import 'dual_coding_engine.dart';

part 'dual_coding_provider.g.dart';

class DualCodingState {
  final List<DualCodingStimulus> history;
  final int score;
  final int totalAttempts;
  final int timeLeft;
  final bool isGameOver;
  final bool isLoading;
  final bool cardMatchPressed;
  final bool pitchMatchPressed;
  final int n;

  DualCodingState({
    required this.history,
    this.score = 0,
    this.totalAttempts = 0,
    this.timeLeft = 45,
    this.isGameOver = false,
    this.isLoading = true,
    this.cardMatchPressed = false,
    this.pitchMatchPressed = false,
    this.n = 2,
  });

  DualCodingState copyWith({
    List<DualCodingStimulus>? history,
    int? score,
    int? totalAttempts,
    int? timeLeft,
    bool? isGameOver,
    bool? isLoading,
    bool? cardMatchPressed,
    bool? pitchMatchPressed,
    int? n,
  }) {
    return DualCodingState(
      history: history ?? this.history,
      score: score ?? this.score,
      totalAttempts: totalAttempts ?? this.totalAttempts,
      timeLeft: timeLeft ?? this.timeLeft,
      isGameOver: isGameOver ?? this.isGameOver,
      isLoading: isLoading ?? this.isLoading,
      cardMatchPressed: cardMatchPressed ?? this.cardMatchPressed,
      pitchMatchPressed: pitchMatchPressed ?? this.pitchMatchPressed,
      n: n ?? this.n,
    );
  }
}

@riverpod
class DualCodingNotifier extends _$DualCodingNotifier {
  final _engine = DualCodingEngine();
  Timer? _gameTimer;
  Timer? _stimulusTimer;

  @override
  DualCodingState build() {
    ref.onDispose(() {
      _gameTimer?.cancel();
      _stimulusTimer?.cancel();
    });
    return DualCodingState(history: []);
  }

  void initGame() {
    _gameTimer?.cancel();
    _stimulusTimer?.cancel();

    final initial = _engine.generateNext([], 2);
    state = DualCodingState(
      history: [initial],
      isLoading: false,
    );

    _startTimers();
  }

  void _startTimers() {
    _gameTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.timeLeft <= 0) {
        _endGame();
      } else {
        state = state.copyWith(timeLeft: state.timeLeft - 1);
      }
    });

    _scheduleNextStimulus();
  }

  void _scheduleNextStimulus() {
    _stimulusTimer?.cancel();
    _stimulusTimer = Timer(const Duration(milliseconds: 3000), () {
      if (!state.isGameOver) {
        _evaluateRound();
        _nextStimulus();
      }
    });
  }

  void _evaluateRound() {
    if (state.history.length <= state.n) return;

    final current = state.history.last;
    final target = state.history[state.history.length - 1 - state.n];

    final isCardMatch = current.matchesCard(target);
    final isPitchMatch = current.matchesPitch(target);

    // Score evaluation:
    // User gets points for correctly checking matches, or correctly NOT checking them.
    // If they checked a match that is real: +2 points.
    // If they checked a match that is not real: -1 point.
    // If they missed a match: -1 point.
    int roundPoints = 0;
    
    if (isCardMatch) {
      if (state.cardMatchPressed) {
        roundPoints += 2;
      } else {
        roundPoints -= 1; // missed card match
      }
    } else {
      if (state.cardMatchPressed) {
        roundPoints -= 1; // false alarm
      }
    }

    if (isPitchMatch) {
      if (state.pitchMatchPressed) {
        roundPoints += 2;
      } else {
        roundPoints -= 1; // missed pitch match
      }
    } else {
      if (state.pitchMatchPressed) {
        roundPoints -= 1; // false alarm
      }
    }

    int newScore = state.score + roundPoints;
    if (newScore < 0) newScore = 0;

    state = state.copyWith(
      score: newScore,
      totalAttempts: state.totalAttempts + 1,
    );
  }

  void _nextStimulus() {
    final next = _engine.generateNext(state.history, state.n);
    state = state.copyWith(
      history: [...state.history, next],
      cardMatchPressed: false,
      pitchMatchPressed: false,
    );
    _scheduleNextStimulus();
  }

  void pressCardMatch() {
    if (state.isGameOver || state.history.length <= state.n) return;
    state = state.copyWith(cardMatchPressed: !state.cardMatchPressed);
  }

  void pressPitchMatch() {
    if (state.isGameOver || state.history.length <= state.n) return;
    state = state.copyWith(pitchMatchPressed: !state.pitchMatchPressed);
  }

  void _endGame() {
    _gameTimer?.cancel();
    _stimulusTimer?.cancel();
    state = state.copyWith(isGameOver: true);
    ref.read(gameStreakNotifierProvider.notifier).completeGame('dual_coding', xpAmount: 25);
  }

  void reset() {
    initGame();
  }
}
