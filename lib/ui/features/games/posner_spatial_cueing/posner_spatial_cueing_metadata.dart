import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'posner_spatial_cueing_screen.dart';

final posnerSpatialCueingMetadata = GameMetadata(
  id: 'posner_spatial_cueing',
  category: 'ATTENTION',
  icon: Icons.track_changes_rounded,
  color: DesignSystem.gameRose,
  builder: (context) => const PosnerSpatialCueingScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.high,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.posnerSpatialCueingTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.posnerSpatialCueingSubtitle;
