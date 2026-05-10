import 'dart:math';

class ArithmeticChainEngine {
  final Random _random = Random();

  Map<String, dynamic> generateChain({int length = 5}) {
    int current = _random.nextInt(10) + 2;
    int start = current;
    List<Map<String, dynamic>> operations = [];

    for (int i = 0; i < length; i++) {
      int type = _random.nextInt(4); // 0: +, 1: -, 2: *, 3: /
      int operand;
      String op;

      switch (type) {
        case 0: // +
          operand = _random.nextInt(15) + 1;
          current += operand;
          op = "+";
          break;
        case 1: // -
          if (current <= 2) {
            // Fallback to addition if too small to subtract meaningfully
            operand = _random.nextInt(15) + 1;
            current += operand;
            op = "+";
          } else {
            operand = _random.nextInt(current - 1) + 1;
            current -= operand;
            op = "-";
          }
          break;
        case 2: // *
          operand = _random.nextInt(4) + 2;
          // Avoid too large numbers
          if (current * operand > 100) {
            operand = 2;
          }
          current *= operand;
          op = "×";
          break;
        case 3: // /
        default:
          // Find a divisor
          List<int> divisors = [];
          for (int d = 2; d <= current; d++) {
            if (current % d == 0) divisors.add(d);
          }
          if (divisors.isEmpty || current > 100) {
            // Fallback to addition if no divisors or current is too large
            operand = _random.nextInt(10) + 1;
            current += operand;
            op = "+";
          } else {
            operand = divisors[_random.nextInt(divisors.length)];
            current ~/= operand;
            op = "÷";
          }
          break;
      }
      operations.add({'op': op, 'val': operand});
    }

    return {
      'start': start,
      'operations': operations,
      'answer': current,
    };
  }
}
