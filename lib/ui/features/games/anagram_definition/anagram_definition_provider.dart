import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'anagram_definition_engine.dart';

part 'anagram_definition_provider.g.dart';

class AnagramDefinitionState {
  final String scrambled;
  final String target;
  final String definition;
  final String currentGuess;
  final bool isGameOver;
  final bool isGameWon;
  final bool isLoading;

  AnagramDefinitionState({
    required this.scrambled,
    required this.target,
    required this.definition,
    this.currentGuess = '',
    this.isGameOver = false,
    this.isGameWon = false,
    this.isLoading = true,
  });

  AnagramDefinitionState copyWith({
    String? scrambled,
    String? target,
    String? definition,
    String? currentGuess,
    bool? isGameOver,
    bool? isGameWon,
    bool? isLoading,
  }) {
    return AnagramDefinitionState(
      scrambled: scrambled ?? this.scrambled,
      target: target ?? this.target,
      definition: definition ?? this.definition,
      currentGuess: currentGuess ?? this.currentGuess,
      isGameOver: isGameOver ?? this.isGameOver,
      isGameWon: isGameWon ?? this.isGameWon,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class AnagramDefinitionNotifier extends _$AnagramDefinitionNotifier {
  final _engine = AnagramDefinitionEngine();

  @override
  AnagramDefinitionState build() {
    return AnagramDefinitionState(scrambled: '', target: '', definition: '');
  }

  void initGame() {
    state = state.copyWith(isLoading: true);
    final task = _engine.getRandomTask();
    
    state = AnagramDefinitionState(
      scrambled: task.scrambled,
      target: task.target,
      definition: task.definition,
      isLoading: false,
    );
  }

  void onLetterPressed(String letter) {
    if (state.isGameOver) return;
    if (state.currentGuess.length >= state.target.replaceAll(' ', '').length) return;
    
    state = state.copyWith(currentGuess: state.currentGuess + letter);
    
    if (state.currentGuess.length == state.target.replaceAll(' ', '').length) {
      submitGuess();
    }
  }

  void onBackspace() {
    if (state.isGameOver || state.currentGuess.isEmpty) return;
    state = state.copyWith(currentGuess: state.currentGuess.substring(0, state.currentGuess.length - 1));
  }

  void submitGuess() {
    if (state.isGameOver) return;
    
    final isCorrect = _engine.checkAnswer(state.currentGuess, state.target);
    if (isCorrect) {
      state = state.copyWith(isGameOver: true, isGameWon: true);
    } else {
      // Allow retry or just clear?
      state = state.copyWith(currentGuess: '');
    }
  }
}
