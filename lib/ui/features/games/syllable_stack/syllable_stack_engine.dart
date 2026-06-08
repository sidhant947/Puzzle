import 'dart:math';

class SyllableStackPuzzle {
  final String word;
  final List<String> syllables;
  final List<String> shuffledSyllables;

  SyllableStackPuzzle({
    required this.word,
    required this.syllables,
    required this.shuffledSyllables,
  });
}

class SyllableStackEngine {
  final Random _random = Random();

  final List<Map<String, List<String>>> _wordData = [
    {'APPLE': ['AP', 'PLE']},
    {'BANANA': ['BA', 'NA', 'NA']},
    {'COMPUTER': ['COM', 'PU', 'TER']},
    {'BUTTERFLY': ['BUT', 'TER', 'FLY']},
    {'DINOSAUR': ['DI', 'NO', 'SAUR']},
    {'ELEPHANT': ['EL', 'E', 'PHANT']},
    {'HOSPITAL': ['HOS', 'PI', 'TAL']},
    {'LIBRARY': ['LI', 'BRAR', 'Y']},
    {'OCTOPUS': ['OC', 'TO', 'PUS']},
    {'UMBRELLA': ['UM', 'BREL', 'LA']},
    {'VEGETABLE': ['VEG', 'E', 'TA', 'BLE']},
    {'WATERMELON': ['WA', 'TER', 'MEL', 'ON']},
    {'KANGAROO': ['KAN', 'GA', 'ROO']},
    {'PYRAMID': ['PYR', 'A', 'MID']},
    {'TELEPHONE': ['TEL', 'E', 'PHONE']},
    {'UNIVERSE': ['U', 'NI', 'VERSE']},
    {'WONDERFUL': ['WON', 'DER', 'FUL']},
    {'CHOCOLATE': ['CHOC', 'O', 'LATE']},
    {'ADVENTURE': ['AD', 'VEN', 'TURE']},
    {'CALENDAR': ['CAL', 'EN', 'DAR']},
  ];

  SyllableStackPuzzle generatePuzzle() {
    final data = _wordData[_random.nextInt(_wordData.length)];
    final word = data.keys.first;
    final syllables = List<String>.from(data.values.first);
    final shuffledSyllables = List<String>.from(syllables)..shuffle(_random);
    
    // Ensure it's actually shuffled if there are more than 1 syllable
    if (syllables.length > 1 && _isEqual(syllables, shuffledSyllables)) {
      shuffledSyllables.shuffle(_random);
    }

    return SyllableStackPuzzle(
      word: word,
      syllables: syllables,
      shuffledSyllables: shuffledSyllables,
    );
  }

  bool _isEqual(List<String> a, List<String> b) {
    if (a.length != b.length) return false;
    for (int i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }
}
