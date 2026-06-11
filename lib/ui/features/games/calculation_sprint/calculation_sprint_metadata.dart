import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'calculation_sprint_screen.dart';

final calculationSprintMetadata = GameMetadata(
  id: 'calculation_sprint',
  category: 'MATH',
  icon: Icons.calculate_rounded,
  color: DesignSystem.gameEmerald,
  builder: (context) => CalculationSprintScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.calculationSprintTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.calculationSprintSubtitle;
