import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/distractor_matrix/distractor_matrix_engine.dart';

void main() {
  group('DistractorMatrixEngine', () {
    late DistractorMatrixEngine engine;

    setUp(() {
      engine = DistractorMatrixEngine();
    });

    group('generatePattern', () {
      test('returns the requested number of indices', () {
        final indices = engine.generatePattern(4, 5);
        expect(indices.length, 5);
      });

      test('indices are within the board range', () {
        final indices = engine.generatePattern(4, 6);
        for (final idx in indices) {
          expect(idx, greaterThanOrEqualTo(0));
          expect(idx, lessThan(16));
        }
      });

      test('no duplicate indices', () {
        final indices = engine.generatePattern(5, 8);
        expect(indices.toSet().length, indices.length);
      });

      test('returns empty list when tileCount is 0', () {
        final indices = engine.generatePattern(4, 0);
        expect(indices, isEmpty);
      });
    });

    group('generateMathQuestion', () {
      test('returns a MathDistractor', () {
        final q = engine.generateMathQuestion();
        expect(q, isA<MathDistractor>());
      });

      test('question contains + or × operator', () {
        final q = engine.generateMathQuestion();
        expect(q.question.contains('+') || q.question.contains('×'), isTrue);
      });

      test('options has exactly 3 entries', () {
        final q = engine.generateMathQuestion();
        expect(q.options.length, 3);
      });

      test('correctAnswer is among the options', () {
        final q = engine.generateMathQuestion();
        expect(q.options.contains(q.correctAnswer), isTrue);
      });

      test('all options are positive', () {
        for (int i = 0; i < 20; i++) {
          final q = engine.generateMathQuestion();
          expect(q.correctAnswer, greaterThan(0));
          for (final opt in q.options) {
            expect(opt, greaterThan(0));
          }
        }
      });

      test('correctAnswer matches the computed result', () {
        for (int i = 0; i < 30; i++) {
          final q = engine.generateMathQuestion();
          final parts = q.question.split(' ');
          final a = int.parse(parts[0]);
          final op = parts[1];
          final b = int.parse(parts[2]);
          final expected = op == '+' ? a + b : a * b;
          expect(q.correctAnswer, expected);
        }
      });
    });

    group('getTileCountForLevel', () {
      test('returns level + 2', () {
        expect(engine.getTileCountForLevel(0), 2);
        expect(engine.getTileCountForLevel(5), 7);
        expect(engine.getTileCountForLevel(10), 12);
      });
    });
  });
}
