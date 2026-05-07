import 'dart:math';
import 'package:flutter/material.dart';
import '../../../../utils/design_system.dart';

class WaterSortEngine {
  static const int tubeCapacity = 4;
  static const int numColors = 5;
  static const int numEmptyTubes = 2;
  static const int totalTubes = numColors + numEmptyTubes;

  static const List<Color> availableColors = [
    DesignSystem.gameBlue,
    DesignSystem.gameGreen,
    DesignSystem.gamePurple,
    DesignSystem.gameOrange,
    DesignSystem.gamePink,
    DesignSystem.gameTeal,
    DesignSystem.gameAmber,
    DesignSystem.gameRose,
  ];

  final Random _random = Random();

  List<List<Color>> generateLevel() {
    List<Color> colors = [];
    for (int i = 0; i < numColors; i++) {
      for (int j = 0; j < tubeCapacity; j++) {
        colors.add(availableColors[i]);
      }
    }
    colors.shuffle(_random);

    List<List<Color>> tubes = List.generate(totalTubes, (_) => []);
    for (int i = 0; i < numColors; i++) {
      tubes[i] = colors.sublist(i * tubeCapacity, (i + 1) * tubeCapacity);
    }

    return tubes;
  }

  bool canPour(List<Color> from, List<Color> to) {
    if (from.isEmpty) return false;
    if (to.length >= tubeCapacity) return false;
    if (to.isEmpty) return true;
    return from.last == to.last;
  }

  void pour(List<Color> from, List<Color> to) {
    if (!canPour(from, to)) return;

    Color colorToPour = from.last;
    while (from.isNotEmpty && from.last == colorToPour && to.length < tubeCapacity) {
      to.add(from.removeLast());
    }
  }

  bool isSolved(List<List<Color>> tubes) {
    for (var tube in tubes) {
      if (tube.isEmpty) continue;
      if (tube.length != tubeCapacity) return false;
      Color firstColor = tube.first;
      if (tube.any((c) => c != firstColor)) return false;
    }
    return true;
  }
}
