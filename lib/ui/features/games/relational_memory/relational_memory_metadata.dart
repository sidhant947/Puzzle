import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'relational_memory_screen.dart';

final relationalMemoryMetadata = GameMetadata(
  id: 'relational_memory',
  category: 'MEMORY',
  icon: Icons.location_on_rounded,
  color: DesignSystem.gameTeal,
  builder: (context) => RelationalMemoryScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.low,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.relationalMemoryTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.relationalMemorySubtitle;
