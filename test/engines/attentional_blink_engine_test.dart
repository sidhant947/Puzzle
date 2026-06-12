import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/attentional_blink/attentional_blink_engine.dart';

void main() {
  group('AttentionalBlinkEngine', () {
    late AttentionalBlinkEngine engine;

    setUp(() {
      engine = AttentionalBlinkEngine();
    });

    group('generateTrial', () {
      test('returns a map with required keys', () {
        final trial = engine.generateTrial(20);
        expect(trial.containsKey('sequence'), isTrue);
        expect(trial.containsKey('t1'), isTrue);
        expect(trial.containsKey('t2'), isTrue);
        expect(trial.containsKey('t1Index'), isTrue);
        expect(trial.containsKey('t2Index'), isTrue);
      });

      test('sequence has correct length', () {
        final trial = engine.generateTrial(20);
        final seq = trial['sequence'] as List<String>;
        expect(seq.length, 20);
      });

      test('t1 and t2 are different numbers', () {
        final trial = engine.generateTrial(20);
        expect(trial['t1'], isNot(equals(trial['t2'])));
      });

      test('t1 and t2 are digits', () {
        final trial = engine.generateTrial(20);
        expect(trial['t1'].toString(), matches(RegExp(r'^\d$')));
        expect(trial['t2'].toString(), matches(RegExp(r'^\d$')));
      });

      test('t1Index is within valid range (3-5)', () {
        for (int i = 0; i < 20; i++) {
          final trial = engine.generateTrial(20);
          final t1Idx = trial['t1Index'] as int;
          expect(t1Idx, greaterThanOrEqualTo(3));
          expect(t1Idx, lessThanOrEqualTo(5));
        }
      });

      test('t2Index is after t1Index', () {
        final trial = engine.generateTrial(20);
        final t1Idx = trial['t1Index'] as int;
        final t2Idx = trial['t2Index'] as int;
        expect(t2Idx, greaterThan(t1Idx));
      });

      test('t2Index is within sequence bounds', () {
        final trial = engine.generateTrial(20);
        final t2Idx = trial['t2Index'] as int;
        expect(t2Idx, lessThan(20));
      });

      test('t1 and t2 appear in sequence at their indices', () {
        final trial = engine.generateTrial(20);
        final seq = trial['sequence'] as List<String>;
        expect(seq[trial['t1Index']], equals(trial['t1']));
        expect(seq[trial['t2Index']], equals(trial['t2']));
      });

      test('remaining sequence items are letters', () {
        final trial = engine.generateTrial(20);
        final seq = trial['sequence'] as List<String>;
        final t1Idx = trial['t1Index'] as int;
        final t2Idx = trial['t2Index'] as int;
        for (int i = 0; i < seq.length; i++) {
          if (i != t1Idx && i != t2Idx) {
            expect(seq[i], matches(RegExp(r'^[A-Z]$')));
          }
        }
      });
    });
  });
}
