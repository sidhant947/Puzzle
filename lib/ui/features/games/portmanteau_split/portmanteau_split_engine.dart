import 'dart:math';

class PortmanteauSplitEngine {
  final Random _random = Random();

  final List<PortmanteauPuzzle> _puzzles = [
    PortmanteauPuzzle(portmanteau: 'BRUNCH', word1: 'BREAKFAST', word2: 'LUNCH'),
    PortmanteauPuzzle(portmanteau: 'SMOG', word1: 'SMOKE', word2: 'FOG'),
    PortmanteauPuzzle(portmanteau: 'MOTEL', word1: 'MOTOR', word2: 'HOTEL'),
    PortmanteauPuzzle(portmanteau: 'SPORK', word1: 'SPOON', word2: 'FORK'),
    PortmanteauPuzzle(portmanteau: 'CHILLAX', word1: 'CHILL', word2: 'RELAX'),
    PortmanteauPuzzle(portmanteau: 'GLAMPING', word1: 'GLAMOROUS', word2: 'CAMPING'),
    PortmanteauPuzzle(portmanteau: 'BROMANCE', word1: 'BROTHER', word2: 'ROMANCE'),
    PortmanteauPuzzle(portmanteau: 'FREEMIUM', word1: 'FREE', word2: 'PREMIUM'),
    PortmanteauPuzzle(portmanteau: 'PODCAST', word1: 'IPOD', word2: 'BROADCAST'),
    PortmanteauPuzzle(portmanteau: 'LABRADOODLE', word1: 'LABRADOR', word2: 'POODLE'),
    PortmanteauPuzzle(portmanteau: 'MOCKTAIL', word1: 'MOCK', word2: 'COCKTAIL'),
    PortmanteauPuzzle(portmanteau: 'EMOTICON', word1: 'EMOTION', word2: 'ICON'),
    PortmanteauPuzzle(portmanteau: 'STAGFLATION', word1: 'STAGNATION', word2: 'INFLATION'),
    PortmanteauPuzzle(portmanteau: 'BIONIC', word1: 'BIOLOGY', word2: 'ELECTRONIC'),
  ];

  PortmanteauPuzzle generatePuzzle() {
    final puzzle = _puzzles[_random.nextInt(_puzzles.length)];
    
    // Generate distractors
    final distractors = <String>{};
    while (distractors.length < 4) {
      final p = _puzzles[_random.nextInt(_puzzles.length)];
      if (p.word1 != puzzle.word1 && p.word1 != puzzle.word2) distractors.add(p.word1);
      if (p.word2 != puzzle.word1 && p.word2 != puzzle.word2) distractors.add(p.word2);
    }
    
    final options = [puzzle.word1, puzzle.word2, ...distractors.take(4)];
    options.shuffle(_random);
    
    return PortmanteauPuzzle(
      portmanteau: puzzle.portmanteau,
      word1: puzzle.word1,
      word2: puzzle.word2,
      options: options,
    );
  }
}

class PortmanteauPuzzle {
  final String portmanteau;
  final String word1;
  final String word2;
  final List<String> options;

  PortmanteauPuzzle({
    required this.portmanteau,
    required this.word1,
    required this.word2,
    this.options = const [],
  });
}
