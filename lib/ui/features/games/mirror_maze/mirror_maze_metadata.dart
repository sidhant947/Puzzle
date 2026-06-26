import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'mirror_maze_screen.dart';

final mirrorMazeMetadata = GameMetadata(
  id: 'mirror_maze',
  category: 'SPATIAL',
  icon: Icons.biotech_rounded,
  color: DesignSystem.gameTeal,
  builder: (context) => const MirrorMazeScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.mirrorMazeTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.mirrorMazeSubtitle;
