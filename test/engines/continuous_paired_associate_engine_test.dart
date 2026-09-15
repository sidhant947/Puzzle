import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/continuous_paired_associate/continuous_paired_associate_engine.dart';

void main() {
  group('ContinuousPairedAssociateEngine', () {
    test('generateRound creates valid round structure', () {
      final round = ContinuousPairedAssociateEngine.generateRound(numPairs: 4);
      expect(round.pairsToLearn.length, 4);
      expect(round.queryQueue.length, 4);
      expect(round.allTargetSymbols.length, 4);
    });
  });
}
