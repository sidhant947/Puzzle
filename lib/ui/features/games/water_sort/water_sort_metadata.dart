import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'water_sort_screen.dart';

final waterSortMetadata = GameMetadata(
  id: 'water_sort',
  category: 'LOGIC',
  icon: Icons.opacity_rounded,
  color: DesignSystem.gameBlue,
  builder: (context) => WaterSortScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.high,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.waterSortTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.waterSortSubtitle;
