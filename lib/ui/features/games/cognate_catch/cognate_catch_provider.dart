import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'cognate_catch_engine.dart';

part 'cognate_catch_provider.g.dart';

class CognateCatchState {
  final String word1;
  final String word2;
  final String language;
  final bool isCognate;
  final String description;
  final bool? selectedIsCognate;
  final bool isGameOver;
  final bool isGameWon;
  final bool isLoading;

  CognateCatchState({
    required this.word1,
    required this.word2,
    required this.language,
    required this.isCognate,
    required this.description,
    this.selectedIsCognate,
    this.isGameOver = false,
    this.isGameWon = false,
    this.isLoading = true,
  });

  CognateCatchState copyWith({
    String? word1,
    String? word2,
    String? language,
    bool? isCognate,
    String? description,
    bool? selectedIsCognate,
    bool? isGameOver,
    bool? isGameWon,
    bool? isLoading,
  }) {
    return CognateCatchState(
      word1: word1 ?? this.word1,
      word2: word2 ?? this.word2,
      language: language ?? this.language,
      isCognate: isCognate ?? this.isCognate,
      description: description ?? this.description,
      selectedIsCognate: selectedIsCognate ?? this.selectedIsCognate,
      isGameOver: isGameOver ?? this.isGameOver,
      isGameWon: isGameWon ?? this.isGameWon,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class CognateCatchNotifier extends _$CognateCatchNotifier {
  final _engine = CognateCatchEngine();

  @override
  CognateCatchState build() {
    return CognateCatchState(word1: '', word2: '', language: '', isCognate: false, description: '');
  }

  void initGame() {
    state = state.copyWith(isLoading: true);
    final task = _engine.getRandomTask();
    
    state = CognateCatchState(
      word1: task.word1,
      word2: task.word2,
      language: task.language,
      isCognate: task.isCognate,
      description: task.description,
      isLoading: false,
    );
  }

  void selectAnswer(bool isCognate) {
    if (state.isGameOver) return;

    final isCorrect = _engine.checkAnswer(isCognate, state.isCognate);
    state = state.copyWith(
      selectedIsCognate: isCognate,
      isGameOver: true,
      isGameWon: isCorrect,
    );
  }
}
