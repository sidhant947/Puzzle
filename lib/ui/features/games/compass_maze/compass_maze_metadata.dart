import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'compass_maze_screen.dart';

final compassMazeMetadata = GameMetadata(
  id: 'compass_maze',
  category: 'SPATIAL',
  icon: Icons.explore_rounded,
  color: DesignSystem.gameGreen,
  builder: (context) => CompassMazeScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.compassMazeTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.compassMazeSubtitle;
