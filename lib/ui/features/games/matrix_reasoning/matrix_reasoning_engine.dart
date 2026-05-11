import 'dart:math';
import 'package:flutter/material.dart';

class MatrixReasoningEngine {
  final Random _random = Random();

  MatrixReasoningPuzzle generatePuzzle() {
    final int ruleType = _random.nextInt(3); // 0: Shape, 1: Color, 2: Both
    final List<IconData> shapes = [Icons.circle, Icons.square, Icons.change_history, Icons.star, Icons.pentagon, Icons.favorite];
    final List<Color> colors = [Colors.red, Colors.blue, Colors.green, Colors.orange, Colors.purple, Colors.teal];

    shapes.shuffle(_random);
    colors.shuffle(_random);

    final List<MatrixCell> cells = List.generate(9, (index) => MatrixCell(shape: shapes[0], color: colors[0]));

    final int correctIdx = 8; // Always missing the last one for consistency
    late MatrixCell answer;

    if (ruleType == 0) {
      // Shape progression (Row based: A, B, C | A, B, C | A, B, ?)
      for (int i = 0; i < 9; i++) {
        cells[i] = MatrixCell(shape: shapes[i % 3], color: colors[0]);
      }
      answer = MatrixCell(shape: shapes[2], color: colors[0]);
    } else if (ruleType == 1) {
      // Color progression (Column based: A, A, A | B, B, B | C, C, ?)
      for (int i = 0; i < 9; i++) {
        cells[i] = MatrixCell(shape: shapes[0], color: colors[i ~/ 3]);
      }
      answer = MatrixCell(shape: shapes[0], color: colors[2]);
    } else {
      // Both (Row shape, Column color)
      for (int i = 0; i < 9; i++) {
        cells[i] = MatrixCell(shape: shapes[i % 3], color: colors[i ~/ 3]);
      }
      answer = MatrixCell(shape: shapes[2], color: colors[2]);
    }

    final List<MatrixCell> options = [answer];
    while (options.length < 4) {
      final wrong = MatrixCell(
        shape: shapes[_random.nextInt(shapes.length)],
        color: colors[_random.nextInt(colors.length)],
      );
      if (!options.any((o) => o.shape == wrong.shape && o.color == wrong.color)) {
        options.add(wrong);
      }
    }
    options.shuffle(_random);

    return MatrixReasoningPuzzle(
      cells: cells,
      answer: answer,
      options: options,
      missingIndex: correctIdx,
    );
  }
}

class MatrixCell {
  final IconData shape;
  final Color color;

  MatrixCell({required this.shape, required this.color});
}

class MatrixReasoningPuzzle {
  final List<MatrixCell> cells;
  final MatrixCell answer;
  final List<MatrixCell> options;
  final int missingIndex;

  MatrixReasoningPuzzle({
    required this.cells,
    required this.answer,
    required this.options,
    required this.missingIndex,
  });
}
