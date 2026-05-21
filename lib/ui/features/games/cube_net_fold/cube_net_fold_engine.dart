import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../../../../utils/design_system.dart';

class CubeOption {
  final List<Color> visibleColors; // [Top, Front, Right]
  final bool isValid;

  CubeOption({
    required this.visibleColors,
    required this.isValid,
  });
}

class CubeNetFoldLevel {
  final List<Color> netColors; // Indexed 0..5: Top, Bottom, Front, Back, Right, Left
  final List<CubeOption> options;
  final int correctOptionIndex;

  CubeNetFoldLevel({
    required this.netColors,
    required this.options,
    required this.correctOptionIndex,
  });
}

class CubeNetFoldEngine {
  final math.Random _random = math.Random();

  // Basic unit colors to assign to the 6 faces
  final List<Color> _faceColors = [
    DesignSystem.gameAmber,   // 0: Top
    DesignSystem.gamePink,    // 1: Bottom
    DesignSystem.gameEmerald, // 2: Front
    DesignSystem.gameOrange,  // 3: Back
    DesignSystem.gameBlue,    // 4: Right
    DesignSystem.gamePurple,  // 5: Left
  ];

  // Helper to rotate cube state 90 degrees around X (pitch)
  List<int> _rotX(List<int> s) {
    return [s[3], s[2], s[0], s[1], s[4], s[5]];
  }

  // Helper to rotate cube state 90 degrees around Y (roll)
  List<int> _rotY(List<int> s) {
    return [s[5], s[4], s[2], s[3], s[0], s[1]];
  }

  // Helper to rotate cube state 90 degrees around Z (yaw)
  List<int> _rotZ(List<int> s) {
    return [s[0], s[1], s[5], s[4], s[2], s[3]];
  }

  // Generates all 24 valid rotational orientations of a 3D cube
  List<List<int>> _generateValidRotations() {
    List<List<int>> results = [];
    List<int> initial = [0, 1, 2, 3, 4, 5];
    
    // Simple BFS/DFS traversal to find all 24 combinations
    List<List<int>> queue = [initial];
    Set<String> seen = {initial.join(',')};

    while (queue.isNotEmpty) {
      final current = queue.removeAt(0);
      results.add(current);

      final nextStates = [
        _rotX(current),
        _rotY(current),
        _rotZ(current),
      ];

      for (final ns in nextStates) {
        final key = ns.join(',');
        if (!seen.contains(key)) {
          seen.add(key);
          queue.add(ns);
        }
      }
    }
    return results;
  }

  CubeNetFoldLevel generateLevel() {
    // 1. Shuffle face colors so every level has a different coloring
    List<Color> currentColors = List.from(_faceColors)..shuffle(_random);

    // 2. Generate all 24 valid rotations
    final validRotations = _generateValidRotations();

    // 3. Choose a random valid rotation to be the correct answer
    // For this visible viewpoint, we see faces: Top (index 0), Front (index 2), Right (index 4)
    final correctPerm = validRotations[_random.nextInt(validRotations.length)];
    final List<Color> correctVisible = [
      currentColors[correctPerm[0]],
      currentColors[correctPerm[2]],
      currentColors[correctPerm[4]],
    ];

    // 4. Generate invalid distractors
    // Distractor 1: Mirror image (chiral swap - swap Right and Left)
    List<Color> distractor1Visible = [];
    while (true) {
      final perm = validRotations[_random.nextInt(validRotations.length)];
      // Swap Right (index 4) and Left (index 5) - this is a mirror reflection
      final swappedColors = List<Color>.from(currentColors);
      final temp = swappedColors[perm[4]];
      swappedColors[perm[4]] = swappedColors[perm[5]];
      swappedColors[perm[5]] = temp;

      final visible = [
        swappedColors[perm[0]],
        swappedColors[perm[2]],
        swappedColors[perm[4]],
      ];
      
      // Ensure it is not accidentally equal to correct visible colors
      if (!_colorListsEqual(visible, correctVisible)) {
        distractor1Visible = visible;
        break;
      }
    }

    // Distractor 2: Impossible combination (put opposite faces adjacent, e.g. Top and Bottom next to each other)
    // For example, we show Top (index 0), Front (index 2), and then Bottom (index 1) in place of Right
    List<Color> distractor2Visible = [];
    while (true) {
      final perm = validRotations[_random.nextInt(validRotations.length)];
      // Put Bottom face where Right face should be
      final visible = [
        currentColors[perm[0]],
        currentColors[perm[2]],
        currentColors[perm[1]], // Impossible! Top and Bottom are opposites
      ];

      if (!_colorListsEqual(visible, correctVisible) && !_colorListsEqual(visible, distractor1Visible)) {
        distractor2Visible = visible;
        break;
      }
    }

    // 5. Package the options and shuffle them
    List<CubeOption> options = [
      CubeOption(visibleColors: correctVisible, isValid: true),
      CubeOption(visibleColors: distractor1Visible, isValid: false),
      CubeOption(visibleColors: distractor2Visible, isValid: false),
    ]..shuffle(_random);

    int correctIndex = options.indexWhere((opt) => opt.isValid);

    return CubeNetFoldLevel(
      netColors: currentColors,
      options: options,
      correctOptionIndex: correctIndex,
    );
  }

  bool _colorListsEqual(List<Color> a, List<Color> b) {
    if (a.length != b.length) return false;
    for (int i = 0; i < a.length; i++) {
      if (a[i].value != b[i].value) return false;
    }
    return true;
  }
}
