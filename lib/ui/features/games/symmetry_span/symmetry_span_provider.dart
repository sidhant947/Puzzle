import 'dart:async';
import 'dart:math';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'symmetry_span_provider.g.dart';

enum SymSpanPhase { showingGrid, showingSymmetry, recalling, result }

class SymmetrySpanState {
  final SymSpanPhase phase;
  final List<int> sequence;
  final List<int> userSequence;
  final int currentSequenceIndex;
  final List<bool> symmetryMatrix;
  final bool symmetryIsSymmetric;
  final int currentLength;
  final int score;
  final int timeLeft;
  final bool isGameOver;
  final bool isLoading;
  final bool? lastRoundCorrect;
  final int highlightedCell; // cell index 0-15 currently shown, -1 for none

  SymmetrySpanState({
    this.phase = SymSpanPhase.showingGrid,
    this.sequence = const [],
    this.userSequence = const [],
    this.currentSequenceIndex = 0,
    this.symmetryMatrix = const [],
    this.symmetryIsSymmetric = true,
    this.currentLength = 2,
    this.score = 0,
    this.timeLeft = 75,
    this.isGameOver = false,
    this.isLoading = true,
    this.lastRoundCorrect,
    this.highlightedCell = -1,
  });

  SymmetrySpanState copyWith({
    SymSpanPhase? phase,
    List<int>? sequence,
    List<int>? userSequence,
    int? currentSequenceIndex,
    List<bool>? symmetryMatrix,
    bool? symmetryIsSymmetric,
    int? currentLength,
    int? score,
    int? timeLeft,
    bool? isGameOver,
    bool? isLoading,
    bool? lastRoundCorrect,
    bool resetLastRoundCorrect = false,
    int? highlightedCell,
  }) {
    return SymmetrySpanState(
      phase: phase ?? this.phase,
      sequence: sequence ?? this.sequence,
      userSequence: userSequence ?? this.userSequence,
      currentSequenceIndex: currentSequenceIndex ?? this.currentSequenceIndex,
      symmetryMatrix: symmetryMatrix ?? this.symmetryMatrix,
      symmetryIsSymmetric: symmetryIsSymmetric ?? this.symmetryIsSymmetric,
      currentLength: currentLength ?? this.currentLength,
      score: score ?? this.score,
      timeLeft: timeLeft ?? this.timeLeft,
      isGameOver: isGameOver ?? this.isGameOver,
      isLoading: isLoading ?? this.isLoading,
      lastRoundCorrect: resetLastRoundCorrect ? null : (lastRoundCorrect ?? this.lastRoundCorrect),
      highlightedCell: highlightedCell ?? this.highlightedCell,
    );
  }
}

@riverpod
class SymmetrySpanNotifier extends _$SymmetrySpanNotifier {
  final Random _random = Random();
  Timer? _gameTimer;
  Timer? _phaseTimer;

  @override
  SymmetrySpanState build() {
    return SymmetrySpanState();
  }

  void initGame() {
    _gameTimer?.cancel();
    _phaseTimer?.cancel();

    state = SymmetrySpanState(
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
    _phaseTimer?.cancel();
    
    // Generate sequence of grid cells (0-15)
    List<int> seq = [];
    for (int i = 0; i < state.currentLength; i++) {
      seq.add(_random.nextInt(16));
    }

    state = state.copyWith(
      phase: SymSpanPhase.showingGrid,
      sequence: seq,
      userSequence: [],
      currentSequenceIndex: 0,
      resetLastRoundCorrect: true,
    );

    _showNextSequenceStep();
  }

  void _showNextSequenceStep() {
    if (state.currentSequenceIndex < state.sequence.length) {
      // Show highlighted grid square
      state = state.copyWith(
        phase: SymSpanPhase.showingGrid,
        highlightedCell: state.sequence[state.currentSequenceIndex],
      );

      _phaseTimer = Timer(const Duration(milliseconds: 1500), () {
        state = state.copyWith(highlightedCell: -1);
        
        // Transition to symmetry check
        _generateSymmetryMatrix();
      });
    } else {
      // Show recall grid
      state = state.copyWith(
        phase: SymSpanPhase.recalling,
        highlightedCell: -1,
      );
    }
  }

  void _generateSymmetryMatrix() {
    // Generate 4x4 vertical symmetry matrix
    // Row layout: 0 1 2 3
    // Symmetrical if: col 0 == col 3, and col 1 == col 2.
    final symmetric = _random.nextBool();
    List<bool> matrix = List.filled(16, false);

    for (int row = 0; row < 4; row++) {
      // random left half
      final c0 = _random.nextBool();
      final c1 = _random.nextBool();
      matrix[row * 4 + 0] = c0;
      matrix[row * 4 + 1] = c1;

      if (symmetric) {
        matrix[row * 4 + 2] = c1;
        matrix[row * 4 + 3] = c0;
      } else {
        // generate random right half
        matrix[row * 4 + 2] = _random.nextBool();
        matrix[row * 4 + 3] = _random.nextBool();
        
        // Double check it's not accidentally symmetric
        if (matrix[row * 4 + 2] == c1 && matrix[row * 4 + 3] == c0) {
          // Flip one to break symmetry
          matrix[row * 4 + 3] = !c0;
        }
      }
    }

    state = state.copyWith(
      phase: SymSpanPhase.showingSymmetry,
      symmetryMatrix: matrix,
      symmetryIsSymmetric: symmetric,
    );
  }

  void answerSymmetry(bool claimedSymmetric) {
    if (state.isGameOver || state.phase != SymSpanPhase.showingSymmetry) return;

    final isCorrect = claimedSymmetric == state.symmetryIsSymmetric;

    // Even if symmetry was wrong, we continue, but score penalizes or helps
    state = state.copyWith(
      score: isCorrect ? state.score + 1 : state.score,
      currentSequenceIndex: state.currentSequenceIndex + 1,
    );

    _showNextSequenceStep();
  }

  void onCellTapRecall(int index) {
    if (state.isGameOver || state.phase != SymSpanPhase.recalling) return;

    final newUserSeq = [...state.userSequence, index];
    state = state.copyWith(userSequence: newUserSeq);

    // Verify tap correctness
    final targetCell = state.sequence[newUserSeq.length - 1];
    if (index != targetCell) {
      _checkRoundResult(false);
    } else if (newUserSeq.length == state.sequence.length) {
      _checkRoundResult(true);
    }
  }

  void _checkRoundResult(bool correct) {
    int nextLen = state.currentLength;
    if (correct) {
      nextLen = state.currentLength + 1;
    } else {
      nextLen = state.currentLength > 2 ? state.currentLength - 1 : 2;
    }

    state = state.copyWith(
      phase: SymSpanPhase.result,
      score: correct ? state.score + (state.currentLength * 2) : state.score,
      lastRoundCorrect: correct,
      currentLength: nextLen,
    );

    _phaseTimer = Timer(const Duration(milliseconds: 1200), _startRound);
  }

  void _endGame() {
    _gameTimer?.cancel();
    _phaseTimer?.cancel();
    state = state.copyWith(isGameOver: true);
  }
}
