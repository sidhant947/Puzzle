import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'factor_finder_screen.dart';

final factorFinderMetadata = GameMetadata(
  id: 'factor_finder',
  category: 'MATH',
  icon: Icons.grid_3x3_rounded,
  color: DesignSystem.gameGreen,
  builder: (context) => FactorFinderScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.factorFinderTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.factorFinderSubtitle;
