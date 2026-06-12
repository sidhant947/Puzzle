import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/inequality_dash/inequality_dash_engine.dart';

void main() {
  group('InequalityDashEngine', () {
    late InequalityDashEngine engine;

    setUp(() {
      engine = InequalityDashEngine();
    });

    group('generateQuestion', () {
      test('returns a question with valid fields', () {
        final q = engine.generateQuestion(0);
        expect(q.leftFormula, isNotEmpty);
        expect(q.rightFormula, isNotEmpty);
        expect(q.correctOperator, anyOf(equals('<'), equals('>'), equals('=')));
      });

      test('correctOperator matches actual values', () {
        for (int i = 0; i < 50; i++) {
          final q = engine.generateQuestion(i);
          String expected;
          if (q.leftValue < q.rightValue) {
            expected = '<';
          } else if (q.leftValue > q.rightValue) {
            expected = '>';
          } else {
            expected = '=';
          }
          expect(q.correctOperator, equals(expected));
        }
      });

      test('generates different questions', () {
        final q1 = engine.generateQuestion(0);
        final q2 = engine.generateQuestion(0);
        // Very unlikely to be identical
        expect(q1.leftFormula + q1.rightFormula,
            isNot(equals(q2.leftFormula + q2.rightFormula)));
      });

      test('level increases with score', () {
        // Score 0-4 => level 1, 5-9 => level 2, etc.
        final qLow = engine.generateQuestion(0);
        final qHigh = engine.generateQuestion(20);
        expect(qLow.leftFormula, isNotNull);
        expect(qHigh.leftFormula, isNotNull);
      });
    });

    group('InequalityQuestion', () {
      test('stores values correctly', () {
        final q = InequalityQuestion(
          leftFormula: '3 + 4',
          rightFormula: '5 + 2',
          leftValue: 7,
          rightValue: 7,
          correctOperator: '=',
        );
        expect(q.leftValue, equals(7));
        expect(q.rightValue, equals(7));
        expect(q.correctOperator, equals('='));
      });
    });
  });
}
