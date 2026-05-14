import 'dart:math';
import 'package:flutter/services.dart';

class WordScrambleEngine {
  static const int minWordLength = 4;
  static const int maxWordLength = 7;

  Future<List<String>> loadWords([String languageCode = 'en']) async {
    try {
      final data = await rootBundle.loadString('assets/find_word_words.txt');
      return data
          .split('\n')
          .map((w) => w.trim().toUpperCase())
          .where((w) => w.length >= minWordLength && w.length <= maxWordLength)
          .toList();
    } catch (e) {
      return ['APPLE', 'BANANA', 'CHERRY', 'ORANGE', 'GRAPES'];
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

  bool checkGuess(String guess, String target) {
    return guess.trim().toUpperCase() == target.trim().toUpperCase();
  }
}
