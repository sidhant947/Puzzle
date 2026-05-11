import 'dart:math';
import 'package:flutter/material.dart';

class FaceData {
  final IconData icon;
  final Color color;
  final String name;

  FaceData({required this.icon, required this.color, required this.name});
}

class FaceNameAssociationEngine {
  final Random _random = Random();

  final List<IconData> _icons = [
    Icons.face,
    Icons.face_retouching_natural,
    Icons.face_retouching_off,
    Icons.sentiment_satisfied,
    Icons.sentiment_very_satisfied,
    Icons.mood,
    Icons.person,
    Icons.account_circle,
    Icons.child_care,
    Icons.emoji_emotions,
    Icons.tag_faces,
    Icons.portrait,
  ];

  final List<Color> _colors = [
    Colors.red[100]!,
    Colors.blue[100]!,
    Colors.green[100]!,
    Colors.yellow[100]!,
    Colors.purple[100]!,
    Colors.orange[100]!,
    Colors.teal[100]!,
    Colors.pink[100]!,
    Colors.cyan[100]!,
    Colors.amber[100]!,
    Colors.indigo[100]!,
    Colors.lime[100]!,
  ];

  final List<String> _names = [
    'Alice', 'Bob', 'Charlie', 'Diana', 'Edward', 'Fiona',
    'George', 'Hannah', 'Isaac', 'Julia', 'Kevin', 'Laura',
    'Michael', 'Nina', 'Oscar', 'Paula', 'Quentin', 'Rose',
    'Steve', 'Tara', 'Victor', 'Wendy', 'Xander', 'Yvonne'
  ];

  List<FaceData> generateFaces(int count) {
    List<IconData> shuffledIcons = List.from(_icons)..shuffle(_random);
    List<Color> shuffledColors = List.from(_colors)..shuffle(_random);
    List<String> shuffledNames = List.from(_names)..shuffle(_random);

    return List.generate(count, (i) {
      return FaceData(
        icon: shuffledIcons[i % shuffledIcons.length],
        color: shuffledColors[i % shuffledColors.length],
        name: shuffledNames[i % shuffledNames.length],
      );
    });
  }

  List<String> generateOptions(String correctName, List<String> allNames, int count) {
    List<String> options = [correctName];
    List<String> otherNames = allNames.where((name) => name != correctName).toList();
    otherNames.shuffle(_random);
    options.addAll(otherNames.take(count - 1));
    options.shuffle(_random);
    return options;
  }
}
