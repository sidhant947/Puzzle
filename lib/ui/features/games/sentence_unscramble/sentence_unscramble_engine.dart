import 'dart:math';

class SentenceUnscramblePuzzle {
  final List<String> originalWords;
  final List<String> scrambledWords;
  final String fullSentence;

  SentenceUnscramblePuzzle({
    required this.originalWords,
    required this.scrambledWords,
    required this.fullSentence,
  });
}

class SentenceUnscrambleEngine {
  final Random _random = Random();

  final List<String> _sentences = [
    'The quick brown fox jumps over the lazy dog.',
    'A journey of a thousand miles begins with a single step.',
    'To be or not to be that is the question.',
    'All that glitters is not gold.',
    'Early to bed and early to rise makes a man healthy.',
    'Practice makes perfect when you are learning new things.',
    'The sun rises in the east and sets in the west.',
    'Knowledge is power but character is more important.',
    'An apple a day keeps the doctor away.',
    'Better late than never but better never late.',
    'Life is what happens when you are busy making other plans.',
    'The only thing we have to fear is fear itself.',
    'Ask not what your country can do for you.',
    'I think therefore I am said the philosopher.',
    'Success is not final failure is not fatal.',
    'Every cloud has a silver lining if you look closely.',
    'Actions speak louder than words in most situations.',
    'A bird in the hand is worth two in the bush.',
    'Don’t count your chickens before they hatch.',
    'If you want something done right do it yourself.',
  ];

  SentenceUnscramblePuzzle generatePuzzle() {
    final sentence = _sentences[_random.nextInt(_sentences.length)];
    // Remove punctuation for simplicity in this game
    final cleanSentence = sentence.replaceAll(RegExp(r'[^\w\s]'), '');
    final words = cleanSentence.toUpperCase().split(' ').where((w) => w.isNotEmpty).toList();
    final scrambled = List<String>.from(words)..shuffle(_random);
    
    // Ensure it's actually scrambled
    if (words.length > 1 && _isEqual(words, scrambled)) {
      scrambled.shuffle(_random);
    }

    return SentenceUnscramblePuzzle(
      originalWords: words,
      scrambledWords: scrambled,
      fullSentence: cleanSentence.toUpperCase(),
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
