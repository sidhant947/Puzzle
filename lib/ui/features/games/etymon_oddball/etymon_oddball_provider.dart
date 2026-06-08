import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'etymon_oddball_engine.dart';

part 'etymon_oddball_provider.g.dart';

class EtymonOddballState {
  final List<String> words;
  final String correctWord;
  final String description;
  final String? selectedWord;
  final bool isGameOver;
  final bool isGameWon;
  final bool isLoading;

  EtymonOddballState({
    required this.words,
    required this.correctWord,
    required this.description,
    this.selectedWord,
    this.isGameOver = false,
    this.isGameWon = false,
    this.isLoading = true,
  });

  EtymonOddballState copyWith({
    List<String>? words,
    String? correctWord,
    String? description,
    String? selectedWord,
    bool? isGameOver,
    bool? isGameWon,
    bool? isLoading,
  }) {
    return EtymonOddballState(
      words: words ?? this.words,
      correctWord: correctWord ?? this.correctWord,
      description: description ?? this.description,
      selectedWord: selectedWord ?? this.selectedWord,
      isGameOver: isGameOver ?? this.isGameOver,
      isGameWon: isGameWon ?? this.isGameWon,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class EtymonOddballNotifier extends _$EtymonOddballNotifier {
  final _engine = EtymonOddballEngine();

  @override
  EtymonOddballState build() {
    return EtymonOddballState(words: [], correctWord: '', description: '');
  }

  void initGame() {
    state = state.copyWith(isLoading: true);
    final task = _engine.getRandomTask();
    final shuffledWords = List<String>.from(task.words)..shuffle();
    
    state = EtymonOddballState(
      words: shuffledWords,
      correctWord: task.oddball,
      description: task.description,
      isLoading: false,
    );
  }

  void selectWord(String word) {
    if (state.isGameOver) return;

    final isCorrect = _engine.checkAnswer(word, state.correctWord);
    state = state.copyWith(
      selectedWord: word,
      isGameOver: true,
      isGameWon: isCorrect,
    );
  }
}
