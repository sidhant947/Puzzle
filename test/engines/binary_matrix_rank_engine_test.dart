import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/binary_matrix_rank/binary_matrix_rank_engine.dart';

void main() {
  group('BinaryMatrixRankEngine', () {
    test('computeRankGF2 calculates correct rank for dependent matrix', () {
      final matrix = [
        [1, 1, 0],
        [1, 0, 1],
        [0, 1, 1],
      ];
      expect(BinaryMatrixRankEngine.computeRankGF2(matrix), equals(2));
    });

    test('computeRankGF2 calculates correct rank for full rank matrix', () {
      final matrix = [
        [1, 1, 0],
        [0, 1, 1],
        [1, 1, 1],
      ];
      expect(BinaryMatrixRankEngine.computeRankGF2(matrix), equals(3));
    });

    test('generateQuestion generates valid question with verified rank', () {
      final question = BinaryMatrixRankEngine.generateQuestion();
      final calculatedRank = BinaryMatrixRankEngine.computeRankGF2(question.matrix);
      expect(question.rank, equals(calculatedRank));
    });
  });
}
