import 'dart:math' as math;

class ConundrumRound {
  final String scrambled;
  final String solution;
  final List<String> letterPool;

  ConundrumRound({
    required this.scrambled,
    required this.solution,
    required this.letterPool,
  });
}

class ConundrumAnagramEngine {
  static final List<String> _words9 = [
    'DISCOVERY',
    'BEAUTIFUL',
    'CHAMPIONS',
    'LANDSCAPE',
    'NOTEBOOKS',
    'PARADISED',
    'ORCHESTRA',
    'UNIVERSAL',
    'ADVENTURE',
    'BRILLIANT',
  ];

  static ConundrumRound generateRound({math.Random? random}) {
    final rng = random ?? math.Random();
    final word = _words9[rng.nextInt(_words9.length)];

    final letters = word.split('');
    final shuffled = List<String>.from(letters)..shuffle(rng);

    return ConundrumRound(
      scrambled: shuffled.join(''),
      solution: word,
      letterPool: shuffled,
    );
  }
}
