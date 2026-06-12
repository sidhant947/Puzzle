import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/vigilance_task/vigilance_task_engine.dart';

void main() {
  group('VigilanceTaskEngine', () {
    late VigilanceTaskEngine engine;

    setUp(() {
      engine = VigilanceTaskEngine();
    });

    test('totalPositions is 60', () {
      expect(engine.totalPositions, 60);
    });

    test('shouldSkip returns bool', () {
      final result = engine.shouldSkip();
      expect(result, isA<bool>());
    });

    test('shouldSkip returns true or false over many calls', () {
      bool hasTrue = false;
      bool hasFalse = false;
      for (int i = 0; i < 200; i++) {
        if (engine.shouldSkip()) hasTrue = true;
        if (!engine.shouldSkip()) hasFalse = true;
      }
      expect(hasTrue, isTrue);
      expect(hasFalse, isTrue);
    });

    test('getNextPosition increments by 1 when not skipping', () {
      expect(engine.getNextPosition(5, false), 6);
      expect(engine.getNextPosition(0, false), 1);
    });

    test('getNextPosition increments by 2 when skipping', () {
      expect(engine.getNextPosition(5, true), 7);
      expect(engine.getNextPosition(0, true), 2);
    });

    test('getNextPosition wraps around at totalPositions', () {
      expect(engine.getNextPosition(59, false), 0);
      expect(engine.getNextPosition(58, true), 0);
      expect(engine.getNextPosition(59, true), 1);
    });

    test('getNextPosition stays in valid range', () {
      for (int pos = 0; pos < 60; pos++) {
        final nextSkip = engine.getNextPosition(pos, true);
        final nextNoSkip = engine.getNextPosition(pos, false);
        expect(nextSkip, greaterThanOrEqualTo(0));
        expect(nextSkip, lessThan(60));
        expect(nextNoSkip, greaterThanOrEqualTo(0));
        expect(nextNoSkip, lessThan(60));
      }
    });
  });
}
