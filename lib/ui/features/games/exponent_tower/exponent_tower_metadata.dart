import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'exponent_tower_screen.dart';

final exponentTowerMetadata = GameMetadata(
  id: 'exponent_tower',
  category: 'MATH',
  icon: Icons.vertical_align_top_rounded,
  color: DesignSystem.gameIndigo,
  builder: (context) => const ExponentTowerScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.high,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.exponentTowerTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.exponentTowerSubtitle;
