import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/symbol_logic/symbol_logic_engine.dart';

void main() {
  group('SymbolLogicEngine', () {
    late SymbolLogicEngine engine;

    setUp(() {
      engine = SymbolLogicEngine();
    });

    group('generatePuzzle', () {
      test('returns map with equations and answer', () {
        final puzzle = engine.generatePuzzle();
        expect(puzzle.containsKey('equations'), isTrue);
        expect(puzzle.containsKey('answer'), isTrue);
      });

      test('equations list has 4 elements', () {
        final puzzle = engine.generatePuzzle();
        final equations = puzzle['equations'] as List<SymbolEquation>;
        expect(equations.length, 4);
      });

      test('answer is a positive integer', () {
        final puzzle = engine.generatePuzzle();
        expect(puzzle['answer'], isA<int>());
        expect(puzzle['answer'], greaterThan(0));
      });

      test('first 3 equations are not questions', () {
        final puzzle = engine.generatePuzzle();
        final equations = puzzle['equations'] as List<SymbolEquation>;
        expect(equations[0].isQuestion, isFalse);
        expect(equations[1].isQuestion, isFalse);
        expect(equations[2].isQuestion, isFalse);
      });

      test('4th equation is the question', () {
        final puzzle = engine.generatePuzzle();
        final equations = puzzle['equations'] as List<SymbolEquation>;
        expect(equations[3].isQuestion, isTrue);
      });

      test('each equation has 2 symbols and 2 coefficients', () {
        final puzzle = engine.generatePuzzle();
        final equations = puzzle['equations'] as List<SymbolEquation>;
        for (final eq in equations) {
          expect(eq.symbols.length, 2);
          expect(eq.coefficients.length, 2);
        }
      });

      test('all coefficients are 1', () {
        final puzzle = engine.generatePuzzle();
        final equations = puzzle['equations'] as List<SymbolEquation>;
        for (final eq in equations) {
          expect(eq.coefficients, [1, 1]);
        }
      });

      test('first equation result is 2x the implied value', () {
        final puzzle = engine.generatePuzzle();
        final equations = puzzle['equations'] as List<SymbolEquation>;
        final eq1 = equations[0];
        expect(eq1.result % 2, 0);
        expect(eq1.symbols[0], eq1.symbols[1]);
      });

      test('equation results are positive integers', () {
        final puzzle = engine.generatePuzzle();
        final equations = puzzle['equations'] as List<SymbolEquation>;
        for (final eq in equations) {
          expect(eq.result, greaterThan(0));
        }
      });

      test('answer is consistent with puzzle logic', () {
        final puzzle = engine.generatePuzzle();
        final equations = puzzle['equations'] as List<SymbolEquation>;
        final eq1 = equations[0];
        final eq2 = equations[1];
        final eq3 = equations[2];
        final eq4 = equations[3];

        final valA = eq1.result ~/ 2;
        final valB = eq2.result - valA;
        final valC = eq3.result - valB;

        expect(eq4.result, valA + valC);
        expect(puzzle['answer'], eq4.result);
      });

      test('symbols are from allIcons list', () {
        final puzzle = engine.generatePuzzle();
        final equations = puzzle['equations'] as List<SymbolEquation>;
        for (final eq in equations) {
          for (final symbol in eq.symbols) {
            expect(engine.allIcons, contains(symbol));
          }
        }
      });

      test('first 3 equations use exactly 3 distinct icons', () {
        final puzzle = engine.generatePuzzle();
        final equations = puzzle['equations'] as List<SymbolEquation>;
        final icons = <IconData>{};
        for (int i = 0; i < 3; i++) {
          for (final s in equations[i].symbols) {
            icons.add(s);
          }
        }
        expect(icons.length, 3);
      });
    });
  });
}
