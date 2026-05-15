import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'word_search_engine.dart';
import 'package:flutter/services.dart';

part 'word_search_provider.g.dart';

class WordSearchState {
  final WordSearchBoard? board;
  final List<Point<int>> selection;
  final bool isSolved;
  final Set<String> foundWords;

  WordSearchState({
    this.board,
    this.selection = const [],
    this.isSolved = false,
    this.foundWords = const {},
  });

  WordSearchState copyWith({
    WordSearchBoard? board,
    List<Point<int>>? selection,
    bool? isSolved,
    Set<String>? foundWords,
  }) {
    return WordSearchState(
      board: board ?? this.board,
      selection: selection ?? this.selection,
      isSolved: isSolved ?? this.isSolved,
      foundWords: foundWords ?? this.foundWords,
    );
  }
}

@riverpod
class WordSearchNotifier extends _$WordSearchNotifier {
  @override
  WordSearchState build() {
    return WordSearchState();
  }

  Future<void> initGame() async {
    List<String> selectedWords = [];
    
    try {
      // Load the dedicated asset
      final String response = await rootBundle.loadString('assets/word_search_words.txt');

      // Process and filter the list
      final List<String> allWords = response
          .split('\n')
          .map((w) => w.trim().toUpperCase())
          .where((w) => w.length >= 4 && w.length <= 8) // Limit word length for better grid fit
          .toList();

      if (allWords.isNotEmpty) {
        // Pick 15 random candidates to give the engine options
        allWords.shuffle();
        selectedWords = allWords.take(15).toList();
      }
    } catch (e) {
      // Fallback handled below
    }

    // Fallback if asset loading fails or results in empty list
    if (selectedWords.isEmpty) {
      selectedWords = [
        'APPLE',
        'BANANA',
        'CHERRY',
        'DRAGON',
        'ELDER',
        'FLOWER',
        'GALAXY',
        'HONEY',
        'ISLAND',
        'JUNGLE'
      ];
    }

    final board = await compute(WordSearchEngine.generateBoard, selectedWords);
    state = WordSearchState(board: board);
  }

  void startSelection(int x, int y) {
    if (state.isSolved) return;
    state = state.copyWith(selection: [Point(x, y)]);
  }

  void updateSelection(int x, int y) {
    if (state.isSolved || state.selection.isEmpty) return;
    
    final start = state.selection.first;
    if (start.x == x && start.y == y) return;

    // Word search selection must be linear (Horizontal, Vertical, or Diagonal)
    int dx = (x - start.x).abs();
    int dy = (y - start.y).abs();

    if (dx == 0 || dy == 0 || dx == dy) {
      // It's a valid direction
      List<Point<int>> newSelection = [];
      int steps = max(dx, dy);
      int stepX = x == start.x ? 0 : (x - start.x) ~/ dx;
      int stepY = y == start.y ? 0 : (y - start.y) ~/ dy;

      for (int i = 0; i <= steps; i++) {
        newSelection.add(Point(start.x + (i * stepX), start.y + (i * stepY)));
      }
      state = state.copyWith(selection: newSelection);
    }
  }

  void endSelection() {
    if (state.isSolved || state.selection.isEmpty) return;

    String selectedWord = state.selection
        .map((p) => state.board!.grid[p.y][p.x])
        .join();
    
    String reversedWord = selectedWord.split('').reversed.join();

    bool found = false;
    String matchedWord = "";

    for (var w in state.board!.words) {
      if (!w.isFound && (w.word == selectedWord || w.word == reversedWord)) {
        w.isFound = true;
        found = true;
        matchedWord = w.word;
        break;
      }
    }

    if (found) {
      final newFound = Set<String>.from(state.foundWords)..add(matchedWord);
      bool allFound = state.board!.words.every((w) => w.isFound);
      state = state.copyWith(
        selection: [],
        foundWords: newFound,
        isSolved: allFound,
      );
    } else {
      state = state.copyWith(selection: []);
    }
  }
}
