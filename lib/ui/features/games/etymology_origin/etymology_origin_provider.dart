import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'etymology_origin_engine.dart';

part 'etymology_origin_provider.g.dart';

class EtymologyOriginState {
  final String word;
  final String correctLanguage;
  final List<String> options;
  final String description;
  final String? selectedLanguage;
  final bool isGameOver;
  final bool isGameWon;
  final bool isLoading;

  EtymologyOriginState({
    required this.word,
    required this.correctLanguage,
    required this.options,
    required this.description,
    this.selectedLanguage,
    this.isGameOver = false,
    this.isGameWon = false,
    this.isLoading = true,
  });

  EtymologyOriginState copyWith({
    String? word,
    String? correctLanguage,
    List<String>? options,
    String? description,
    String? selectedLanguage,
    bool? isGameOver,
    bool? isGameWon,
    bool? isLoading,
  }) {
    return EtymologyOriginState(
      word: word ?? this.word,
      correctLanguage: correctLanguage ?? this.correctLanguage,
      options: options ?? this.options,
      description: description ?? this.description,
      selectedLanguage: selectedLanguage ?? this.selectedLanguage,
      isGameOver: isGameOver ?? this.isGameOver,
      isGameWon: isGameWon ?? this.isGameWon,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class EtymologyOriginNotifier extends _$EtymologyOriginNotifier {
  final _engine = EtymologyOriginEngine();

  @override
  EtymologyOriginState build() {
    return EtymologyOriginState(word: '', correctLanguage: '', options: [], description: '');
  }

  void initGame() {
    state = state.copyWith(isLoading: true);
    final task = _engine.getRandomTask();
    
    state = EtymologyOriginState(
      word: task.word,
      correctLanguage: task.origin,
      options: task.options!,
      description: task.description,
      isLoading: false,
    );
  }

  void selectLanguage(String language) {
    if (state.isGameOver) return;

    final isCorrect = _engine.checkAnswer(language, state.correctLanguage);
    state = state.copyWith(
      selectedLanguage: language,
      isGameOver: true,
      isGameWon: isCorrect,
    );
  }
}
