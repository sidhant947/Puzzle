import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class ChainReactionEngine {
  final Random _random = Random();

  static const String _wordsAssetPath = 'assets/chain_words.txt';
  static const int minWordLength = 3;
  static const int maxWordLength = 7;

  // Cached dictionary of valid words (uppercase). Populated lazily on first
  // call to [loadDictionary] / [isRealWord].
  static Set<String>? _dictionary;
  static Future<void>? _loadingFuture;

  final List<String> _words = [
    'ACTION', 'ONION', 'ONSET', 'ETHEREAL', 'ALWAYS', 'YESTERDAY',
    'APPLE', 'LEMON', 'ONLINE', 'NEARBY', 'BYPASS', 'ASSIGN',
    'GARDEN', 'ENERGY', 'GYROSCOPE', 'PERIOD', 'ODYSSEY', 'EYEBALL',
    'HANDLE', 'LEVEL', 'ELBOW', 'OWNER', 'ERROR', 'ORBIT',
    'BOTTLE', 'LENGTH', 'THROUGH', 'GHOST', 'STORM', 'REMOTE',
    'TEMPLE', 'LEAVE', 'VEHICLE', 'CLEAN', 'ANIMAL', 'ALONE',
  ];

  ChainReactionPuzzle generatePuzzle() {
    final startWord = _words[_random.nextInt(_words.length)];
    return ChainReactionPuzzle(
      startWord: startWord,
      targetChainLength: 5,
    );
  }

  bool isValidNextWord(String currentWord, String nextWord) {
    if (currentWord.length < 2 || nextWord.length < 2) return false;
    final lastTwo = currentWord.substring(currentWord.length - 2).toUpperCase();
    final firstTwo = nextWord.substring(0, 2).toUpperCase();
    return lastTwo == firstTwo;
  }

  /// Returns true once the dictionary has been loaded into memory.
  /// Safe to call repeatedly — concurrent callers share the same future.
  Future<bool> ensureLoaded() async {
    if (_dictionary != null) return true;
    _loadingFuture ??= _loadFromAsset();
    try {
      await _loadingFuture;
      return _dictionary != null && _dictionary!.isNotEmpty;
    } catch (_) {
      _loadingFuture = null;
      return false;
    }
  }

  Future<void> _loadFromAsset() async {
    final data = await rootBundle.loadString(_wordsAssetPath);
    final words = await compute(_processWords, data);
    _dictionary = words;
  }

  static Set<String> _processWords(String data) {
    return data
        .split('\n')
        .map((w) => w.trim().toUpperCase())
        .where(
          (w) =>
              w.length >= minWordLength &&
              w.length <= maxWordLength &&
              RegExp(r'^[A-Z]+$').hasMatch(w),
        )
        .toSet();
  }

  /// Synchronous check against the dictionary.
  /// Returns false if the dictionary has not been loaded yet — callers should
  /// invoke [ensureLoaded] first.
  bool isRealWord(String word) {
    final normalized = word.trim().toUpperCase();
    if (normalized.length < minWordLength || normalized.length > maxWordLength) {
      return false;
    }
    final dict = _dictionary;
    if (dict == null || dict.isEmpty) return false;
    return dict.contains(normalized);
  }

  /// Test/debug hook — replaces the in-memory dictionary. Returns the
  /// previously installed set so tests can restore it.
  @visibleForTesting
  static Set<String>? debugSetDictionary(Set<String>? words) {
    final previous = _dictionary;
    _dictionary = words?.map((w) => w.toUpperCase()).toSet();
    _loadingFuture = null;
    return previous;
  }

  @visibleForTesting
  static void debugReset() {
    _dictionary = null;
    _loadingFuture = null;
  }
}

class ChainReactionPuzzle {
  final String startWord;
  final int targetChainLength;

  ChainReactionPuzzle({
    required this.startWord,
    required this.targetChainLength,
  });
}
