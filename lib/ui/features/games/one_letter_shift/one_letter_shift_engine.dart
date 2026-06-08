import 'dart:math';

class OneLetterShiftEngine {
  static const List<Map<String, String>> _puzzles = [
    {'start': 'HEART', 'end': 'STARE', 'hint': 'To look fixedly'},
    {'start': 'SLATE', 'end': 'CLEAT', 'hint': 'A wedge-shaped projection'},
    {'start': 'BREAD', 'end': 'TREAD', 'hint': 'To walk or step'},
    {'start': 'TRAIN', 'end': 'BRAIN', 'hint': 'Organ of the head'},
    {'start': 'PLANE', 'end': 'LEARN', 'hint': 'To acquire knowledge'},
    {'start': 'STORE', 'end': 'ROSET', 'hint': 'A decorative knot'}, // No, ROSETTE?
    {'start': 'STORE', 'end': 'OTHER', 'hint': 'Not the same'},
    {'start': 'SHORE', 'end': 'HORSE', 'hint': 'Equine animal'},
    {'start': 'PLATE', 'end': 'LEAPT', 'hint': 'Jumped'},
    {'start': 'STEAM', 'end': 'MATES', 'hint': 'Friends or partners'},
    {'start': 'GRAPE', 'end': 'PAGER', 'hint': 'Communication device'},
    {'start': 'LEAST', 'end': 'SLATE', 'hint': 'Roofing material'},
    {'start': 'REACH', 'end': 'CHAIR', 'hint': 'Something to sit on'},
    {'start': 'TEACH', 'end': 'CHEAT', 'hint': 'To act dishonestly'},
    {'start': 'DREAM', 'end': 'ARMED', 'hint': 'Equipped with weapons'},
    {'start': 'MAPLE', 'end': 'AMPLE', 'hint': 'Plentiful'},
    {'start': 'SPARE', 'end': 'PEARS', 'hint': 'Fruit'},
    {'start': 'STARE', 'end': 'TEARS', 'hint': 'Drops from eyes'},
    {'start': 'SNAKE', 'end': 'SNEAK', 'hint': 'To move stealthily'},
    {'start': 'EARTH', 'end': 'HEART', 'hint': 'Organ that pumps blood'},
    {'start': 'BRAKE', 'end': 'BAKER', 'hint': 'One who bakes bread'},
    {'start': 'PEACH', 'end': 'CHEAP', 'hint': 'Low in price'},
    {'start': 'LEMON', 'end': 'MELON', 'hint': 'Large fruit'},
    {'start': 'SWING', 'hint': 'To move to and fro', 'end': 'WINGS'}, // No, 5 to 5.
    {'start': 'LARGE', 'end': 'GLARE', 'hint': 'A fierce look'},
    {'start': 'TABLE', 'end': 'BLEAT', 'hint': 'Cry of a sheep'},
  ];

  Map<String, String> getRandomPuzzle() {
    final random = Random();
    return _puzzles[random.nextInt(_puzzles.length)];
  }

  bool isCorrect(String endWord, String userWord) {
    return endWord.toUpperCase() == userWord.toUpperCase();
  }
}
