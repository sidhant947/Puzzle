import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'verbal_analogies_engine.dart';

part 'verbal_analogies_provider.g.dart';

class VerbalAnalogiesState {
  final Analogy? currentAnalogy;
  final int score;
  final int targetScore;
  final bool isVictory;
  final bool isLoading;
  final String? selectedOption;
  final bool? isCorrect;

  VerbalAnalogiesState({
    this.currentAnalogy,
    this.score = 0,
    this.targetScore = 10,
    this.isVictory = false,
    this.isLoading = true,
    this.selectedOption,
    this.isCorrect,
  });

  VerbalAnalogiesState copyWith({
    Analogy? currentAnalogy,
    int? score,
    int? targetScore,
    bool? isVictory,
    bool? isLoading,
    String? selectedOption,
    bool? isCorrect,
  }) {
    return VerbalAnalogiesState(
      currentAnalogy: currentAnalogy ?? this.currentAnalogy,
      score: score ?? this.score,
      targetScore: targetScore ?? this.targetScore,
      isVictory: isVictory ?? this.isVictory,
      isLoading: isLoading ?? this.isLoading,
      selectedOption: selectedOption, // Allow nulling out
      isCorrect: isCorrect, // Allow nulling out
    );
  }
}

@riverpod
class VerbalAnalogiesNotifier extends _$VerbalAnalogiesNotifier {
  final _engine = VerbalAnalogiesEngine();

  @override
  VerbalAnalogiesState build() {
    return VerbalAnalogiesState();
  }

  void initGame() {
    state = VerbalAnalogiesState(
      currentAnalogy: _engine.getRandomAnalogy(),
      isLoading: false,
    );
  }

  void selectOption(String option) {
    if (state.isVictory || state.selectedOption != null) return;

    final isCorrect = option == state.currentAnalogy!.answer;
    final newScore = isCorrect ? state.score + 1 : state.score;
    
    state = state.copyWith(
      selectedOption: option,
      isCorrect: isCorrect,
      score: newScore,
    );

    if (newScore >= state.targetScore) {
      state = state.copyWith(isVictory: true);
    } else {
      Future.delayed(const Duration(milliseconds: 1000), () {
        if (state.isVictory) return;
        state = state.copyWith(
          currentAnalogy: _engine.getRandomAnalogy(),
          selectedOption: null,
          isCorrect: null,
        );
      });
    }
  }
}
