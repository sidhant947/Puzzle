import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'mental_mapping_screen.dart';

final mentalMappingMetadata = GameMetadata(
  id: 'mental_mapping',
  category: 'SPATIAL',
  icon: Icons.map_rounded,
  color: DesignSystem.gameTeal,
  builder: (context) => MentalMappingScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.low,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.mentalMappingTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.mentalMappingSubtitle;
