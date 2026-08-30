import 'dart:math' as math;

class BinaryMatrixRankQuestion {
  final List<List<int>> matrix; // 3x3 binary matrix (0s and 1s)
  final int rank; // 1, 2, or 3 over GF(2)
  final List<int> choices;

  BinaryMatrixRankQuestion({
    required this.matrix,
    required this.rank,
    required this.choices,
  });
}

class BinaryMatrixRankEngine {
  static BinaryMatrixRankQuestion generateQuestion({math.Random? random}) {
    final rng = random ?? math.Random();

    // 3x3 binary matrix samples with known ranks
    final samples = [
      // Rank 1
      {'m': [[1, 0, 1], [1, 0, 1], [1, 0, 1]], 'r': 1},
      {'m': [[0, 1, 1], [0, 1, 1], [0, 0, 0]], 'r': 1},
      // Rank 2
      {'m': [[1, 0, 0], [0, 1, 0], [1, 1, 0]], 'r': 2},
      {'m': [[1, 1, 0], [0, 1, 1], [1, 0, 1]], 'r': 2},
      {'m': [[1, 0, 1], [0, 1, 0], [1, 0, 1]], 'r': 2},
      // Rank 3
      {'m': [[1, 0, 0], [0, 1, 0], [0, 0, 1]], 'r': 3},
      {'m': [[1, 1, 0], [1, 0, 1], [0, 1, 1]], 'r': 3},
      {'m': [[1, 0, 1], [0, 1, 1], [0, 0, 1]], 'r': 3},
    ];

    final sample = samples[rng.nextInt(samples.length)];
    final matrix = sample['m'] as List<List<int>>;
    final rank = sample['r'] as int;

    return BinaryMatrixRankQuestion(
      matrix: matrix,
      rank: rank,
      choices: [1, 2, 3],
    );
  }
}
