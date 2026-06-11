import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'alphabet_sudoku_screen.dart';

final alphabetSudokuMetadata = GameMetadata(
  id: 'alphabet_sudoku',
  category: 'LOGIC',
  icon: Icons.abc_rounded,
  color: DesignSystem.gameIndigo,
  builder: (context) => AlphabetSudokuScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.high,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.alphabetSudokuTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.alphabetSudokuSubtitle;
