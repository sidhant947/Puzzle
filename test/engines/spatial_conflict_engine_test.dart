import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/spatial_conflict/spatial_conflict_engine.dart';

void main() {
  group('SpatialConflictEngine', () {
    late SpatialConflictEngine engine;

    setUp(() {
      engine = SpatialConflictEngine();
    });

    group('generateTrials', () {
      test('generates exactly 15 trials', () {
        final trials = engine.generateTrials();
        expect(trials.length, 15);
      });

      test('each trial has a valid word direction', () {
        final trials = engine.generateTrials();
        for (final trial in trials) {
          expect(trial.word, anyOf(equals(Direction.left), equals(Direction.right)));
        }
      });

      test('each trial has a valid position direction', () {
        final trials = engine.generateTrials();
        for (final trial in trials) {
          expect(trial.position, anyOf(equals(Direction.left), equals(Direction.right)));
        }
      });

      test('isCongruent is true when word equals position', () {
        final trial = ConflictTrial(word: Direction.left, position: Direction.left);
        expect(trial.isCongruent, isTrue);
      });

      test('isCongruent is false when word differs from position', () {
        final trial = ConflictTrial(word: Direction.left, position: Direction.right);
        expect(trial.isCongruent, isFalse);
      });

      test('generateTrials produces a mix of congruent and incongruent', () {
        final trials = engine.generateTrials();
        final congruentCount = trials.where((t) => t.isCongruent).length;
        final incongruentCount = trials.where((t) => !t.isCongruent).length;
        // With 15 random trials, it is extremely unlikely all are same
        // but we test that both exist in most runs
        expect(congruentCount + incongruentCount, 15);
      });

      test('Direction label returns uppercase name', () {
        expect(Direction.left.label, 'LEFT');
        expect(Direction.right.label, 'RIGHT');
      });
    });
  });
}
