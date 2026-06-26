import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'area_perimeter_match_screen.dart';

final areaPerimeterMatchMetadata = GameMetadata(
  id: 'area_perimeter_match',
  category: 'MATH',
  icon: Icons.aspect_ratio_rounded,
  color: DesignSystem.gameBlue,
  builder: (context) => const AreaPerimeterMatchScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.areaPerimeterMatchTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.areaPerimeterMatchSubtitle;
