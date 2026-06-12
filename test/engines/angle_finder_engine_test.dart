import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/angle_finder/angle_finder_engine.dart';

void main() {
  group('AngleFinderEngine', () {
    late AngleFinderEngine engine;

    setUp(() {
      engine = AngleFinderEngine();
    });

    group('generateProblem', () {
      test('returns an AngleProblem', () {
        final problem = engine.generateProblem(0);
        expect(problem, isA<AngleProblem>());
      });

      test('problem has question, description, answer, and options', () {
        final problem = engine.generateProblem(0);
        expect(problem.question, isNotEmpty);
        expect(problem.description, isNotEmpty);
        expect(problem.answer, greaterThan(0));
        expect(problem.options.length, 4);
      });

      test('answer is included in options', () {
        final problem = engine.generateProblem(0);
        expect(problem.options, contains(problem.answer));
      });

      test('options are unique', () {
        final problem = engine.generateProblem(0);
        expect(problem.options.toSet().length, problem.options.length);
      });

      test('low score generates supplementary or complementary', () {
        for (int i = 0; i < 20; i++) {
          final problem = engine.generateProblem(0);
          expect(
            problem.type == AngleProblemType.supplementary ||
                problem.type == AngleProblemType.complementary,
            isTrue,
          );
        }
      });

      test('high score can generate any problem type', () {
        final types = <AngleProblemType>{};
        for (int i = 0; i < 50; i++) {
          final problem = engine.generateProblem(15);
          types.add(problem.type);
        }
        expect(types.length, greaterThan(1));
      });

      test('supplementary answer is 180 - given angle', () {
        final problem = engine.generateProblem(0);
        if (problem.type == AngleProblemType.supplementary) {
          expect(problem.answer + problem.givenAngles.first, equals(180));
        }
      });

      test('complementary answer is 90 - given angle', () {
        for (int i = 0; i < 50; i++) {
          final problem = engine.generateProblem(0);
          if (problem.type == AngleProblemType.complementary) {
            expect(problem.answer + problem.givenAngles.first, equals(90));
          }
        }
      });

      test('triangle answer plus given angles sum to 180', () {
        for (int i = 0; i < 50; i++) {
          final problem = engine.generateProblem(5);
          if (problem.type == AngleProblemType.triangle) {
            final sum = problem.answer + problem.givenAngles[0] + problem.givenAngles[1];
            expect(sum, equals(180));
          }
        }
      });

      test('quadrilateral answer plus given angles sum to 360', () {
        for (int i = 0; i < 50; i++) {
          final problem = engine.generateProblem(15);
          if (problem.type == AngleProblemType.quadrilateral) {
            final sum = problem.answer +
                problem.givenAngles[0] +
                problem.givenAngles[1] +
                problem.givenAngles[2];
            expect(sum, equals(360));
          }
        }
      });
    });
  });

  group('AngleProblem', () {
    test('stores all fields correctly', () {
      final problem = AngleProblem(
        question: '180° - 30° = ?',
        description: 'Find supplementary',
        answer: 150,
        options: [150, 140, 160, 130],
        type: AngleProblemType.supplementary,
        givenAngles: [30],
      );
      expect(problem.question, '180° - 30° = ?');
      expect(problem.answer, 150);
      expect(problem.type, AngleProblemType.supplementary);
      expect(problem.givenAngles, [30]);
    });
  });
}
