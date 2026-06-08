import 'dart:math';

class OxymoronHuntEngine {
  final Random _random = Random();

  final List<OxymoronPair> _allPairs = [
    OxymoronPair('DEAFENING', 'SILENCE'),
    OxymoronPair('BITTER', 'SWEET'),
    OxymoronPair('ONLY', 'CHOICE'),
    OxymoronPair('ORIGINAL', 'COPY'),
    OxymoronPair('AWFUL', 'GOOD'),
    OxymoronPair('ALONE', 'TOGETHER'),
    OxymoronPair('LIQUID', 'GAS'),
    OxymoronPair('SERIOUSLY', 'FUNNY'),
    OxymoronPair('SMALL', 'CROWD'),
    OxymoronPair('OPEN', 'SECRET'),
    OxymoronPair('FOUND', 'MISSING'),
    OxymoronPair('CLEARLY', 'CONFUSED'),
    OxymoronPair('ACT', 'NATURALLY'),
    OxymoronPair('VIRTUAL', 'REALITY'),
    OxymoronPair('CRUEL', 'KINDNESS'),
    OxymoronPair('PRETTY', 'UGLY'),
    OxymoronPair('OLD', 'NEWS'),
    OxymoronPair('LIVING', 'DEAD'),
  ];

  OxymoronHuntPuzzle generatePuzzle() {
    final pairs = List<OxymoronPair>.from(_allPairs);
    pairs.shuffle(_random);
    
    // Select 4 pairs for a 2x4 grid or similar
    final selectedPairs = pairs.take(4).toList();
    final words = <String>[];
    for (var pair in selectedPairs) {
      words.add(pair.word1);
      words.add(pair.word2);
    }
    words.shuffle(_random);
    
    return OxymoronHuntPuzzle(
      words: words,
      pairs: selectedPairs,
    );
  }
}

class OxymoronPair {
  final String word1;
  final String word2;

  OxymoronPair(this.word1, this.word2);

  bool contains(String word) => word1 == word || word2 == word;
}

class OxymoronHuntPuzzle {
  final List<String> words;
  final List<OxymoronPair> pairs;

  OxymoronHuntPuzzle({
    required this.words,
    required this.pairs,
  });
}
