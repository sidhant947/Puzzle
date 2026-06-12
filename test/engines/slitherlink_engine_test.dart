import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/slitherlink/slitherlink_engine.dart';

void main() {
  group('SlitherlinkEngine', () {
    late SlitherlinkEngine engine;

    setUp(() {
      engine = SlitherlinkEngine();
    });

    group('generateLevel', () {
      test('returns a SlitherlinkLevel', () {
        final level = engine.generateLevel(size: 3);
        expect(level, isA<SlitherlinkLevel>());
      });

      test('level has correct size', () {
        final level = engine.generateLevel(size: 3);
        expect(level.size, 3);
      });

      test('clues grid matches size', () {
        final level = engine.generateLevel(size: 3);
        expect(level.clues.length, 3);
        for (final row in level.clues) {
          expect(row.length, 3);
        }
      });

      test('hEdges dimensions are (size+1) x size', () {
        final level = engine.generateLevel(size: 3);
        expect(level.solutionHEdges.length, 4);
        for (final row in level.solutionHEdges) {
          expect(row.length, 3);
        }
      });

      test('vEdges dimensions are size x (size+1)', () {
        final level = engine.generateLevel(size: 3);
        expect(level.solutionVEdges.length, 3);
        for (final row in level.solutionVEdges) {
          expect(row.length, 4);
        }
      });

      test('generated level forms a valid single loop', () {
        final level = engine.generateLevel(size: 3);
        expect(engine.isValidSingleLoop(3, level.solutionHEdges, level.solutionVEdges), isTrue);
      });

      test('clue values are between 0 and 4', () {
        final level = engine.generateLevel(size: 3);
        for (final row in level.clues) {
          for (final clue in row) {
            if (clue != null) {
              expect(clue, inInclusiveRange(0, 4));
            }
          }
        }
      });
    });

    group('isValidSingleLoop', () {
      test('returns false for empty edges (no active edges)', () {
        final hEdges = List.generate(4, (_) => List.filled(3, false));
        final vEdges = List.generate(3, (_) => List.filled(4, false));
        expect(engine.isValidSingleLoop(3, hEdges, vEdges), isFalse);
      });

      test('returns true for a simple rectangular loop', () {
        // 2x2 grid: loop around top-left cell (0,0)
        final hEdges = [
          [true, false],   // row 0 top of cell (0,0)
          [true, false],   // row 1 bottom of cell (0,0)
          [false, false],  // row 2
        ];
        final vEdges = [
          [true, true, false],  // row 0: left + right of cell (0,0)
          [false, false, false], // row 1
        ];
        expect(engine.isValidSingleLoop(2, hEdges, vEdges), isTrue);
      });

      test('returns false when a vertex has degree 1', () {
        // Create a path (not a loop) - one edge connecting two vertices
        final hEdges = [
          [false, false],
          [false, false],
        ];
        final vEdges = [
          [true, false, false],
          [false, false, false],
        ];
        expect(engine.isValidSingleLoop(1, hEdges, vEdges), isFalse);
      });

      test('returns true for a single-cell loop', () {
        // 1x1 grid: loop around the single cell
        final hEdges = [
          [true],
          [true],
        ];
        final vEdges = [
          [true, true],
        ];
        expect(engine.isValidSingleLoop(1, hEdges, vEdges), isTrue);
      });
    });
  });
}
