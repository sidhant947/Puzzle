import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'pangram_sprint_engine.dart';

part 'pangram_sprint_provider.g.dart';

class PangramSprintState {
  final List<String> availableWords;
  final List<String> selectedWords;
  final String targetSentence;
  final bool isGameOver;
  final bool isGameWon;
  final bool isLoading;
  final Set<String> lettersUsed;

  PangramSprintState({
    required this.availableWords,
    required this.selectedWords,
    required this.targetSentence,
    required this.lettersUsed,
    this.isGameOver = false,
    this.isGameWon = false,
    this.isLoading = true,
  });

  PangramSprintState copyWith({
    List<String>? availableWords,
    List<String>? selectedWords,
    String? targetSentence,
    Set<String>? lettersUsed,
    bool? isGameOver,
    bool? isGameWon,
    bool? isLoading,
  }) {
    return PangramSprintState(
      availableWords: availableWords ?? this.availableWords,
      selectedWords: selectedWords ?? this.selectedWords,
      targetSentence: targetSentence ?? this.targetSentence,
      lettersUsed: lettersUsed ?? this.lettersUsed,
      isGameOver: isGameOver ?? this.isGameOver,
      isGameWon: isGameWon ?? this.isGameWon,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class PangramSprintNotifier extends _$PangramSprintNotifier {
  final _engine = PangramSprintEngine();

  @override
  PangramSprintState build() {
    return PangramSprintState(
      availableWords: [],
      selectedWords: [],
      targetSentence: '',
      lettersUsed: {},
    );
  }

  void initGame() {
    state = state.copyWith(isLoading: true);
    final task = _engine.getRandomTask();
    final shuffledWords = List<String>.from(task.words)..shuffle();
    
    state = PangramSprintState(
      availableWords: shuffledWords,
      selectedWords: [],
      targetSentence: task.sentence,
      lettersUsed: {},
      isLoading: false,
    );
  }

  void selectWord(int index) {
    if (state.isGameOver) return;

    final word = state.availableWords[index];
    final newAvailable = List<String>.from(state.availableWords)..removeAt(index);
    final newSelected = List<String>.from(state.selectedWords)..add(word);
    
    _updateState(newAvailable, newSelected);
  }

  void deselectWord(int index) {
    if (state.isGameOver) return;

    final word = state.selectedWords[index];
    final newSelected = List<String>.from(state.selectedWords)..removeAt(index);
    final newAvailable = List<String>.from(state.availableWords)..add(word);
    
    _updateState(newAvailable, newSelected);
  }

  void _updateState(List<String> available, List<String> selected) {
    final currentSentence = selected.join(' ');
    final letters = currentSentence.toLowerCase().replaceAll(RegExp(r'[^a-z]'), '').split('').toSet();
    
    final isWon = letters.length == 26;
    
    state = state.copyWith(
      availableWords: available,
      selectedWords: selected,
      lettersUsed: letters,
      isGameOver: isWon,
      isGameWon: isWon,
    );
  }
}
