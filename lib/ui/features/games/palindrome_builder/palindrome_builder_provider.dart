import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'palindrome_builder_engine.dart';

part 'palindrome_builder_provider.g.dart';

class PalindromeBuilderState {
  final String incomplete;
  final String solution;
  final String display;
  final String currentGuess;
  final bool isGameOver;
  final bool isGameWon;
  final bool isLoading;

  PalindromeBuilderState({
    required this.incomplete,
    required this.solution,
    required this.display,
    this.currentGuess = '',
    this.isGameOver = false,
    this.isGameWon = false,
    this.isLoading = true,
  });

  PalindromeBuilderState copyWith({
    String? incomplete,
    String? solution,
    String? display,
    String? currentGuess,
    bool? isGameOver,
    bool? isGameWon,
    bool? isLoading,
  }) {
    return PalindromeBuilderState(
      incomplete: incomplete ?? this.incomplete,
      solution: solution ?? this.solution,
      display: display ?? this.display,
      currentGuess: currentGuess ?? this.currentGuess,
      isGameOver: isGameOver ?? this.isGameOver,
      isGameWon: isGameWon ?? this.isGameWon,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class PalindromeBuilderNotifier extends _$PalindromeBuilderNotifier {
  final _engine = PalindromeBuilderEngine();

  @override
  PalindromeBuilderState build() {
    return PalindromeBuilderState(incomplete: '', solution: '', display: '');
  }

  void initGame() {
    state = state.copyWith(isLoading: true);
    final task = _engine.getRandomTask();
    state = PalindromeBuilderState(
      incomplete: task.incomplete,
      solution: task.solution,
      display: task.display,
      isLoading: false,
    );
  }

  void onLetterPressed(String letter) {
    if (state.isGameOver || state.currentGuess.length >= state.solution.length) return;
    state = state.copyWith(currentGuess: state.currentGuess + letter);
  }

  void onBackspace() {
    if (state.isGameOver || state.currentGuess.isEmpty) return;
    state = state.copyWith(currentGuess: state.currentGuess.substring(0, state.currentGuess.length - 1));
  }

  void submit() {
    if (state.isGameOver || state.currentGuess.length != state.solution.length) return;
    
    final isCorrect = _engine.checkSolution(state.currentGuess, state.solution);
    if (isCorrect) {
      state = state.copyWith(isGameOver: true, isGameWon: true);
    } else {
      state = state.copyWith(currentGuess: '');
    }
  }
}
