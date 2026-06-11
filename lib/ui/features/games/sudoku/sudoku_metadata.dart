import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'sudoku_screen.dart';

final sudokuMetadata = GameMetadata(
  id: 'sudoku',
  category: 'LOGIC',
  icon: Icons.grid_4x4_rounded,
  color: DesignSystem.gameBlue,
  builder: (context) => SudokuScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.high,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.sudokuTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.sudokuSubtitle;
