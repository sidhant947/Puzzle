import 'dart:math';

class EtymologyOriginEngine {
  final List<EtymologyTask> _tasks = [
    EtymologyTask(word: 'ALGEBRA', origin: 'Arabic', description: 'From "al-jabr", meaning "reunion of broken parts".'),
    EtymologyTask(word: 'KINDERGARTEN', origin: 'German', description: 'Literal translation is "children\'s garden".'),
    EtymologyTask(word: 'TSUNAMI', origin: 'Japanese', description: 'From "tsu" (harbor) and "nami" (wave).'),
    EtymologyTask(word: 'AVOCADO', origin: 'Nahuatl', description: 'From "āhuacatl", also meaning "testicle" (due to its shape).'),
    EtymologyTask(word: 'PYJAMAS', origin: 'Hindi/Urdu', description: 'From "pāy-jāma", meaning "leg garment".'),
    EtymologyTask(word: 'KARAOKE', origin: 'Japanese', description: 'From "kara" (empty) and "oke" (orchestra).'),
    EtymologyTask(word: 'SAFARI', origin: 'Swahili', description: 'From "safari", meaning "journey", originally from Arabic.'),
    EtymologyTask(word: 'CANTALOUPE', origin: 'French', description: 'Named after Cantalupo, a former papal estate near Rome.'),
    EtymologyTask(word: 'KETCHUP', origin: 'Chinese (Hokkien)', description: 'From "kôe-chiap", meaning "fish sauce".'),
    EtymologyTask(word: 'ZOMBIE', origin: 'Bantu (Kimbundu/Kongo)', description: 'From "nzambi" (god) or "zumbi" (fetish).'),
    EtymologyTask(word: 'CHOCOLATE', origin: 'Nahuatl', description: 'From "xocolātl".'),
    EtymologyTask(word: 'ROBOT', origin: 'Czech', description: 'From "robota", meaning "forced labor".'),
    EtymologyTask(word: 'TABOO', origin: 'Tongan', description: 'From "tapu", meaning "sacred" or "forbidden".'),
    EtymologyTask(word: 'BALCONY', origin: 'Italian', description: 'From "balcone", meaning "large scaffold".'),
    EtymologyTask(word: 'GURU', origin: 'Sanskrit', description: 'Meaning "weighty" or "venerable".'),
  ];

  final List<String> _languages = [
    'Arabic', 'German', 'Japanese', 'Nahuatl', 'Hindi/Urdu', 
    'Swahili', 'French', 'Chinese (Hokkien)', 'Bantu (Kimbundu/Kongo)', 
    'Czech', 'Tongan', 'Italian', 'Sanskrit', 'Spanish', 'Greek', 'Latin'
  ];

  EtymologyTask getRandomTask() {
    final task = _tasks[Random().nextInt(_tasks.length)];
    final options = {task.origin};
    final random = Random();
    
    while (options.length < 4) {
      options.add(_languages[random.nextInt(_languages.length)]);
    }
    
    return EtymologyTask(
      word: task.word,
      origin: task.origin,
      description: task.description,
      options: options.toList()..shuffle(),
    );
  }

  bool checkAnswer(String selected, String correct) {
    return selected == correct;
  }
}

class EtymologyTask {
  final String word;
  final String origin;
  final String description;
  final List<String>? options;

  EtymologyTask({
    required this.word, 
    required this.origin, 
    required this.description,
    this.options,
  });
}
