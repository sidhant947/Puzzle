import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../providers/user_providers.dart';
import 'context_clues_engine.dart';

part 'context_clues_provider.g.dart';

enum ContextCluesStatus {
  playing,
  success,
  failure,
  completed
}

class ContextCluesState {
  final int currentLevel;
  final ContextCluesStatus status;
  final List<ClueQuestion> questions;
  final int currentQuestionIndex;
  final String? selectedOption;
  final bool? isCorrect;
  final bool isWon;

  ContextCluesState({
    this.currentLevel = 1,
    this.status = ContextCluesStatus.playing,
    this.questions = const [],
    this.currentQuestionIndex = 0,
    this.selectedOption,
    this.isCorrect,
    this.isWon = false,
  });

  ContextCluesState copyWith({
    int? currentLevel,
    ContextCluesStatus? status,
    List<ClueQuestion>? questions,
    int? currentQuestionIndex,
    String? selectedOption,
    bool? isCorrect,
    bool? isWon,
  }) {
    return ContextCluesState(
      currentLevel: currentLevel ?? this.currentLevel,
      status: status ?? this.status,
      questions: questions ?? this.questions,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      selectedOption: selectedOption,
      isCorrect: isCorrect,
      isWon: isWon ?? this.isWon,
    );
  }
}

@riverpod
class ContextCluesNotifier extends _$ContextCluesNotifier {
  final _engine = ContextCluesEngine();
  Timer? _timer;

  @override
  ContextCluesState build() {
    ref.onDispose(() {
      _timer?.cancel();
    });
    Future.microtask(() => startLevel(1));
    return ContextCluesState();
  }

  void startLevel(int level) {
    _timer?.cancel();
    final questions = _engine.generateQuestionsForLevel(level);

    state = ContextCluesState(
      currentLevel: level,
      status: ContextCluesStatus.playing,
      questions: questions,
      currentQuestionIndex: 0,
      selectedOption: null,
      isCorrect: null,
    );
  }

  void answerQuestion(String option) {
    if (state.status != ContextCluesStatus.playing) return;

    final question = state.questions[state.currentQuestionIndex];
    final isCorrect = _engine.validateAnswer(question, option);

    state = state.copyWith(
      selectedOption: option,
      isCorrect: isCorrect,
    );

    if (isCorrect) {
      _timer = Timer(const Duration(milliseconds: 1000), () {
        if (state.currentQuestionIndex == state.questions.length - 1) {
          // Level success
          state = state.copyWith(status: ContextCluesStatus.success);
          
          _timer = Timer(const Duration(milliseconds: 1200), () {
            if (state.currentLevel >= 5) {
              _completeGame();
            } else {
              startLevel(state.currentLevel + 1);
            }
          });
        } else {
          // Go to next question
          state = state.copyWith(
            currentQuestionIndex: state.currentQuestionIndex + 1,
            selectedOption: null,
            isCorrect: null,
          );
        }
      });
    } else {
      state = state.copyWith(status: ContextCluesStatus.failure);
    }
  }

  void _completeGame() {
    state = state.copyWith(
      status: ContextCluesStatus.completed,
      isWon: true,
    );
    ref.read(gameStreakNotifierProvider.notifier).completeGame('context_clues', xpAmount: 25);
  }

  void reset() {
    _timer?.cancel();
    startLevel(1);
  }
}
