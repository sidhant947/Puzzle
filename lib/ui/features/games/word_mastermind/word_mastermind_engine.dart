class WordMastermindEngine {
  static const int wordLength = 4;
  static const int maxTries = 10;

  // Dedicated dataset for Word Mastermind
  final List<String> _words = [
    'BLUE', 'GOLD', 'DARK', 'MIND', 'CODE', 'PLAY', 'GAME', 'TIME', 'FAST', 'SLOW',
    'FIRE', 'WIND', 'SNOW', 'RAIN', 'STAR', 'MOON', 'SUNS', 'COOL', 'HEAT', 'ROCK',
    'TREE', 'LEAF', 'BIRD', 'FISH', 'SHIP', 'BOAT', 'ROAD', 'CITY', 'LAND', 'SAND'
  ];

  String getRandomWord() {
    return _words[(DateTime.now().millisecondsSinceEpoch % _words.length)].toUpperCase();
  }

  // Returns [bulls, cows]
  // Bulls: Correct letter, correct position
  // Cows: Correct letter, wrong position
  List<int> checkGuess(String guess, String target) {
    int bulls = 0;
    int cows = 0;

    List<String> targetList = target.toUpperCase().split('');
    List<String> guessList = guess.toUpperCase().split('');
    List<bool> targetUsed = List.filled(wordLength, false);
    List<bool> guessUsed = List.filled(wordLength, false);

    // First pass: Find Bulls
    for (int i = 0; i < wordLength; i++) {
      if (guessList[i] == targetList[i]) {
        bulls++;
        targetUsed[i] = true;
        guessUsed[i] = true;
      }
    }

    // Second pass: Find Cows
    for (int i = 0; i < wordLength; i++) {
      if (!guessUsed[i]) {
        for (int j = 0; j < wordLength; j++) {
          if (!targetUsed[j] && guessList[i] == targetList[j]) {
            cows++;
            targetUsed[j] = true;
            break;
          }
        }
      }
    }

    return [bulls, cows];
  }
}
