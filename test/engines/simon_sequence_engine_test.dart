import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/simon_sequence/simon_sequence_engine.dart';

void main() {
  group('SimonSequenceEngine', () {
    late SimonSequenceEngine engine;

    setUp(() {
      engine = SimonSequenceEngine();
    });

    group('generateFixedSequence', () {
      test('returns a sequence of the requested length', () {
        final seq = engine.generateFixedSequence(5);
        expect(seq.length, 5);
      });

      test('returns empty list for length 0', () {
        final seq = engine.generateFixedSequence(0);
        expect(seq, isEmpty);
      });

      test('returns single element for length 1', () {
        final seq = engine.generateFixedSequence(1);
        expect(seq.length, 1);
      });

      test('all values are within valid grid range 0-8', () {
        final seq = engine.generateFixedSequence(50);
        for (final value in seq) {
          expect(value, greaterThanOrEqualTo(0));
          expect(value, lessThan(9));
        }
      });

      test('generates long sequences without error', () {
        final seq = engine.generateFixedSequence(100);
        expect(seq.length, 100);
        for (final value in seq) {
          expect(value, inInclusiveRange(0, 8));
        }
      });

      test('produces different sequences on multiple calls', () {
        final seq1 = engine.generateFixedSequence(20);
        final seq2 = engine.generateFixedSequence(20);
        expect(seq1, isNot(equals(seq2)));
      });
    });
  });
}
