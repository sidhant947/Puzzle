import 'dart:math';
import 'package:flutter/material.dart';

class RotationOption {
  final double rotation;
  final bool isMirrored;
  final bool isTarget;

  RotationOption({required this.rotation, this.isMirrored = false, this.isTarget = false});
}

class OddRotationEngine {
  final List<IconData> complexShapes = [
    Icons.architecture_rounded,
    Icons.extension_rounded,
    Icons.interests_rounded,
    Icons.widgets_rounded,
    Icons.category_rounded,
    Icons.grid_view_rounded,
  ];

  Map<String, dynamic> generatePuzzle() {
    final random = Random();
    final shape = complexShapes[random.nextInt(complexShapes.length)];
    
    int targetIndex = random.nextInt(4);
    List<RotationOption> options = List.generate(4, (index) {
      if (index == targetIndex) {
        return RotationOption(
          rotation: random.nextDouble() * 2 * pi,
          isMirrored: true,
          isTarget: true,
        );
      } else {
        return RotationOption(
          rotation: random.nextDouble() * 2 * pi,
          isMirrored: false,
        );
      }
    });

    return {
      'shape': shape,
      'options': options,
      'targetIndex': targetIndex,
    };
  }
}
