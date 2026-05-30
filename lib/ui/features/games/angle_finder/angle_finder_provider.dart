import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'angle_finder_engine.dart';

part 'angle_finder_provider.g.dart';

class AngleFinderState {
  final AngleProblem? currentProblem;
  final bool isGameOver;
  final bool isVictory;
  final int score;
  final int timeLeft;
  final bool isLoading;

  AngleFinderState({
    this.currentProblem,
    this.isGameOver = false,
    this.isVictory = false,
    this.score = 0,
    this.timeLeft = 60,
    this.isLoading = true,
  });

  AngleFinderState copyWith({
    AngleProblem? currentProblem,
    bool? isGameOver,
    bool? isVictory,
    int? score,
    int? timeLeft,
    bool? isLoading,
  }) {
    return AngleFinderState(
      currentProblem: currentProblem ?? this.currentProblem,
      isGameOver: isGameOver ?? this.isGameOver,
      isVictory: isVictory ?? this.isVictory,
      score: score ?? this.score,
      timeLeft: timeLeft ?? this.timeLeft,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class AngleFinderNotifier extends _$AngleFinderNotifier {
  final _engine = AngleFinderEngine();

  @override
  AngleFinderState build() {
    return AngleFinderState();
  }

  void initGame() {
    state = AngleFinderState(
      currentProblem: _engine.generateProblem(0),
      isLoading: false,
    );
  }

  void selectOption(int option) {
    if (state.isGameOver || state.isVictory) return;

    if (option == state.currentProblem!.answer) {
      final nextScore = state.score + 1;
      if (nextScore >= 10) {
        state = state.copyWith(isVictory: true, score: nextScore);
      } else {
        state = state.copyWith(
          score: nextScore,
          currentProblem: _engine.generateProblem(nextScore),
        );
      }
    } else {
      state = state.copyWith(isGameOver: true);
    }
  }
}
