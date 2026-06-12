import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/temporal_order/temporal_order_engine.dart';

void main() {
  group('TemporalOrderEngine', () {
    late TemporalOrderEngine engine;

    setUp(() {
      engine = TemporalOrderEngine();
    });

    group('generateSequence', () {
      test('generates sequence of requested length', () {
        final seq = engine.generateSequence(5);
        expect(seq.length, 5);
      });

      test('contains unique values', () {
        final seq = engine.generateSequence(8);
        expect(seq.toSet().length, seq.length);
      });

      test('values are between 0 and 14', () {
        final seq = engine.generateSequence(10);
        for (final val in seq) {
          expect(val, greaterThanOrEqualTo(0));
          expect(val, lessThanOrEqualTo(14));
        }
      });

      test('length 1 produces single element', () {
        final seq = engine.generateSequence(1);
        expect(seq.length, 1);
      });

      test('generates different sequences on multiple calls', () {
        final seq1 = engine.generateSequence(5);
        final seq2 = engine.generateSequence(5);
        expect(seq1.length, 5);
        expect(seq2.length, 5);
      });
    });

    group('generateQuestion', () {
      test('returns a TemporalQuestion', () {
        final seq = engine.generateSequence(5);
        final q = engine.generateQuestion(seq);
        expect(q, isA<TemporalQuestion>());
      });

      test('question references valid indices', () {
        final seq = engine.generateSequence(5);
        final q = engine.generateQuestion(seq);
        expect(q.indexA, greaterThanOrEqualTo(0));
        expect(q.indexA, lessThan(seq.length));
        expect(q.indexB, greaterThanOrEqualTo(0));
        expect(q.indexB, lessThan(seq.length));
      });

      test('indexA is less than indexB', () {
        final seq = engine.generateSequence(6);
        final q = engine.generateQuestion(seq);
        expect(q.indexA, lessThan(q.indexB));
      });

      test('correctItem is either itemA or itemB', () {
        final seq = engine.generateSequence(5);
        final q = engine.generateQuestion(seq);
        expect(
          q.correctItem == q.itemA || q.correctItem == q.itemB,
          isTrue,
        );
      });

      test('correctItem for earlier type is the earlier item', () {
        final seq = [10, 5, 8, 3, 12];
        final q = engine.generateQuestion(seq);
        if (q.type == QuestionType.earlier) {
          expect(q.correctItem, seq[q.indexA]);
        }
      });

      test('correctItem for later type is the later item', () {
        final seq = [10, 5, 8, 3, 12];
        final q = engine.generateQuestion(seq);
        if (q.type == QuestionType.later) {
          expect(q.correctItem, seq[q.indexB]);
        }
      });
    });

    group('getSequenceLengthForLevel', () {
      test('level 1 returns 4', () {
        expect(engine.getSequenceLengthForLevel(1), 4);
      });

      test('level 2 returns 5', () {
        expect(engine.getSequenceLengthForLevel(2), 5);
      });

      test('level 5 returns 8', () {
        expect(engine.getSequenceLengthForLevel(5), 8);
      });

      test('higher levels produce longer sequences', () {
        for (int i = 1; i < 5; i++) {
          expect(
            engine.getSequenceLengthForLevel(i + 1),
            greaterThan(engine.getSequenceLengthForLevel(i)),
          );
        }
      });
    });
  });
}
