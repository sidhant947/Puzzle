import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'math_maze_screen.dart';

final mathMazeMetadata = GameMetadata(
  id: 'math_maze',
  category: 'MATH',
  icon: Icons.navigation_rounded,
  color: DesignSystem.gameOrange,
  builder: (context) => const MathMazeScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.mathMazeTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.mathMazeSubtitle;
