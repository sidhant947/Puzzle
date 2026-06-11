import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'mental_abacus_screen.dart';

final mentalAbacusMetadata = GameMetadata(
  id: 'mental_abacus',
  category: 'MATH',
  icon: Icons.grid_4x4_rounded,
  color: DesignSystem.gameAmber,
  builder: (context) => MentalAbacusScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.low,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.mentalAbacusTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.mentalAbacusSubtitle;
