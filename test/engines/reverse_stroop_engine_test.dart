import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/reverse_stroop/reverse_stroop_engine.dart';

void main() {
  group('ReverseStroopEngine', () {
    group('generateStimulus', () {
      test('returns a StroopStimulus', () {
        final stimulus = ReverseStroopEngine.generateStimulus('easy');
        expect(stimulus, isA<StroopStimulus>());
      });

      test('word is a valid color name', () {
        final validWords = {'RED', 'GREEN', 'BLUE', 'YELLOW', 'PURPLE', 'ORANGE', 'PINK'};
        final stimulus = ReverseStroopEngine.generateStimulus('easy');
        expect(validWords.contains(stimulus.word), isTrue);
      });

      test('colorName is a valid color name', () {
        final validNames = {'RED', 'GREEN', 'BLUE', 'YELLOW', 'PURPLE', 'ORANGE', 'PINK'};
        final stimulus = ReverseStroopEngine.generateStimulus('easy');
        expect(validNames.contains(stimulus.colorName), isTrue);
      });

      test('rule is text or color', () {
        final stimulus = ReverseStroopEngine.generateStimulus('easy');
        expect(
          stimulus.rule == StroopRule.text || stimulus.rule == StroopRule.color,
          isTrue,
        );
      });

      test('correct answer matches the rule', () {
        final stimulus = ReverseStroopEngine.generateStimulus('easy');
        if (stimulus.rule == StroopRule.text) {
          expect(stimulus.correctAnswer, equals(stimulus.word));
        } else {
          expect(stimulus.correctAnswer, equals(stimulus.colorName));
        }
      });

      test('options contains the correct answer', () {
        final stimulus = ReverseStroopEngine.generateStimulus('easy');
        expect(stimulus.options, contains(stimulus.correctAnswer));
      });

      test('options has 4 items', () {
        final stimulus = ReverseStroopEngine.generateStimulus('easy');
        expect(stimulus.options.length, equals(4));
      });

      test('all options are unique', () {
        final stimulus = ReverseStroopEngine.generateStimulus('easy');
        expect(stimulus.options.toSet().length, equals(4));
      });

      test('color is a valid Color object', () {
        final stimulus = ReverseStroopEngine.generateStimulus('easy');
        expect(stimulus.color, isA<Color>());
      });
    });
  });

  group('StroopStimulus', () {
    test('stores all fields correctly', () {
      final stimulus = StroopStimulus(
        word: 'RED',
        color: Colors.red,
        colorName: 'BLUE',
        rule: StroopRule.text,
        options: ['RED', 'GREEN', 'BLUE', 'YELLOW'],
        correctAnswer: 'RED',
      );
      expect(stimulus.word, equals('RED'));
      expect(stimulus.rule, equals(StroopRule.text));
      expect(stimulus.correctAnswer, equals('RED'));
      expect(stimulus.options.length, equals(4));
      expect(stimulus.color, equals(Colors.red));
    });
  });
}
