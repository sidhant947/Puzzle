import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/conjunction_search/conjunction_search_engine.dart';

void main() {
  group('ConjunctionSearchEngine', () {
    late ConjunctionSearchEngine engine;

    setUp(() {
      engine = ConjunctionSearchEngine();
    });

    group('generateLevel', () {
      test('returns a map with target and items', () {
        final level = engine.generateLevel();
        expect(level.containsKey('target'), isTrue);
        expect(level.containsKey('items'), isTrue);
      });

      test('target is a SearchItem', () {
        final level = engine.generateLevel();
        expect(level['target'], isA<SearchItem>());
      });

      test('target has isTarget true', () {
        final level = engine.generateLevel();
        final target = level['target'] as SearchItem;
        expect(target.isTarget, isTrue);
      });

      test('items list has 36 entries', () {
        final level = engine.generateLevel();
        final items = level['items'] as List<SearchItem>;
        expect(items.length, 36);
      });

      test('target is in items list', () {
        final level = engine.generateLevel();
        final target = level['target'] as SearchItem;
        final items = level['items'] as List<SearchItem>;
        expect(items.any((i) => i.id == target.id && i.isTarget), isTrue);
      });

      test('distractors share shape or color with target', () {
        final level = engine.generateLevel();
        final target = level['target'] as SearchItem;
        final items = level['items'] as List<SearchItem>;

        for (final item in items) {
          if (!item.isTarget) {
            final sharesShape = item.shape == target.shape;
            final sharesColor = item.color == target.color;
            expect(sharesShape || sharesColor, isTrue,
                reason: 'Distractor should share at least one feature with target');
            expect(sharesShape && sharesColor, isFalse,
                reason: 'Distractor should not share both features with target');
          }
        }
      });
    });
  });

  group('SearchItem', () {
    test('stores all fields', () {
      final item = SearchItem(
        shape: ShapeType.circle,
        color: ColorType.red,
        isTarget: true,
        id: 0,
      );
      expect(item.shape, ShapeType.circle);
      expect(item.color, ColorType.red);
      expect(item.isTarget, isTrue);
      expect(item.id, 0);
    });
  });

  group('ShapeType and ColorType', () {
    test('ShapeType has 4 values', () {
      expect(ShapeType.values.length, 4);
    });

    test('ColorType has 4 values', () {
      expect(ColorType.values.length, 4);
    });

    test('ShapeType label returns uppercase name', () {
      expect(ShapeType.circle.label, 'CIRCLE');
    });

    test('ColorType label returns uppercase name', () {
      expect(ColorType.red.label, 'RED');
    });
  });
}
