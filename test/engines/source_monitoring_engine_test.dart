import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/source_monitoring/source_monitoring_engine.dart';

void main() {
  group('SourceMonitoringEngine', () {
    late SourceMonitoringEngine engine;

    setUp(() {
      engine = SourceMonitoringEngine();
    });

    group('generateLevel', () {
      test('returns a SourceMonitoringLevel', () {
        final level = engine.generateLevel();
        expect(level, isA<SourceMonitoringLevel>());
      });

      test('generates exactly 4 items', () {
        final level = engine.generateLevel();
        expect(level.items.length, 4);
      });

      test('generates exactly 4 questions', () {
        final level = engine.generateLevel();
        expect(level.questions.length, 4);
      });

      test('items have non-empty words', () {
        final level = engine.generateLevel();
        for (final item in level.items) {
          expect(item.word.isNotEmpty, isTrue);
        }
      });

      test('items have non-empty source names', () {
        final level = engine.generateLevel();
        for (final item in level.items) {
          expect(item.sourceName.isNotEmpty, isTrue);
        }
      });

      test('questions contain the same words as items', () {
        final level = engine.generateLevel();
        final itemWords = level.items.map((e) => e.word).toSet();
        final questionWords = level.questions.map((e) => e.word).toSet();
        expect(itemWords, equals(questionWords));
      });

      test('items have different words (no duplicates)', () {
        final level = engine.generateLevel();
        final words = level.items.map((e) => e.word).toList();
        expect(words.toSet().length, words.length);
      });
    });
  });
}
