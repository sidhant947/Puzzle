import 'dart:math';

class DefinitionDashEngine {
  final Random _random = Random();

  final List<DefinitionPair> _pairs = [
    DefinitionPair(word: 'EPHEMERAL', definition: 'Lasting for a very short time.'),
    DefinitionPair(word: 'ELOQUENT', definition: 'Fluent or persuasive in speaking or writing.'),
    DefinitionPair(word: 'LUCID', definition: 'Expressed clearly; easy to understand.'),
    DefinitionPair(word: 'METICULOUS', definition: 'Showing great attention to detail; very careful and precise.'),
    DefinitionPair(word: 'PRAGMATIC', definition: 'Dealing with things sensibly and realistically.'),
    DefinitionPair(word: 'RESILIENT', definition: 'Able to withstand or recover quickly from difficult conditions.'),
    DefinitionPair(word: 'UBIQUITOUS', definition: 'Present, appearing, or found everywhere.'),
    DefinitionPair(word: 'BENEVOLENT', definition: 'Well meaning and kindly.'),
    DefinitionPair(word: 'CANDID', definition: 'Truthful and straightforward; frank.'),
    DefinitionPair(word: 'DILIGENT', definition: 'Having or showing care and conscientiousness in one\'s work.'),
  ];

  DefinitionDashPuzzle generatePuzzle() {
    final correctPair = _pairs[_random.nextInt(_pairs.length)];
    
    // Get 3 other random definitions
    final otherDefinitions = _pairs
        .where((p) => p.word != correctPair.word)
        .map((p) => p.definition)
        .toList()
      ..shuffle(_random);
    
    final options = [correctPair.definition, ...otherDefinitions.take(3)].toList()
      ..shuffle(_random);

    return DefinitionDashPuzzle(
      word: correctPair.word,
      correctDefinition: correctPair.definition,
      options: options,
    );
  }
}

class DefinitionPair {
  final String word;
  final String definition;

  DefinitionPair({required this.word, required this.definition});
}

class DefinitionDashPuzzle {
  final String word;
  final String correctDefinition;
  final List<String> options;

  DefinitionDashPuzzle({
    required this.word,
    required this.correctDefinition,
    required this.options,
  });
}
