import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'fraction_match_engine.dart';

part 'fraction_match_provider.g.dart';

class FractionMatchState {
  final int numerator;
  final int denominator;
  final List<String> options;
  final String correctAnswer;
  final int score;
  final bool isGameOver;
  final bool isLoading;

  FractionMatchState({
    this.numerator = 0,
    this.denominator = 1,
    this.options = const [],
    this.correctAnswer = '',
    this.score = 0,
    this.isGameOver = false,
    this.isLoading = true,
  });

  FractionMatchState copyWith({
    int? numerator,
    int? denominator,
    List<String>? options,
    String? correctAnswer,
    int? score,
    bool? isGameOver,
    bool? isLoading,
  }) {
    return FractionMatchState(
      numerator: numerator ?? this.numerator,
      denominator: denominator ?? this.denominator,
      options: options ?? this.options,
      correctAnswer: correctAnswer ?? this.correctAnswer,
      score: score ?? this.score,
      isGameOver: isGameOver ?? this.isGameOver,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class FractionMatchNotifier extends _$FractionMatchNotifier {
  final _engine = FractionMatchEngine();

  @override
  FractionMatchState build() {
    return FractionMatchState();
  }

  void initGame() {
    final level = _engine.generateLevel(0);
    state = FractionMatchState(
      numerator: level.numerator,
      denominator: level.denominator,
      options: level.options,
      correctAnswer: level.correctAnswer,
      isLoading: false,
    );
  }

  void onOptionTap(String option) {
    if (state.isGameOver) return;

    if (option == state.correctAnswer) {
      final newScore = state.score + 1;
      final nextLevel = _engine.generateLevel(newScore);
      state = state.copyWith(
        score: newScore,
        numerator: nextLevel.numerator,
        denominator: nextLevel.denominator,
        options: nextLevel.options,
        correctAnswer: nextLevel.correctAnswer,
      );
    } else {
      state = state.copyWith(isGameOver: true);
    }
  }

  void resetGame() {
    state = FractionMatchState(score: 0, isLoading: false);
    initGame();
  }
}
