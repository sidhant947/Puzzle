import 'dart:math';

class LetterFrequencyScanEngine {
  static const List<String> _paragraphs = [
    'The quick brown fox jumps over the lazy dog.',
    'A journey of a thousand miles begins with a single step.',
    'To be, or not to be, that is the question.',
    'All that glitters is not gold.',
    'Fortune favors the bold.',
    'Knowledge is power.',
    'Practice makes perfect.',
    'Better late than never.',
    'Where there is a will, there is a way.',
    'Actions speak louder than words.',
    'Every cloud has a silver lining.',
    'Laughter is the best medicine.',
    'Beauty is in the eye of the beholder.',
    'Necessity is the mother of invention.',
    'Honesty is the best policy.',
    'Good things come to those who wait.',
    'The early bird catches the worm.',
    'Birds of a feather flock together.',
    'A stitch in time saves nine.',
    'Easy come, easy go.',
    'Haste makes waste.',
    'Keep your friends close, and your enemies closer.',
    'Many hands make light work.',
    'No man is an island.',
    'Old habits die hard.',
    'Out of sight, out of mind.',
    'Rome was not built in a day.',
    'The pen is mightier than the sword.',
    'Two heads are better than one.',
    'When in Rome, do as the Romans do.',
    'You cannot judge a book by its cover.',
    'Your time is limited, so do not waste it living someone else life.',
    'The only way to do great work is to love what you do.',
    'If you can dream it, you can do it.',
    'Believe you can and you are halfway there.',
    'The best way to predict the future is to create it.',
    'Success is not final, failure is not fatal: it is the courage to continue that counts.',
    'It does not matter how slowly you go as long as you do not stop.',
    'Everything you have ever wanted is on the other side of fear.',
    'Hardships often prepare ordinary people for an extraordinary destiny.',
    'Dream big and dare to fail.',
  ];

  Map<String, dynamic> getRandomPuzzle() {
    final random = Random();
    final paragraph = _paragraphs[random.nextInt(_paragraphs.length)];
    
    // Pick a letter that actually appears in the paragraph
    final cleanPara = paragraph.replaceAll(RegExp(r'[^a-zA-Z]'), '').toUpperCase();
    final letters = cleanPara.split('').toSet().toList();
    final targetLetter = letters[random.nextInt(letters.length)];
    
    final count = paragraph.toUpperCase().split('').where((l) => l == targetLetter).length;
    
    return {
      'paragraph': paragraph,
      'targetLetter': targetLetter,
      'count': count,
    };
  }

  bool isCorrect(int targetCount, int userCount) {
    return targetCount == userCount;
  }
}
