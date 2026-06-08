import 'dart:math';

class CognateCatchEngine {
  final List<CognateTask> _tasks = [
    CognateTask(word1: 'NIGHT', word2: 'NACHT', language: 'German', isCognate: true, description: 'Cognates: Both come from Proto-Indo-European *nokwt-.'),
    CognateTask(word1: 'EMBARRASSED', word2: 'EMBARAZADA', language: 'Spanish', isCognate: false, description: 'False Friends: "Embarazada" means pregnant.'),
    CognateTask(word1: 'ACTUALLY', word2: 'ACTUELLEMENT', language: 'French', isCognate: false, description: 'False Friends: "Actuellement" means currently.'),
    CognateTask(word1: 'MOTHER', word2: 'MADRE', language: 'Spanish', isCognate: true, description: 'Cognates: Both come from Proto-Indo-European *méh₂tēr.'),
    CognateTask(word1: 'GIFT', word2: 'GIFT', language: 'German', isCognate: false, description: 'False Friends: "Gift" in German means poison.'),
    CognateTask(word1: 'LIBRARY', word2: 'LIBRAIRIE', language: 'French', isCognate: false, description: 'False Friends: "Librairie" means bookstore.'),
    CognateTask(word1: 'STATION', word2: 'STATION', language: 'French', isCognate: true, description: 'Cognates: Both from Latin "statio".'),
    CognateTask(word1: 'EVENTUALLY', word2: 'EVENTUALMENTE', language: 'Spanish', isCognate: false, description: 'False Friends: "Eventualmente" means possibly/at times.'),
    CognateTask(word1: 'WATER', word2: 'WASSER', language: 'German', isCognate: true, description: 'Cognates: Both from Proto-Germanic *watōr.'),
    CognateTask(word1: 'SENSITIVE', word2: 'SENSIVEL', language: 'Portuguese', isCognate: true, description: 'Cognates: Both from Latin "sensitivus".'),
    CognateTask(word1: 'EXIT', word2: 'EXITO', language: 'Spanish', isCognate: false, description: 'False Friends: "Éxito" means success.'),
    CognateTask(word1: 'ROPE', word2: 'ROPA', language: 'Spanish', isCognate: false, description: 'False Friends: "Ropa" means clothes.'),
  ];

  CognateTask getRandomTask() {
    return _tasks[Random().nextInt(_tasks.length)];
  }

  bool checkAnswer(bool selected, bool correct) {
    return selected == correct;
  }
}

class CognateTask {
  final String word1;
  final String word2;
  final String language;
  final bool isCognate;
  final String description;

  CognateTask({
    required this.word1,
    required this.word2,
    required this.language,
    required this.isCognate,
    required this.description,
  });
}
