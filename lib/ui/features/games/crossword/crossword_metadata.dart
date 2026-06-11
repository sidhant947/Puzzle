import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'crossword_screen.dart';

final crosswordMetadata = GameMetadata(
  id: 'crossword',
  category: 'WORD',
  icon: Icons.grid_on_rounded,
  color: DesignSystem.gamePurple,
  builder: (context) => CrosswordScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.high,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.crosswordTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.crosswordSubtitle;
