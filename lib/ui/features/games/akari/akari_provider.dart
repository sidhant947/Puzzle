import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'akari_engine.dart';

part 'akari_provider.g.dart';

class AkariState {
  final List<List<int>> grid; // -2: white, -1: wall, 0-4: numbered wall
  final List<List<bool>> bulbs;
  final List<List<bool>> lit;
  final bool isVictory;
  final bool isLoading;

  AkariState({
    required this.grid,
    required this.bulbs,
    required this.lit,
    this.isVictory = false,
    this.isLoading = true,
  });

  AkariState copyWith({
    List<List<int>>? grid,
    List<List<bool>>? bulbs,
    List<List<bool>>? lit,
    bool? isVictory,
    bool? isLoading,
  }) {
    return AkariState(
      grid: grid ?? this.grid,
      bulbs: bulbs ?? this.bulbs,
      lit: lit ?? this.lit,
      isVictory: isVictory ?? this.isVictory,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class AkariNotifier extends _$AkariNotifier {
  final _engine = AkariEngine();

  @override
  AkariState build() {
    return AkariState(grid: [], bulbs: [], lit: []);
  }

  void initGame() {
    final level = _engine.generateLevel();
    final grid = level['grid'] as List<List<int>>;
    final size = grid.length;
    state = AkariState(
      grid: grid,
      bulbs: List.generate(size, (_) => List.filled(size, false)),
      lit: List.generate(size, (_) => List.filled(size, false)),
      isLoading: false,
    );
    _updateLit();
  }

  void toggleBulb(int r, int c) {
    if (state.isVictory || state.grid[r][c] != -2) return;

    final newBulbs = state.bulbs.map((row) => List<bool>.from(row)).toList();
    newBulbs[r][c] = !newBulbs[r][c];
    
    state = state.copyWith(bulbs: newBulbs);
    _updateLit();
    _checkVictory();
  }

  void _updateLit() {
    final size = state.grid.length;
    final newLit = List.generate(size, (_) => List.filled(size, false));

    for (int r = 0; r < size; r++) {
      for (int c = 0; c < size; c++) {
        if (state.bulbs[r][c]) {
          newLit[r][c] = true;
          // Up
          for (int i = r - 1; i >= 0 && state.grid[i][c] == -2; i--) {
            newLit[i][c] = true;
          }
          // Down
          for (int i = r + 1; i < size && state.grid[i][c] == -2; i++) {
            newLit[i][c] = true;
          }
          // Left
          for (int j = c - 1; j >= 0 && state.grid[r][j] == -2; j--) {
            newLit[r][j] = true;
          }
          // Right
          for (int j = c + 1; j < size && state.grid[r][j] == -2; j++) {
            newLit[r][j] = true;
          }
        }
      }
    }
    state = state.copyWith(lit: newLit);
  }

  void _checkVictory() {
    final size = state.grid.length;

    // 1. All white cells must be lit
    for (int r = 0; r < size; r++) {
      for (int c = 0; c < size; c++) {
        if (state.grid[r][c] == -2 && !state.lit[r][c]) return;
      }
    }

    // 2. Bulbs can't see each other
    for (int r = 0; r < size; r++) {
      for (int c = 0; c < size; c++) {
        if (state.bulbs[r][c]) {
          // Check horizontal
          for (int j = c + 1; j < size && state.grid[r][j] == -2; j++) {
            if (state.bulbs[r][j]) return;
          }
          // Check vertical
          for (int i = r + 1; i < size && state.grid[i][c] == -2; i++) {
            if (state.bulbs[i][c]) return;
          }
        }
      }
    }

    // 3. Numbered walls must have exact adjacent bulbs
    for (int r = 0; r < size; r++) {
      for (int c = 0; c < size; c++) {
        final val = state.grid[r][c];
        if (val >= 0) {
          int count = 0;
          if (r > 0 && state.bulbs[r - 1][c]) count++;
          if (r < size - 1 && state.bulbs[r + 1][c]) count++;
          if (c > 0 && state.bulbs[r][c - 1]) count++;
          if (c < size - 1 && state.bulbs[r][c + 1]) count++;
          if (count != val) return;
        }
      }
    }

    state = state.copyWith(isVictory: true);
  }
}
