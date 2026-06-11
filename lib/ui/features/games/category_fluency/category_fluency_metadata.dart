import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'category_fluency_screen.dart';

final categoryFluencyMetadata = GameMetadata(
  id: 'category_fluency',
  category: 'WORD',
  icon: Icons.category_rounded,
  color: DesignSystem.gameGreen,
  builder: (context) => CategoryFluencyScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.low,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.categoryFluencyTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.categoryFluencySubtitle;
