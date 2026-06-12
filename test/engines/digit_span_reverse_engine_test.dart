import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/digit_span_reverse/digit_span_reverse_engine.dart';

void main() {
  group('DigitSpanReverseEngine', () {
    late DigitSpanReverseEngine engine;

    setUp(() {
      engine = DigitSpanReverseEngine();
    });

    group('generateSequence', () {
      test('returns a sequence of the requested length', () {
        final seq = engine.generateSequence(length: 5);
        expect(seq.length, 5);
      });

      test('generates single-digit numbers (0-9)', () {
        final seq = engine.generateSequence(length: 100);
        for (final digit in seq) {
          expect(digit, greaterThanOrEqualTo(0));
          expect(digit, lessThanOrEqualTo(9));
        }
      });

      test('generates empty list for length 0', () {
        final seq = engine.generateSequence(length: 0);
        expect(seq, isEmpty);
      });
    });

    group('validate', () {
      test('returns true for correct reversed sequence', () {
        final seq = [3, 7, 1, 9];
        final reversed = [9, 1, 7, 3];
        expect(engine.validate(seq, reversed), isTrue);
      });

      test('returns false for non-reversed sequence', () {
        final seq = [3, 7, 1, 9];
        final user = [3, 7, 1, 9];
        expect(engine.validate(seq, user), isFalse);
      });

      test('returns false for wrong length', () {
        expect(engine.validate([1, 2, 3], [3, 2]), isFalse);
      });

      test('returns true for empty sequences', () {
        expect(engine.validate([], []), isTrue);
      });

      test('returns true for single element', () {
        expect(engine.validate([5], [5]), isTrue);
      });

      test('handles duplicate digits correctly', () {
        final seq = [1, 1, 2, 2];
        expect(engine.validate(seq, [2, 2, 1, 1]), isTrue);
      });
    });
  });
}
