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
    Object? selectedPosition = const _Unset(),
    Object? selectedWord = const _Unset(),
    MemoryPalaceStatus? status,
  }) {
    return MemoryPalaceState(
      assignments: assignments,
      userRecall: userRecall ?? this.userRecall,
      selectedPosition: selectedPosition is _Unset ? this.selectedPosition : selectedPosition as int?,
      selectedWord: selectedWord is _Unset ? this.selectedWord : selectedWord as String?,
      status: status ?? this.status,
      availableWords: availableWords,
    );
  }
}

/// Sentinel class used to distinguish "not provided" from explicit null in copyWith.
class _Unset {
  const _Unset();
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

      // If this word was already placed at another position, remove it from there
      newUserRecall.removeWhere((pos, w) => w == state.selectedWord);

      // If the target position already had a word, it will simply be overwritten
      newUserRecall[state.selectedPosition!] = state.selectedWord!;

      state = state.copyWith(
        userRecall: newUserRecall,
        selectedWord: null,     // explicit null — now works correctly
        selectedPosition: null, // explicit null — now works correctly
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
