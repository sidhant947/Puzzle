class WordLadderEngine {
  // Dedicated dataset of valid 4-letter words for Word Ladder
  final Set<String> _dictionary = {
    'COLD', 'CORD', 'CARD', 'WARD', 'WARM',
    'FIRE', 'FARE', 'CARE', 'CAKE', 'BAKE',
    'BLUE', 'BLUR', 'SLUR', 'SLOW', 'SNOW',
    'BOOK', 'COOK', 'COCK', 'ROCK', 'RACK',
    'TIME', 'TIDE', 'RIDE', 'RICE', 'RACE',
    'WIND', 'WINE', 'LINE', 'LANE', 'LATE',
    'SHIP', 'SLIP', 'SLAP', 'SLAT', 'FLAT',
    'MOON', 'SOON', 'SOON', 'SOON', 'SOON', // Placeholder chains
    'FISH', 'DISH', 'DASH', 'BASH', 'BASK'
  };

  final List<Map<String, String>> _puzzles = [
    {'start': 'COLD', 'end': 'WARM'},
    {'start': 'FIRE', 'end': 'BAKE'},
    {'start': 'BLUE', 'end': 'SNOW'},
    {'start': 'BOOK', 'end': 'RACK'},
    {'start': 'TIME', 'end': 'RACE'},
    {'start': 'WIND', 'end': 'LATE'},
  ];

  Map<String, String> getRandomPuzzle() {
    return _puzzles[(DateTime.now().millisecondsSinceEpoch % _puzzles.length)];
  }

  bool isValidWord(String word) {
    return _dictionary.contains(word.toUpperCase());
  }

  bool isOneLetterDifferent(String word1, String word2) {
    if (word1.length != word2.length) return false;
    int differences = 0;
    for (int i = 0; i < word1.length; i++) {
      if (word1[i] != word2[i]) differences++;
    }
    return differences == 1;
  }
}
