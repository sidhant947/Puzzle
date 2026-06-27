import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/cube_net_fold/cube_net_fold_engine.dart';

void main() {
  group('CubeNetFoldEngine', () {
    late CubeNetFoldEngine engine;

    setUp(() {
      engine = CubeNetFoldEngine();
    });

    group('generateLevel', () {
      test('returns a CubeNetFoldLevel', () {
        final level = engine.generateLevel();
        expect(level, isA<CubeNetFoldLevel>());
      });

      test('netColors has exactly 6 colors', () {
        final level = engine.generateLevel();
        expect(level.netColors.length, 6);
      });

      test('options has exactly 3 entries', () {
        final level = engine.generateLevel();
        expect(level.options.length, 3);
      });

      test('exactly one option is valid', () {
        final level = engine.generateLevel();
        final validCount = level.options.where((o) => o.isValid).length;
        expect(validCount, 1);
      });

      test('correctOptionIndex points to the valid option', () {
        final level = engine.generateLevel();
        expect(level.options[level.correctOptionIndex].isValid, isTrue);
      });

      test('each option has exactly 3 visible colors', () {
        final level = engine.generateLevel();
        for (final option in level.options) {
          expect(option.visibleColors.length, 3);
        }
      });

      test('all netColors are distinct', () {
        final level = engine.generateLevel();
        final colors = level.netColors;
        final colorSet = <Color>{};
        for (final c in colors) {
          expect(colorSet.contains(c), isFalse);
          colorSet.add(c);
        }
      });

      test('generates different levels on multiple calls', () {
        final level1 = engine.generateLevel();
        final level2 = engine.generateLevel();
        final nets1 = level1.netColors.map((c) => c.toARGB32()).toList();
        final nets2 = level2.netColors.map((c) => c.toARGB32()).toList();
        expect(nets1, isNot(equals(nets2)));
      });
    });
  });
}
