import 'dart:math';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'paper_folding_engine.dart';

part 'paper_folding_provider.g.dart';

class PaperFoldingState {
  final List<FoldType> folds;
  final Point<int> punch;
  final List<List<Point<int>>> options;
  final int correctIndex;
  final int? selectedIndex;
  final bool isVictory;
  final bool isLoading;

  PaperFoldingState({
    required this.folds,
    required this.punch,
    required this.options,
    required this.correctIndex,
    this.selectedIndex,
    this.isVictory = false,
    this.isLoading = true,
  });

  PaperFoldingState copyWith({
    List<FoldType>? folds,
    Point<int>? punch,
    List<List<Point<int>>>? options,
    int? correctIndex,
    int? selectedIndex,
    bool? isVictory,
    bool? isLoading,
  }) {
    return PaperFoldingState(
      folds: folds ?? this.folds,
      punch: punch ?? this.punch,
      options: options ?? this.options,
      correctIndex: correctIndex ?? this.correctIndex,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      isVictory: isVictory ?? this.isVictory,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class PaperFoldingNotifier extends _$PaperFoldingNotifier {
  final _engine = PaperFoldingEngine();

  @override
  PaperFoldingState build() {
    return PaperFoldingState(
      folds: [],
      punch: const Point(0, 0),
      options: [],
      correctIndex: 0,
    );
  }

  void initGame() {
    final level = _engine.generateLevel();
    state = PaperFoldingState(
      folds: level['folds'],
      punch: level['punch'],
      options: level['options'],
      correctIndex: level['correctIndex'],
      isLoading: false,
    );
  }

  void selectOption(int index) {
    if (state.isVictory) return;
    
    state = state.copyWith(selectedIndex: index);
    
    if (index == state.correctIndex) {
      state = state.copyWith(isVictory: true);
    }
  }
}
