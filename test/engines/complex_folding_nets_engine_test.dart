import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/complex_folding_nets/complex_folding_nets_engine.dart';

void main() {
  group('ComplexFoldingNetsEngine', () {
    late ComplexFoldingNetsEngine engine;

    setUp(() {
      engine = ComplexFoldingNetsEngine();
    });

    group('pairs', () {
      test('has 7 solid types', () {
        expect(engine.pairs.length, 7);
      });

      test('each pair has a name', () {
        for (final pair in engine.pairs) {
          expect(pair.name, isNotEmpty);
        }
      });

      test('each pair has a SolidType', () {
        for (final pair in engine.pairs) {
          expect(pair.type, isA<SolidType>());
        }
      });
    });

    group('generateLevel', () {
      test('returns a map with correctPair and options', () {
        final level = engine.generateLevel();
        expect(level.containsKey('correctPair'), isTrue);
        expect(level.containsKey('options'), isTrue);
      });

      test('correctPair is one of the pairs', () {
        final level = engine.generateLevel();
        final correct = level['correctPair'] as NetSolidPair;
        expect(engine.pairs, contains(correct));
      });

      test('has 4 options', () {
        final level = engine.generateLevel();
        final options = level['options'] as List<NetSolidPair>;
        expect(options.length, 4);
      });

      test('correctPair is in options', () {
        final level = engine.generateLevel();
        final correct = level['correctPair'] as NetSolidPair;
        final options = level['options'] as List<NetSolidPair>;
        expect(options, contains(correct));
      });

      test('all options are unique', () {
        final level = engine.generateLevel();
        final options = level['options'] as List<NetSolidPair>;
        final names = options.map((o) => o.name).toSet();
        expect(names.length, 4);
      });
    });
  });

  group('NetSolidPair', () {
    test('stores type and name', () {
      final pair = NetSolidPair(type: SolidType.octahedron, name: 'Octahedron');
      expect(pair.type, SolidType.octahedron);
      expect(pair.name, 'Octahedron');
    });
  });
}
