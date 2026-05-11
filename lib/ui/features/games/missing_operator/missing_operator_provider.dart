import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'missing_operator_engine.dart';

part 'missing_operator_provider.g.dart';

class MissingOperatorState {
  final MissingOperatorProblem? problem;
  final List<String?> userOperators;
  final int score;
  final bool isGameOver;
  final bool? isLastAnswerCorrect;

  MissingOperatorState({
    this.problem,
    required this.userOperators,
    this.score = 0,
    this.isGameOver = false,
    this.isLastAnswerCorrect,
  });

  MissingOperatorState copyWith({
    MissingOperatorProblem? problem,
    List<String?>? userOperators,
    int? score,
    bool? isGameOver,
    bool? isLastAnswerCorrect,
  }) {
    return MissingOperatorState(
      problem: problem ?? this.problem,
      userOperators: userOperators ?? this.userOperators,
      score: score ?? this.score,
      isGameOver: isGameOver ?? this.isGameOver,
      isLastAnswerCorrect: isLastAnswerCorrect ?? this.isLastAnswerCorrect,
    );
  }
}

@riverpod
class MissingOperatorNotifier extends _$MissingOperatorNotifier {
  final _engine = MissingOperatorEngine();

  @override
  MissingOperatorState build() => MissingOperatorState(userOperators: [null, null]);

  void initGame() {
    final problem = _engine.generateProblem();
    state = MissingOperatorState(
      problem: problem,
      userOperators: List.filled(problem.operators.length, null),
      score: state.score,
    );
  }

  void setOperator(int index, String op) {
    if (state.isGameOver) return;
    final newUserOps = List<String?>.from(state.userOperators);
    newUserOps[index] = op;
    state = state.copyWith(userOperators: newUserOps);
    
    if (!newUserOps.contains(null)) {
      _checkAnswer();
    }
  }

  void _checkAnswer() {
    final isCorrect = _engine.check(
      state.problem!.operands,
      state.userOperators.cast<String>(),
      state.problem!.result,
    );

    if (isCorrect) {
      state = state.copyWith(
        score: state.score + 1,
        isLastAnswerCorrect: true,
        isGameOver: true,
      );
    } else {
      state = state.copyWith(
        isLastAnswerCorrect: false,
        isGameOver: true,
      );
    }
  }
}
