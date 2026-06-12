import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/associative_pairs/associative_pairs_engine.dart';

void main() {
  group('AssociativePairsEngine', () {
    late AssociativePairsEngine engine;

    setUp(() {
      engine = AssociativePairsEngine();
    });

    group('generatePairs', () {
      test('returns correct number of pairs', () {
        final pairs = engine.generatePairs(3);
        expect(pairs.length, 3);
      });

      test('each pair has unique shape and color', () {
        final pairs = engine.generatePairs(5);
        for (final pair in pairs) {
          expect(pair.shape, isA<AssocShape>());
          expect(pair.color, isA<AssocColor>());
        }
      });

      test('all shapes are different', () {
        final pairs = engine.generatePairs(5);
        final shapes = pairs.map((p) => p.shape).toSet();
        expect(shapes.length, 5);
      });

      test('all colors are different', () {
        final pairs = engine.generatePairs(5);
        final colors = pairs.map((p) => p.color).toSet();
        expect(colors.length, 5);
      });
    });

    group('generateQuestions', () {
      test('generates one question per pair', () {
        final pairs = engine.generatePairs(3);
        final questions = engine.generateQuestions(pairs);
        expect(questions.length, 3);
      });

      test('each question has 4 options', () {
        final pairs = engine.generatePairs(3);
        final questions = engine.generateQuestions(pairs);
        for (final q in questions) {
          expect(q.options.length, 4);
        }
      });

      test('correct option is in the options list', () {
        final pairs = engine.generatePairs(3);
        final questions = engine.generateQuestions(pairs);
        for (final q in questions) {
          expect(q.options, contains(q.correctOption));
        }
      });

      test('correct option matches pair attribute', () {
        final pairs = engine.generatePairs(3);
        final questions = engine.generateQuestions(pairs);
        for (final q in questions) {
          if (q.type == AssociativeQuestionType.shapeToColor) {
            expect(q.correctOption, equals(q.target.color));
          } else {
            expect(q.correctOption, equals(q.target.shape));
          }
        }
      });
    });

    group('getPairsCountForLevel', () {
      test('level 1 returns 3 pairs', () {
        expect(engine.getPairsCountForLevel(1), 3);
      });

      test('level 5 returns 7 pairs', () {
        expect(engine.getPairsCountForLevel(5), 7);
      });

      test('increases by 1 per level', () {
        expect(engine.getPairsCountForLevel(2) - engine.getPairsCountForLevel(1), 1);
      });
    });
  });
}
