import 'dart:math';
import 'package:flutter/material.dart';

class RotationOption {
  final double rotation;
  final bool isMirrored;
  final bool isTarget;

  RotationOption({required this.rotation, this.isMirrored = false, this.isTarget = false});
}

class OddRotationEngine {
  // Use shapes that are asymmetrical so that mirroring is distinguishable from rotation.
  final List<IconData> complexShapes = [
    Icons.architecture_rounded,
    Icons.extension_rounded,
    Icons.interests_rounded,
    Icons.category_rounded,
    Icons.handyman_rounded,
    Icons.psychology_rounded,
    Icons.science_rounded,
    Icons.theater_comedy_rounded,
    Icons.ac_unit_rounded, // While symmetrical, it's complex enough that mirroring might be hard, so maybe avoid.
    Icons.agriculture_rounded,
    Icons.airplanemode_active_rounded,
    Icons.anchor_rounded,
  ];

  Map<String, dynamic> generatePuzzle() {
    final random = Random();
    
    // Curated list of definitely asymmetrical icons
    final asymmetricalIcons = [
      Icons.architecture_rounded,
      Icons.extension_rounded,
      Icons.handyman_rounded,
      Icons.psychology_rounded,
      Icons.science_rounded,
      Icons.agriculture_rounded,
      Icons.airplanemode_active_rounded,
      Icons.anchor_rounded,
      Icons.build_rounded,
      Icons.carpenter_rounded,
      Icons.delivery_dining_rounded,
      Icons.directions_bike_rounded,
      Icons.local_shipping_rounded,
      Icons.sailing_rounded,
    ];

    final shape = asymmetricalIcons[random.nextInt(asymmetricalIcons.length)];
    
    int targetIndex = random.nextInt(4);
    
    // To make it solvable, we need to ensure that for any rotation of the normal shape,
    // it doesn't look identical to the mirrored shape at some other rotation.
    // However, with truly asymmetrical shapes, this is generally guaranteed.
    // We also want to avoid very small rotation differences between options.
    
    double baseRotation = random.nextDouble() * 2 * pi;
    
    List<RotationOption> options = List.generate(4, (index) {
      // Each option gets a significantly different rotation to avoid ambiguity
      // and make it about the mirroring, not pixel-perfect rotation matching.
      double rotation = (baseRotation + (index * pi / 2) + (random.nextDouble() * pi / 4)) % (2 * pi);
      
      if (index == targetIndex) {
        return RotationOption(
          rotation: rotation,
          isMirrored: true,
          isTarget: true,
        );
      } else {
        return RotationOption(
          rotation: rotation,
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
