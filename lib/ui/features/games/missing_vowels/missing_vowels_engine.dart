import 'dart:math';
import 'package:flutter/services.dart';

class MissingVowelsEngine {
  static const int minWordLength = 5;
  static const int maxWordLength = 8;

  Future<List<String>> loadWords([String languageCode = 'en']) async {
    try {
      final data = await rootBundle.loadString('assets/find_word_words.txt');
      return data
          .split('\n')
          .map((w) => w.trim().toUpperCase())
          .where((w) => w.length >= minWordLength && w.length <= maxWordLength)
          .where((w) => w.contains(RegExp('[AEIOU]'))) // Must have vowels
          .toList();
    } catch (e) {
      return ['APPLE', 'BANANA', 'CHERRY', 'ORANGE', 'GRAPES'];
    }
  }

  String getRandomWord(List<String> words) {
    if (words.isEmpty) return 'APPLE';
    return words[Random().nextInt(words.length)];
  }

  String hideVowels(String word) {
    return word.replaceAll(RegExp('[AEIOU]'), '_');
  }

  bool checkGuess(String guess, String target) {
    return guess.trim().toUpperCase() == target.trim().toUpperCase();
  }
}
