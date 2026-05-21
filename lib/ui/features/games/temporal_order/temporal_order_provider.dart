import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../providers/user_providers.dart';
import 'temporal_order_engine.dart';

part 'temporal_order_provider.g.dart';

enum TemporalOrderStatus {
  showingSequence,
  questioning,
  success,
  failure,
  completed
}

class TemporalOrderState {
  final int currentLevel;
  final int currentRound;
  final TemporalOrderStatus status;
  final List<int> sequence;
  final int currentIndexInSequence;
  final TemporalQuestion? question;
  final int? selectedItem;
  final bool? isCorrect;
  final bool isWon;

  TemporalOrderState({
    this.currentLevel = 1,
    this.currentRound = 1,
    this.status = TemporalOrderStatus.showingSequence,
    this.sequence = const [],
    this.currentIndexInSequence = 0,
    this.question,
    this.selectedItem,
    this.isCorrect,
    this.isWon = false,
  });

  TemporalOrderState copyWith({
    int? currentLevel,
    int? currentRound,
    TemporalOrderStatus? status,
    List<int>? sequence,
    int? currentIndexInSequence,
    TemporalQuestion? question,
    int? selectedItem,
    bool? isCorrect,
    bool? isWon,
  }) {
    return TemporalOrderState(
      currentLevel: currentLevel ?? this.currentLevel,
      currentRound: currentRound ?? this.currentRound,
      status: status ?? this.status,
      sequence: sequence ?? this.sequence,
      currentIndexInSequence: currentIndexInSequence ?? this.currentIndexInSequence,
      question: question ?? this.question,
      selectedItem: selectedItem,
      isCorrect: isCorrect,
      isWon: isWon ?? this.isWon,
    );
  }
}

@riverpod
class TemporalOrderNotifier extends _$TemporalOrderNotifier {
  final _engine = TemporalOrderEngine();
  Timer? _playbackTimer;
  Timer? _transitionTimer;

  @override
  TemporalOrderState build() {
    ref.onDispose(() {
      _playbackTimer?.cancel();
      _transitionTimer?.cancel();
    });
    Future.microtask(() => startRound(1, 1));
    return TemporalOrderState();
  }

  void startRound(int level, int round) {
    _playbackTimer?.cancel();
    _transitionTimer?.cancel();

    final seqLength = _engine.getSequenceLengthForLevel(level);
    final sequence = _engine.generateSequence(seqLength);

    state = TemporalOrderState(
      currentLevel: level,
      currentRound: round,
      status: TemporalOrderStatus.showingSequence,
      sequence: sequence,
      currentIndexInSequence: 0,
      question: null,
      selectedItem: null,
      isCorrect: null,
    );

    _startPlayback();
  }

  void _startPlayback() {
    _playbackTimer = Timer.periodic(const Duration(milliseconds: 1400), (timer) {
      final nextIdx = state.currentIndexInSequence + 1;
      if (nextIdx < state.sequence.length) {
        state = state.copyWith(currentIndexInSequence: nextIdx);
      } else {
        _playbackTimer?.cancel();
        // Go to question phase
        _transitionToQuestion();
      }
    });
  }

  void _transitionToQuestion() {
    final question = _engine.generateQuestion(state.sequence);
    state = state.copyWith(
      status: TemporalOrderStatus.questioning,
      question: question,
    );
  }

  void selectOption(int item) {
    if (state.status != TemporalOrderStatus.questioning) return;

    final question = state.question;
    if (question == null) return;

    final isCorrect = item == question.correctItem;
    state = state.copyWith(
      selectedItem: item,
      isCorrect: isCorrect,
    );

    if (isCorrect) {
      state = state.copyWith(status: TemporalOrderStatus.success);
      _transitionTimer = Timer(const Duration(milliseconds: 1200), () {
        if (state.currentRound >= 3) {
          if (state.currentLevel >= 5) {
            _completeGame();
          } else {
            startRound(state.currentLevel + 1, 1);
          }
        } else {
          startRound(state.currentLevel, state.currentRound + 1);
        }
      });
    } else {
      state = state.copyWith(status: TemporalOrderStatus.failure);
    }
  }

  void _completeGame() {
    state = state.copyWith(
      status: TemporalOrderStatus.completed,
      isWon: true,
    );
    ref.read(gameStreakNotifierProvider.notifier).completeGame('temporal_order', xpAmount: 25);
  }

  void reset() {
    _playbackTimer?.cancel();
    _transitionTimer?.cancel();
    startRound(1, 1);
  }
}
