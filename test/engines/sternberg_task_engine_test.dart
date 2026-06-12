import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/sternberg_task/sternberg_task_engine.dart';

void main() {
  group('SternbergTaskEngine', () {
    late SternbergTaskEngine engine;

    setUp(() {
      engine = SternbergTaskEngine();
    });

    group('generateTrial', () {
      test('returns map with memorySet, probe, and isPresent', () {
        final trial = engine.generateTrial(3);
        expect(trial.containsKey('memorySet'), isTrue);
        expect(trial.containsKey('probe'), isTrue);
        expect(trial.containsKey('isPresent'), isTrue);
      });

      test('memorySet length matches setSize', () {
        for (int size in [1, 2, 3, 5]) {
          final trial = engine.generateTrial(size);
          final memorySet = trial['memorySet'] as List<String>;
          expect(memorySet.length, size);
        }
      });

      test('memorySet contains unique letters', () {
        final trial = engine.generateTrial(5);
        final memorySet = trial['memorySet'] as List<String>;
        expect(memorySet.toSet().length, memorySet.length);
      });

      test('all memorySet letters are valid single uppercase letters', () {
        final validLetters = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'J', 'K', 'L', 'M', 'N', 'P', 'R', 'S', 'T', 'W', 'X', 'Y'};
        final trial = engine.generateTrial(4);
        final memorySet = trial['memorySet'] as List<String>;
        for (final letter in memorySet) {
          expect(validLetters.contains(letter), isTrue);
        }
      });

      test('when isPresent is true, probe is in memorySet', () {
        for (int i = 0; i < 20; i++) {
          final trial = engine.generateTrial(3);
          if (trial['isPresent'] == true) {
            final memorySet = trial['memorySet'] as List<String>;
            expect(memorySet.contains(trial['probe']), isTrue);
          }
        }
      });

      test('when isPresent is false, probe is NOT in memorySet', () {
        for (int i = 0; i < 20; i++) {
          final trial = engine.generateTrial(3);
          if (trial['isPresent'] == false) {
            final memorySet = trial['memorySet'] as List<String>;
            expect(memorySet.contains(trial['probe']), isFalse);
          }
        }
      });

      test('probe is always a valid letter', () {
        final validLetters = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'J', 'K', 'L', 'M', 'N', 'P', 'R', 'S', 'T', 'W', 'X', 'Y'};
        for (int i = 0; i < 20; i++) {
          final trial = engine.generateTrial(4);
          expect(validLetters.contains(trial['probe']), isTrue);
        }
      });

      test('isPresent is a boolean', () {
        final trial = engine.generateTrial(2);
        expect(trial['isPresent'], isA<bool>());
      });

      test('memorySet and probe use different letters for isPresent false', () {
        final trial = engine.generateTrial(1);
        if (trial['isPresent'] == false) {
          final memorySet = trial['memorySet'] as List<String>;
          expect(memorySet.first != trial['probe'], isTrue);
        }
      });
    });
  });
}
