import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'trail_making_screen.dart';

final trailMakingMetadata = GameMetadata(
  id: 'trail_making',
  category: 'ATTENTION',
  icon: Icons.timeline_rounded,
  color: DesignSystem.gameGreen,
  builder: (context) => TrailMakingScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.low,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.trailMakingTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.trailMakingSubtitle;
