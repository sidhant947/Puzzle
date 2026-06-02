import 'dart:math';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';

class WordScrambleEngine {
  static const int minWordLength = 4;
  static const int maxWordLength = 8;

  List<String>? _cachedWords;

  static List<String> _processWords(String data) {
    return data
        .split('\n')
        .map((w) => w.trim().toUpperCase())
        .where((w) => w.isNotEmpty && w.length >= minWordLength && w.length <= maxWordLength)
        .toList();
  }

  Future<List<String>> loadWords([String languageCode = 'en']) async {
    if (_cachedWords != null && _cachedWords!.isNotEmpty) {
      return _cachedWords!;
    }

    try {
      final data = await rootBundle.loadString('assets/find_word_words.txt');
      _cachedWords = await compute(_processWords, data);
      
      if (_cachedWords!.isEmpty) {
        throw Exception('No words found in file');
      }
      
      return _cachedWords!;
    } catch (e) {
      // Fallback words if loading fails
      return [
        'APPLE', 'BANANA', 'CHERRY', 'ORANGE', 'GRAPES', 
        'MELON', 'PEACH', 'PLUM', 'MANGO', 'LEMON',
        'GUAVA', 'BERRY', 'FRUIT', 'CANDY', 'SWEET'
      ];
    }
  }

  String getRandomWord(List<String> words) {
    if (words.isEmpty) return 'APPLE';
    return words[Random().nextInt(words.length)];
  }

  String scrambleWord(String word) {
    List<String> letters = word.split('');
    String scrambled;
    do {
      letters.shuffle();
      scrambled = letters.join('');
    } while (scrambled == word && word.length > 1);
    return scrambled;
  }

  bool checkGuess(String guess, String target, List<String> wordList) {
    final g = guess.trim().toUpperCase();
    final t = target.trim().toUpperCase();
    
    if (g == t) return true;
    
    // Check if it's a valid anagram
    if (wordList.contains(g)) {
      final gLetters = g.split('')..sort();
      final tLetters = t.split('')..sort();
      return gLetters.join('') == tLetters.join('');
    }
    
    return false;
  }
}
