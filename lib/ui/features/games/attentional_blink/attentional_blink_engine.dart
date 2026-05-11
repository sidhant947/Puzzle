import 'dart:math';

class AttentionalBlinkEngine {
  final Random _random = Random();
  final String _letters = 'ABCDEFGHJKLMNPQRSTUVWXYZ';
  final String _numbers = '23456789';

  Map<String, dynamic> generateTrial(int length) {
    List<String> sequence = List.generate(length, (_) => _letters[_random.nextInt(_letters.length)]);
    
    int t1Index = 3 + _random.nextInt(3); // First target at index 3-5
    int t2Lag = 1 + _random.nextInt(5); // Second target 1-5 items after first
    int t2Index = t1Index + t2Lag;
    
    if (t2Index >= length) {
      t2Index = length - 1;
    }

    String t1 = _numbers[_random.nextInt(_numbers.length)];
    String t2;
    do {
      t2 = _numbers[_random.nextInt(_numbers.length)];
    } while (t2 == t1);

    sequence[t1Index] = t1;
    sequence[t2Index] = t2;

    return {
      'sequence': sequence,
      't1': t1,
      't2': t2,
      't1Index': t1Index,
      't2Index': t2Index,
    };
  }
}
