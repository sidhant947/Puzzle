import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/palindrome_builder/palindrome_builder_engine.dart';

void main() {
  group('PalindromeBuilderEngine', () {
    late PalindromeBuilderEngine engine;

    setUp(() {
      engine = PalindromeBuilderEngine();
    });

    group('getRandomTask', () {
      test('returns a PalindromeTask', () {
        final task = engine.getRandomTask();
        expect(task, isA<PalindromeTask>());
      });

      test('task has non-empty incomplete word', () {
        final task = engine.getRandomTask();
        expect(task.incomplete.isNotEmpty, isTrue);
      });

      test('task has non-empty solution', () {
        final task = engine.getRandomTask();
        expect(task.solution.isNotEmpty, isTrue);
      });

      test('task has non-empty display', () {
        final task = engine.getRandomTask();
        expect(task.display.isNotEmpty, isTrue);
      });
    });

    group('checkSolution', () {
      test('returns true for exact match', () {
        expect(engine.checkSolution('AR', 'AR'), isTrue);
      });

      test('returns true for case-insensitive match', () {
        expect(engine.checkSolution('ar', 'AR'), isTrue);
        expect(engine.checkSolution('Ar', 'AR'), isTrue);
      });

      test('returns true with leading/trailing whitespace', () {
        expect(engine.checkSolution('  AR  ', 'AR'), isTrue);
      });

      test('returns false for wrong guess', () {
        expect(engine.checkSolution('BA', 'AR'), isFalse);
      });

      test('returns false for empty guess', () {
        expect(engine.checkSolution('', 'AR'), isFalse);
      });
    });
  });

  group('PalindromeTask', () {
    test('balance field defaults to null', () {
      final task = PalindromeTask(
        incomplete: 'MAD__',
        solution: 'AM',
        display: 'MAD..',
      );
      expect(task.balance, isNull);
    });

    test('balance field can be set', () {
      final task = PalindromeTask(
        incomplete: 'CI__C',
        balance: 'VI',
        solution: 'VI',
        display: 'CI..C',
      );
      expect(task.balance, equals('VI'));
    });
  });
}
