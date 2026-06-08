import 'dart:math';

class SemanticDistanceEngine {
  final Random _random = Random();

  final List<SemanticDistancePuzzle> _puzzles = [
    SemanticDistancePuzzle(
      target: 'APPLE',
      relatedWords: {
        'FRUIT': 10.5,
        'ORANGE': 25.2,
        'BANANA': 30.1,
        'IPHONE': 15.8,
        'TECH': 40.5,
        'PIE': 20.3,
        'JUICE': 18.2,
        'RED': 12.4,
        'TREE': 22.1,
        'ORCHARD': 28.5,
      },
    ),
    SemanticDistancePuzzle(
      target: 'OCEAN',
      relatedWords: {
        'WATER': 5.2,
        'SEA': 8.1,
        'BEACH': 15.4,
        'WAVE': 12.3,
        'SALT': 20.1,
        'BLUE': 18.5,
        'FISH': 22.4,
        'SHARK': 30.2,
        'WHALE': 32.1,
        'DEEP': 25.6,
      },
    ),
    SemanticDistancePuzzle(
      target: 'SPACE',
      relatedWords: {
        'STAR': 10.2,
        'PLANET': 12.5,
        'GALAXY': 15.1,
        'MOON': 18.4,
        'ASTRONAUT': 22.3,
        'ROCKET': 25.1,
        'NASA': 30.5,
        'UNIVERSE': 14.2,
        'VOID': 35.6,
        'BLACK': 40.1,
      },
    ),
  ];

  SemanticDistancePuzzle generatePuzzle() {
    return _puzzles[_random.nextInt(_puzzles.length)];
  }

  double calculateDistance(String target, String guess) {
    guess = guess.toUpperCase().trim();
    if (guess == target) return 0.0;
    
    // Find puzzle
    final puzzle = _puzzles.firstWhere((p) => p.target == target);
    if (puzzle.relatedWords.containsKey(guess)) {
      return puzzle.relatedWords[guess]!;
    }

    // Default distance for unrelated words
    // Calculate a pseudo-random but stable distance based on the guess
    int hash = guess.codeUnits.fold(0, (prev, element) => prev + element);
    return 50.0 + (hash % 45.0) + (guess.length % 5);
  }
}

class SemanticDistancePuzzle {
  final String target;
  final Map<String, double> relatedWords;

  SemanticDistancePuzzle({
    required this.target,
    required this.relatedWords,
  });
}
