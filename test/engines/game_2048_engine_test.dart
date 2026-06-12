import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/game_2048/game_2048_engine.dart';

void main() {
  group('Game2048Engine', () {
    late Game2048Engine engine;

    setUp(() {
      engine = Game2048Engine();
    });

    group('Tile', () {
      test('copyWith preserves original fields when not specified', () {
        final tile = Tile(id: 1, value: 2, x: 0, y: 0);
        final copy = tile.copyWith();
        expect(copy.id, 1);
        expect(copy.value, 2);
        expect(copy.x, 0);
        expect(copy.y, 0);
      });

      test('copyWith overrides specified fields', () {
        final tile = Tile(id: 1, value: 2, x: 0, y: 0);
        final copy = tile.copyWith(value: 4, x: 3);
        expect(copy.value, 4);
        expect(copy.x, 3);
        expect(copy.y, 0);
      });
    });

    group('initBoard', () {
      test('returns exactly 2 tiles', () {
        final tiles = engine.initBoard();
        expect(tiles.length, 2);
      });

      test('tiles have values 2 or 4', () {
        final tiles = engine.initBoard();
        for (final t in tiles) {
          expect(t.value == 2 || t.value == 4, isTrue);
        }
      });

      test('tiles are within board bounds', () {
        final tiles = engine.initBoard();
        for (final t in tiles) {
          expect(t.x, greaterThanOrEqualTo(0));
          expect(t.x, lessThan(Game2048Engine.size));
          expect(t.y, greaterThanOrEqualTo(0));
          expect(t.y, lessThan(Game2048Engine.size));
        }
      });

      test('tiles have unique IDs', () {
        final tiles = engine.initBoard();
        final ids = tiles.map((t) => t.id).toSet();
        expect(ids.length, 2);
      });
    });

    group('move', () {
      test('returns tiles, score, and moved', () {
        final tiles = engine.initBoard();
        final result = engine.move(tiles, 1, 0);
        expect(result.containsKey('tiles'), isTrue);
        expect(result.containsKey('score'), isTrue);
        expect(result.containsKey('moved'), isTrue);
      });

      test('merging two equal tiles doubles value', () {
        final tiles = [
          Tile(id: 0, value: 2, x: 0, y: 0),
          Tile(id: 1, value: 2, x: 1, y: 0),
        ];
        final result = engine.move(tiles, 1, 0);
        final resultTiles = result['tiles'] as List<Tile>;
        final merged = resultTiles.where((t) => t.value == 4 && !t.merged);
        expect(merged.isNotEmpty, isTrue);
      });

      test('score increases by merged value', () {
        final tiles = [
          Tile(id: 0, value: 2, x: 0, y: 0),
          Tile(id: 1, value: 2, x: 1, y: 0),
        ];
        final result = engine.move(tiles, 1, 0);
        expect(result['score'] as int, greaterThanOrEqualTo(4));
      });
    });

    group('isGameOver', () {
      test('returns false when board is not full', () {
        final tiles = engine.initBoard();
        expect(engine.isGameOver(tiles), isFalse);
      });

      test('returns false when empty cells exist', () {
        final tiles = [
          Tile(id: 0, value: 2, x: 0, y: 0),
          Tile(id: 1, value: 4, x: 1, y: 0),
        ];
        expect(engine.isGameOver(tiles), isFalse);
      });

      test('returns false when merges are possible', () {
        final tiles = [
          Tile(id: 0, value: 2, x: 0, y: 0),
          Tile(id: 1, value: 2, x: 1, y: 0),
          Tile(id: 2, value: 4, x: 2, y: 0),
          Tile(id: 3, value: 8, x: 3, y: 0),
          Tile(id: 4, value: 16, x: 0, y: 1),
          Tile(id: 5, value: 32, x: 1, y: 1),
          Tile(id: 6, value: 64, x: 2, y: 1),
          Tile(id: 7, value: 128, x: 3, y: 1),
          Tile(id: 8, value: 256, x: 0, y: 2),
          Tile(id: 9, value: 512, x: 1, y: 2),
          Tile(id: 10, value: 1024, x: 2, y: 2),
          Tile(id: 11, value: 2048, x: 3, y: 2),
          Tile(id: 12, value: 2, x: 0, y: 3),
          Tile(id: 13, value: 4, x: 1, y: 3),
          Tile(id: 14, value: 8, x: 2, y: 3),
          Tile(id: 15, value: 8, x: 3, y: 3),
        ];
        expect(engine.isGameOver(tiles), isFalse);
      });
    });
  });
}
