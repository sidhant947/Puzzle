import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'spatial_conflict_screen.dart';

final spatialConflictMetadata = GameMetadata(
  id: 'spatial_conflict',
  category: 'ATTENTION',
  icon: Icons.swap_horizontal_circle_rounded,
  color: DesignSystem.gameAmber,
  builder: (context) => SpatialConflictScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.low,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.spatialConflictTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.spatialConflictSubtitle;
