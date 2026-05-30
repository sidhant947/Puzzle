import 'dart:math';

enum SequenceType { arithmetic, geometric, squares, cubes, fibonacci }

class SequenceProblem {
  final List<String> sequence;
  final int answer;
  final String description;

  SequenceProblem({
    required this.sequence,
    required this.answer,
    required this.description,
  });
}

class SequenceSleuthEngine {
  final Random _random = Random();

  SequenceProblem generateProblem() {
    SequenceType type = SequenceType.values[_random.nextInt(SequenceType.values.length)];
    List<int> numbers = [];
    int answer;
    String description;

    switch (type) {
      case SequenceType.arithmetic:
        int start = _random.nextInt(20) + 1;
        int diff = _random.nextInt(10) + 2;
        numbers = List.generate(5, (i) => start + i * diff);
        description = "Arithmetic (+ $diff)";
        break;
      case SequenceType.geometric:
        int start = _random.nextInt(5) + 1;
        int ratio = _random.nextInt(3) + 2;
        numbers = List.generate(5, (i) => start * pow(ratio, i).toInt());
        description = "Geometric (× $ratio)";
        break;
      case SequenceType.squares:
        int start = _random.nextInt(10) + 1;
        numbers = List.generate(5, (i) => pow(start + i, 2).toInt());
        description = "Squares";
        break;
      case SequenceType.cubes:
        int start = _random.nextInt(5) + 1;
        numbers = List.generate(5, (i) => pow(start + i, 3).toInt());
        description = "Cubes";
        break;
      case SequenceType.fibonacci:
        List<int> fib = [1, 1];
        int startIdx = _random.nextInt(8);
        for (int i = 2; i < 15; i++) {
          fib.add(fib[i - 1] + fib[i - 2]);
        }
        numbers = fib.sublist(startIdx, startIdx + 5);
        description = "Fibonacci";
        break;
    }

    // Hide the last number
    answer = numbers.last;
    List<String> displaySequence = numbers.map((n) => n.toString()).toList();
    displaySequence[displaySequence.length - 1] = "?";

    return SequenceProblem(
      sequence: displaySequence,
      answer: answer,
      description: description,
    );
  }
}
