import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'matrix_multiplier_screen.dart';

final matrixMultiplierMetadata = GameMetadata(
  id: 'matrix_multiplier',
  category: 'MATH',
  icon: Icons.grid_view_rounded,
  color: DesignSystem.gameOrange,
  builder: (context) => const MatrixMultiplierScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.matrixMultiplierTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.matrixMultiplierSubtitle;
