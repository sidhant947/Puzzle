import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'fraction_matcher_screen.dart';

final fractionMatcherMetadata = GameMetadata(
  id: 'fraction_matcher',
  category: 'MATH',
  icon: Icons.pie_chart_outline_rounded,
  color: DesignSystem.gameBlue,
  builder: (context) => FractionMatcherScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.fractionMatcherTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.fractionMatcherSubtitle;
