import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/switch_task/switch_task_engine.dart';

void main() {
  group('SwitchTaskEngine', () {
    late SwitchTaskEngine engine;

    setUp(() {
      engine = SwitchTaskEngine();
    });

    group('generateTrial', () {
      test('returns map with rule, item, and expectedAnswer', () {
        final trial = engine.generateTrial(null);
        expect(trial.containsKey('rule'), isTrue);
        expect(trial.containsKey('item'), isTrue);
        expect(trial.containsKey('expectedAnswer'), isTrue);
      });

      test('rule is a SwitchRule enum value', () {
        final trial = engine.generateTrial(null);
        expect(trial['rule'], isA<SwitchRule>());
      });

      test('item is a SwitchItem', () {
        final trial = engine.generateTrial(null);
        expect(trial['item'], isA<SwitchItem>());
      });

      test('expectedAnswer is a String', () {
        final trial = engine.generateTrial(null);
        expect(trial['expectedAnswer'], isA<String>());
      });

      test('when rule is color, expectedAnswer matches item.colorName', () {
        for (int i = 0; i < 20; i++) {
          final trial = engine.generateTrial(null);
          if (trial['rule'] == SwitchRule.color) {
            final item = trial['item'] as SwitchItem;
            expect(trial['expectedAnswer'], item.colorName);
          }
        }
      });

      test('when rule is shape, expectedAnswer matches item.shapeName', () {
        for (int i = 0; i < 20; i++) {
          final trial = engine.generateTrial(null);
          if (trial['rule'] == SwitchRule.shape) {
            final item = trial['item'] as SwitchItem;
            expect(trial['expectedAnswer'], item.shapeName);
          }
        }
      });

      test('with previousRule null, any rule can be generated', () {
        final rules = <SwitchRule>{};
        for (int i = 0; i < 20; i++) {
          final trial = engine.generateTrial(null);
          rules.add(trial['rule'] as SwitchRule);
        }
        expect(rules.length, 2);
      });

      test('with previousRule, rule may stay the same or switch', () {
        final results = <SwitchRule>{};
        for (int i = 0; i < 20; i++) {
          final trial = engine.generateTrial(SwitchRule.color);
          results.add(trial['rule'] as SwitchRule);
        }
        expect(results.length, greaterThanOrEqualTo(1));
      });

      test('item has valid color and shape', () {
        final trial = engine.generateTrial(null);
        final item = trial['item'] as SwitchItem;
        expect(item.color, isA<Color>());
        expect(item.shape, isA<IconData>());
        expect(item.colorName, isA<String>());
        expect(item.shapeName, isA<String>());
      });
    });

    group('getOptions', () {
      test('color rule returns BLUE and RED', () {
        final options = engine.getOptions(SwitchRule.color);
        expect(options, containsAll(['BLUE', 'RED']));
        expect(options.length, 2);
      });

      test('shape rule returns CIRCLE and SQUARE', () {
        final options = engine.getOptions(SwitchRule.shape);
        expect(options, containsAll(['CIRCLE', 'SQUARE']));
        expect(options.length, 2);
      });
    });
  });
}
