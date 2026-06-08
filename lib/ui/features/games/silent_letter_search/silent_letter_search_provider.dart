import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'silent_letter_search_engine.dart';

part 'silent_letter_search_provider.g.dart';

class SilentLetterSearchState {
  final String word;
  final List<int> silentIndices;
  final List<int> selectedIndices;
  final bool isGameOver;
  final bool isGameWon;
  final bool isLoading;

  SilentLetterSearchState({
    required this.word,
    required this.silentIndices,
    this.selectedIndices = const [],
    this.isGameOver = false,
    this.isGameWon = false,
    this.isLoading = true,
  });

  SilentLetterSearchState copyWith({
    String? word,
    List<int>? silentIndices,
    List<int>? selectedIndices,
    bool? isGameOver,
    bool? isGameWon,
    bool? isLoading,
  }) {
    return SilentLetterSearchState(
      word: word ?? this.word,
      silentIndices: silentIndices ?? this.silentIndices,
      selectedIndices: selectedIndices ?? this.selectedIndices,
      isGameOver: isGameOver ?? this.isGameOver,
      isGameWon: isGameWon ?? this.isGameWon,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class SilentLetterSearchNotifier extends _$SilentLetterSearchNotifier {
  final _engine = SilentLetterSearchEngine();

  @override
  SilentLetterSearchState build() {
    return SilentLetterSearchState(word: '', silentIndices: []);
  }

  void initGame() {
    state = state.copyWith(isLoading: true);
    final silentWord = _engine.getRandomWord();
    state = SilentLetterSearchState(
      word: silentWord.word,
      silentIndices: silentWord.silentIndices,
      isLoading: false,
    );
  }

  void toggleLetter(int index) {
    if (state.isGameOver) return;
    
    final newSelected = List<int>.from(state.selectedIndices);
    if (newSelected.contains(index)) {
      newSelected.remove(index);
    } else {
      newSelected.add(index);
    }
    
    state = state.copyWith(selectedIndices: newSelected);
  }

  void submit() {
    if (state.isGameOver) return;
    
    final isCorrect = _engine.isCorrect(state.selectedIndices, state.silentIndices);
    if (isCorrect) {
      state = state.copyWith(isGameOver: true, isGameWon: true);
    } else {
      // In this game, we might want to show which ones were wrong or just reset
      // For now, let's just keep it simple
    }
  }
}
