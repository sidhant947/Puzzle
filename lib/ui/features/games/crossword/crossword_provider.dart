import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter/foundation.dart';
import 'crossword_engine.dart';

part 'crossword_provider.g.dart';

class CrosswordState {
  final CrosswordBoard? board;
  final List<List<String>> userGrid;
  final int? selectedX;
  final int? selectedY;
  final bool isSolved;
  final bool isAcross;

  CrosswordState({
    this.board,
    required this.userGrid,
    this.selectedX,
    this.selectedY,
    this.isSolved = false,
    this.isAcross = true,
  });

  CrosswordState copyWith({
    CrosswordBoard? board,
    List<List<String>>? userGrid,
    int? selectedX,
    int? selectedY,
    bool? isSolved,
    bool? isAcross,
  }) {
    return CrosswordState(
      board: board ?? this.board,
      userGrid: userGrid ?? this.userGrid,
      selectedX: selectedX ?? this.selectedX,
      selectedY: selectedY ?? this.selectedY,
      isSolved: isSolved ?? this.isSolved,
      isAcross: isAcross ?? this.isAcross,
    );
  }
}

@riverpod
class CrosswordNotifier extends _$CrosswordNotifier {
  final _engine = CrosswordEngine();

  @override
  CrosswordState build() {
    return CrosswordState(
      userGrid: List.generate(CrosswordEngine.boardSize, (_) => List.filled(CrosswordEngine.boardSize, ' ')),
    );
  }

  Future<void> initGame() async {
    final allData = await _engine.loadData();
    final board = await compute(CrosswordEngine.generateBoard, allData);
    
    state = CrosswordState(
      board: board,
      userGrid: List.generate(board.size, (_) => List.filled(board.size, ' ')),
    );
  }

  void selectCell(int x, int y) {
    if (state.board == null) return;
    if (state.board!.grid[y][x] == ' ') return;
    
    if (state.selectedX == x && state.selectedY == y) {
      state = state.copyWith(isAcross: !state.isAcross);
    } else {
      // Find default direction for this cell
      bool hasAcross = _hasWordAt(x, y, true);
      bool hasDown = _hasWordAt(x, y, false);
      
      bool newIsAcross = state.isAcross;
      if (hasAcross && !hasDown) newIsAcross = true;
      if (!hasAcross && hasDown) newIsAcross = false;
      
      state = state.copyWith(selectedX: x, selectedY: y, isAcross: newIsAcross);
    }
  }

  bool _hasWordAt(int x, int y, bool across) {
    for (var w in state.board!.words) {
      if (w.isHorizontal == across) {
        if (across) {
          if (y == w.y && x >= w.x && x < w.x + w.word.length) return true;
        } else {
          if (x == w.x && y >= w.y && y < w.y + w.word.length) return true;
        }
      }
    }
    return false;
  }

  void setLetter(String char) {
    if (state.selectedX == null || state.selectedY == null || state.board == null) return;
    if (state.isSolved) return;

    final newGrid = List.generate(state.board!.size, (i) => List<String>.from(state.userGrid[i]));
    newGrid[state.selectedY!][state.selectedX!] = char.toUpperCase();

    bool solved = _checkSolved(newGrid);
    state = state.copyWith(userGrid: newGrid, isSolved: solved);
    
    if (!solved) {
      _moveNext();
    }
  }

  void removeLetter() {
    if (state.selectedX == null || state.selectedY == null || state.board == null) return;
    if (state.isSolved) return;

    final newGrid = List.generate(state.board!.size, (i) => List<String>.from(state.userGrid[i]));
    
    if (newGrid[state.selectedY!][state.selectedX!] == ' ') {
      _moveBack();
    } else {
      newGrid[state.selectedY!][state.selectedX!] = ' ';
      state = state.copyWith(userGrid: newGrid);
    }
  }

  bool _checkSolved(List<List<String>> grid) {
    if (state.board == null) return false;
    for (int y = 0; y < state.board!.size; y++) {
      for (int x = 0; x < state.board!.size; x++) {
        if (state.board!.grid[y][x] != ' ' && state.board!.grid[y][x] != grid[y][x]) {
          return false;
        }
      }
    }
    return true;
  }

  void _moveNext() {
    if (state.selectedX == null || state.selectedY == null || state.board == null) return;
    
    int nx = state.selectedX!;
    int ny = state.selectedY!;

    if (state.isAcross) {
      nx++;
    } else {
      ny++;
    }

    if (nx >= 0 && nx < state.board!.size && ny >= 0 && ny < state.board!.size) {
      if (state.board!.grid[ny][nx] != ' ') {
        state = state.copyWith(selectedX: nx, selectedY: ny);
      }
    }
  }

  void _moveBack() {
    if (state.selectedX == null || state.selectedY == null || state.board == null) return;
    
    int nx = state.selectedX!;
    int ny = state.selectedY!;

    if (state.isAcross) {
      nx--;
    } else {
      ny--;
    }

    if (nx >= 0 && nx < state.board!.size && ny >= 0 && ny < state.board!.size) {
      if (state.board!.grid[ny][nx] != ' ') {
        state = state.copyWith(selectedX: nx, selectedY: ny);
      }
    }
  }
}
