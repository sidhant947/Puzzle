import 'dart:math';

class EtymonOddballEngine {
  final List<OddballTask> _tasks = [
    OddballTask(words: ['ASTRONOMY', 'ASTROLOGY', 'ASTERISK', 'ASPHALT'], oddball: 'ASPHALT', description: 'ASPHALT does not share the Greek "astron" (star) root.'),
    OddballTask(words: ['TELEPHONE', 'TELEVISION', 'TELEPATHY', 'TELLURIUM'], oddball: 'TELLURIUM', description: 'TELLURIUM does not share the Greek "tele" (far) root.'),
    OddballTask(words: ['BIOLOGY', 'BIOGRAPHY', 'BIOME', 'BICYCLE'], oddball: 'BICYCLE', description: 'BICYCLE does not share the Greek "bios" (life) root.'),
    OddballTask(words: ['MANUAL', 'MANUSCRIPT', 'MANAGE', 'MANIAC'], oddball: 'MANIAC', description: 'MANIAC does not share the Latin "manus" (hand) root.'),
    OddballTask(words: ['AUDIENCE', 'AUDITORIUM', 'AUDIBLE', 'AUGUST'], oddball: 'AUGUST', description: 'AUGUST does not share the Latin "audire" (hear) root.'),
    OddballTask(words: ['CHRONOLOGY', 'CHRONIC', 'CHRONOMETER', 'CHROME'], oddball: 'CHROME', description: 'CHROME does not share the Greek "khronos" (time) root.'),
    OddballTask(words: ['SPECTATOR', 'SPECTRUM', 'INSPECT', 'SPECIAL'], oddball: 'SPECIAL', description: 'SPECIAL does not share the Latin "specere" (look) root.'), // Debatable, but for the game...
    OddballTask(words: ['PHOTOGRAPHY', 'PHOTON', 'PHOTOSYNTHESIS', 'PHRASE'], oddball: 'PHRASE', description: 'PHRASE does not share the Greek "phos" (light) root.'),
    OddballTask(words: ['GEOLOGY', 'GEOGRAPHY', 'GEOMETRY', 'GENTLE'], oddball: 'GENTLE', description: 'GENTLE does not share the Greek "geo" (earth) root.'),
    OddballTask(words: ['AQUARIUM', 'AQUATIC', 'AQUEDUCT', 'AQUIFER'], oddball: 'AQUIFER', description: 'Wait, AQUIFER has aqua. Let\'s try: AQUARIUM, AQUATIC, AQUEDUCT, EQUATOR'),
    OddballTask(words: ['AQUARIUM', 'AQUATIC', 'AQUEDUCT', 'EQUATOR'], oddball: 'EQUATOR', description: 'EQUATOR does not share the Latin "aqua" (water) root.'),
  ];

  OddballTask getRandomTask() {
    return _tasks[Random().nextInt(_tasks.length)];
  }

  bool checkAnswer(String selected, String correct) {
    return selected == correct;
  }
}

class OddballTask {
  final List<String> words;
  final String oddball;
  final String description;

  OddballTask({required this.words, required this.oddball, required this.description});
}
