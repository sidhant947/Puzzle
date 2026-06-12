import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/symbolic_flanker/symbolic_flanker_engine.dart';

void main() {
  group('SymbolicFlankerEngine', () {
    late SymbolicFlankerEngine engine;

    setUp(() {
      engine = SymbolicFlankerEngine();
    });

    group('generateTrial', () {
      test('returns map with display, target, and isCongruent', () {
        final trial = engine.generateTrial();
        expect(trial.containsKey('display'), isTrue);
        expect(trial.containsKey('target'), isTrue);
        expect(trial.containsKey('isCongruent'), isTrue);
      });

      test('display is a 5-character string', () {
        final trial = engine.generateTrial();
        expect(trial['display'], isA<String>());
        expect((trial['display'] as String).length, 5);
      });

      test('target is one of the valid symbols', () {
        for (int i = 0; i < 20; i++) {
          final trial = engine.generateTrial();
          expect(engine.symbols.contains(trial['target']), isTrue);
        }
      });

      test('isCongruent is a boolean', () {
        final trial = engine.generateTrial();
        expect(trial['isCongruent'], isA<bool>());
      });

      test('center character of display is the target', () {
        for (int i = 0; i < 20; i++) {
          final trial = engine.generateTrial();
          final display = trial['display'] as String;
          expect(display[2], trial['target']);
        }
      });

      test('when isCongruent, flankers match target', () {
        for (int i = 0; i < 20; i++) {
          final trial = engine.generateTrial();
          if (trial['isCongruent'] == true) {
            final display = trial['display'] as String;
            expect(display[0], trial['target']);
            expect(display[1], trial['target']);
            expect(display[3], trial['target']);
            expect(display[4], trial['target']);
          }
        }
      });

      test('when not congruent, flankers differ from target', () {
        for (int i = 0; i < 20; i++) {
          final trial = engine.generateTrial();
          if (trial['isCongruent'] == false) {
            final display = trial['display'] as String;
            expect(display[0] != trial['target'], isTrue);
            expect(display[1] != trial['target'], isTrue);
            expect(display[3] != trial['target'], isTrue);
            expect(display[4] != trial['target'], isTrue);
          }
        }
      });

      test('all characters in display are valid symbols', () {
        for (int i = 0; i < 20; i++) {
          final trial = engine.generateTrial();
          final display = trial['display'] as String;
          for (int j = 0; j < 5; j++) {
            expect(engine.symbols.contains(display[j]), isTrue);
          }
        }
      });

      test('both congruent and incongruent trials can occur', () {
        final results = <bool>{};
        for (int i = 0; i < 30; i++) {
          final trial = engine.generateTrial();
          results.add(trial['isCongruent'] as bool);
        }
        expect(results.contains(true), isTrue);
        expect(results.contains(false), isTrue);
      });
    });
  });
}
