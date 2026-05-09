import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'star_battle_engine.dart';

part 'star_battle_provider.g.dart';

class StarBattleState {
  final List<List<int>> regions;
  final List<List<int>> userGrid; // 0: empty, 1: star, 2: cross
  final bool isGameOver;
  final bool isGameWon;
  final bool isLoading;

  StarBattleState({
    required this.regions,
    required this.userGrid,
    this.isGameOver = false,
    this.isGameWon = false,
    this.isLoading = true,
  });

  StarBattleState copyWith({
    List<List<int>>? regions,
    List<List<int>>? userGrid,
    bool? isGameOver,
    bool? isGameWon,
    bool? isLoading,
  }) {
    return StarBattleState(
      regions: regions ?? this.regions,
      userGrid: userGrid ?? this.userGrid,
      isGameOver: isGameOver ?? this.isGameOver,
      isGameWon: isGameWon ?? this.isGameWon,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class StarBattleNotifier extends _$StarBattleNotifier {
  final _engine = StarBattleEngine();

  @override
  StarBattleState build() {
    return StarBattleState(regions: [], userGrid: []);
  }

  void initGame() {
    final puzzle = _engine.generatePuzzle();
    final size = _engine.size;
    state = StarBattleState(
      regions: puzzle['regions'],
      userGrid: List.generate(size, (_) => List.filled(size, 0)),
      isLoading: false,
    );
  }

  void onTileTapped(int r, int c) {
    if (state.isGameOver) return;
    
    final newGrid = List<List<int>>.from(state.userGrid.map((row) => List<int>.from(row)));
    newGrid[r][c] = (newGrid[r][c] + 1) % 3; // Cycle: 0 -> 1 (Star) -> 2 (Cross) -> 0
    
    state = state.copyWith(userGrid: newGrid);
    
    final won = _engine.checkWin(newGrid, state.regions);
    if (won) {
      state = state.copyWith(isGameOver: true, isGameWon: true);
    }
  }
}
