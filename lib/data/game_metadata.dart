import 'package:flutter/material.dart';

enum Popularity { high, default_, low }

class GameMetadata {
  final String id;
  final String category;
  final IconData icon;
  final Color color;
  final WidgetBuilder builder;
  final String Function(BuildContext) titleGetter;
  final String Function(BuildContext) subtitleGetter;
  final Popularity popularity;

  const GameMetadata({
    required this.id,
    required this.category,
    required this.icon,
    required this.color,
    required this.builder,
    required this.titleGetter,
    required this.subtitleGetter,
    this.popularity = Popularity.default_,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'category': category,
        'icon': icon,
        'color': color,
        'builder': builder,
        'titleGetter': titleGetter,
        'subtitleGetter': subtitleGetter,
        'popularity': popularity,
      };
}
