import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'classic_maze_screen.dart';

final classicMazeMetadata = GameMetadata(
  id: 'classic_maze',
  category: 'SPATIAL',
  icon: Icons.grid_goldenratio_rounded,
  color: DesignSystem.gameEmerald,
  builder: (context) => ClassicMazeScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.classicMazeTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.classicMazeSubtitle;
