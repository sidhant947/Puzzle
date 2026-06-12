import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/corsi_blocks/corsi_blocks_engine.dart';

void main() {
  group('CorsiBlocksEngine', () {
    late CorsiBlocksEngine engine;

    setUp(() {
      engine = CorsiBlocksEngine();
    });

    group('generateSequence', () {
      test('returns a list of integers', () {
        final seq = engine.generateSequence(5, 9);
        expect(seq, isA<List<int>>());
      });

      test('sequence has correct length', () {
        final seq = engine.generateSequence(5, 9);
        expect(seq.length, 5);
      });

      test('all values are within maxIndex range', () {
        final seq = engine.generateSequence(10, 9);
        for (final val in seq) {
          expect(val, greaterThanOrEqualTo(0));
          expect(val, lessThan(9));
        }
      });

      test('generates different sequences', () {
        final results = <String>{};
        for (int i = 0; i < 20; i++) {
          results.add(engine.generateSequence(5, 9).join(','));
        }
        expect(results.length, greaterThan(1));
      });

      test('empty sequence for length 0', () {
        final seq = engine.generateSequence(0, 9);
        expect(seq, isEmpty);
      });
    });
  });
}
