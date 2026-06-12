import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/stop_signal/stop_signal_engine.dart';

void main() {
  group('StopSignalEngine', () {
    late StopSignalEngine engine;

    setUp(() {
      engine = StopSignalEngine();
    });

    group('generateTrial', () {
      test('returns a StopSignalTrial instance', () {
        final trial = engine.generateTrial();
        expect(trial, isA<StopSignalTrial>());
      });

      test('trial type is either go or stop', () {
        for (int i = 0; i < 20; i++) {
          final trial = engine.generateTrial();
          expect(
            trial.type == StopSignalType.go || trial.type == StopSignalType.stop,
            isTrue,
          );
        }
      });

      test('trial direction is 0 or 1', () {
        for (int i = 0; i < 20; i++) {
          final trial = engine.generateTrial();
          expect(trial.direction == 0 || trial.direction == 1, isTrue);
        }
      });

      test('stopSignalDelay is between 150 and 299', () {
        for (int i = 0; i < 20; i++) {
          final trial = engine.generateTrial();
          expect(trial.stopSignalDelay, greaterThanOrEqualTo(150));
          expect(trial.stopSignalDelay, lessThan(300));
        }
      });

      test('stopSignalDelay is an integer', () {
        final trial = engine.generateTrial();
        expect(trial.stopSignalDelay, isA<int>());
      });

      test('majority of trials are go trials (~75%)', () {
        int goCount = 0;
        const int totalTrials = 100;
        for (int i = 0; i < totalTrials; i++) {
          final trial = engine.generateTrial();
          if (trial.type == StopSignalType.go) goCount++;
        }
        expect(goCount, greaterThan(50));
      });

      test('stopSignalType enum has both values', () {
        expect(StopSignalType.values.length, 2);
        expect(StopSignalType.values, contains(StopSignalType.go));
        expect(StopSignalType.values, contains(StopSignalType.stop));
      });
    });
  });
}
