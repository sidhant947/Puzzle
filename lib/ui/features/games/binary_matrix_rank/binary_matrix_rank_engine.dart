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
  static int computeRankGF2(List<List<int>> matrix) {
    final rows = matrix.length;
    final cols = matrix[0].length;
    final m = List.generate(rows, (r) => List<int>.from(matrix[r]));
    int rank = 0;
    for (int col = 0; col < cols && rank < rows; col++) {
      int pivot = -1;
      for (int r = rank; r < rows; r++) {
        if (m[r][col] == 1) {
          pivot = r;
          break;
        }
      }
      if (pivot == -1) continue;
      if (pivot != rank) {
        final temp = m[rank];
        m[rank] = m[pivot];
        m[pivot] = temp;
      }
      for (int r = 0; r < rows; r++) {
        if (r != rank && m[r][col] == 1) {
          for (int c = col; c < cols; c++) {
            m[r][c] ^= m[rank][c];
          }
        }
      }
      rank++;
    }
    return rank;
  }

  static BinaryMatrixRankQuestion generateQuestion({math.Random? random}) {
    final rng = random ?? math.Random();

    final samples = [
      [[1, 0, 1], [1, 0, 1], [1, 0, 1]],
      [[0, 1, 1], [0, 1, 1], [0, 0, 0]],
      [[1, 0, 0], [0, 1, 0], [1, 1, 0]],
      [[1, 1, 0], [0, 1, 1], [1, 0, 1]],
      [[1, 0, 1], [0, 1, 0], [1, 0, 1]],
      [[1, 0, 0], [0, 1, 0], [0, 0, 1]],
      [[1, 1, 0], [0, 1, 1], [1, 1, 1]],
      [[1, 0, 1], [0, 1, 1], [0, 0, 1]],
    ];

    final matrix = samples[rng.nextInt(samples.length)];
    final rank = computeRankGF2(matrix);

    return BinaryMatrixRankQuestion(
      matrix: matrix,
      rank: rank,
      choices: [1, 2, 3],
    );
  }
}
