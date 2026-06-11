import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'numerical_estimation_screen.dart';

final numericalEstimationMetadata = GameMetadata(
  id: 'numerical_estimation',
  category: 'MATH',
  icon: Icons.scatter_plot_rounded,
  color: DesignSystem.gameRose,
  builder: (context) => NumericalEstimationScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.low,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.numericalEstimationTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.numericalEstimationSubtitle;
