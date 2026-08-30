import 'dart:math' as math;

class VectorDotQuestion {
  final List<int> vecA; // [x1, y1]
  final List<int> vecB; // [x2, y2]
  final int dotProduct; // x1*x2 + y1*y2
  final List<int> choices;

  VectorDotQuestion({
    required this.vecA,
    required this.vecB,
    required this.dotProduct,
    required this.choices,
  });

  String get vecAStr => '⟨${vecA[0]}, ${vecA[1]}⟩';
  String get vecBStr => '⟨${vecB[0]}, ${vecB[1]}⟩';
}

class VectorDotProductEngine {
  static VectorDotQuestion generateQuestion({math.Random? random}) {
    final rng = random ?? math.Random();
    final ax = rng.nextInt(7) - 3;
    final ay = rng.nextInt(7) - 3;
    final bx = rng.nextInt(7) - 3;
    final by = rng.nextInt(7) - 3;

    final dot = (ax * bx) + (ay * by);

    final distractorSet = <int>{dot};
    while (distractorSet.length < 4) {
      final fake = dot + (rng.nextInt(11) - 5);
      if (fake != dot) {
        distractorSet.add(fake);
      } else {
        distractorSet.add(rng.nextInt(20) - 10);
      }
    }

    final choices = distractorSet.toList()..shuffle(rng);

    return VectorDotQuestion(
      vecA: [ax, ay],
      vecB: [bx, by],
      dotProduct: dot,
      choices: choices,
    );
  }
}
