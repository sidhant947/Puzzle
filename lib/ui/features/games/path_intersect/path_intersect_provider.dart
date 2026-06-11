import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'path_intersect_engine.dart';
import '../../../../providers/user_providers.dart';

part 'path_intersect_provider.g.dart';

class PathIntersectState {
  final int gridSize;
  final IList<Point<int>> path1;
  final IList<Point<int>> path2;
  final Point<int> intersection;
  final Point<int>? selectedPoint;
  final bool isSolved;
  final bool isVictory;
  final bool isFailed;
  final bool isLoading;

  PathIntersectState({
    this.gridSize = 8,
    this.path1 = const IListConst([]),
    this.path2 = const IListConst([]),
    this.intersection = const Point(0, 0),
    this.selectedPoint,
    this.isSolved = false,
    this.isVictory = false,
    this.isFailed = false,
    this.isLoading = true,
  });

  PathIntersectState copyWith({
    int? gridSize,
    IList<Point<int>>? path1,
    IList<Point<int>>? path2,
    Point<int>? intersection,
    Point<int>? selectedPoint,
    bool? isSolved,
    bool? isVictory,
    bool? isFailed,
    bool? isLoading,
  }) {
    return PathIntersectState(
      gridSize: gridSize ?? this.gridSize,
      path1: path1 ?? this.path1,
      path2: path2 ?? this.path2,
      intersection: intersection ?? this.intersection,
      selectedPoint: selectedPoint ?? this.selectedPoint,
      isSolved: isSolved ?? this.isSolved,
      isVictory: isVictory ?? this.isVictory,
      isFailed: isFailed ?? this.isFailed,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class PathIntersectNotifier extends _$PathIntersectNotifier {
  @override
  PathIntersectState build() {
    return PathIntersectState(isLoading: true);
  }

  Future<void> initGame() async {
    state = state.copyWith(isLoading: true, isSolved: false, isVictory: false, isFailed: false, selectedPoint: null);
    
    final level = await compute(PathIntersectEngine.generateLevelWrapper, 8);
    
    state = PathIntersectState(
      gridSize: level['gridSize'],
      path1: (level['path1'] as List<Point<int>>).lock,
      path2: (level['path2'] as List<Point<int>>).lock,
      intersection: level['intersection'],
      isLoading: false,
    );
  }

  void selectPoint(int x, int y) {
    if (state.isLoading || state.isSolved || state.isFailed) return;
    
    final selected = Point(x, y);
    final bool solved = selected == state.intersection;
    
    state = state.copyWith(
      selectedPoint: selected,
      isSolved: solved,
      isVictory: solved,
      isFailed: !solved,
    );

    if (solved) {
      ref.read(gameStreakNotifierProvider.notifier).completeGame('path_intersect');
    }
  }
}
