import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'pixel_mimic_engine.dart';

part 'pixel_mimic_provider.g.dart';

class PixelMimicState {
  final List<List<int>> targetGrid;
  final List<List<int>> userGrid;
  final bool isShowingPattern;
  final int selectedColor;
  final bool isGameOver;
  final bool isGameWon;
  final bool isLoading;

  PixelMimicState({
    required this.targetGrid,
    required this.userGrid,
    this.isShowingPattern = true,
    this.selectedColor = 1,
    this.isGameOver = false,
    this.isGameWon = false,
    this.isLoading = true,
  });

  PixelMimicState copyWith({
    List<List<int>>? targetGrid,
    List<List<int>>? userGrid,
    bool? isShowingPattern,
    int? selectedColor,
    bool? isGameOver,
    bool? isGameWon,
    bool? isLoading,
  }) {
    return PixelMimicState(
      targetGrid: targetGrid ?? this.targetGrid,
      userGrid: userGrid ?? this.userGrid,
      isShowingPattern: isShowingPattern ?? this.isShowingPattern,
      selectedColor: selectedColor ?? this.selectedColor,
      isGameOver: isGameOver ?? this.isGameOver,
      isGameWon: isGameWon ?? this.isGameWon,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class PixelMimicNotifier extends _$PixelMimicNotifier {
  final _engine = PixelMimicEngine();
  Timer? _timer;

  @override
  PixelMimicState build() {
    return PixelMimicState(targetGrid: [], userGrid: []);
  }

  void initGame() {
    final target = _engine.generatePattern();
    final user = List.generate(_engine.size, (_) => List.filled(_engine.size, 0));
    
    state = PixelMimicState(
      targetGrid: target,
      userGrid: user,
      isShowingPattern: true,
      isLoading: false,
    );

    _timer?.cancel();
    _timer = Timer(const Duration(seconds: 3), () {
      state = state.copyWith(isShowingPattern: false);
    });
  }

  void selectColor(int color) {
    state = state.copyWith(selectedColor: color);
  }

  void onTileTapped(int r, int c) {
    if (state.isShowingPattern || state.isGameOver) return;

    final newUserGrid = List<List<int>>.from(state.userGrid.map((row) => List<int>.from(row)));
    if (newUserGrid[r][c] == state.selectedColor) {
      newUserGrid[r][c] = 0;
    } else {
      newUserGrid[r][c] = state.selectedColor;
    }
    
    state = state.copyWith(userGrid: newUserGrid);
  }

  void submitMimic() {
    if (state.isShowingPattern || state.isGameOver) return;
    
    final won = _engine.checkMatch(state.targetGrid, state.userGrid);
    state = state.copyWith(
      isGameOver: true,
      isGameWon: won,
    );
  }
}
