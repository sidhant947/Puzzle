import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'counting_span_provider.g.dart';

enum CountingSpanPhase { counting, recalling, result }

enum CountingShapeType { circle, square }
enum CountingColorType { blue, yellow, green }

class CountingItem {
  final CountingShapeType shape;
  final CountingColorType color;
  final double x; // coordinates 0 to 1 for rendering
  final double y;

  CountingItem({required this.shape, required this.color, required this.x, required this.y});
}

class CountingSpanState {
  final CountingSpanPhase phase;
  final List<int> sequence;
  final List<int> userSequence;
  final int currentSequenceIndex;
  final List<CountingItem> currentItems;
  final List<int> countOptions;
  final int currentLength;
  final int score;
  final int timeLeft;
  final bool isGameOver;
  final bool isLoading;
  final bool? lastRoundCorrect;

  CountingSpanState({
    this.phase = CountingSpanPhase.counting,
    this.sequence = const [],
    this.userSequence = const [],
    this.currentSequenceIndex = 0,
    this.currentItems = const [],
    this.countOptions = const [],
    this.currentLength = 2,
    this.score = 0,
    this.timeLeft = 80,
    this.isGameOver = false,
    this.isLoading = true,
    this.lastRoundCorrect,
  });

  CountingSpanState copyWith({
    CountingSpanPhase? phase,
    List<int>? sequence,
    List<int>? userSequence,
    int? currentSequenceIndex,
    List<CountingItem>? currentItems,
    List<int>? countOptions,
    int? currentLength,
    int? score,
    int? timeLeft,
    bool? isGameOver,
    bool? isLoading,
    bool? lastRoundCorrect,
  }) {
    return CountingSpanState(
      phase: phase ?? this.phase,
      sequence: sequence ?? this.sequence,
      userSequence: userSequence ?? this.userSequence,
      currentSequenceIndex: currentSequenceIndex ?? this.currentSequenceIndex,
      currentItems: currentItems ?? this.currentItems,
      countOptions: countOptions ?? this.countOptions,
      currentLength: currentLength ?? this.currentLength,
      score: score ?? this.score,
      timeLeft: timeLeft ?? this.timeLeft,
      isGameOver: isGameOver ?? this.isGameOver,
      isLoading: isLoading ?? this.isLoading,
      lastRoundCorrect: lastRoundCorrect ?? this.lastRoundCorrect,
    );
  }
}

@riverpod
class CountingSpanNotifier extends _$CountingSpanNotifier {
  final Random _random = Random();
  Timer? _gameTimer;
  Timer? _phaseTimer;

  @override
  CountingSpanState build() {
    return CountingSpanState();
  }

  void initGame() {
    _gameTimer?.cancel();
    _phaseTimer?.cancel();

    state = CountingSpanState(
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

    // Generate sequence of target counts (each count between 3 and 9)
    List<int> seq = [];
    for (int i = 0; i < state.currentLength; i++) {
      seq.add(_random.nextInt(7) + 3); // 3 to 9
    }

    state = state.copyWith(
      phase: CountingSpanPhase.counting,
      sequence: seq,
      userSequence: [],
      currentSequenceIndex: 0,
      lastRoundCorrect: null,
    );

    _showNextScreen();
  }

  void _showNextScreen() {
    if (state.currentSequenceIndex < state.sequence.length) {
      final targetCount = state.sequence[state.currentSequenceIndex];
      final distractorCount = _random.nextInt(6) + 4; // 4 to 9 distractors

      List<CountingItem> items = [];

      // Generate targets (blue circles)
      for (int i = 0; i < targetCount; i++) {
        final pos = _generateNonOverlappingPosition(items);
        items.add(CountingItem(
          shape: CountingShapeType.circle,
          color: CountingColorType.blue,
          x: pos.dx,
          y: pos.dy,
        ));
      }

      // Generate distractors (blue squares, green circles)
      for (int i = 0; i < distractorCount; i++) {
        final pos = _generateNonOverlappingPosition(items);
        final isSquare = _random.nextBool();
        items.add(CountingItem(
          shape: isSquare ? CountingShapeType.square : CountingShapeType.circle,
          color: isSquare ? CountingColorType.blue : CountingColorType.green,
          x: pos.dx,
          y: pos.dy,
        ));
      }

      // Generate 4 options including targetCount
      Set<int> options = {targetCount};
      while (options.length < 4) {
        options.add(_random.nextInt(8) + 2); // options from 2 to 9
      }
      final sortedOptions = options.toList()..sort();

      state = state.copyWith(
        phase: CountingSpanPhase.counting,
        currentItems: items,
        countOptions: sortedOptions,
      );
    } else {
      // Transition to recall phase
      state = state.copyWith(
        phase: CountingSpanPhase.recalling,
        currentItems: [],
        countOptions: [],
      );
    }
  }

  Offset _generateNonOverlappingPosition(List<CountingItem> existing) {
    double x = 0;
    double y = 0;
    bool overlapping = true;
    int attempts = 0;

    while (overlapping && attempts < 100) {
      x = _random.nextDouble() * 0.8 + 0.1; // margin of 10%
      y = _random.nextDouble() * 0.8 + 0.1;
      overlapping = false;
      attempts++;

      for (final item in existing) {
        final dist = (x - item.x) * (x - item.x) + (y - item.y) * (y - item.y);
        if (dist < 0.012) { // minimum distance
          overlapping = true;
          break;
        }
      }
    }
    return Offset(x, y);
  }

  void answerCount(int count) {
    if (state.isGameOver || state.phase != CountingSpanPhase.counting) return;

    final targetCount = state.sequence[state.currentSequenceIndex];
    final isCorrect = (count == targetCount);

    state = state.copyWith(
      score: isCorrect ? state.score + 1 : state.score,
      currentSequenceIndex: state.currentSequenceIndex + 1,
    );

    _showNextScreen();
  }

  void onNumberTapRecall(int num) {
    if (state.isGameOver || state.phase != CountingSpanPhase.recalling) return;

    final newUserSeq = [...state.userSequence, num];
    state = state.copyWith(userSequence: newUserSeq);

    final targetNum = state.sequence[newUserSeq.length - 1];
    if (num != targetNum) {
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
      phase: CountingSpanPhase.result,
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
