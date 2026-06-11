import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'spatial_cabinet_memory_screen.dart';

final spatialCabinetMemoryMetadata = GameMetadata(
  id: 'spatial_cabinet_memory',
  category: 'MEMORY',
  icon: Icons.door_sliding_rounded,
  color: DesignSystem.gameCyan,
  builder: (context) => SpatialCabinetMemoryScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.low,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.spatialCabinetMemoryTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.spatialCabinetMemorySubtitle;
