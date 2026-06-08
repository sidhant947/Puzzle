import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'portmanteau_split_engine.dart';

part 'portmanteau_split_provider.g.dart';

class PortmanteauSplitState {
  final PortmanteauPuzzle? puzzle;
  final Set<String> selectedWords;
  final int score;
  final int timeLeft;
  final bool isGameOver;
  final bool isCorrect;

  PortmanteauSplitState({
    this.puzzle,
    this.selectedWords = const {},
    this.score = 0,
    this.timeLeft = 60,
    this.isGameOver = false,
    this.isCorrect = false,
  });

  PortmanteauSplitState copyWith({
    PortmanteauPuzzle? puzzle,
    Set<String>? selectedWords,
    int? score,
    int? timeLeft,
    bool? isGameOver,
    bool? isCorrect,
  }) {
    return PortmanteauSplitState(
      puzzle: puzzle ?? this.puzzle,
      selectedWords: selectedWords ?? this.selectedWords,
      score: score ?? this.score,
      timeLeft: timeLeft ?? this.timeLeft,
      isGameOver: isGameOver ?? this.isGameOver,
      isCorrect: isCorrect ?? this.isCorrect,
    );
  }
}

@riverpod
class PortmanteauSplitNotifier extends _$PortmanteauSplitNotifier {
  final _engine = PortmanteauSplitEngine();
  Timer? _timer;

  @override
  PortmanteauSplitState build() {
    ref.onDispose(() => _timer?.cancel());
    return PortmanteauSplitState();
  }

  void startGame() {
    _timer?.cancel();
    state = PortmanteauSplitState(
      puzzle: _engine.generatePuzzle(),
      selectedWords: {},
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

  void selectWord(String word) {
    if (state.isGameOver || state.isCorrect) return;

    final newSelected = Set<String>.from(state.selectedWords);
    if (newSelected.contains(word)) {
      newSelected.remove(word);
    } else {
      if (newSelected.length < 2) {
        newSelected.add(word);
      }
    }

    state = state.copyWith(selectedWords: newSelected);

    if (newSelected.length == 2) {
      final list = newSelected.toList();
      final w1 = list[0];
      final w2 = list[1];
      
      final isMatch = (w1 == state.puzzle!.word1 && w2 == state.puzzle!.word2) ||
                      (w1 == state.puzzle!.word2 && w2 == state.puzzle!.word1);

      if (isMatch) {
        state = state.copyWith(
          score: state.score + 1,
          isCorrect: true,
        );
        
        Future.delayed(const Duration(milliseconds: 500), () {
          if (!state.isGameOver) {
            state = state.copyWith(
              puzzle: _engine.generatePuzzle(),
              selectedWords: {},
              isCorrect: false,
            );
          }
        });
      } else {
        // Wrong selection
        Future.delayed(const Duration(milliseconds: 300), () {
          if (!state.isGameOver) {
            state = state.copyWith(selectedWords: {});
          }
        });
      }
    }
  }
}
