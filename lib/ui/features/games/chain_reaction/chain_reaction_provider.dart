import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'chain_reaction_engine.dart';

part 'chain_reaction_provider.g.dart';

class ChainReactionState {
  final ChainReactionPuzzle? puzzle;
  final List<String> chain;
  final int score;
  final bool isGameOver;
  final int timeLeft;
  final String? error;

  ChainReactionState({
    this.puzzle,
    this.chain = const [],
    this.score = 0,
    this.isGameOver = false,
    this.timeLeft = 90,
    this.error,
  });

  ChainReactionState copyWith({
    ChainReactionPuzzle? puzzle,
    List<String>? chain,
    int? score,
    bool? isGameOver,
    int? timeLeft,
    String? error,
  }) {
    return ChainReactionState(
      puzzle: puzzle ?? this.puzzle,
      chain: chain ?? this.chain,
      score: score ?? this.score,
      isGameOver: isGameOver ?? this.isGameOver,
      timeLeft: timeLeft ?? this.timeLeft,
      error: error,
    );
  }
}

@riverpod
class ChainReactionNotifier extends _$ChainReactionNotifier {
  final _engine = ChainReactionEngine();
  Timer? _timer;

  @override
  ChainReactionState build() {
    ref.onDispose(() => _timer?.cancel());
    return ChainReactionState();
  }

  void startGame() {
    _timer?.cancel();
    final puzzle = _engine.generatePuzzle();
    state = ChainReactionState(
      puzzle: puzzle,
      chain: [puzzle.startWord],
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

  void submitWord(String word) {
    if (state.isGameOver || word.isEmpty) return;
    
    final normalizedWord = word.toUpperCase().trim();
    final lastWord = state.chain.last;

    if (state.chain.contains(normalizedWord)) {
      state = state.copyWith(error: 'Word already used!');
      return;
    }

    if (!_engine.isRealWord(normalizedWord)) {
      state = state.copyWith(error: 'Word too short!');
      return;
    }

    if (_engine.isValidNextWord(lastWord, normalizedWord)) {
      final newChain = [...state.chain, normalizedWord];
      state = state.copyWith(
        chain: newChain,
        score: state.score + 10,
        error: null,
      );
      
      if (newChain.length >= state.puzzle!.targetChainLength + 1) {
        // Bonus for long chain? Or just keep going.
      }
    } else {
      state = state.copyWith(error: 'Invalid link!');
    }
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
}
