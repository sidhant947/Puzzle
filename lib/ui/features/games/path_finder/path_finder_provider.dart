import 'dart:math';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../utils/haptic_feedback.dart';
import 'path_finder_engine.dart';

part 'path_finder_provider.g.dart';

class PathFinderState {
  final List<Point<int>> requiredNodes;
  final List<Point<int>> currentPath;
  final bool isGameOver;

  PathFinderState({
    required this.requiredNodes,
    required this.currentPath,
    this.isGameOver = false,
  });

  PathFinderState copyWith({
    List<Point<int>>? requiredNodes,
    List<Point<int>>? currentPath,
    bool? isGameOver,
  }) {
    return PathFinderState(
      requiredNodes: requiredNodes ?? this.requiredNodes,
      currentPath: currentPath ?? this.currentPath,
      isGameOver: isGameOver ?? this.isGameOver,
    );
  }
}

@riverpod
class PathFinderNotifier extends _$PathFinderNotifier {
  final _engine = PathFinderEngine();

  @override
  PathFinderState build() {
    final nodes = _engine.generateLevel();
    return PathFinderState(
      requiredNodes: nodes,
      currentPath: [nodes.first],
    );
  }

  void addNode(Point<int> node) {
    if (state.isGameOver) return;
    
    // If tapping a node already in the path, backtrack to it
    if (state.currentPath.contains(node)) {
      final index = state.currentPath.indexOf(node);
      if (index != state.currentPath.length - 1) {
        HapticFeedbackUtil.selectionClick();
        state = state.copyWith(
          currentPath: state.currentPath.sublist(0, index + 1),
        );
      }
      return;
    }

    final last = state.currentPath.last;
    final dist = (last.x - node.x).abs() + (last.y - node.y).abs();
    
    // Allow ANY adjacent move, regardless of whether it's the correct hidden path
    if (dist == 1) {
      HapticFeedbackUtil.selectionClick();
      final newPath = List<Point<int>>.from(state.currentPath)..add(node);
      state = state.copyWith(
        currentPath: newPath,
      );
      
      // Check if level is complete (must match the hidden path exactly)
      if (_engine.isLevelComplete(newPath, state.requiredNodes)) {
        state = state.copyWith(isGameOver: true);
      }
    }
  }

  void reset() {
    final nodes = _engine.generateLevel();
    state = PathFinderState(
      requiredNodes: nodes,
      currentPath: [nodes.first],
    );
  }
}
