import 'dart:math';
import 'package:flutter/material.dart';

class SourceItem {
  final String word;
  final Color color;
  final String sourceName;

  SourceItem({required this.word, required this.color, required this.sourceName});
}

class SourceMonitoringLevel {
  final List<SourceItem> items;
  final List<SourceItem> questions;

  SourceMonitoringLevel({required this.items, required this.questions});
}

class SourceMonitoringEngine {
  final Random _random = Random();

  static const List<String> _words = [
    'Apple', 'Table', 'River', 'Mountain', 'Cloud', 'Spirit', 'Forest', 'Ocean', 'Desert', 'Valley',
    'Bridge', 'Street', 'Window', 'Mirror', 'Candle', 'Bottle', 'Basket', 'Ladder', 'Hammer', 'Pencil'
  ];

  static const List<Map<String, dynamic>> _sources = [
    {'name': 'RED BOX', 'color': Colors.red},
    {'name': 'BLUE BOX', 'color': Colors.blue},
    {'name': 'GREEN BOX', 'color': Colors.green},
  ];

  SourceMonitoringLevel generateLevel() {
    final shuffledWords = List<String>.from(_words)..shuffle(_random);
    final items = List.generate(4, (i) {
      final source = _sources[_random.nextInt(_sources.length)];
      return SourceItem(
        word: shuffledWords[i],
        color: source['color'],
        sourceName: source['name'],
      );
    });

    final questions = List<SourceItem>.from(items)..shuffle(_random);

    return SourceMonitoringLevel(items: items, questions: questions);
  }
}
