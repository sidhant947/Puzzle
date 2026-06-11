import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'sum_pyramid_screen.dart';

final sumPyramidMetadata = GameMetadata(
  id: 'sum_pyramid',
  category: 'MATH',
  icon: Icons.change_history_rounded,
  color: DesignSystem.gameTeal,
  builder: (context) => SumPyramidScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.sumPyramidTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.sumPyramidSubtitle;
