import 'dart:math' as math;

class WordPairEntry {
  final String wordA;
  final String wordB;

  WordPairEntry(this.wordA, this.wordB);
}

class WordPairAssociateRound {
  final List<WordPairEntry> studyPairs;
  final List<WordPairEntry> queryPairs; // Tested with options

  WordPairAssociateRound({
    required this.studyPairs,
    required this.queryPairs,
  });
}

class WordPairAssociateMemoryEngine {
  static final List<WordPairEntry> _wordBank = [
    WordPairEntry('DOCTOR', 'HOSPITAL'),
    WordPairEntry('ASTRONAUT', 'SHUTTLE'),
    WordPairEntry('CHEF', 'KITCHEN'),
    WordPairEntry('PILOT', 'COCKPIT'),
    WordPairEntry('ARTIST', 'CANVAS'),
    WordPairEntry('GARDENER', 'SHOVEL'),
    WordPairEntry('MINER', 'PICKAXE'),
    WordPairEntry('SAILOR', 'COMPASS'),
    WordPairEntry('DETECTIVE', 'MAGNIFIER'),
    WordPairEntry('FARMER', 'TRACTOR'),
  ];

  static WordPairAssociateRound generateRound({int count = 4, math.Random? random}) {
    final rng = random ?? math.Random();
    final shuffled = List<WordPairEntry>.from(_wordBank)..shuffle(rng);

    final selected = shuffled.take(count).toList();
    final queries = List<WordPairEntry>.from(selected)..shuffle(rng);

    return WordPairAssociateRound(
      studyPairs: selected,
      queryPairs: queries,
    );
  }
}
