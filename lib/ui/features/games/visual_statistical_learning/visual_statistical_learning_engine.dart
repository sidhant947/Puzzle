import 'dart:math';
import 'package:flutter/material.dart';

class VisualStatisticalLearningEngine {
  final Random _random = Random();
  
  final List<IconData> _shapes = [
    Icons.favorite,
    Icons.star,
    Icons.square,
    Icons.circle,
    Icons.change_history,
    Icons.pentagon,
    Icons.hexagon,
    Icons.diamond,
    Icons.cruelty_free,
    Icons.cloud,
    Icons.sunny,
    Icons.eco,
  ];

  List<List<IconData>> generateTriplets() {
    List<IconData> shuffled = List.from(_shapes)..shuffle(_random);
    return [
      shuffled.sublist(0, 3),
      shuffled.sublist(3, 6),
      shuffled.sublist(6, 9),
      shuffled.sublist(9, 12),
    ];
  }

  List<IconData> generateLearningSequence(List<List<IconData>> triplets, int length) {
    List<IconData> sequence = [];
    for (int i = 0; i < length; i++) {
      sequence.addAll(triplets[_random.nextInt(triplets.length)]);
    }
    return sequence;
  }

  Map<String, dynamic> generateTestTrial(List<List<IconData>> triplets) {
    List<IconData> target = triplets[_random.nextInt(triplets.length)];
    
    // Generate a foil (shuffled version of icons not in a single triplet)
    List<IconData> allIcons = triplets.expand((t) => t).toList();
    allIcons.shuffle(_random);
    List<IconData> foil = allIcons.sublist(0, 3);
    
    // Ensure foil is not accidentally a triplet
    bool isLeftTarget = _random.nextBool();
    
    return {
      'left': isLeftTarget ? target : foil,
      'right': isLeftTarget ? foil : target,
      'isLeftCorrect': isLeftTarget,
    };
  }
}
