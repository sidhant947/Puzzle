import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'matrix_multiplier_match_screen.dart';

final matrixMultiplierMatchMetadata = GameMetadata(
  id: 'matrix_multiplier_match',
  category: 'MATH',
  icon: Icons.grid_on_rounded,
  color: DesignSystem.gameBlue,
  builder: (context) => const MatrixMultiplierMatchScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.matrixMultiplierMatchTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.matrixMultiplierMatchSubtitle;
