import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'memory_palace_engine.dart';

part 'memory_palace_provider.g.dart';

enum MemoryPalaceStatus { memorizing, recalling, success, failure }

class MemoryPalaceState {
  final Map<int, String> assignments;
  final Map<int, String> userRecall;
  final int? selectedPosition;
  final String? selectedWord;
  final MemoryPalaceStatus status;
  final List<String> availableWords;

  MemoryPalaceState({
    required this.assignments,
    required this.userRecall,
    this.selectedPosition,
    this.selectedWord,
    required this.status,
    required this.availableWords,
  });

  MemoryPalaceState copyWith({
    Map<int, String>? userRecall,
    int? selectedPosition,
    String? selectedWord,
    MemoryPalaceStatus? status,
  }) {
    return MemoryPalaceState(
      assignments: assignments,
      userRecall: userRecall ?? this.userRecall,
      selectedPosition: selectedPosition ?? this.selectedPosition,
      selectedWord: selectedWord ?? this.selectedWord,
      status: status ?? this.status,
      availableWords: availableWords,
    );
  }
}

@riverpod
class MemoryPalaceNotifier extends _$MemoryPalaceNotifier {
  @override
  MemoryPalaceState build() {
    return _createGame();
  }

  MemoryPalaceState _createGame() {
    // Fill all 9 cells for a harder experience
    const int wordCount = 9;

    final assignments = MemoryPalaceEngine.generateLevel(wordCount);
    final availableWords = assignments.values.toList()..shuffle();

    return MemoryPalaceState(
      assignments: assignments,
      userRecall: {},
      status: MemoryPalaceStatus.memorizing,
      availableWords: availableWords,
    );
  }

  void startRecalling() {
    state = state.copyWith(status: MemoryPalaceStatus.recalling);
  }

  void selectWord(String word) {
    state = state.copyWith(selectedWord: word);
    _checkAssignment();
  }

  void selectPosition(int pos) {
    state = state.copyWith(selectedPosition: pos);
    _checkAssignment();
  }

  void _checkAssignment() {
    if (state.selectedWord != null && state.selectedPosition != null) {
      final newUserRecall = Map<int, String>.from(state.userRecall);
      newUserRecall[state.selectedPosition!] = state.selectedWord!;
      
      state = state.copyWith(
        userRecall: newUserRecall,
        selectedWord: null,
        selectedPosition: null,
      );

      if (newUserRecall.length == state.assignments.length) {
        bool allCorrect = true;
        state.assignments.forEach((pos, word) {
          if (newUserRecall[pos] != word) allCorrect = false;
        });
        state = state.copyWith(status: allCorrect ? MemoryPalaceStatus.success : MemoryPalaceStatus.failure);
      }
    }
  }

  void reset() {
    state = _createGame();
  }
}
