import 'dart:math' as math;

enum NavonTaskLevel { global, local }

class NavonStimulus {
  final String globalLetter; // e.g. 'H', 'S', 'T', 'E'
  final String localLetter;  // e.g. 'H', 'S', 'T', 'E'
  final NavonTaskLevel taskLevel;

  NavonStimulus({
    required this.globalLetter,
    required this.localLetter,
    required this.taskLevel,
  });

  String get targetLetter => taskLevel == NavonTaskLevel.global ? globalLetter : localLetter;
}

class NavonHierarchicalEngine {
  static const List<String> letterPool = ['H', 'S', 'T', 'E', 'L', 'F'];

  static NavonStimulus generateStimulus({math.Random? random}) {
    final rng = random ?? math.Random();
    final taskLevel = rng.nextBool() ? NavonTaskLevel.global : NavonTaskLevel.local;
    
    final gIdx = rng.nextInt(letterPool.length);
    int lIdx = rng.nextInt(letterPool.length);
    // 50% congruent, 50% incongruent
    if (rng.nextBool()) {
      lIdx = gIdx;
    } else {
      while (lIdx == gIdx) {
        lIdx = rng.nextInt(letterPool.length);
      }
    }

    return NavonStimulus(
      globalLetter: letterPool[gIdx],
      localLetter: letterPool[lIdx],
      taskLevel: taskLevel,
    );
  }
}
