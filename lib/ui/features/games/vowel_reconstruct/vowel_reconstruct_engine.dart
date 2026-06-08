import 'dart:math';

class VowelReconstructPuzzle {
  final String originalSentence;
  final String maskedSentence;
  final List<String> vowels;

  VowelReconstructPuzzle({
    required this.originalSentence,
    required this.maskedSentence,
    required this.vowels,
  });
}

class VowelReconstructEngine {
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
  ];

  VowelReconstructPuzzle generatePuzzle() {
    final sentence = _sentences[_random.nextInt(_sentences.length)];
    final cleanSentence = sentence.toUpperCase();
    
    final vowelsList = ['A', 'E', 'I', 'O', 'U'];
    String masked = '';
    List<String> vowels = [];

    for (int i = 0; i < cleanSentence.length; i++) {
      final char = cleanSentence[i];
      if (vowelsList.contains(char)) {
        masked += '_';
        vowels.add(char);
      } else {
        masked += char;
      }
    }

    return VowelReconstructPuzzle(
      originalSentence: cleanSentence,
      maskedSentence: masked,
      vowels: vowels,
    );
  }
}
