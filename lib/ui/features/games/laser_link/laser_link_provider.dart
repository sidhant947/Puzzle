import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'laser_link_engine.dart';
import '../../../../providers/user_providers.dart';

part 'laser_link_provider.g.dart';

class LaserLinkState {
  final int size;
  final Point<int> sourcePos;
  final Direction sourceDir;
  final IList<Point<int>> targets;
  final IList<IList<MirrorType>> grid;
  final IList<Point<int>> laserPath;
  final bool isSolved;
  final bool isLoading;

  LaserLinkState({
    this.size = 5,
    this.sourcePos = const Point(0, 0),
    this.sourceDir = Direction.right,
    this.targets = const IListConst([]),
    this.grid = const IListConst([]),
    this.laserPath = const IListConst([]),
    this.isSolved = false,
    this.isLoading = true,
  });

  LaserLinkState copyWith({
    int? size,
    Point<int>? sourcePos,
    Direction? sourceDir,
    IList<Point<int>>? targets,
    IList<IList<MirrorType>>? grid,
    IList<Point<int>>? laserPath,
    bool? isSolved,
    bool? isLoading,
  }) {
    return LaserLinkState(
      size: size ?? this.size,
      sourcePos: sourcePos ?? this.sourcePos,
      sourceDir: sourceDir ?? this.sourceDir,
      targets: targets ?? this.targets,
      grid: grid ?? this.grid,
      laserPath: laserPath ?? this.laserPath,
      isSolved: isSolved ?? this.isSolved,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class LaserLinkNotifier extends _$LaserLinkNotifier {
  @override
  LaserLinkState build() {
    return LaserLinkState(isLoading: true);
  }

  Future<void> initGame() async {
    state = state.copyWith(isLoading: true, isSolved: false);
    
    final level = await compute(LaserLinkEngine.generateLevelWrapper, 5);
    
    final int size = level['size'];
    final Point<int> sourcePos = level['sourcePos'];
    final Direction sourceDir = level['sourceDir'];
    final List<Point<int>> targets = level['targets'];
    
    final grid = List.generate(size, (_) => List.filled(size, MirrorType.none));
    
    final engine = LaserLinkEngine(size: size);
    final laserPath = engine.tracePath(sourcePos, sourceDir, {});

    state = LaserLinkState(
      size: size,
      sourcePos: sourcePos,
      sourceDir: sourceDir,
      targets: targets.lock,
      grid: grid.map((r) => r.lock).toIList(),
      laserPath: laserPath.lock,
      isLoading: false,
    );
  }

  void toggleMirror(int r, int c) {
    if (state.isLoading || state.isSolved) return;
    
    final currentType = state.grid[r][c];
    
    MirrorType nextType;
    switch (currentType) {
      case MirrorType.none:
        nextType = MirrorType.forwardSlash;
        break;
      case MirrorType.forwardSlash:
        nextType = MirrorType.backSlash;
        break;
      case MirrorType.backSlash:
        nextType = MirrorType.none;
        break;
    }

    final newGridList = state.grid.map((row) => row.toList()).toList();
    newGridList[r][c] = nextType;
    final newGrid = newGridList.map((row) => row.lock).toIList();

    // Re-calculate laser path
    final engine = LaserLinkEngine(size: state.size);
    Map<Point<int>, MirrorType> mirrors = {};
    for (int i = 0; i < state.size; i++) {
      for (int j = 0; j < state.size; j++) {
        if (newGridList[i][j] != MirrorType.none) {
          mirrors[Point(j, i)] = newGridList[i][j];
        }
      }
    }

    final newPath = engine.tracePath(state.sourcePos, state.sourceDir, mirrors);
    
    bool solved = true;
    for (final target in state.targets) {
      if (!newPath.contains(target)) {
        solved = false;
        break;
      }
    }

    state = state.copyWith(
      grid: newGrid,
      laserPath: newPath.lock,
      isSolved: solved,
    );

    if (solved) {
      ref.read(gameStreakNotifierProvider.notifier).completeGame('laser_link');
    }
  }
}
