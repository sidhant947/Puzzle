import 'dart:math';

enum WordSurgeType { synonym, antonym }

class WordSurgeChallenge {
  final String target;
  final String answer;
  final List<String> options;
  final WordSurgeType type;

  WordSurgeChallenge({
    required this.target,
    required this.answer,
    required this.options,
    required this.type,
  });
}

class WordSurgeEngine {
  final Random _random = Random();

  final List<Map<String, dynamic>> _wordPairs = [
    {"word": "Happy", "synonyms": ["Joyful", "Cheerful", "Glad"], "antonyms": ["Sad", "Miserable", "Gloomy"]},
    {"word": "Fast", "synonyms": ["Quick", "Rapid", "Swift"], "antonyms": ["Slow", "Sluggish", "Leisurely"]},
    {"word": "Big", "synonyms": ["Large", "Huge", "Enormous"], "antonyms": ["Small", "Tiny", "Little"]},
    {"word": "Smart", "synonyms": ["Intelligent", "Clever", "Bright"], "antonyms": ["Stupid", "Dull", "Foolish"]},
    {"word": "Brave", "synonyms": ["Courageous", "Fearless", "Valiant"], "antonyms": ["Cowardly", "Fearful", "Timid"]},
    {"word": "Strong", "synonyms": ["Powerful", "Mighty", "Tough"], "antonyms": ["Weak", "Fragile", "Feeble"]},
    {"word": "Kind", "synonyms": ["Generous", "Friendly", "Caring"], "antonyms": ["Cruel", "Mean", "Unkind"]},
    {"word": "Bright", "synonyms": ["Shining", "Radiant", "Luminous"], "antonyms": ["Dark", "Dim", "Dull"]},
    {"word": "Cold", "synonyms": ["Chilly", "Freezing", "Icy"], "antonyms": ["Hot", "Warm", "Burning"]},
    {"word": "Quiet", "synonyms": ["Silent", "Still", "Calm"], "antonyms": ["Loud", "Noisy", "Rowdy"]},
    {"word": "Ancient", "synonyms": ["Old", "Antique", "Aged"], "antonyms": ["Modern", "New", "Fresh"]},
    {"word": "Difficult", "synonyms": ["Hard", "Challenging", "Tough"], "antonyms": ["Easy", "Simple", "Effortless"]},
    {"word": "Beautiful", "synonyms": ["Pretty", "Lovely", "Gorgeous"], "antonyms": ["Ugly", "Hideous", "Repulsive"]},
    {"word": "Wealthy", "synonyms": ["Rich", "Affluent", "Prosperous"], "antonyms": ["Poor", "Needy", "Destitute"]},
    {"word": "Honest", "synonyms": ["Sincere", "Truthful", "Candid"], "antonyms": ["Dishonest", "Deceitful", "Fake"]},
  ];

  WordSurgeChallenge getRandomChallenge() {
    final pair = _wordPairs[_random.nextInt(_wordPairs.length)];
    final type = _random.nextBool() ? WordSurgeType.synonym : WordSurgeType.antonym;
    
    final answer = type == WordSurgeType.synonym 
        ? pair["synonyms"][_random.nextInt(3)] 
        : pair["antonyms"][_random.nextInt(3)];

    final List<String> options = [answer];
    
    // Add 3 wrong options
    while (options.length < 4) {
      final wrongPair = _wordPairs[_random.nextInt(_wordPairs.length)];
      if (wrongPair["word"] == pair["word"]) continue;

      final wrongOptions = [...wrongPair["synonyms"], ...wrongPair["antonyms"]];
      final wrongChoice = wrongOptions[_random.nextInt(wrongOptions.length)];
      
      if (!options.contains(wrongChoice)) {
        options.add(wrongChoice);
      }
    }

    options.shuffle(_random);

    return WordSurgeChallenge(
      target: pair["word"],
      answer: answer,
      options: options,
      type: type,
    );
  }
}
