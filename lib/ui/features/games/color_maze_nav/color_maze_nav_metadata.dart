import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'color_maze_nav_screen.dart';

final colorMazeNavMetadata = GameMetadata(
  id: 'color_maze_nav',
  category: 'ATTENTION',
  icon: Icons.color_lens_rounded,
  color: DesignSystem.gameBlue,
  builder: (context) => const ColorMazeNavScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.colorMazeNavTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.colorMazeNavSubtitle;
