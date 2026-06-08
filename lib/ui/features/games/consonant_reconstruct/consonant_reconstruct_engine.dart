import 'dart:math';

class ConsonantReconstructPuzzle {
  final String originalSentence;
  final String maskedSentence;
  final List<String> consonants;

  ConsonantReconstructPuzzle({
    required this.originalSentence,
    required this.maskedSentence,
    required this.consonants,
  });
}

class ConsonantReconstructEngine {
  final Random _random = Random();

  final List<String> _sentences = [
    'The quick brown fox jumps over the lazy dog.',
    'A journey of a thousand miles begins with a single step.',
    'To be or not to be that is the question.',
    'All that glitters is not gold.',
    'An apple a day keeps the doctor away.',
    'Actions speak louder than words.',
    'Practice makes perfect.',
    'Knowledge is power.',
    'Fortune favors the bold.',
    'Silence is golden.',
    'Patience is a virtue.',
    'Time is money.',
    'Honesty is the best policy.',
    'Laughter is the best medicine.',
    'Knowledge is power.',
  ];

  ConsonantReconstructPuzzle generatePuzzle() {
    final sentence = _sentences[_random.nextInt(_sentences.length)];
    final cleanSentence = sentence.toUpperCase();
    
    final vowelsList = ['A', 'E', 'I', 'O', 'U'];
    String masked = '';
    List<String> consonants = [];

    for (int i = 0; i < cleanSentence.length; i++) {
      final char = cleanSentence[i];
      if (RegExp(r'[A-Z]').hasMatch(char)) {
        if (!vowelsList.contains(char)) {
          masked += '_';
          consonants.add(char);
        } else {
          masked += char;
        }
      } else {
        masked += char;
      }
    }

    return ConsonantReconstructPuzzle(
      originalSentence: cleanSentence,
      maskedSentence: masked,
      consonants: consonants,
    );
  }
}
