import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'staircase_memory_screen.dart';

final staircaseMemoryMetadata = GameMetadata(
  id: 'staircase_memory',
  category: 'MEMORY',
  icon: Icons.stairs_rounded,
  color: DesignSystem.gameAmber,
  builder: (context) => StaircaseMemoryScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.low,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.staircaseMemoryTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.staircaseMemorySubtitle;
