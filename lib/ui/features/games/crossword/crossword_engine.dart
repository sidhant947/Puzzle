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
  static const int defaultBoardSize = 8;

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

  static CrosswordBoard generateBoard(List<dynamic> args) {
    final List<Map<String, String>> allWords = (args[0] as List).map((item) {
      final map = item as Map;
      return {
        "word": map['word'].toString().toUpperCase(),
        "clue": map['clue'].toString(),
      };
    }).toList();
    final int size = args[1] as int;

    final validWords = allWords.where((w) => w['word']!.length <= size).toList();

    if (validWords.isEmpty) {
      return CrosswordBoard(
        size: size,
        grid: List.generate(size, (_) => List.filled(size, ' ')),
        words: []
      );
    }

    List<List<String>> bestGrid = List.generate(size, (_) => List.filled(size, ' '));
    List<CrosswordWord> bestPlacedWords = [];

    for (int attempt = 0; attempt < 200; attempt++) {
      validWords.shuffle();
      List<List<String>> grid = List.generate(size, (_) => List.filled(size, ' '));
      List<CrosswordWord> placedWords = [];

      var seedList = validWords.where((w) => w['word']!.length >= size - 2 && w['word']!.length <= size).toList();
      var seed = seedList.isNotEmpty ? seedList[0] : validWords[0];

      var first = CrosswordWord(word: seed['word']!, clue: seed['clue']!);
      first.x = (size - first.word.length) ~/ 2;
      first.y = size ~/ 2;
      first.isHorizontal = true;

      _place(grid, first);
      placedWords.add(first);

      for (int i = 0; i < validWords.length && placedWords.length < 15; i++) {
        if (placedWords.any((pw) => pw.word == validWords[i]['word'])) continue;

        var candidate = CrosswordWord(word: validWords[i]['word']!, clue: validWords[i]['clue']!);
        _tryPlaceCandidate(grid, candidate, placedWords, size);
      }

      if (placedWords.length > bestPlacedWords.length) {
        bestPlacedWords = List.from(placedWords);
        bestGrid = List.generate(size, (y) => List<String>.from(grid[y]));
      }

      if (placedWords.length >= 10) break;
    }

    _assignNumbers(bestPlacedWords);
    return CrosswordBoard(size: size, grid: bestGrid, words: bestPlacedWords);
  }

  static void _tryPlaceCandidate(List<List<String>> grid, CrosswordWord candidate, List<CrosswordWord> placedWords, int size) {
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

            if (_canPlaceSafely(grid, candidate, placedWords, size)) {
              _place(grid, candidate);
              placedWords.add(candidate);
              return;
            }
          }
        }
      }
    }
  }

  static bool _canPlaceSafely(List<List<String>> grid, CrosswordWord w, List<CrosswordWord> placedWords, int size) {
    if (w.x < 0 || w.y < 0) return false;
    if (w.isHorizontal && w.x + w.word.length > size) return false;
    if (!w.isHorizontal && w.y + w.word.length > size) return false;

    int intersectionCount = 0;

    for (int i = 0; i < w.word.length; i++) {
      int cx = w.isHorizontal ? w.x + i : w.x;
      int cy = w.isHorizontal ? w.y : w.y + i;

      if (grid[cy][cx] != ' ' && grid[cy][cx] != w.word[i]) return false;

      if (grid[cy][cx] == w.word[i]) intersectionCount++;

      if (grid[cy][cx] == ' ') {
        if (w.isHorizontal) {
          if (cy > 0 && grid[cy - 1][cx] != ' ') return false;
          if (cy < size - 1 && grid[cy + 1][cx] != ' ') return false;
        } else {
          if (cx > 0 && grid[cy][cx - 1] != ' ') return false;
          if (cx < size - 1 && grid[cy][cx + 1] != ' ') return false;
        }
      }
    }

    if (intersectionCount < 1) return false;

    for (var existing in placedWords) {
      if (existing.isHorizontal == w.isHorizontal) {
        if (w.isHorizontal && existing.y == w.y) {
          if (!(w.x + w.word.length <= existing.x || existing.x + existing.word.length <= w.x)) return false;
        } else if (!w.isHorizontal && existing.x == w.x) {
          if (!(w.y + w.word.length <= existing.y || existing.y + existing.word.length <= w.y)) return false;
        }
      } else {
        int sharedCells = 0;
        for (int i = 0; i < w.word.length; i++) {
          int cx = w.isHorizontal ? w.x + i : w.x;
          int cy = w.isHorizontal ? w.y : w.y + i;

          for (int j = 0; j < existing.word.length; j++) {
            int ex = existing.isHorizontal ? existing.x + j : existing.x;
            int ey = existing.isHorizontal ? existing.y : existing.y + j;

            if (cx == ex && cy == ey) {
              sharedCells++;
            }
          }
        }
        if (sharedCells > 1) return false;
      }
    }

    if (w.isHorizontal) {
      if (w.x > 0 && grid[w.y][w.x - 1] != ' ') return false;
      if (w.x + w.word.length < size && grid[w.y][w.x + w.word.length] != ' ') return false;
    } else {
      if (w.y > 0 && grid[w.y - 1][w.x] != ' ') return false;
      if (w.y + w.word.length < size && grid[w.y + w.word.length][w.x] != ' ') return false;
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
