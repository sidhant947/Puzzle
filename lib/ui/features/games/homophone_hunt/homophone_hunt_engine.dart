import 'dart:math';

class HomophonePuzzle {
  final String sentence;
  final String correctAnswer;
  final String wrongAnswer;
  final String fullSentence;

  HomophonePuzzle({
    required this.sentence,
    required this.correctAnswer,
    required this.wrongAnswer,
    required this.fullSentence,
  });
}

class HomophoneHuntEngine {
  final Random _random = Random();

  final List<Map<String, dynamic>> _data = [
    {
      'sentence': 'I hope the ____ is nice tomorrow.',
      'correct': 'weather',
      'wrong': 'whether',
      'full': 'I hope the weather is nice tomorrow.'
    },
    {
      'sentence': 'I don\'t know ____ I should go or stay.',
      'correct': 'whether',
      'wrong': 'weather',
      'full': 'I don\'t know whether I should go or stay.'
    },
    {
      'sentence': 'The dog wagged ____ tail.',
      'correct': 'its',
      'wrong': 'it\'s',
      'full': 'The dog wagged its tail.'
    },
    {
      'sentence': '____ a very beautiful day.',
      'correct': 'It\'s',
      'wrong': 'Its',
      'full': 'It\'s a very beautiful day.'
    },
    {
      'sentence': 'They left ____ bags in the car.',
      'correct': 'their',
      'wrong': 'there',
      'full': 'They left their bags in the car.'
    },
    {
      'sentence': 'Go over ____ and sit down.',
      'correct': 'there',
      'wrong': 'their',
      'full': 'Go over there and sit down.'
    },
    {
      'sentence': '____ going to the park later.',
      'correct': 'They\'re',
      'wrong': 'Their',
      'full': 'They\'re going to the park later.'
    },
    {
      'sentence': 'I need to ____ some new clothes.',
      'correct': 'buy',
      'wrong': 'by',
      'full': 'I need to buy some new clothes.'
    },
    {
      'sentence': 'He sat ____ the window.',
      'correct': 'by',
      'wrong': 'buy',
      'full': 'He sat by the window.'
    },
    {
      'sentence': 'I read the ____ book in one day.',
      'correct': 'whole',
      'wrong': 'hole',
      'full': 'I read the whole book in one day.'
    },
    {
      'sentence': 'There is a ____ in my sock.',
      'correct': 'hole',
      'wrong': 'whole',
      'full': 'There is a hole in my sock.'
    },
  ];

  HomophonePuzzle generatePuzzle() {
    final item = _data[_random.nextInt(_data.length)];
    return HomophonePuzzle(
      sentence: item['sentence'],
      correctAnswer: item['correct'],
      wrongAnswer: item['wrong'],
      fullSentence: item['full'],
    );
  }
}
