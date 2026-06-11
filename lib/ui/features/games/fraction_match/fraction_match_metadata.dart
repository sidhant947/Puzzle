import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'fraction_match_screen.dart';

final fractionMatchMetadata = GameMetadata(
  id: 'fraction_match',
  category: 'MATH',
  icon: Icons.pie_chart_rounded,
  color: DesignSystem.gamePurple,
  builder: (context) => FractionMatchScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.fractionMatchTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.fractionMatchSubtitle;
