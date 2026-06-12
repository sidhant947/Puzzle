import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:puzzle/ui/features/games/color_match/color_match_engine.dart';

void main() {
  group('ColorMatchEngine', () {
    late ColorMatchEngine engine;

    setUp(() {
      engine = ColorMatchEngine();
    });

    group('generateTargetColor', () {
      test('returns a Color', () {
        final color = engine.generateTargetColor();
        expect(color, isA<Color>());
      });

      test('generates different colors', () {
        final colors = <Color>{};
        for (int i = 0; i < 20; i++) {
          colors.add(engine.generateTargetColor());
        }
        expect(colors.length, greaterThan(1));
      });
    });

    group('calculateSimilarity', () {
      test('returns 100% for identical colors', () {
        const color = Color(0xFFFF0000);
        final similarity = engine.calculateSimilarity(color, color);
        expect(similarity, closeTo(100.0, 0.1));
      });

      test('returns 0% for maximally different colors', () {
        const target = Color(0xFFFF0000);
        const current = Color(0xFF00FF00);
        final similarity = engine.calculateSimilarity(target, current);
        expect(similarity, lessThan(50.0));
      });

      test('returns a value between 0 and 100', () {
        const target = Color(0xFFFF0000);
        const current = Color(0xFF0000FF);
        final similarity = engine.calculateSimilarity(target, current);
        expect(similarity, greaterThanOrEqualTo(0));
        expect(similarity, lessThanOrEqualTo(100));
      });

      test('closer colors have higher similarity', () {
        const target = Color(0xFFFF0000);
        const close = Color(0xFFFF1010);
        const far = Color(0xFF0000FF);
        final simClose = engine.calculateSimilarity(target, close);
        final simFar = engine.calculateSimilarity(target, far);
        expect(simClose, greaterThan(simFar));
      });

      test('similarity is symmetric', () {
        const a = Color(0xFFFF0000);
        const b = Color(0xFF0000FF);
        expect(
          engine.calculateSimilarity(a, b),
          closeTo(engine.calculateSimilarity(b, a), 0.1),
        );
      });
    });
  });
}
