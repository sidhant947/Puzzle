import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'd2_attention_engine.dart';
import '../../../../providers/user_providers.dart';

part 'd2_attention_provider.g.dart';

class D2AttentionState {
  final List<D2Item> board;
  final Set<int> selectedIds;
  final int currentBoardIndex;
  final int totalBoards;
  final int score;
  final int errors;
  final bool isCompleted;

  D2AttentionState({
    required this.board,
    required this.selectedIds,
    required this.currentBoardIndex,
    required this.totalBoards,
    required this.score,
    required this.errors,
    required this.isCompleted,
  });

  D2AttentionState copyWith({
    List<D2Item>? board,
    Set<int>? selectedIds,
    int? currentBoardIndex,
    int? totalBoards,
    int? score,
    int? errors,
    bool? isCompleted,
  }) {
    return D2AttentionState(
      board: board ?? this.board,
      selectedIds: selectedIds ?? this.selectedIds,
      currentBoardIndex: currentBoardIndex ?? this.currentBoardIndex,
      totalBoards: totalBoards ?? this.totalBoards,
      score: score ?? this.score,
      errors: errors ?? this.errors,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}

@riverpod
class D2AttentionNotifier extends _$D2AttentionNotifier {
  final D2AttentionEngine _engine = D2AttentionEngine();
  static const int maxBoards = 3;

  @override
  D2AttentionState build() {
    return D2AttentionState(
      board: _engine.generateBoard(),
      selectedIds: {},
      currentBoardIndex: 1,
      totalBoards: maxBoards,
      score: 0,
      errors: 0,
      isCompleted: false,
    );
  }

  void toggleItemSelection(int id) {
    if (state.isCompleted) return;

    final newSelected = {...state.selectedIds};
    if (newSelected.contains(id)) {
      newSelected.remove(id);
    } else {
      newSelected.add(id);
    }

    state = state.copyWith(selectedIds: newSelected);
  }

  void submitBoard() {
    if (state.isCompleted) return;

    int hits = 0;
    int falseAlarms = 0;
    int misses = 0;

    for (final item in state.board) {
      final isSelected = state.selectedIds.contains(item.id);
      if (item.isTarget) {
        if (isSelected) {
          hits++;
        } else {
          misses++;
        }
      } else {
        if (isSelected) {
          falseAlarms++;
        }
      }
    }

    final boardScore = (hits * 100) - ((falseAlarms + misses) * 30);
    final boardErrors = falseAlarms + misses;

    final nextBoardIndex = state.currentBoardIndex + 1;
    if (nextBoardIndex > state.totalBoards) {
      state = state.copyWith(
        score: (state.score + boardScore).clamp(0, 9999),
        errors: state.errors + boardErrors,
        isCompleted: true,
      );
      ref.read(gameStreakNotifierProvider.notifier).completeGame('d2_attention', xpAmount: 25);
    } else {
      state = state.copyWith(
        score: (state.score + boardScore).clamp(0, 9999),
        errors: state.errors + boardErrors,
        board: _engine.generateBoard(),
        selectedIds: {},
        currentBoardIndex: nextBoardIndex,
      );
    }
  }

  void reset() {
    state = D2AttentionState(
      board: _engine.generateBoard(),
      selectedIds: {},
      currentBoardIndex: 1,
      totalBoards: maxBoards,
      score: 0,
      errors: 0,
      isCompleted: false,
    );
  }
}
