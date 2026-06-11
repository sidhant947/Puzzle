import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'prime_hunter_screen.dart';

final primeHunterMetadata = GameMetadata(
  id: 'prime_hunter',
  category: 'MATH',
  icon: Icons.gps_fixed_rounded,
  color: DesignSystem.gameBlue,
  builder: (context) => PrimeHunterScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.primeHunterTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.primeHunterSubtitle;
