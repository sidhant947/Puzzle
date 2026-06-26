import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'maze_nav_3d_screen.dart';

final mazeNav3DMetadata = GameMetadata(
  id: 'maze_nav_3d',
  category: 'SPATIAL',
  icon: Icons.explore_rounded,
  color: DesignSystem.gameBlue,
  builder: (context) => const MazeNav3DScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.mazeNav3DTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.mazeNav3DSubtitle;
