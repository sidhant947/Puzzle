import 'dart:math';
import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/sequence_sleuth/sequence_sleuth_engine.dart';

void main() {
  group('SequenceSleuthEngine', () {
    late SequenceSleuthEngine engine;

    setUp(() {
      engine = SequenceSleuthEngine();
    });

    group('generateProblem', () {
      test('returns a SequenceProblem', () {
        final problem = engine.generateProblem();
        expect(problem, isA<SequenceProblem>());
      });

      test('sequence has 5 elements with last being "?"', () {
        final problem = engine.generateProblem();
        expect(problem.sequence.length, 5);
        expect(problem.sequence.last, '?');
      });

      test('first 4 elements are numeric strings', () {
        final problem = engine.generateProblem();
        for (int i = 0; i < 4; i++) {
          expect(int.tryParse(problem.sequence[i]), isNotNull,
              reason: 'Element $i "${problem.sequence[i]}" should be a number');
        }
      });

      test('answer is a positive integer', () {
        final problem = engine.generateProblem();
        expect(problem.answer, greaterThan(0));
      });

      test('description is non-empty', () {
        final problem = engine.generateProblem();
        expect(problem.description.isNotEmpty, true);
      });

      test('description matches a known type', () {
        final validDescriptions = [
          'Arithmetic',
          'Geometric',
          'Squares',
          'Cubes',
          'Fibonacci',
        ];
        final problem = engine.generateProblem();
        expect(
          validDescriptions.any((d) => problem.description.startsWith(d)),
          true,
          reason: 'Description "${problem.description}" does not match any known type',
        );
      });
    });

    group('arithmetic sequences', () {
      test('verified arithmetic pattern', () {
        // Generate many problems and check arithmetic ones
        for (int i = 0; i < 100; i++) {
          final problem = engine.generateProblem();
          if (problem.description.startsWith('Arithmetic')) {
            final nums = List.generate(5, (j) {
              if (j < 4) return int.parse(problem.sequence[j]);
              return problem.answer;
            });
            final diff = nums[1] - nums[0];
            for (int j = 2; j < 5; j++) {
              expect(nums[j] - nums[j - 1], diff,
                  reason: 'Arithmetic sequence broken at index $j');
            }
            return; // Found one, test passed
          }
        }
      });
    });

    group('geometric sequences', () {
      test('verified geometric pattern', () {
        for (int i = 0; i < 100; i++) {
          final problem = engine.generateProblem();
          if (problem.description.startsWith('Geometric')) {
            final nums = List.generate(5, (j) {
              if (j < 4) return int.parse(problem.sequence[j]);
              return problem.answer;
            });
            final ratio = nums[1] ~/ nums[0];
            for (int j = 2; j < 5; j++) {
              expect(nums[j], nums[j - 1] * ratio,
                  reason: 'Geometric sequence broken at index $j');
            }
            return;
          }
        }
      });
    });

    group('fibonacci sequences', () {
      test('verified fibonacci pattern', () {
        for (int i = 0; i < 200; i++) {
          final problem = engine.generateProblem();
          if (problem.description.startsWith('Fibonacci')) {
            final nums = List.generate(5, (j) {
              if (j < 4) return int.parse(problem.sequence[j]);
              return problem.answer;
            });
            for (int j = 2; j < 5; j++) {
              expect(nums[j], nums[j - 1] + nums[j - 2],
                  reason: 'Fibonacci sequence broken at index $j');
            }
            return;
          }
        }
      });
    });

    group('squares sequences', () {
      test('verified squares pattern', () {
        for (int i = 0; i < 100; i++) {
          final problem = engine.generateProblem();
          if (problem.description == 'Squares') {
            final nums = List.generate(5, (j) {
              if (j < 4) return int.parse(problem.sequence[j]);
              return problem.answer;
            });
            // All should be perfect squares
            for (final n in nums) {
              final root = sqrt(n).toInt();
              expect(root * root, n,
                  reason: '$n is not a perfect square');
            }
            return;
          }
        }
      });
    });

    group('cubes sequences', () {
      test('verified cubes pattern', () {
        for (int i = 0; i < 100; i++) {
          final problem = engine.generateProblem();
          if (problem.description == 'Cubes') {
            final nums = List.generate(5, (j) {
              if (j < 4) return int.parse(problem.sequence[j]);
              return problem.answer;
            });
            // All should be perfect cubes
            for (final n in nums) {
              final root = _cubeRoot(n);
              expect(root * root * root, n,
                  reason: '$n is not a perfect cube');
            }
            return;
          }
        }
      });
    });
  });

  group('SequenceProblem', () {
    test('stores fields correctly', () {
      final problem = SequenceProblem(
        sequence: ['1', '2', '3', '4', '?'],
        answer: 5,
        description: 'Arithmetic (+ 1)',
      );
      expect(problem.sequence, ['1', '2', '3', '4', '?']);
      expect(problem.answer, 5);
      expect(problem.description, 'Arithmetic (+ 1)');
    });
  });
}

int _cubeRoot(int n) {
  for (int i = 0; i * i * i <= n; i++) {
    if (i * i * i == n) return i;
  }
  return 0;
}
