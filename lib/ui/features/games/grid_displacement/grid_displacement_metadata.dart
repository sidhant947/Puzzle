import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'grid_displacement_screen.dart';

final gridDisplacementMetadata = GameMetadata(
  id: 'grid_displacement',
  category: 'MEMORY',
  icon: Icons.shuffle_rounded,
  color: DesignSystem.gameBlue,
  builder: (context) => const GridDisplacementScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.gridDisplacementTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.gridDisplacementSubtitle;
