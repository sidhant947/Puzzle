import 'dart:math';

class RomanProblem {
  final String equation;
  final int answer;
  final List<int> options;

  RomanProblem({
    required this.equation,
    required this.answer,
    required this.options,
  });
}

class RomanArithmeticEngine {
  final Random _random = Random();

  static const Map<String, int> _romanToArabic = {
    'M': 1000,
    'CM': 900,
    'D': 500,
    'CD': 400,
    'C': 100,
    'XC': 90,
    'L': 50,
    'XL': 40,
    'X': 10,
    'IX': 9,
    'V': 5,
    'IV': 4,
    'I': 1,
  };

  String intToRoman(int num) {
    if (num <= 0) return "";
    var result = "";
    var remaining = num;
    _romanToArabic.forEach((roman, arabic) {
      while (remaining >= arabic) {
        result += roman;
        remaining -= arabic;
      }
    });
    return result;
  }

  int romanToInt(String roman) {
    int total = 0;
    int prevValue = 0;
    for (int i = roman.length - 1; i >= 0; i--) {
      int? value = _romanToArabic[roman[i]];
      if (value == null) continue;
      if (value < prevValue) {
        total -= value;
      } else {
        total += value;
      }
      prevValue = value;
    }
    return total;
  }

  RomanProblem generateProblem(int currentScore) {
    int difficulty = (currentScore ~/ 5) + 1;
    int maxNum = 20 * difficulty;
    
    bool isSubtraction = _random.nextBool();
    int a, b, answer;
    String symbol;

    if (isSubtraction) {
      a = _random.nextInt(maxNum) + 10;
      b = _random.nextInt(a - 1) + 1;
      answer = a - b;
      symbol = '-';
    } else {
      a = _random.nextInt(maxNum) + 1;
      b = _random.nextInt(maxNum) + 1;
      answer = a + b;
      symbol = '+';
    }

    String romanA = intToRoman(a);
    String romanB = intToRoman(b);
    String equation = '$romanA $symbol $romanB';

    // Generate options
    Set<int> optionsSet = {answer};
    while (optionsSet.length < 4) {
      int offset = _random.nextInt(11) - 5;
      if (offset == 0) offset = 1;
      int fake = answer + offset;
      if (fake > 0) {
        optionsSet.add(fake);
      }
    }

    List<int> options = optionsSet.toList()..shuffle(_random);

    return RomanProblem(
      equation: equation,
      answer: answer,
      options: options,
    );
  }
}
