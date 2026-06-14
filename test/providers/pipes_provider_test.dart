import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/pipes/pipes_provider.dart';
import 'package:puzzle/ui/features/games/pipes/pipes_engine.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  group('PipesNotifier', () {
    test('pipes should not be able to pass through a terminal dot of a different color', () {
      final container = ProviderContainer();
      final notifier = container.read(pipesNotifierProvider.notifier);
      
      final level = PipesLevel(
        size: 4,
        pairs: [
          [Point(0, 0), Point(1, 0)], // Color 0
          [Point(0, 1), Point(1, 1)], // Color 1
          [Point(0, 2), Point(1, 2)], // Color 2
          [Point(0, 3), Point(1, 3)], // Color 3
        ],
      );

      notifier.state = PipesState(
        level: level,
        paths: List.generate(level.pairs.length, (_) => []),
      );

      notifier.startPath(0, 0);
      notifier.updatePath(0, 1);

      final state = container.read(pipesNotifierProvider);
      final color0Path = state.paths[0];

      expect(color0Path.contains(Point(0, 1)), isFalse);
    });

    test('pipes should be able to pass through their own terminal dots', () {
      final container = ProviderContainer();
      final notifier = container.read(pipesNotifierProvider.notifier);
      
      final level = PipesLevel(
        size: 4,
        pairs: [
          [Point(0, 0), Point(1, 0)], // Color 0
          [Point(0, 1), Point(1, 1)], // Color 1
        ],
      );

      notifier.state = PipesState(
        level: level,
        paths: List.generate(level.pairs.length, (_) => []),
      );

      notifier.startPath(0, 0);
      notifier.updatePath(1, 0);

      final state = container.read(pipesNotifierProvider);
      final color0Path = state.paths[0];

      expect(color0Path.contains(Point(1, 0)), isTrue);
    });
  });
}
