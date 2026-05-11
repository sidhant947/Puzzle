import 'dart:math';

class MentalRotationEngine {
  final Random _random = Random();

  MentalRotationPuzzle generatePuzzle() {
    final bool isSame = _random.nextBool();
    final List<int> pattern = _generateRandomPattern();
    final int rotation = _random.nextInt(4); // 0, 90, 180, 270

    List<int> pattern2;
    if (isSame) {
      pattern2 = _rotatePattern(pattern, rotation);
    } else {
      // Either mirror it then rotate, or just a different pattern
      if (_random.nextBool()) {
        pattern2 = _rotatePattern(_mirrorPattern(pattern), rotation);
      } else {
        pattern2 = _rotatePattern(_distortPattern(pattern), rotation);
      }
    }

    // Ensure they aren't accidentally the same if they should be different
    // (though unlikely with mirroring/distortion)
    final bool actuallySame = _arePatternsEquivalent(pattern, pattern2);

    return MentalRotationPuzzle(
      original: pattern,
      transformed: pattern2,
      isSame: actuallySame,
    );
  }

  List<int> _generateRandomPattern() {
    final List<int> indices = List.generate(16, (i) => i);
    indices.shuffle(_random);
    return indices.take(6).toList()..sort();
  }

  List<int> _rotatePattern(List<int> pattern, int rotation) {
    List<int> result = List.from(pattern);
    for (int i = 0; i < rotation; i++) {
      result = result.map((idx) {
        int r = idx ~/ 4;
        int c = idx % 4;
        // (r, c) -> (c, 3-r)
        return c * 4 + (3 - r);
      }).toList();
    }
    return result..sort();
  }

  List<int> _mirrorPattern(List<int> pattern) {
    return pattern.map((idx) {
      int r = idx ~/ 4;
      int c = idx % 4;
      // Flip horizontally: (r, c) -> (r, 3-c)
      return r * 4 + (3 - c);
    }).toList()..sort();
  }

  List<int> _distortPattern(List<int> pattern) {
    final List<int> result = List.from(pattern);
    int toRemove = _random.nextInt(result.length);
    result.removeAt(toRemove);
    
    int newIdx;
    do {
      newIdx = _random.nextInt(16);
    } while (pattern.contains(newIdx));
    
    result.add(newIdx);
    return result..sort();
  }

  bool _arePatternsEquivalent(List<int> p1, List<int> p2) {
    // Check all 4 rotations
    for (int i = 0; i < 4; i++) {
      if (_listEquals(_rotatePattern(p1, i), p2)) return true;
    }
    return false;
  }

  bool _listEquals(List<int> l1, List<int> l2) {
    if (l1.length != l2.length) return false;
    final s1 = l1..sort();
    final s2 = l2..sort();
    for (int i = 0; i < s1.length; i++) {
      if (s1[i] != s2[i]) return false;
    }
    return true;
  }
}

class MentalRotationPuzzle {
  final List<int> original;
  final List<int> transformed;
  final bool isSame;

  MentalRotationPuzzle({
    required this.original,
    required this.transformed,
    required this.isSame,
  });
}
