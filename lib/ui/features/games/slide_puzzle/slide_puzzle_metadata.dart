import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'slide_puzzle_screen.dart';

final slidePuzzleMetadata = GameMetadata(
  id: 'slide_puzzle',
  category: 'SPATIAL',
  icon: Icons.grid_view_rounded,
  color: DesignSystem.gameRose,
  builder: (context) => SlidePuzzleScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.high,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.slidePuzzleTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.slidePuzzleSubtitle;
