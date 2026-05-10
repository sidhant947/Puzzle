class RhythmMasterEngine {
  /// Calculates the accuracy score based on the time difference from the beat
  /// diff: difference in milliseconds
  /// interval: time between beats in milliseconds
  int calculateAccuracy(int diff, int interval) {
    if (diff < 50) return 100; // Perfect
    if (diff < 100) return 80; // Great
    if (diff < 150) return 50; // Good
    if (diff < 250) return 20; // OK
    return 0; // Miss
  }

  String getAccuracyLabel(int accuracy) {
    if (accuracy >= 100) return "PERFECT";
    if (accuracy >= 80) return "GREAT";
    if (accuracy >= 50) return "GOOD";
    if (accuracy >= 20) return "OK";
    return "MISS";
  }
}
