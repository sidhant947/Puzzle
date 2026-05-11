import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'n_back_engine.dart';

part 'n_back_provider.g.dart';

class NBackState {
  final List<String> history;
  final String currentSymbol;
  final int n;
  final int score;
  final int timeLeft;
  final bool isGameOver;
  final bool isLoading;
  final bool? lastMatchResult; // true = correct, false = wrong, null = no input yet

  NBackState({
    required this.history,
    required this.currentSymbol,
    this.n = 2,
    this.score = 0,
    this.timeLeft = 60,
    this.isGameOver = false,
    this.isLoading = true,
    this.lastMatchResult,
  });

  NBackState copyWith({
    List<String>? history,
    String? currentSymbol,
    int? n,
    int? score,
    int? timeLeft,
    bool? isGameOver,
    bool? isLoading,
    bool? lastMatchResult,
  }) {
    return NBackState(
      history: history ?? this.history,
      currentSymbol: currentSymbol ?? this.currentSymbol,
      n: n ?? this.n,
      score: score ?? this.score,
      timeLeft: timeLeft ?? this.timeLeft,
      isGameOver: isGameOver ?? this.isGameOver,
      isLoading: isLoading ?? this.isLoading,
      lastMatchResult: lastMatchResult,
    );
  }
}

@riverpod
class NBackNotifier extends _$NBackNotifier {
  final _engine = NBackEngine();
  Timer? _gameTimer;
  Timer? _symbolTimer;

  @override
  NBackState build() {
    return NBackState(history: [], currentSymbol: '');
  }

  void initGame() {
    _gameTimer?.cancel();
    _symbolTimer?.cancel();
    
    final initialSymbol = _engine.generateNextSymbol([], 2);
    state = NBackState(
      history: [initialSymbol],
      currentSymbol: initialSymbol,
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

    _scheduleNextSymbol();
  }

  void _scheduleNextSymbol() {
    _symbolTimer?.cancel();
    _symbolTimer = Timer(const Duration(milliseconds: 2000), () {
      if (!state.isGameOver) {
        _nextSymbol();
      }
    });
  }

  void _nextSymbol() {
    final next = _engine.generateNextSymbol(state.history, state.n);
    state = state.copyWith(
      history: [...state.history, next],
      currentSymbol: next,
      lastMatchResult: null,
    );
    _scheduleNextSymbol();
  }

  void onMatchTap() {
    if (state.isGameOver || state.history.length <= state.n) return;

    final isMatch = state.currentSymbol == state.history[state.history.length - 1 - state.n];
    
    if (isMatch) {
      state = state.copyWith(
        score: state.score + 1,
        lastMatchResult: true,
      );
    } else {
      state = state.copyWith(
        lastMatchResult: false,
        timeLeft: state.timeLeft > 3 ? state.timeLeft - 3 : 0,
      );
    }
    
    // Move to next symbol immediately on tap
    _nextSymbol();
  }

  void _endGame() {
    _gameTimer?.cancel();
    _symbolTimer?.cancel();
    state = state.copyWith(isGameOver: true);
  }
}
