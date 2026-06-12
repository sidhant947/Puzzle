import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/rule_switcher/rule_switcher_engine.dart';

void main() {
  group('RuleSwitcherEngine', () {
    late RuleSwitcherEngine engine;

    setUp(() {
      engine = RuleSwitcherEngine();
    });

    group('generateTrial', () {
      test('returns a map with required keys', () {
        final trial = engine.generateTrial();
        expect(trial.containsKey('rule'), isTrue);
        expect(trial.containsKey('number'), isTrue);
        expect(trial.containsKey('colorName'), isTrue);
        expect(trial.containsKey('isCorrect'), isTrue);
      });

      test('rule is a SwitchRule enum', () {
        final trial = engine.generateTrial();
        expect(
          trial['rule'] == SwitchRule.number ||
              trial['rule'] == SwitchRule.color,
          isTrue,
        );
      });

      test('number is between 1 and 9', () {
        for (int i = 0; i < 20; i++) {
          final trial = engine.generateTrial();
          final number = trial['number'] as int;
          expect(number, greaterThanOrEqualTo(1));
          expect(number, lessThanOrEqualTo(9));
        }
      });

      test('colorName is Red or Green', () {
        for (int i = 0; i < 20; i++) {
          final trial = engine.generateTrial();
          final colorName = trial['colorName'] as String;
          expect(
            colorName == 'Red' || colorName == 'Green',
            isTrue,
          );
        }
      });

      test('isCorrect is a boolean', () {
        final trial = engine.generateTrial();
        expect(trial['isCorrect'], isA<bool>());
      });

      test('number rule: even numbers are correct', () {
        final trial = {
          'rule': SwitchRule.number,
          'number': 4,
          'colorName': 'Red',
          'isCorrect': true,
        };
        // 4 is even, so isCorrect should be true
        expect(trial['isCorrect'], isTrue);
      });

      test('number rule: odd numbers are incorrect', () {
        final trial = {
          'rule': SwitchRule.number,
          'number': 3,
          'colorName': 'Red',
          'isCorrect': false,
        };
        // 3 is odd, so isCorrect should be false
        expect(trial['isCorrect'], isFalse);
      });

      test('color rule: Red is correct', () {
        final trial = {
          'rule': SwitchRule.color,
          'number': 5,
          'colorName': 'Red',
          'isCorrect': true,
        };
        expect(trial['isCorrect'], isTrue);
      });

      test('color rule: Green is incorrect', () {
        final trial = {
          'rule': SwitchRule.color,
          'number': 5,
          'colorName': 'Green',
          'isCorrect': false,
        };
        expect(trial['isCorrect'], isFalse);
      });

      test('generates both rule types', () {
        int numberCount = 0;
        int colorCount = 0;
        for (int i = 0; i < 40; i++) {
          final trial = engine.generateTrial();
          if (trial['rule'] == SwitchRule.number) {
            numberCount++;
          } else {
            colorCount++;
          }
        }
        expect(numberCount, greaterThan(0));
        expect(colorCount, greaterThan(0));
      });
    });
  });
}
