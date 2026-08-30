import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'visual_search_conjunction_screen.dart';

final visualSearchConjunctionMetadata = GameMetadata(
  id: 'visual_search_conjunction',
  category: 'ATTENTION',
  icon: Icons.manage_search_rounded,
  color: DesignSystem.gameRose,
  builder: (context) => const VisualSearchConjunctionScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.high,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.visualSearchConjunctionTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.visualSearchConjunctionSubtitle;
