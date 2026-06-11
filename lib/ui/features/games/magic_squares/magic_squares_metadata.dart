import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'magic_squares_screen.dart';

final magicSquaresMetadata = GameMetadata(
  id: 'magic_squares',
  category: 'MATH',
  icon: Icons.grid_3x3_rounded,
  color: DesignSystem.gamePurple,
  builder: (context) => MagicSquaresScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.high,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.magicSquaresTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.magicSquaresSubtitle(15);
