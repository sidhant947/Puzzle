import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/change_blindness/change_blindness_engine.dart';

void main() {
  group('ChangeBlindnessEngine', () {
    late ChangeBlindnessEngine engine;

    setUp(() {
      engine = ChangeBlindnessEngine();
    });

    group('generateTrial', () {
      test('returns a map with original, changed, and changeIndex', () {
        final trial = engine.generateTrial(3);
        expect(trial.containsKey('original'), isTrue);
        expect(trial.containsKey('changed'), isTrue);
        expect(trial.containsKey('changeIndex'), isTrue);
      });

      test('original and changed have correct number of items', () {
        final trial = engine.generateTrial(3);
        final original = trial['original'] as List;
        final changed = trial['changed'] as List;
        expect(original.length, 9); // 3*3
        expect(changed.length, 9);
      });

      test('changeIndex is within bounds', () {
        final trial = engine.generateTrial(3);
        final idx = trial['changeIndex'] as int;
        expect(idx, greaterThanOrEqualTo(0));
        expect(idx, lessThan(9));
      });

      test('changed item differs from original at changeIndex', () {
        final trial = engine.generateTrial(3);
        final original = trial['original'] as List<Map<String, dynamic>>;
        final changed = trial['changed'] as List<Map<String, dynamic>>;
        final idx = trial['changeIndex'] as int;
        // Either icon or color changed
        expect(
          original[idx]['icon'] != changed[idx]['icon'] ||
              original[idx]['color'] != changed[idx]['color'],
          isTrue,
        );
      });

      test('items not at changeIndex remain the same', () {
        final trial = engine.generateTrial(3);
        final original = trial['original'] as List<Map<String, dynamic>>;
        final changed = trial['changed'] as List<Map<String, dynamic>>;
        final idx = trial['changeIndex'] as int;
        for (int i = 0; i < original.length; i++) {
          if (i != idx) {
            expect(original[i]['icon'], equals(changed[i]['icon']));
            expect(original[i]['color'], equals(changed[i]['color']));
          }
        }
      });

      test('each item has icon and color', () {
        final trial = engine.generateTrial(2);
        final items = trial['original'] as List<Map<String, dynamic>>;
        for (final item in items) {
          expect(item.containsKey('icon'), isTrue);
          expect(item.containsKey('color'), isTrue);
        }
      });
    });
  });
}
