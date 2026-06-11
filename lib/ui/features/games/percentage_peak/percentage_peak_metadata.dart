import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'percentage_peak_screen.dart';

final percentagePeakMetadata = GameMetadata(
  id: 'percentage_peak',
  category: 'MATH',
  icon: Icons.percent_rounded,
  color: DesignSystem.gameGreen,
  builder: (context) => PercentagePeakScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.percentagePeakTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.percentagePeakSubtitle;
