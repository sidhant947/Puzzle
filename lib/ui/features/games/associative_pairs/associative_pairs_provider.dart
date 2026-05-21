import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../providers/user_providers.dart';
import 'associative_pairs_engine.dart';

part 'associative_pairs_provider.g.dart';

enum AssociativeStatus {
  memorizing,
  questioning,
  success,
  failure,
  completed
}

class AssociativePairsState {
  final int currentLevel;
  final AssociativeStatus status;
  final List<AssociationPair> pairs;
  final List<AssociativeQuestion> questions;
  final int currentQuestionIndex;
  final dynamic selectedOption;
  final bool? isCorrect;
  final bool isWon;

  AssociativePairsState({
    this.currentLevel = 1,
    this.status = AssociativeStatus.memorizing,
    this.pairs = const [],
    this.questions = const [],
    this.currentQuestionIndex = 0,
    this.selectedOption,
    this.isCorrect,
    this.isWon = false,
  });

  AssociativePairsState copyWith({
    int? currentLevel,
    AssociativeStatus? status,
    List<AssociationPair>? pairs,
    List<AssociativeQuestion>? questions,
    int? currentQuestionIndex,
    dynamic selectedOption,
    bool? isCorrect,
    bool? isWon,
  }) {
    return AssociativePairsState(
      currentLevel: currentLevel ?? this.currentLevel,
      status: status ?? this.status,
      pairs: pairs ?? this.pairs,
      questions: questions ?? this.questions,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      selectedOption: selectedOption,
      isCorrect: isCorrect,
      isWon: isWon ?? this.isWon,
    );
  }
}

@riverpod
class AssociativePairsNotifier extends _$AssociativePairsNotifier {
  final _engine = AssociativePairsEngine();
  Timer? _timer;

  @override
  AssociativePairsState build() {
    ref.onDispose(() {
      _timer?.cancel();
    });
    Future.microtask(() => startLevel(1));
    return AssociativePairsState();
  }

  void startLevel(int level) {
    _timer?.cancel();
    final count = _engine.getPairsCountForLevel(level);
    final pairs = _engine.generatePairs(count);
    final questions = _engine.generateQuestions(pairs);

    state = AssociativePairsState(
      currentLevel: level,
      status: AssociativeStatus.memorizing,
      pairs: pairs,
      questions: questions,
      currentQuestionIndex: 0,
      selectedOption: null,
      isCorrect: null,
    );
  }

  void startTesting() {
    if (state.status != AssociativeStatus.memorizing) return;
    state = state.copyWith(
      status: AssociativeStatus.questioning,
      currentQuestionIndex: 0,
    );
  }

  void answerQuestion(dynamic option) {
    if (state.status != AssociativeStatus.questioning) return;

    final question = state.questions[state.currentQuestionIndex];
    final isCorrect = option == question.correctOption;

    state = state.copyWith(
      selectedOption: option,
      isCorrect: isCorrect,
    );

    if (isCorrect) {
      _timer = Timer(const Duration(milliseconds: 1000), () {
        if (state.currentQuestionIndex == state.questions.length - 1) {
          // Finished all questions for this level
          state = state.copyWith(status: AssociativeStatus.success);
          
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
      state = state.copyWith(status: AssociativeStatus.failure);
    }
  }

  void _completeGame() {
    state = state.copyWith(
      status: AssociativeStatus.completed,
      isWon: true,
    );
    ref.read(gameStreakNotifierProvider.notifier).completeGame('associative_pairs', xpAmount: 25);
  }

  void reset() {
    _timer?.cancel();
    startLevel(1);
  }
}
