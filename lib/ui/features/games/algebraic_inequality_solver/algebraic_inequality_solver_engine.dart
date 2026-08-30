import 'dart:math' as math;

class InequalityQuestion {
  final String inequalityString; // e.g. "2x + 4 < 12"
  final String simplifiedSolution; // e.g. "x < 4"
  final List<String> choices;

  InequalityQuestion({
    required this.inequalityString,
    required this.simplifiedSolution,
    required this.choices,
  });
}

class AlgebraicInequalitySolverEngine {
  static InequalityQuestion generateQuestion({math.Random? random}) {
    final rng = random ?? math.Random();
    
    // a*x + b (<, >, <=, >=) c
    final a = rng.nextInt(5) + 2; // 2 to 6
    final targetX = rng.nextInt(9) + 1; // 1 to 9
    final b = rng.nextInt(10) + 1;
    final c = a * targetX + b;

    final ops = ['<', '>', '≤', '≥'];
    final op = ops[rng.nextInt(ops.length)];

    final inequalityStr = '$a x + $b $op $c';
    final correctSolution = 'x $op $targetX';

    final choices = <String>{correctSolution};
    while (choices.length < 4) {
      final fakeX = targetX + (rng.nextInt(5) - 2);
      final fakeOp = ops[rng.nextInt(ops.length)];
      choices.add('x $fakeOp $fakeX');
    }

    final shuffled = choices.toList()..shuffle(rng);

    return InequalityQuestion(
      inequalityString: inequalityStr,
      simplifiedSolution: correctSolution,
      choices: shuffled,
    );
  }
}
