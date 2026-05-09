import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'hitori_engine.dart';

part 'hitori_provider.g.dart';

class HitoriState {
  final List<List<int>> grid;
  final List<List<bool>> painted;
  final bool isGameOver;
  final bool isGameWon;
  final bool isLoading;

  HitoriState({
    required this.grid,
    required this.painted,
    this.isGameOver = false,
    this.isGameWon = false,
    this.isLoading = true,
  });

  HitoriState copyWith({
    List<List<int>>? grid,
    List<List<bool>>? painted,
    bool? isGameOver,
    bool? isGameWon,
    bool? isLoading,
  }) {
    return HitoriState(
      grid: grid ?? this.grid,
      painted: painted ?? this.painted,
      isGameOver: isGameOver ?? this.isGameOver,
      isGameWon: isGameWon ?? this.isGameWon,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class HitoriNotifier extends _$HitoriNotifier {
  final _engine = HitoriEngine();

  @override
  HitoriState build() {
    return HitoriState(grid: [], painted: []);
  }

  void initGame() {
    final puzzle = _engine.generatePuzzle();
    final size = _engine.size;
    state = HitoriState(
      grid: puzzle['grid'],
      painted: List.generate(size, (_) => List.filled(size, false)),
      isLoading: false,
    );
  }

  void toggleCell(int r, int c) {
    if (state.isGameOver) return;
    
    final newPainted = List<List<bool>>.from(state.painted.map((row) => List<bool>.from(row)));
    newPainted[r][c] = !newPainted[r][c];
    
    state = state.copyWith(painted: newPainted);
    
    final won = _engine.checkWin(state.grid, newPainted);
    if (won) {
      state = state.copyWith(isGameOver: true, isGameWon: true);
    }
  }
}
