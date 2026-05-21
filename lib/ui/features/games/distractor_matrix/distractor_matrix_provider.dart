import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../providers/user_providers.dart';
import 'distractor_matrix_engine.dart';

part 'distractor_matrix_provider.g.dart';

enum DistractorMatrixStatus {
  memorizing,
  distractor,
  playing,
  success,
  failure,
  completed
}

class DistractorMatrixState {
  final int currentLevel;
  final List<int> targetPattern;
  final Set<int> selectedPattern;
  final DistractorMatrixStatus status;
  final MathDistractor? mathQuestion;
  final bool? mathAnsweredCorrectly;
  final int boardSize;
  final int mathStrikes;
  final bool isWon;

  DistractorMatrixState({
    this.currentLevel = 1,
    this.targetPattern = const [],
    this.selectedPattern = const {},
    this.status = DistractorMatrixStatus.memorizing,
    this.mathQuestion,
    this.mathAnsweredCorrectly,
    this.boardSize = 4,
    this.mathStrikes = 0,
    this.isWon = false,
  });

  DistractorMatrixState copyWith({
    int? currentLevel,
    List<int>? targetPattern,
    Set<int>? selectedPattern,
    DistractorMatrixStatus? status,
    MathDistractor? mathQuestion,
    bool? mathAnsweredCorrectly,
    int? boardSize,
    int? mathStrikes,
    bool? isWon,
  }) {
    return DistractorMatrixState(
      currentLevel: currentLevel ?? this.currentLevel,
      targetPattern: targetPattern ?? this.targetPattern,
      selectedPattern: selectedPattern ?? this.selectedPattern,
      status: status ?? this.status,
      mathQuestion: mathQuestion ?? this.mathQuestion,
      mathAnsweredCorrectly: mathAnsweredCorrectly,
      boardSize: boardSize ?? this.boardSize,
      mathStrikes: mathStrikes ?? this.mathStrikes,
      isWon: isWon ?? this.isWon,
    );
  }
}

@riverpod
class DistractorMatrixNotifier extends _$DistractorMatrixNotifier {
  final _engine = DistractorMatrixEngine();
  Timer? _timer;

  @override
  DistractorMatrixState build() {
    ref.onDispose(() {
      _timer?.cancel();
    });
    Future.microtask(() => startLevel(1));
    return DistractorMatrixState();
  }

  void startLevel(int level) {
    _timer?.cancel();
    final tileCount = _engine.getTileCountForLevel(level);
    final pattern = _engine.generatePattern(4, tileCount);

    state = DistractorMatrixState(
      currentLevel: level,
      targetPattern: pattern,
      selectedPattern: {},
      status: DistractorMatrixStatus.memorizing,
      boardSize: 4,
      mathQuestion: null,
      mathAnsweredCorrectly: null,
      mathStrikes: 0,
    );

    _timer = Timer(const Duration(milliseconds: 3200), () {
      _goToDistractorPhase();
    });
  }

  void _goToDistractorPhase() {
    final math = _engine.generateMathQuestion();
    state = state.copyWith(
      status: DistractorMatrixStatus.distractor,
      mathQuestion: math,
      mathAnsweredCorrectly: null,
    );
  }

  void answerMath(int option) {
    if (state.status != DistractorMatrixStatus.distractor) return;

    final isCorrect = option == state.mathQuestion?.correctAnswer;
    if (isCorrect) {
      state = state.copyWith(
        mathAnsweredCorrectly: true,
      );
      // Transition to recall/playing phase after a brief pause
      _timer = Timer(const Duration(milliseconds: 600), () {
        state = state.copyWith(status: DistractorMatrixStatus.playing);
      });
    } else {
      final strikes = state.mathStrikes + 1;
      if (strikes >= 3) {
        state = state.copyWith(
          status: DistractorMatrixStatus.failure,
          mathAnsweredCorrectly: false,
          mathStrikes: strikes,
        );
      } else {
        state = state.copyWith(
          mathAnsweredCorrectly: false,
          mathStrikes: strikes,
        );
        // Generate a new math question
        _timer = Timer(const Duration(milliseconds: 800), () {
          _goToDistractorPhase();
        });
      }
    }
  }

  void selectTile(int index) {
    if (state.status != DistractorMatrixStatus.playing) return;
    if (state.selectedPattern.contains(index)) return;

    if (!state.targetPattern.contains(index)) {
      // Wrong tile selection -> Level fails
      state = state.copyWith(status: DistractorMatrixStatus.failure);
      return;
    }

    final newSelected = {...state.selectedPattern, index};
    state = state.copyWith(selectedPattern: newSelected);

    if (newSelected.length == state.targetPattern.length) {
      // Level succeeded
      state = state.copyWith(status: DistractorMatrixStatus.success);

      if (state.currentLevel >= 5) {
        _completeGame();
      } else {
        _timer = Timer(const Duration(milliseconds: 1200), () {
          startLevel(state.currentLevel + 1);
        });
      }
    }
  }

  void _completeGame() {
    state = state.copyWith(
      status: DistractorMatrixStatus.completed,
      isWon: true,
    );
    ref.read(gameStreakNotifierProvider.notifier).completeGame('distractor_matrix', xpAmount: 25);
  }

  void reset() {
    _timer?.cancel();
    startLevel(1);
  }
}
