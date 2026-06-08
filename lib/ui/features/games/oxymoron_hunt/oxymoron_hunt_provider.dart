import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'oxymoron_hunt_engine.dart';

part 'oxymoron_hunt_provider.g.dart';

class OxymoronHuntState {
  final OxymoronHuntPuzzle? puzzle;
  final Set<String> selectedWords;
  final Set<String> foundWords;
  final int score;
  final int timeLeft;
  final bool isGameOver;

  OxymoronHuntState({
    this.puzzle,
    this.selectedWords = const {},
    this.foundWords = const {},
    this.score = 0,
    this.timeLeft = 60,
    this.isGameOver = false,
  });

  OxymoronHuntState copyWith({
    OxymoronHuntPuzzle? puzzle,
    Set<String>? selectedWords,
    Set<String>? foundWords,
    int? score,
    int? timeLeft,
    bool? isGameOver,
  }) {
    return OxymoronHuntState(
      puzzle: puzzle ?? this.puzzle,
      selectedWords: selectedWords ?? this.selectedWords,
      foundWords: foundWords ?? this.foundWords,
      score: score ?? this.score,
      timeLeft: timeLeft ?? this.timeLeft,
      isGameOver: isGameOver ?? this.isGameOver,
    );
  }
}

@riverpod
class OxymoronHuntNotifier extends _$OxymoronHuntNotifier {
  final _engine = OxymoronHuntEngine();
  Timer? _timer;

  @override
  OxymoronHuntState build() {
    ref.onDispose(() => _timer?.cancel());
    return OxymoronHuntState();
  }

  void startGame() {
    _timer?.cancel();
    state = OxymoronHuntState(
      puzzle: _engine.generatePuzzle(),
      selectedWords: {},
      foundWords: {},
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
    if (state.isGameOver || state.foundWords.contains(word)) return;

    final newSelected = Set<String>.from(state.selectedWords);
    if (newSelected.contains(word)) {
      newSelected.remove(word);
    } else {
      newSelected.add(word);
    }

    if (newSelected.length == 2) {
      final list = newSelected.toList();
      final w1 = list[0];
      final w2 = list[1];
      
      bool isMatch = false;
      for (var pair in state.puzzle!.pairs) {
        if (pair.contains(w1) && pair.contains(w2)) {
          isMatch = true;
          break;
        }
      }

      if (isMatch) {
        final newFound = {...state.foundWords, w1, w2};
        state = state.copyWith(
          foundWords: newFound,
          selectedWords: {},
          score: state.score + 1,
        );

        if (newFound.length == state.puzzle!.words.length) {
          // Puzzle complete, get next
          Future.delayed(const Duration(milliseconds: 500), () {
            if (!state.isGameOver) {
              state = state.copyWith(
                puzzle: _engine.generatePuzzle(),
                selectedWords: {},
                foundWords: {},
              );
            }
          });
        }
      } else {
        // Wrong pair
        state = state.copyWith(selectedWords: {});
      }
    } else {
      state = state.copyWith(selectedWords: newSelected);
    }
  }
}
