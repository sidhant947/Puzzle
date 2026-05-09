import 'dart:math';

class TypingSpeedEngine {
  final List<String> _phrases = [
    "THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG",
    "PRACTICE MAKES PERFECT IN EVERY ENDEAVOR",
    "KNOWLEDGE IS POWER AND TIME IS MONEY",
    "FLUTTER IS A POWERFUL FRAMEWORK FOR APPS",
    "TYPE AS FAST AS YOU CAN WITHOUT MISTAKES",
    "CHALLENGE YOUR BRAIN WITH DAILY PUZZLES",
    "SUCCESS IS NOT FINAL FAILURE IS NOT FATAL",
    "CONSISTENCY IS THE KEY TO GREAT RESULTS",
  ];

  String getRandomPhrase() {
    return _phrases[Random().nextInt(_phrases.length)];
  }

  double calculateWPM(int correctChars, int secondsElapsed) {
    if (secondsElapsed <= 0) return 0.0;
    // Standard WPM: (chars / 5) / (seconds / 60)
    return (correctChars / 5.0) / (secondsElapsed / 60.0);
  }

  int countCorrectChars(String input, String target) {
    int count = 0;
    int length = min(input.length, target.length);
    for (int i = 0; i < length; i++) {
      if (input[i].toUpperCase() == target[i].toUpperCase()) {
        count++;
      }
    }
    return count;
  }
}
