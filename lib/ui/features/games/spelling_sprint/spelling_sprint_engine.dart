import 'dart:math';

class SpellingSprintEngine {
  final Random _random = Random();
  final List<String> _wordPool = [
    'APPLE', 'BEACH', 'CLOUD', 'DANCE', 'EAGLE', 'FLAME', 'GRAPE', 'HOUSE', 'INDEX', 'JOKER',
    'KNIFE', 'LEMON', 'MUSIC', 'NIGHT', 'OCEAN', 'PIANO', 'QUEEN', 'RIVER', 'SNAKE', 'TIGER',
    'UNCLE', 'VOICE', 'WATER', 'YACHT', 'ZEBRA', 'BRIGHT', 'COFFEE', 'DANGER', 'ENERGY', 'FLOWER',
    'GARDEN', 'HEAVEN', 'ISLAND', 'JUNGLE', 'KITTEN', 'LAPTOP', 'MARKET', 'NATURE', 'ORANGE', 'PLAYER',
    'ROCKET', 'SCHOOL', 'TRAVEL', 'UPDATE', 'VALLEY', 'WINDOW', 'YELLOW', 'ANIMAL', 'BASKET', 'CHURCH'
  ];

  String getRandomWord() {
    return _wordPool[_random.nextInt(_wordPool.length)];
  }

  List<String> getShuffledLetters(String word) {
    List<String> letters = word.split('');
    // Add some random letters to make it harder
    const alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    for (int i = 0; i < 3; i++) {
      letters.add(alphabet[_random.nextInt(alphabet.length)]);
    }
    letters.shuffle(_random);
    return letters;
  }
}
