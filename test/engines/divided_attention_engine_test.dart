import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/divided_attention/divided_attention_engine.dart';

void main() {
  group('DividedAttentionEngine', () {
    late DividedAttentionEngine engine;

    setUp(() {
      engine = DividedAttentionEngine();
    });

    group('generateItem', () {
      test('returns a DividedAttentionItem', () {
        final item = engine.generateItem(true);
        expect(item, isA<DividedAttentionItem>());
      });

      test('left side generates shape values', () {
        for (int i = 0; i < 20; i++) {
          final item = engine.generateItem(true);
          expect(
            ['star', 'square', 'circle', 'triangle'].contains(item.value),
            isTrue,
          );
        }
      });

      test('right side generates color values', () {
        for (int i = 0; i < 20; i++) {
          final item = engine.generateItem(false);
          expect(
            ['red', 'blue', 'green', 'yellow'].contains(item.value),
            isTrue,
          );
        }
      });

      test('star is target on left side', () {
        for (int i = 0; i < 50; i++) {
          final item = engine.generateItem(true);
          if (item.value == 'star') {
            expect(item.isTarget, isTrue);
          } else {
            expect(item.isTarget, isFalse);
          }
        }
      });

      test('red is target on right side', () {
        for (int i = 0; i < 50; i++) {
          final item = engine.generateItem(false);
          if (item.value == 'red') {
            expect(item.isTarget, isTrue);
          } else {
            expect(item.isTarget, isFalse);
          }
        }
      });

      test('items have unique IDs', () {
        final ids = <String>{};
        for (int i = 0; i < 20; i++) {
          final item = engine.generateItem(true);
          ids.add(item.id);
        }
        expect(ids.length, 20);
      });
    });
  });
}
