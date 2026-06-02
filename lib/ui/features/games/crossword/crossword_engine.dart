import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';

class CrosswordWord {
  final String word;
  final String clue;
  int x;
  int y;
  bool isHorizontal;
  int number;

  CrosswordWord({
    required this.word,
    required this.clue,
    this.x = 0,
    this.y = 0,
    this.isHorizontal = true,
    this.number = 0,
  });
}

class CrosswordBoard {
  final int size;
  final List<List<String>> grid;
  final List<CrosswordWord> words;

  CrosswordBoard({
    required this.size,
    required this.grid,
    required this.words,
  });
}

class CrosswordEngine {
  static const int boardSize = 5;

  static List<Map<String, String>> _parseJson(String response) {
    final data = json.decode(response) as List<dynamic>;
    return data.map((item) => {
      "word": item['word'].toString().toUpperCase(),
      "clue": item['clue'].toString()
    }).toList();
  }

  Future<List<Map<String, String>>> loadData([String languageCode = 'en']) async {
    try {
      final String response = await rootBundle.loadString('assets/crossword_data.json');
      return await compute(_parseJson, response);
    } catch (e) {
      return [
        {"word": "ACE", "clue": "A top-ranking playing card"},
        {"word": "BED", "clue": "A piece of furniture for sleep"},
        {"word": "CAT", "clue": "A small domesticated carnivorous mammal"},
        {"word": "DOG", "clue": "A domesticated carnivorous mammal"}
      ];
    }
  }

  static CrosswordBoard generateBoard(List<Map<String, String>> allWords) {
    // Filter words that actually fit on the board
    final validWords = allWords.where((w) => w['word']!.length <= boardSize).toList();
    
    if (validWords.isEmpty) {
      return CrosswordBoard(
        size: boardSize, 
        grid: List.generate(boardSize, (_) => List.filled(boardSize, ' ')), 
        words: []
      );
    }

    List<List<String>> bestGrid = List.generate(boardSize, (_) => List.filled(boardSize, ' '));
    List<CrosswordWord> bestPlacedWords = [];

    // Attempt generation multiple times to get a good one
    for (int attempt = 0; attempt < 100; attempt++) {
      validWords.shuffle();
      List<List<String>> grid = List.generate(boardSize, (_) => List.filled(boardSize, ' '));
      List<CrosswordWord> placedWords = [];

      // Start with a random 4 or 5 letter word
      var seedList = validWords.where((w) => w['word']!.length == boardSize || w['word']!.length == boardSize - 1).toList();
      var seed = seedList.isNotEmpty ? seedList[0] : validWords[0];
      
      var first = CrosswordWord(word: seed['word']!, clue: seed['clue']!);
      first.x = (boardSize - first.word.length) ~/ 2;
      first.y = boardSize ~/ 2;
      first.isHorizontal = true;
      
      _place(grid, first);
      placedWords.add(first);

      // Try to add more words through intersections
      for (int i = 0; i < validWords.length && placedWords.length < 12; i++) {
        if (placedWords.any((pw) => pw.word == validWords[i]['word'])) continue;
        
        var candidate = CrosswordWord(word: validWords[i]['word']!, clue: validWords[i]['clue']!);
        _tryPlaceCandidate(grid, candidate, placedWords);
      }

      if (placedWords.length > bestPlacedWords.length) {
        bestPlacedWords = List.from(placedWords);
        bestGrid = List.generate(boardSize, (y) => List<String>.from(grid[y]));
      }

      // NYT Mini usually has at least 8-10 words
      if (placedWords.length >= 8) {
        break;
      }
    }

    _assignNumbers(bestPlacedWords);
    return CrosswordBoard(size: boardSize, grid: bestGrid, words: bestPlacedWords);
  }

  static void _tryPlaceCandidate(List<List<String>> grid, CrosswordWord candidate, List<CrosswordWord> placedWords) {
    // Try random placed words to intersect with
    var targets = List.from(placedWords)..shuffle();
    
    for (var target in targets) {
      for (int tIdx = 0; tIdx < target.word.length; tIdx++) {
        for (int cIdx = 0; cIdx < candidate.word.length; cIdx++) {
          if (target.word[tIdx] == candidate.word[cIdx]) {
            candidate.isHorizontal = !target.isHorizontal;
            if (candidate.isHorizontal) {
              candidate.x = (target.isHorizontal ? target.x + tIdx : target.x) - cIdx;
              candidate.y = target.isHorizontal ? target.y : target.y + tIdx;
            } else {
              candidate.x = target.isHorizontal ? target.x + tIdx : target.x;
              candidate.y = (target.isHorizontal ? target.y : target.y + tIdx) - cIdx;
            }

            if (_canPlaceSafely(grid, candidate)) {
              _place(grid, candidate);
              placedWords.add(candidate);
              return;
            }
          }
        }
      }
    }
  }

  static bool _canPlaceSafely(List<List<String>> grid, CrosswordWord w) {
    if (w.x < 0 || w.y < 0) return false;
    if (w.isHorizontal && w.x + w.word.length > boardSize) return false;
    if (!w.isHorizontal && w.y + w.word.length > boardSize) return false;

    for (int i = 0; i < w.word.length; i++) {
      int cx = w.isHorizontal ? w.x + i : w.x;
      int cy = w.isHorizontal ? w.y : w.y + i;

      // Rule 1: Must match existing letter or be empty
      if (grid[cy][cx] != ' ' && grid[cy][cx] != w.word[i]) return false;
      
      // Rule 2: No parallel touching or adjacency that creates new words
      // Check neighbors perpendicular to the word's direction
      if (w.isHorizontal) {
        // Check top/bottom unless it's an intersection
        if (grid[cy][cx] == ' ') {
           if (cy > 0 && grid[cy-1][cx] != ' ') return false;
           if (cy < boardSize - 1 && grid[cy+1][cx] != ' ') return false;
        }
      } else {
        // Check left/right unless it's an intersection
        if (grid[cy][cx] == ' ') {
           if (cx > 0 && grid[cy][cx-1] != ' ') return false;
           if (cx < boardSize - 1 && grid[cy][cx+1] != ' ') return false;
        }
      }
    }

    // Check caps (cells before and after the word)
    if (w.isHorizontal) {
      if (w.x > 0 && grid[w.y][w.x - 1] != ' ') return false;
      if (w.x + w.word.length < boardSize && grid[w.y][w.x + w.word.length] != ' ') return false;
    } else {
      if (w.y > 0 && grid[w.y - 1][w.x] != ' ') return false;
      if (w.y + w.word.length < boardSize && grid[w.y + w.word.length][w.x] != ' ') return false;
    }

    return true;
  }

  static void _place(List<List<String>> grid, CrosswordWord w) {
    for (int i = 0; i < w.word.length; i++) {
      int cx = w.isHorizontal ? w.x + i : w.x;
      int cy = w.isHorizontal ? w.y : w.y + i;
      grid[cy][cx] = w.word[i];
    }
  }

  static void _assignNumbers(List<CrosswordWord> words) {
    // Sort primarily by y (row), then by x (column)
    words.sort((a, b) {
      if (a.y != b.y) return a.y.compareTo(b.y);
      return a.x.compareTo(b.x);
    });

    int currentNum = 1;
    Map<String, int> posToNum = {};
    for (var w in words) {
      String key = "${w.x},${w.y}";
      if (posToNum.containsKey(key)) {
        w.number = posToNum[key]!;
      } else {
        w.number = currentNum;
        posToNum[key] = currentNum;
        currentNum++;
      }
    }
  }
}
