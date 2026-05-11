import 'dart:math';

class SemanticLinkEngine {
  final Random _random = Random();

  final List<SemanticLinkPuzzle> _puzzles = [
    SemanticLinkPuzzle(words: ['River', 'Money', 'Blood'], answer: 'Bank'),
    SemanticLinkPuzzle(words: ['Falling', 'Actor', 'Dust'], answer: 'Star'),
    SemanticLinkPuzzle(words: ['Broken', 'Clear', 'Eye'], answer: 'Glass'),
    SemanticLinkPuzzle(words: ['Cottage', 'Swiss', 'Cake'], answer: 'Cheese'),
    SemanticLinkPuzzle(words: ['Light', 'Birthday', 'Stick'], answer: 'Candle'),
    SemanticLinkPuzzle(words: ['Water', 'Mine', 'Shaker'], answer: 'Salt'),
    SemanticLinkPuzzle(words: ['Dream', 'Break', 'Day'], answer: 'Night'),
    SemanticLinkPuzzle(words: ['Work', 'Hot', 'Iron'], answer: 'Press'),
    SemanticLinkPuzzle(words: ['Sand', 'Running', 'Water'], answer: 'Time'),
    SemanticLinkPuzzle(words: ['Key', 'Board', 'Walk'], answer: 'Side'),
    SemanticLinkPuzzle(words: ['Bitter', 'Dark', 'Milk'], answer: 'Chocolate'),
    SemanticLinkPuzzle(words: ['Sun', 'Flower', 'Shower'], answer: 'Sun'), // Wait, Sun/Sun is bad
    SemanticLinkPuzzle(words: ['Square', 'Card', 'Table'], answer: 'Deal'),
    SemanticLinkPuzzle(words: ['Tree', 'Car', 'Boot'], answer: 'Trunk'),
    SemanticLinkPuzzle(words: ['Man', 'Wheel', 'Fire'], answer: 'First'),
    SemanticLinkPuzzle(words: ['Safety', 'Table', 'Net'], answer: 'Tennis'),
    SemanticLinkPuzzle(words: ['High', 'School', 'Back'], answer: 'Kick'), // High kick, school kick? No.
  ];

  SemanticLinkEngine() {
    // Fix some bad ones
    _puzzles.clear();
    _puzzles.addAll([
      SemanticLinkPuzzle(words: ['River', 'Money', 'Blood'], answer: 'Bank'),
      SemanticLinkPuzzle(words: ['Falling', 'Actor', 'Dust'], answer: 'Star'),
      SemanticLinkPuzzle(words: ['Broken', 'Clear', 'Eye'], answer: 'Glass'),
      SemanticLinkPuzzle(words: ['Cottage', 'Swiss', 'Cake'], answer: 'Cheese'),
      SemanticLinkPuzzle(words: ['Light', 'Birthday', 'Stick'], answer: 'Candle'),
      SemanticLinkPuzzle(words: ['Water', 'Mine', 'Shaker'], answer: 'Salt'),
      SemanticLinkPuzzle(words: ['Work', 'Hot', 'Iron'], answer: 'Press'),
      SemanticLinkPuzzle(words: ['Sand', 'Running', 'Hand'], answer: 'Time'),
      SemanticLinkPuzzle(words: ['Key', 'Board', 'Walk'], answer: 'Side'),
      SemanticLinkPuzzle(words: ['Bitter', 'Dark', 'Milk'], answer: 'Chocolate'),
      SemanticLinkPuzzle(words: ['Tree', 'Car', 'Elephant'], answer: 'Trunk'),
      SemanticLinkPuzzle(words: ['Palm', 'Shoe', 'Tree'], answer: 'Tree'), // Bad
      SemanticLinkPuzzle(words: ['Sense', 'Palm', 'Reader'], answer: 'Sixth'), // Sixth sense, palm reader? No.
      SemanticLinkPuzzle(words: ['Food', 'Forward', 'Break'], answer: 'Fast'),
      SemanticLinkPuzzle(words: ['Heart', 'Potato', 'Fried'], answer: 'Sweet'),
      SemanticLinkPuzzle(words: ['Call', 'Pay', 'Line'], answer: 'Phone'),
    ]);
  }

  SemanticLinkPuzzle generatePuzzle() {
    final puzzle = _puzzles[_random.nextInt(_puzzles.length)];
    final List<String> options = [puzzle.answer];
    
    // Add 3 random wrong answers from other puzzles
    while (options.length < 4) {
      final wrong = _puzzles[_random.nextInt(_puzzles.length)].answer;
      if (!options.contains(wrong)) {
        options.add(wrong);
      }
    }
    
    options.shuffle(_random);
    
    return SemanticLinkPuzzle(
      words: puzzle.words,
      answer: puzzle.answer,
      options: options,
    );
  }
}

class SemanticLinkPuzzle {
  final List<String> words;
  final String answer;
  final List<String> options;

  SemanticLinkPuzzle({
    required this.words,
    required this.answer,
    this.options = const [],
  });
}
