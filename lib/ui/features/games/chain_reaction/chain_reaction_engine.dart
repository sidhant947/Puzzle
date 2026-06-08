import 'dart:math';

class ChainReactionEngine {
  final Random _random = Random();

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
  
  bool isRealWord(String word) {
    // In a real app, we'd check against a dictionary.
    // For this prototype, we'll allow any word longer than 2 chars
    // but ideally we should check if it exists.
    return word.length >= 3;
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
