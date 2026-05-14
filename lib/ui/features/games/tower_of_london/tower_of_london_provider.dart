import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'tower_of_london_engine.dart';

part 'tower_of_london_provider.g.dart';

class TowerOfLondonState {
  final List<List<int>> currentConfig;
  final List<List<int>> targetConfig;
  final int moves;
  final int maxMoves;
  final bool isGameOver;
  final bool isVictory;
  final int? selectedPeg;
  final bool isLoading;

  TowerOfLondonState({
    required this.currentConfig,
    required this.targetConfig,
    this.moves = 0,
    this.maxMoves = 0,
    this.isGameOver = false,
    this.isVictory = false,
    this.selectedPeg,
    this.isLoading = true,
  });

  TowerOfLondonState copyWith({
    List<List<int>>? currentConfig,
    List<List<int>>? targetConfig,
    int? moves,
    int? maxMoves,
    bool? isGameOver,
    bool? isVictory,
    int? selectedPeg,
    bool? isLoading,
  }) {
    return TowerOfLondonState(
      currentConfig: currentConfig ?? this.currentConfig,
      targetConfig: targetConfig ?? this.targetConfig,
      moves: moves ?? this.moves,
      maxMoves: maxMoves ?? this.maxMoves,
      isGameOver: isGameOver ?? this.isGameOver,
      isVictory: isVictory ?? this.isVictory,
      selectedPeg: selectedPeg != null ? (selectedPeg == -1 ? null : selectedPeg) : this.selectedPeg,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class TowerOfLondonNotifier extends _$TowerOfLondonNotifier {
  final _engine = TowerOfLondonEngine();

  @override
  TowerOfLondonState build() {
    return TowerOfLondonState(
      currentConfig: [[], [], []],
      targetConfig: [[], [], []],
    );
  }

  void initGame() {
    // Generate a puzzle with at least 5 moves solution
    final puzzle = _engine.generatePuzzle(minMoves: 5);
    final start = puzzle['start']!;
    final target = puzzle['target']!;
    final optimalMoves = _engine.solve(start, target);

    state = TowerOfLondonState(
      currentConfig: start,
      targetConfig: target,
      maxMoves: (optimalMoves * 1.5).ceil().clamp(optimalMoves + 2, 20),
      isLoading: false,
    );
  }

  void selectPeg(int index) {
    if (state.isGameOver) return;

    if (state.selectedPeg == null) {
      if (state.currentConfig[index].isNotEmpty) {
        state = state.copyWith(selectedPeg: index);
      }
    } else {
      final from = state.selectedPeg!;
      final to = index;

      if (_engine.canMove(state.currentConfig, from, to)) {
        final nextConfig = _engine.move(state.currentConfig, from, to);
        final isSolved = _engine.isSolved(nextConfig, state.targetConfig);
        final newMoves = state.moves + 1;
        
        final isOutOfMoves = newMoves >= state.maxMoves;

        state = state.copyWith(
          currentConfig: nextConfig,
          moves: newMoves,
          selectedPeg: -1, // Reset selection
          isGameOver: isSolved || isOutOfMoves,
          isVictory: isSolved,
        );
      } else {
        state = state.copyWith(selectedPeg: -1);
      }
    }
  }
}
