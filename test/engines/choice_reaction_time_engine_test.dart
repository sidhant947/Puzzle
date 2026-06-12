import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/choice_reaction_time/choice_reaction_time_engine.dart';

void main() {
  group('ChoiceReactionTimeEngine', () {
    late ChoiceReactionTimeEngine engine;

    setUp(() {
      engine = ChoiceReactionTimeEngine();
    });

    group('generateTarget', () {
      test('returns a value between 0 and 3', () {
        for (int i = 0; i < 50; i++) {
          final target = engine.generateTarget();
          expect(target, greaterThanOrEqualTo(0));
          expect(target, lessThanOrEqualTo(3));
        }
      });

      test('generates all four positions over time', () {
        final positions = <int>{};
        for (int i = 0; i < 50; i++) {
          positions.add(engine.generateTarget());
        }
        expect(positions, containsAll([0, 1, 2, 3]));
      });
    });

    group('getDelay', () {
      test('returns a value between 500 and 2000', () {
        for (int i = 0; i < 50; i++) {
          final delay = engine.getDelay();
          expect(delay, greaterThanOrEqualTo(500));
          expect(delay, lessThanOrEqualTo(2000));
        }
      });

      test('generates varying delays', () {
        final delays = <int>{};
        for (int i = 0; i < 50; i++) {
          delays.add(engine.getDelay());
        }
        expect(delays.length, greaterThan(1));
      });
    });
  });
}
