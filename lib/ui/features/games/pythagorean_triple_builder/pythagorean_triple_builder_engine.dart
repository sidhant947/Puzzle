import 'dart:math' as math;

class PythagoreanQuestion {
  final int a;
  final int b;
  final int c; // a^2 + b^2 = c^2
  final int missingIndex; // 0 for a, 1 for b, 2 for c
  final int correctValue;
  final List<int> choices;

  PythagoreanQuestion({
    required this.a,
    required this.b,
    required this.c,
    required this.missingIndex,
    required this.correctValue,
    required this.choices,
  });
}

class PythagoreanTripleBuilderEngine {
  static final List<List<int>> _triples = [
    [3, 4, 5],
    [5, 12, 13],
    [6, 8, 10],
    [7, 24, 25],
    [8, 15, 17],
    [9, 12, 15],
    [10, 24, 26],
    [12, 16, 20],
    [15, 20, 25],
    [9, 40, 41],
  ];

  static PythagoreanQuestion generateQuestion({math.Random? random}) {
    final rng = random ?? math.Random();
    final triple = _triples[rng.nextInt(_triples.length)];

    final missingIdx = rng.nextInt(3);
    final correctVal = triple[missingIdx];

    final distractorSet = <int>{correctVal};
    while (distractorSet.length < 4) {
      final fake = correctVal + (rng.nextInt(9) - 4);
      if (fake > 0 && fake != correctVal) {
        distractorSet.add(fake);
      } else {
        distractorSet.add(rng.nextInt(35) + 2);
      }
    }

    final choices = distractorSet.toList()..shuffle(rng);

    return PythagoreanQuestion(
      a: triple[0],
      b: triple[1],
      c: triple[2],
      missingIndex: missingIdx,
      correctValue: correctVal,
      choices: choices,
    );
  }
}
