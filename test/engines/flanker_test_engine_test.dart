import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/flanker_test/flanker_test_engine.dart';

void main() {
  group('FlankerEngine', () {
    late FlankerEngine engine;

    setUp(() {
      engine = FlankerEngine();
    });

    group('generateTrial', () {
      test('returns a map with display, target, and isCongruent', () {
        final trial = engine.generateTrial();
        expect(trial.containsKey('display'), isTrue);
        expect(trial.containsKey('target'), isTrue);
        expect(trial.containsKey('isCongruent'), isTrue);
      });

      test('target is 0 (left) or 1 (right)', () {
        for (int i = 0; i < 20; i++) {
          final trial = engine.generateTrial();
          expect(trial['target'] == 0 || trial['target'] == 1, isTrue);
        }
      });

      test('display has 5 characters (with spaces)', () {
        final trial = engine.generateTrial();
        final display = trial['display'] as String;
        expect(display.split(' ').length, 5);
      });

      test('center character is the target arrow', () {
        for (int i = 0; i < 20; i++) {
          final trial = engine.generateTrial();
          final display = trial['display'] as String;
          final parts = display.split(' ');
          final target = trial['target'] as int;
          final expectedChar = target == 0 ? '<' : '>';
          expect(parts[2], expectedChar);
        }
      });

      test('congruent trial has matching flankers and target', () {
        for (int i = 0; i < 50; i++) {
          final trial = engine.generateTrial();
          if (trial['isCongruent'] == true) {
            final display = trial['display'] as String;
            final parts = display.split(' ');
            expect(parts[0], parts[2]);
            expect(parts[1], parts[2]);
            expect(parts[3], parts[2]);
            expect(parts[4], parts[2]);
          }
        }
      });

      test('incongruent trial has opposite flankers from target', () {
        for (int i = 0; i < 50; i++) {
          final trial = engine.generateTrial();
          if (trial['isCongruent'] == false) {
            final display = trial['display'] as String;
            final parts = display.split(' ');
            final targetChar = trial['target'] == 0 ? '<' : '>';
            final flankerChar = trial['target'] == 0 ? '>' : '<';
            expect(parts[0], flankerChar);
            expect(parts[1], flankerChar);
            expect(parts[2], targetChar);
            expect(parts[3], flankerChar);
            expect(parts[4], flankerChar);
          }
        }
      });
    });
  });
}
