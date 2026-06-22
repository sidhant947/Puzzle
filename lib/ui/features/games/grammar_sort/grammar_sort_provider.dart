import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'grammar_sort_engine.dart';

part 'grammar_sort_provider.g.dart';

class GrammarSortState {
  final GrammarWord? currentWord;
  final int score;
  final int totalAnswered;
  final bool isGameOver;
  final int timeLeft;
  final bool? lastCorrect;
  final bool _updateLastCorrect;

  GrammarSortState({
    this.currentWord,
    this.score = 0,
    this.totalAnswered = 0,
    this.isGameOver = false,
    this.timeLeft = 60,
    this.lastCorrect,
    bool updateLastCorrect = false,
  }) : _updateLastCorrect = updateLastCorrect;

  GrammarSortState copyWith({
    GrammarWord? currentWord,
    int? score,
    int? totalAnswered,
    bool? isGameOver,
    int? timeLeft,
    bool? lastCorrect,
    bool updateLastCorrect = false,
  }) {
    return GrammarSortState(
      currentWord: currentWord ?? this.currentWord,
      score: score ?? this.score,
      totalAnswered: totalAnswered ?? this.totalAnswered,
      isGameOver: isGameOver ?? this.isGameOver,
      timeLeft: timeLeft ?? this.timeLeft,
      lastCorrect: updateLastCorrect ? lastCorrect : this.lastCorrect,
      updateLastCorrect: updateLastCorrect,
    );
  }
}

@riverpod
class GrammarSortNotifier extends _$GrammarSortNotifier {
  final _engine = GrammarSortEngine();
  Timer? _timer;

  @override
  GrammarSortState build() {
    ref.onDispose(() => _timer?.cancel());
    return GrammarSortState();
  }

  void startGame() {
    _timer?.cancel();
    state = GrammarSortState(
      currentWord: _engine.nextWord(),
      score: 0,
      totalAnswered: 0,
      isGameOver: false,
      timeLeft: 60,
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

  void sortWord(PartOfSpeech category) {
    if (state.isGameOver || state.currentWord == null) return;

    final isCorrect = state.currentWord!.type == category;
    
    state = state.copyWith(
      score: isCorrect ? state.score + 10 : state.score,
      totalAnswered: state.totalAnswered + 1,
      lastCorrect: isCorrect,
      updateLastCorrect: true,
    );

    Future.delayed(const Duration(milliseconds: 300), () {
      if (state.isGameOver) return;
      state = state.copyWith(
        currentWord: _engine.nextWord(),
        lastCorrect: null,
        updateLastCorrect: true,
      );
    });
  }
}
