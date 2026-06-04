import 'dart:math';
import 'package:flutter/material.dart';

class RotationOption {
  final double rotation;
  final bool isMirrored;
  final bool isTarget;

  RotationOption(
      {required this.rotation, this.isMirrored = false, this.isTarget = false});
}

class OddRotationEngine {
  Map<String, dynamic> generatePuzzle() {
    final random = Random();

    final asymmetricalIcons = [
      Icons.psychology_rounded,
      Icons.delivery_dining_rounded,
      Icons.local_shipping_rounded,
      Icons.sailing_rounded,
      Icons.flight_takeoff_rounded,
      Icons.shopping_cart_rounded,
      Icons.thumb_up_rounded,
      Icons.music_note_rounded,
      Icons.coffee_rounded,
      Icons.directions_run_rounded,
      Icons.directions_walk_rounded,
      Icons.format_paint_rounded,
      Icons.motorcycle_rounded,
      Icons.plumbing_rounded,
      Icons.two_wheeler_rounded,
      Icons.agriculture_rounded,
      Icons.ice_skating_rounded,
      Icons.kitesurfing_rounded,
      Icons.nordic_walking_rounded,
      Icons.snowboarding_rounded,
      Icons.skateboarding_rounded,
      Icons.kayaking_rounded,
      Icons.surfing_rounded,
      Icons.paragliding_rounded,
      Icons.stroller_rounded,
      Icons.hardware_rounded,
      Icons.precision_manufacturing_rounded,
      Icons.car_rental_rounded,
      Icons.construction_rounded,
      Icons.electric_moped_rounded,
      Icons.electric_rickshaw_rounded,
      Icons.electric_scooter_rounded,
      Icons.rowing_rounded,
      Icons.pedal_bike_rounded,
    ];

    final shape = asymmetricalIcons[random.nextInt(asymmetricalIcons.length)];

    int targetIndex = random.nextInt(4);

    double baseRotation = random.nextDouble() * 2 * pi;

    List<RotationOption> options = List.generate(4, (index) {
      double rotation =
          (baseRotation + (index * pi / 2) + (random.nextDouble() * pi / 4)) %
              (2 * pi);

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
