import 'dart:math';

class RhymeMasterEngine {
  final Random _random = Random();

  final List<RhymeSet> _rhymeSets = [
    RhymeSet(target: 'CAT', rhymes: ['BAT', 'HAT', 'MAT', 'RAT', 'SAT', 'FAT', 'PAT', 'VAT']),
    RhymeSet(target: 'LIGHT', rhymes: ['BRIGHT', 'FIGHT', 'NIGHT', 'SIGHT', 'TIGHT', 'MIGHT', 'RIGHT', 'WHITE']),
    RhymeSet(target: 'PLAY', rhymes: ['DAY', 'MAY', 'SAY', 'STAY', 'WAY', 'GRAY', 'PRAY', 'TRAY']),
    RhymeSet(target: 'BLUE', rhymes: ['DUE', 'GLUE', 'TRUE', 'VIEW', 'NEW', 'SHOE', 'TWO', 'ZOO']),
    RhymeSet(target: 'SING', rhymes: ['BRING', 'KING', 'RING', 'WING', 'THING', 'SPRING', 'STRING', 'SWING']),
    RhymeSet(target: 'BOLD', rhymes: ['COLD', 'GOLD', 'HOLD', 'OLD', 'SOLD', 'TOLD', 'FOLD', 'MOLD']),
    RhymeSet(target: 'COOL', rhymes: ['POOL', 'RULE', 'SCHOOL', 'TOOL', 'FOOL', 'FUEL', 'MULE', 'SPOOL']),
  ];

  RhymeMasterPuzzle generatePuzzle() {
    final rhymeSet = _rhymeSets[_random.nextInt(_rhymeSets.length)];
    return RhymeMasterPuzzle(
      targetWord: rhymeSet.target,
      allRhymes: rhymeSet.rhymes,
    );
  }

  bool isRhyme(String targetWord, String word, List<String> allRhymes) {
    return allRhymes.contains(word.toUpperCase().trim());
  }
}

class RhymeSet {
  final String target;
  final List<String> rhymes;

  RhymeSet({required this.target, required this.rhymes});
}

class RhymeMasterPuzzle {
  final String targetWord;
  final List<String> allRhymes;

  RhymeMasterPuzzle({
    required this.targetWord,
    required this.allRhymes,
  });
}
