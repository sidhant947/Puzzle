import 'dart:math';

class SternbergTaskEngine {
  final Random _random = Random();
  final List<String> _letters = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'J', 'K', 'L', 'M', 'N', 'P', 'R', 'S', 'T', 'W', 'X', 'Y'];

  Map<String, dynamic> generateTrial(int setSize) {
    List<String> available = List.from(_letters);
    available.shuffle(_random);
    
    List<String> memorySet = available.sublist(0, setSize);
    bool isPresent = _random.nextBool();
    String probe;
    
    if (isPresent) {
      probe = memorySet[_random.nextInt(memorySet.length)];
    } else {
      probe = available[setSize + _random.nextInt(available.length - setSize)];
    }
    
    return {
      'memorySet': memorySet,
      'probe': probe,
      'isPresent': isPresent,
    };
  }
}
