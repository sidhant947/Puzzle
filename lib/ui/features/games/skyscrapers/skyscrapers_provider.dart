import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'skyscrapers_engine.dart';

part 'skyscrapers_provider.g.dart';

class SkyscrapersState {
  final List<List<int>> userGrid;
  final Map<String, List<int>> clues;
  final bool isGameOver;
  final bool isGameWon;
  final bool isLoading;

  SkyscrapersState({
    required this.userGrid,
    required this.clues,
    this.isGameOver = false,
    this.isGameWon = false,
    this.isLoading = true,
  });

  SkyscrapersState copyWith({
    List<List<int>>? userGrid,
    Map<String, List<int>>? clues,
    bool? isGameOver,
    bool? isGameWon,
    bool? isLoading,
  }) {
    return SkyscrapersState(
      userGrid: userGrid ?? this.userGrid,
      clues: clues ?? this.clues,
      isGameOver: isGameOver ?? this.isGameOver,
      isGameWon: isGameWon ?? this.isGameWon,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class SkyscrapersNotifier extends _$SkyscrapersNotifier {
  final _engine = SkyscrapersEngine();

  @override
  SkyscrapersState build() {
    return SkyscrapersState(userGrid: [], clues: {});
  }

  void initGame() {
    final puzzle = _engine.generatePuzzle();
    state = SkyscrapersState(
      userGrid: List.generate(4, (_) => List.filled(4, 0)),
      clues: {
        'top': puzzle['top'],
        'bottom': puzzle['bottom'],
        'left': puzzle['left'],
        'right': puzzle['right'],
      },
      isLoading: false,
    );
  }

  void toggleCell(int r, int c) {
    if (state.isGameOver) return;
    final newGrid = List<List<int>>.from(state.userGrid.map((row) => List<int>.from(row)));
    newGrid[r][c] = (newGrid[r][c] + 1) % 5; // 0, 1, 2, 3, 4
    
    final won = _engine.checkWin(newGrid, state.clues);
    
    state = state.copyWith(
      userGrid: newGrid,
      isGameOver: won,
      isGameWon: won,
    );
  }
}
