import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/visual_statistical_learning/visual_statistical_learning_engine.dart';

void main() {
  group('VisualStatisticalLearningEngine', () {
    late VisualStatisticalLearningEngine engine;

    setUp(() {
      engine = VisualStatisticalLearningEngine();
    });

    test('generateTriplets returns 4 triplets of 3 icons each', () {
      final triplets = engine.generateTriplets();
      expect(triplets.length, 4);
      for (final triplet in triplets) {
        expect(triplet.length, 3);
      }
    });

    test('all triplets contain unique icons (no duplicates across triplets)', () {
      final triplets = engine.generateTriplets();
      final allIcons = triplets.expand((t) => t).toList();
      expect(allIcons.length, allIcons.toSet().length);
    });

    test('generateLearningSequence returns correct length', () {
      final triplets = engine.generateTriplets();
      final sequence = engine.generateLearningSequence(triplets, 5);
      expect(sequence.length, 15);
    });

    test('generateLearningSequence length is length param times 3', () {
      final triplets = engine.generateTriplets();
      final sequence = engine.generateLearningSequence(triplets, 3);
      expect(sequence.length, 3 * 3);
    });

    test('generateLearningSequence contains only icons from triplets', () {
      final triplets = engine.generateTriplets();
      final allIcons = triplets.expand((t) => t).toSet();
      final sequence = engine.generateLearningSequence(triplets, 4);
      for (final icon in sequence) {
        expect(allIcons, contains(icon));
      }
    });

    test('generateTestTrial returns left, right, isLeftCorrect', () {
      final triplets = engine.generateTriplets();
      final trial = engine.generateTestTrial(triplets);
      expect(trial.containsKey('left'), isTrue);
      expect(trial.containsKey('right'), isTrue);
      expect(trial.containsKey('isLeftCorrect'), isTrue);
      expect(trial['isLeftCorrect'], isA<bool>());
    });

    test('generateTestTrial left and right each have 3 icons', () {
      final triplets = engine.generateTriplets();
      final trial = engine.generateTestTrial(triplets);
      expect((trial['left'] as List).length, 3);
      expect((trial['right'] as List).length, 3);
    });
  });
}
