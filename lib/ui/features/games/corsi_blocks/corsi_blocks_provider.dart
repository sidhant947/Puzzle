import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'corsi_blocks_engine.dart';

part 'corsi_blocks_provider.g.dart';

enum CorsiPhase { showing, inputting, result }

class CorsiBlocksState {
  final List<int> sequence;
  final List<int> userSequence;
  final int currentLength;
  final int score;
  final int timeLeft;
  final bool isGameOver;
  final bool isLoading;
  final CorsiPhase phase;
  final int highlightedIndex;
  final bool? lastRoundCorrect;

  CorsiBlocksState({
    required this.sequence,
    this.userSequence = const [],
    this.currentLength = 4,
    this.score = 0,
    this.timeLeft = 60,
    this.isGameOver = false,
    this.isLoading = true,
    this.phase = CorsiPhase.showing,
    this.highlightedIndex = -1,
    this.lastRoundCorrect,
  });

  CorsiBlocksState copyWith({
    List<int>? sequence,
    List<int>? userSequence,
    int? currentLength,
    int? score,
    int? timeLeft,
    bool? isGameOver,
    bool? isLoading,
    CorsiPhase? phase,
    int? highlightedIndex,
    bool? lastRoundCorrect,
  }) {
    return CorsiBlocksState(
      sequence: sequence ?? this.sequence,
      userSequence: userSequence ?? this.userSequence,
      currentLength: currentLength ?? this.currentLength,
      score: score ?? this.score,
      timeLeft: timeLeft ?? this.timeLeft,
      isGameOver: isGameOver ?? this.isGameOver,
      isLoading: isLoading ?? this.isLoading,
      phase: phase ?? this.phase,
      highlightedIndex: highlightedIndex ?? this.highlightedIndex,
      lastRoundCorrect: lastRoundCorrect,
    );
  }
}

@riverpod
class CorsiBlocksNotifier extends _$CorsiBlocksNotifier {
  final _engine = CorsiBlocksEngine();
  Timer? _gameTimer;
  Timer? _displayTimer;

  @override
  CorsiBlocksState build() {
    return CorsiBlocksState(sequence: []);
  }

  void initGame() {
    _gameTimer?.cancel();
    _displayTimer?.cancel();
    
    state = CorsiBlocksState(
      sequence: [],
      isLoading: false,
    );
    
    _startRound();
    _startTimer();
  }

  void _startTimer() {
    _gameTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.timeLeft <= 0) {
        _endGame();
      } else {
        state = state.copyWith(timeLeft: state.timeLeft - 1);
      }
    });
  }

  void _startRound() {
    final sequence = _engine.generateSequence(state.currentLength, 16);
    state = state.copyWith(
      sequence: sequence,
      userSequence: [],
      phase: CorsiPhase.showing,
      highlightedIndex: -1,
      lastRoundCorrect: null,
    );
    _showSequence(0);
  }

  void _showSequence(int index) {
    if (index < state.sequence.length) {
      state = state.copyWith(highlightedIndex: state.sequence[index]);
      _displayTimer = Timer(const Duration(milliseconds: 600), () {
        state = state.copyWith(highlightedIndex: -1);
        _displayTimer = Timer(const Duration(milliseconds: 200), () => _showSequence(index + 1));
      });
    } else {
      state = state.copyWith(phase: CorsiPhase.inputting);
    }
  }

  void onBlockTap(int index) {
    if (state.phase != CorsiPhase.inputting || state.isGameOver) return;

    final newUserSequence = [...state.userSequence, index];
    state = state.copyWith(userSequence: newUserSequence);

    if (newUserSequence.last != state.sequence[newUserSequence.length - 1]) {
      _checkResult(false);
    } else if (newUserSequence.length == state.sequence.length) {
      _checkResult(true);
    }
  }

  void _checkResult(bool correct) {
    if (correct) {
      state = state.copyWith(
        score: state.score + 1,
        currentLength: state.currentLength + 1,
        lastRoundCorrect: true,
      );
    } else {
      state = state.copyWith(
        currentLength: state.currentLength > 3 ? state.currentLength - 1 : 3,
        lastRoundCorrect: false,
      );
    }

    state = state.copyWith(phase: CorsiPhase.result);
    Timer(const Duration(milliseconds: 1000), _startRound);
  }

  void _endGame() {
    _gameTimer?.cancel();
    _displayTimer?.cancel();
    state = state.copyWith(isGameOver: true);
  }
}
