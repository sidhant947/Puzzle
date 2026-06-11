import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'conjunction_search_screen.dart';

final conjunctionSearchMetadata = GameMetadata(
  id: 'conjunction_search',
  category: 'ATTENTION',
  icon: Icons.manage_search_rounded,
  color: DesignSystem.gameGreen,
  builder: (context) => ConjunctionSearchScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.low,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.conjunctionSearchTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.conjunctionSearchSubtitle;
