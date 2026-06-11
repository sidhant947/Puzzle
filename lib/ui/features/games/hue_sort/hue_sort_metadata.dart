import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'hue_sort_screen.dart';

final hueSortMetadata = GameMetadata(
  id: 'hue_sort',
  category: 'SPATIAL',
  icon: Icons.gradient_rounded,
  color: DesignSystem.gamePurple,
  builder: (context) => HueSortScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.high,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.hueSortTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.hueSortSubtitle;
