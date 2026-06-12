import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:puzzle/ui/features/games/balance_scale/balance_scale_engine.dart';

void main() {
  group('BalanceScaleEngine', () {
    late BalanceScaleEngine engine;

    setUp(() {
      engine = BalanceScaleEngine();
    });

    group('generatePuzzle', () {
      test('returns a map with equations, answer, and unitIcon', () {
        final puzzle = engine.generatePuzzle();
        expect(puzzle.containsKey('equations'), isTrue);
        expect(puzzle.containsKey('answer'), isTrue);
        expect(puzzle.containsKey('unitIcon'), isTrue);
      });

      test('has 4 equations', () {
        final puzzle = engine.generatePuzzle();
        final equations = puzzle['equations'] as List<WeightEquation>;
        expect(equations.length, 4);
      });

      test('last equation is a question', () {
        final puzzle = engine.generatePuzzle();
        final equations = puzzle['equations'] as List<WeightEquation>;
        expect(equations.last.isQuestion, isTrue);
      });

      test('first three equations are not questions', () {
        final puzzle = engine.generatePuzzle();
        final equations = puzzle['equations'] as List<WeightEquation>;
        for (int i = 0; i < 3; i++) {
          expect(equations[i].isQuestion, isFalse);
        }
      });

      test('answer is a positive integer', () {
        final puzzle = engine.generatePuzzle();
        expect(puzzle['answer'], isA<int>());
        expect(puzzle['answer'], greaterThan(0));
      });

      test('all 4 equations use 4 different icons', () {
        final puzzle = engine.generatePuzzle();
        final equations = puzzle['equations'] as List<WeightEquation>;
        final icons = <dynamic>{};
        for (final eq in equations) {
          icons.addAll(eq.left.keys);
          icons.addAll(eq.right.keys);
        }
        expect(icons.length, 4);
      });

      test('equations use icons from allIcons list', () {
        final puzzle = engine.generatePuzzle();
        final equations = puzzle['equations'] as List<WeightEquation>;
        for (final eq in equations) {
          for (final icon in eq.left.keys) {
            expect(engine.allIcons, contains(icon));
          }
          for (final icon in eq.right.keys) {
            expect(engine.allIcons, contains(icon));
          }
        }
      });
    });
  });

  group('WeightEquation', () {
    test('stores fields correctly', () {
      final eq = WeightEquation(
        left: {Icons.star_rounded: 3},
        right: {Icons.square_rounded: 1},
      );
      expect(eq.left.length, 1);
      expect(eq.right.length, 1);
      expect(eq.isQuestion, isFalse);
    });

    test('can be a question', () {
      final eq = WeightEquation(
        left: {},
        right: {},
        isQuestion: true,
      );
      expect(eq.isQuestion, isTrue);
    });

    test('left and right are independent maps', () {
      final left = {Icons.star_rounded: 2};
      final right = {Icons.circle_rounded: 1};
      final eq = WeightEquation(left: left, right: right);
      left[Icons.star_rounded] = 99;
      expect(eq.left[Icons.star_rounded], 2);
    });
  });
}
