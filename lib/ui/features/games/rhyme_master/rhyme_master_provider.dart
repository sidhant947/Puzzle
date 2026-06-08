import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'rhyme_master_engine.dart';

part 'rhyme_master_provider.g.dart';

class RhymeMasterState {
  final RhymeMasterPuzzle? puzzle;
  final List<String> foundRhymes;
  final int score;
  final bool isGameOver;
  final int timeLeft;

  RhymeMasterState({
    this.puzzle,
    this.foundRhymes = const [],
    this.score = 0,
    this.isGameOver = false,
    this.timeLeft = 60,
  });

  RhymeMasterState copyWith({
    RhymeMasterPuzzle? puzzle,
    List<String>? foundRhymes,
    int? score,
    bool? isGameOver,
    int? timeLeft,
  }) {
    return RhymeMasterState(
      puzzle: puzzle ?? this.puzzle,
      foundRhymes: foundRhymes ?? this.foundRhymes,
      score: score ?? this.score,
      isGameOver: isGameOver ?? this.isGameOver,
      timeLeft: timeLeft ?? this.timeLeft,
    );
  }
}

@riverpod
class RhymeMasterNotifier extends _$RhymeMasterNotifier {
  final _engine = RhymeMasterEngine();
  Timer? _timer;

  @override
  RhymeMasterState build() {
    ref.onDispose(() => _timer?.cancel());
    return RhymeMasterState();
  }

  void startGame() {
    _timer?.cancel();
    final puzzle = _engine.generatePuzzle();
    state = RhymeMasterState(
      puzzle: puzzle,
      foundRhymes: [],
      score: 0,
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

  void submitWord(String word) {
    if (state.isGameOver || word.isEmpty) return;
    
    final normalizedWord = word.toUpperCase().trim();
    if (state.foundRhymes.contains(normalizedWord)) return;

    if (_engine.isRhyme(state.puzzle!.targetWord, normalizedWord, state.puzzle!.allRhymes)) {
      final newFound = [...state.foundRhymes, normalizedWord];
      state = state.copyWith(
        foundRhymes: newFound,
        score: state.score + 10,
      );

      if (newFound.length == state.puzzle!.allRhymes.length) {
        _timer?.cancel();
        state = state.copyWith(isGameOver: true);
      }
    }
  }
}
