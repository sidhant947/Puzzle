import 'dart:math';

enum CommonDenominatorType {
  gcd,
  lcm,
}

class CommonDenominatorProblem {
  final List<int> numbers;
  final CommonDenominatorType type;
  final int answer;

  CommonDenominatorProblem({
    required this.numbers,
    required this.type,
    required this.answer,
  });

  String get question {
    final numsStr = numbers.join(", ");
    return type == CommonDenominatorType.gcd
        ? "GCD($numsStr)"
        : "LCM($numsStr)";
  }
}

class CommonDenominatorEngine {
  final Random _random = Random();

  CommonDenominatorProblem generateProblem(int score) {
    final type = CommonDenominatorType.values[_random.nextInt(2)];
    final useThreeNumbers = score >= 5 && _random.nextBool();
    
    List<int> numbers;
    int answer;

    if (type == CommonDenominatorType.gcd) {
      if (useThreeNumbers) {
        answer = _random.nextInt(10) + 2;
        numbers = [
          answer * (_random.nextInt(5) + 1),
          answer * (_random.nextInt(5) + 1),
          answer * (_random.nextInt(5) + 1),
        ];
        answer = _gcdList(numbers);
      } else {
        answer = _random.nextInt(15) + 2;
        numbers = [
          answer * (_random.nextInt(8) + 1),
          answer * (_random.nextInt(8) + 1),
        ];
        answer = _gcd(numbers[0], numbers[1]);
      }
    } else {
      if (useThreeNumbers) {
        // Small numbers for LCM of 3 to avoid huge results
        numbers = [
          _random.nextInt(6) + 2,
          _random.nextInt(6) + 2,
          _random.nextInt(6) + 2,
        ];
        answer = _lcmList(numbers);
        // Regulate difficulty
        if (answer > 100) return generateProblem(score);
      } else {
        numbers = [
          _random.nextInt(12) + 2,
          _random.nextInt(12) + 2,
        ];
        answer = _lcm(numbers[0], numbers[1]);
        if (answer > 100) return generateProblem(score);
      }
    }

    // Ensure numbers are distinct if possible
    if (numbers.toSet().length < numbers.length) {
       // Just one more try to make them distinct
       return generateProblem(score);
    }

    return CommonDenominatorProblem(
      numbers: numbers,
      type: type,
      answer: answer,
    );
  }

  int _gcd(int a, int b) {
    while (b != 0) {
      a %= b;
      int temp = a;
      a = b;
      b = temp;
    }
    return a;
  }

  int _gcdList(List<int> nums) {
    int result = nums[0];
    for (int i = 1; i < nums.length; i++) {
      result = _gcd(result, nums[i]);
    }
    return result;
  }

  int _lcm(int a, int b) {
    if (a == 0 || b == 0) return 0;
    return (a * b) ~/ _gcd(a, b);
  }

  int _lcmList(List<int> nums) {
    int result = nums[0];
    for (int i = 1; i < nums.length; i++) {
      result = _lcm(result, nums[i]);
    }
    return result;
  }
}
