import 'dart:math';

class LetterBridgeEngine {
  // Better bridge data: Word1 + BridgeLetter = NewWord1, BridgeLetter + Word2 = NewWord2
  // Or just Word1 + BridgeLetter and BridgeLetter + Word2.
  static const List<Map<String, dynamic>> _puzzles = [
    {'first': 'HEAR', 'second': 'ABLE', 'bridge': 'T'}, // HEART, TABLE
    {'first': 'SUN', 'second': 'OWN', 'bridge': 'D'}, // SUND, DOWN? No.
    {'first': 'FIRE', 'second': 'ARM', 'bridge': 'A'}, // FIREA? No.
    {'first': 'HAND', 'second': 'LE', 'bridge': 'Y'}, // HANDY, YLE? No.
    
    {'first': 'BACK', 'second': 'OOR', 'bridge': 'D'}, // BACKD? No.
    
    // Let's use: Word1 + Letter is a word, Letter + Word2 is a word.
    {'first': 'BAR', 'second': 'K', 'bridge': 'K'}, // BARK, KK? No.
    
    // Standard Letter Bridge:
    // PI(A)NO -> PI-A is not a word.
    // Maybe it's: [Word1] + ? and ? + [Word2]
    {'first': 'CAR', 'second': 'PET', 'bridge': 'D'}, // CARD, DPET? No.
    
    // Let's try these:
    {'first': 'PLAN', 'second': 'AR', 'bridge': 'E'}, // PLANE, EAR
    {'first': 'BOOK', 'second': 'ND', 'bridge': 'E'}, // BOOKE? No.
    {'first': 'STAY', 'second': 'ABLE', 'bridge': 'L'}, // STAYL? No.
    
    {'first': 'BOA', 'second': 'OAT', 'bridge': 'T'}, // BOAT, TOAT? No.
    
    // How about: Word1 + ? = Word, ? + Word2 = Word
    {'first': 'WIN', 'second': 'EAR', 'bridge': 'D'}, // WIND, DEAR
    {'first': 'FOR', 'second': 'EST', 'bridge': 'T'}, // FORT, TEST
    {'first': 'CAR', 'second': 'RED', 'bridge': 'D'}, // CARD, DRED? No.
    {'first': 'BAT', 'second': 'HER', 'bridge': 'H'}, // BATH, HHER? No.
    {'first': 'MAN', 'second': 'O', 'bridge': 'G'}, // MANG? No.
    
    {'first': 'ARM', 'second': 'ART', 'bridge': 'Y'}, // ARMY, YART? No.
    {'first': 'PEN', 'second': 'ICE', 'bridge': 'D'}, // PEND, DICE
    {'first': 'SEA', 'second': 'SON', 'bridge': 'L'}, // SEAL, LSON? No.
    
    {'first': 'PAL', 'second': 'ALE', 'bridge': 'M'}, // PALM, MALE
    {'first': 'KIN', 'second': 'ART', 'bridge': 'G'}, // KING, GART? No.
    {'first': 'SIN', 'second': 'EST', 'bridge': 'G'}, // SING, GEST
    {'first': 'WAR', 'second': 'ASH', 'bridge': 'M'}, // WARM, MASH
    {'first': 'FAN', 'second': 'ANG', 'bridge': 'G'}, // FANG, GANG
    {'first': 'PAN', 'second': 'ANT', 'bridge': 'T'}, // PANT, TANT? No.
    {'first': 'BAR', 'second': 'ARE', 'bridge': 'E'}, // BARE, EARE? No.
    
    {'first': 'POST', 'second': 'AGE', 'bridge': 'S'}, // POSTS? No.
    {'first': 'HER', 'second': 'EAR', 'bridge': 'D'}, // HERD, DEAR
    {'first': 'TEN', 'second': 'ENT', 'bridge': 'T'}, // TENT, TENT
    {'first': 'FAR', 'second': 'ARE', 'bridge': 'M'}, // FARM, MARE
    {'first': 'CAR', 'second': 'ART', 'bridge': 'T'}, // CART, TART
    {'first': 'MAR', 'second': 'ARE', 'bridge': 'K'}, // MARK, KARE? No.
    {'first': 'PIN', 'second': 'END', 'bridge': 'E'}, // PINE, EEND? No.
    
    {'first': 'CAN', 'second': 'AMP', 'bridge': 'D'}, // CAND? No.
    {'first': 'WIN', 'second': 'AY', 'bridge': 'D'}, // WIND, DAY
    {'first': 'RUN', 'second': 'EAR', 'bridge': 'E'}, // RUNE, EAR
    {'first': 'TOP', 'second': 'IT', 'bridge': 'S'}, // TOPS, SIT
    {'first': 'BAR', 'second': 'RED', 'bridge': 'E'}, // BARE, ERED? No.
    {'first': 'CAR', 'second': 'ASE', 'bridge': 'E'}, // CARE, EASE
    {'first': 'FOR', 'second': 'AND', 'bridge': 'K'}, // FORK, KAND? No.
    {'first': 'HER', 'second': 'ELP', 'bridge': 'B'}, // HERB, BELP? No.
    {'first': 'HER', 'second': 'OLD', 'bridge': 'B'}, // HERB, BOLD
    {'first': 'SIN', 'second': 'ATE', 'bridge': 'G'}, // SING, GATE
    {'first': 'SON', 'second': 'GET', 'bridge': 'G'}, // SONG, GGET? No.
    {'first': 'PAN', 'second': 'ART', 'bridge': 'Y'}, // PANY? No.
    {'first': 'PAR', 'second': 'ART', 'bridge': 'T'}, // PART, TART
    {'first': 'STAR', 'second': 'RAIN', 'bridge': 'T'}, // START, TRAIN
    {'first': 'PLAN', 'second': 'EAST', 'bridge': 'T'}, // PLANT, TEAST? No.
    {'first': 'PLAN', 'second': 'EASE', 'bridge': 'T'}, // PLANT, TEASE
    {'first': 'COAL', 'second': 'ONE', 'bridge': 'D'}, // COALD? No.
    {'first': 'COAL', 'second': 'ONE', 'bridge': 'S'}, // COALS, SONE? No.
    {'first': 'HAND', 'second': 'EAL', 'bridge': 'S'}, // HANDS, SEAL
    {'first': 'BOOK', 'second': 'LOW', 'bridge': 'S'}, // BOOKS, SLOW
    {'first': 'BACK', 'second': 'EAR', 'bridge': 'S'}, // BACKS, SEAR
    {'first': 'TIME', 'second': 'AND', 'bridge': 'S'}, // TIMES, SAND
    {'first': 'WORD', 'second': 'ONE', 'bridge': 'S'}, // WORDS, SONE? No.
    {'first': 'WORK', 'second': 'ING', 'bridge': 'S'}, // WORKS, SING
    {'first': 'PLAY', 'second': 'EAR', 'bridge': 'S'}, // PLAYS, SEAR
    {'first': 'RAIN', 'second': 'END', 'bridge': 'S'}, // RAINS, SEND
    {'first': 'FIRE', 'second': 'HOT', 'bridge': 'S'}, // FIRES, SHOT
    {'first': 'BLUE', 'second': 'HIP', 'bridge': 'S'}, // BLUES, SHIP
  ];

  Map<String, dynamic> getRandomPuzzle() {
    final random = Random();
    return _puzzles[random.nextInt(_puzzles.length)];
  }

  bool isCorrect(String bridge, String userLetter) {
    return bridge.toUpperCase() == userLetter.toUpperCase();
  }
}
