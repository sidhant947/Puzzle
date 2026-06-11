import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'tents_and_trees_screen.dart';

final tentsAndTreesMetadata = GameMetadata(
  id: 'tents_and_trees',
  category: 'LOGIC',
  icon: Icons.park_rounded,
  color: DesignSystem.gameGreen,
  builder: (context) => TentsAndTreesScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.high,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.tentsAndTreesTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.tentsAndTreesSubtitle;
