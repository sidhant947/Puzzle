import 'dart:math';

class PhoneticGuessEngine {
  final List<PhoneticTask> _tasks = [
    PhoneticTask(word: 'APPLE', ipa: 'ˈæpəl'),
    PhoneticTask(word: 'PHONETIC', ipa: 'fəˈnɛtɪk'),
    PhoneticTask(word: 'GUESS', ipa: 'ɡɛs'),
    PhoneticTask(word: 'PUZZLE', ipa: 'ˈpʌzəl'),
    PhoneticTask(word: 'KNOWLEDGE', ipa: 'ˈnɒlɪdʒ'),
    PhoneticTask(word: 'SCIENCE', ipa: 'ˈsaɪəns'),
    PhoneticTask(word: 'THROUGH', ipa: 'θruː'),
    PhoneticTask(word: 'LAUGH', ipa: 'læf'),
    PhoneticTask(word: 'RHYTHM', ipa: 'ˈrɪðəm'),
    PhoneticTask(word: 'SQUIRREL', ipa: 'ˈskwɪrəl'),
    PhoneticTask(word: 'CIRCLE', ipa: 'ˈsɜːrkəl'),
    PhoneticTask(word: 'ISLAND', ipa: 'ˈaɪlənd'),
    PhoneticTask(word: 'WRITING', ipa: 'ˈraɪtɪŋ'),
    PhoneticTask(word: 'SUBTLE', ipa: 'ˈsʌtəl'),
    PhoneticTask(word: 'RECEIPT', ipa: 'rɪˈsiːt'),
  ];

  PhoneticTask getRandomTask() {
    return _tasks[Random().nextInt(_tasks.length)];
  }

  String scrambleWord(String word) {
    List<String> letters = word.split('');
    letters.shuffle();
    return letters.join('');
  }

  bool checkGuess(String guess, String target) {
    return guess.trim().toUpperCase() == target.toUpperCase();
  }
}

class PhoneticTask {
  final String word;
  final String ipa;

  PhoneticTask({required this.word, required this.ipa});
}
