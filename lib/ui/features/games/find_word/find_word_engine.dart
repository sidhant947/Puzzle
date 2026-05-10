import 'dart:math';
import 'package:flutter/services.dart';

enum LetterStatus { initial, notInWord, wrongSpot, correctSpot }

class FindWordEngine {
  static const int maxTries = 6;
  static const int wordLength = 5;
  static List<String>? _cachedWords;

  Future<List<String>> loadWords() async {
    if (_cachedWords != null) return _cachedWords!;
    
    try {
      final data = await rootBundle.loadString('assets/find_word_words.txt');
      _cachedWords = data
          .split('\n')
          .map((w) => w.trim().toUpperCase())
          .where((w) => w.length == wordLength)
          .toList();
      
      if (_cachedWords!.isEmpty) {
        _cachedWords = ['APPLE', 'BRAIN', 'CHAIR', 'DANCE', 'EARTH'];
      }
      return _cachedWords!;
    } catch (e) {
      // Fallback if asset loading fails
      _cachedWords = ['APPLE', 'BRAIN', 'CHAIR', 'DANCE', 'EARTH'];
      return _cachedWords!;
    }
  }

  String getRandomWord(List<String> words) {
    if (words.isEmpty) return 'APPLE';
    return words[Random().nextInt(words.length)];
  }

  List<LetterStatus> checkGuess(String guess, String target) {
    List<LetterStatus> results = List.filled(wordLength, LetterStatus.notInWord);
    
    // Safety check: ensure both words have the expected length
    if (guess.length != wordLength || target.length != wordLength) {
      return results;
    }

    List<String> targetList = target.split('');
    List<String> guessList = guess.split('');

    // First pass: Correct spots
    for (int i = 0; i < wordLength; i++) {
      if (guessList[i] == targetList[i]) {
        results[i] = LetterStatus.correctSpot;
        targetList[i] = ''; // Mark as used
        guessList[i] = ''; // Mark as handled
      }
    }

    // Second pass: Wrong spots
    for (int i = 0; i < wordLength; i++) {
      if (guessList[i] != '') {
        int index = targetList.indexOf(guessList[i]);
        if (index != -1) {
          results[i] = LetterStatus.wrongSpot;
          targetList[index] = ''; // Mark as used
        }
      }
    }

    return results;
  }
}
