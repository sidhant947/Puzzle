import 'dart:math';

class AnagramDefinitionEngine {
  final List<AnagramTask> _tasks = [
    AnagramTask(scrambled: 'DEALER', target: 'LEADER', definition: 'A person who commands a group, organization, or country.'),
    AnagramTask(scrambled: 'DORMITORY', target: 'DIRTY ROOM', definition: 'A place where many people sleep (humorous anagram).'),
    AnagramTask(scrambled: 'LISTEN', target: 'SILENT', definition: 'Making no utterance or sound.'),
    AnagramTask(scrambled: 'ELBOW', target: 'BELOW', definition: 'At a lower level or layer.'),
    AnagramTask(scrambled: 'NIGHT', target: 'THING', definition: 'An object that one need not or cannot specificially name.'),
    AnagramTask(scrambled: 'STATE', target: 'TASTE', definition: 'The sensation of flavor perceived in the mouth.'),
    AnagramTask(scrambled: 'ARC', target: 'CAR', definition: 'A road vehicle, typically with four wheels.'),
    AnagramTask(scrambled: 'BRAG', target: 'GRAB', definition: 'Seize suddenly and roughly.'),
    AnagramTask(scrambled: 'SAVE', target: 'VASE', definition: 'A decorative container, typically of glass or china.'),
    AnagramTask(scrambled: 'LEMON', target: 'MELON', definition: 'A yellow citrus fruit.'),
  ];

  AnagramTask getRandomTask() {
    return _tasks[Random().nextInt(_tasks.length)];
  }

  bool checkAnswer(String guess, String target) {
    return guess.toUpperCase().replaceAll(' ', '') == target.toUpperCase().replaceAll(' ', '');
  }
}

class AnagramTask {
  final String scrambled;
  final String target;
  final String definition;

  AnagramTask({
    required this.scrambled,
    required this.target,
    required this.definition,
  });
}
