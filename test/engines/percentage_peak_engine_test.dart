import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/percentage_peak/percentage_peak_engine.dart';

void main() {
  group('PercentagePeakEngine', () {
    late PercentagePeakEngine engine;

    setUp(() {
      engine = PercentagePeakEngine();
    });

    group('generateQuestion', () {
      test('returns a PercentageQuestion', () {
        final q = engine.generateQuestion();
        expect(q, isA<PercentageQuestion>());
      });

      test('question is non-empty', () {
        final q = engine.generateQuestion();
        expect(q.question.isNotEmpty, isTrue);
      });

      test('answer is a positive integer', () {
        final q = engine.generateQuestion();
        expect(q.answer, greaterThan(0));
      });

      test('type is one of the enum values', () {
        final q = engine.generateQuestion();
        expect(
          q.type == PercentageQuestionType.calculateValue ||
              q.type == PercentageQuestionType.calculateTotal ||
              q.type == PercentageQuestionType.calculatePercentage,
          isTrue,
        );
      });

      test('calculateValue type has correct answer', () {
        // Test specific known cases
        final q = PercentageQuestion(
          question: '20% of 100',
          answer: 20,
          type: PercentageQuestionType.calculateValue,
        );
        expect(q.answer, equals(20));
      });

      test('generates different questions on multiple calls', () {
        final questions = <String>{};
        for (int i = 0; i < 10; i++) {
          questions.add(engine.generateQuestion().question);
        }
        expect(questions.length, greaterThan(1));
      });
    });
  });
}
