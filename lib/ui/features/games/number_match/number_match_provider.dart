import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../providers/user_providers.dart';
import 'number_match_engine.dart';

part 'number_match_provider.g.dart';

class NumberMatchState {
  final List<int> numbers;
  final List<bool> cleared;
  final int? selectedIndex;
  final bool isWon;
  final bool noMoreMoves;

  NumberMatchState({
    required this.numbers,
    required this.cleared,
    this.selectedIndex,
    this.isWon = false,
    this.noMoreMoves = false,
  });

  NumberMatchState copyWith({
    List<int>? numbers,
    List<bool>? cleared,
    int? selectedIndex,
    bool? isWon,
    bool? noMoreMoves,
    bool clearSelectedIndex = false,
  }) {
    return NumberMatchState(
      numbers: numbers ?? this.numbers,
      cleared: cleared ?? this.cleared,
      selectedIndex: clearSelectedIndex ? null : (selectedIndex ?? this.selectedIndex),
      isWon: isWon ?? this.isWon,
      noMoreMoves: noMoreMoves ?? this.noMoreMoves,
    );
  }
}

@riverpod
class NumberMatchNotifier extends _$NumberMatchNotifier {
  final _engine = NumberMatchEngine();

  @override
  NumberMatchState build() {
    final numbers = _engine.generateInitialBoard();
    return NumberMatchState(
      numbers: numbers,
      cleared: List.filled(numbers.length, false),
      noMoreMoves: !_engine.hasPossibleMoves(numbers, List.filled(numbers.length, false)),
    );
  }

  void reset() {
    final numbers = _engine.generateInitialBoard();
    state = NumberMatchState(
      numbers: numbers,
      cleared: List.filled(numbers.length, false),
      noMoreMoves: !_engine.hasPossibleMoves(numbers, List.filled(numbers.length, false)),
    );
  }

  void selectCell(int index) {
    if (state.isWon) return;
    if (state.cleared[index]) return;

    if (state.selectedIndex == null) {
      state = state.copyWith(selectedIndex: index);
    } else {
      if (state.selectedIndex == index) {
        state = state.copyWith(clearSelectedIndex: true);
      } else {
        bool isValid = _engine.isValidPair(state.selectedIndex!, index, state.numbers, state.cleared);
        if (isValid) {
          final newCleared = List<bool>.from(state.cleared);
          newCleared[state.selectedIndex!] = true;
          newCleared[index] = true;

          bool won = !newCleared.contains(false);
          bool noMoves = false;
          if (!won) {
             noMoves = !_engine.hasPossibleMoves(state.numbers, newCleared);
          }

          state = state.copyWith(
            cleared: newCleared,
            clearSelectedIndex: true,
            isWon: won,
            noMoreMoves: noMoves,
          );

          if (won) {
            ref.read(gameStreakNotifierProvider.notifier).completeGame('number_match', xpAmount: 30);
          }
        } else {
          // Invalid pair, select the new one instead
          state = state.copyWith(selectedIndex: index);
        }
      }
    }
  }

  void addRows() {
    if (state.isWon) return;

    List<int> remainingNumbers = [];
    for (int i = 0; i < state.numbers.length; i++) {
      if (!state.cleared[i]) {
        remainingNumbers.add(state.numbers[i]);
      }
    }

    if (remainingNumbers.isEmpty) return;

    final newNumbers = List<int>.from(state.numbers)..addAll(remainingNumbers);
    final newCleared = List<bool>.from(state.cleared)..addAll(List.filled(remainingNumbers.length, false));

    state = state.copyWith(
      numbers: newNumbers,
      cleared: newCleared,
      clearSelectedIndex: true,
      noMoreMoves: !_engine.hasPossibleMoves(newNumbers, newCleared),
    );
  }
}
