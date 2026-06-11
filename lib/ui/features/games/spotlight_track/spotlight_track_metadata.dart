import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'spotlight_track_screen.dart';

final spotlightTrackMetadata = GameMetadata(
  id: 'spotlight_track',
  category: 'ATTENTION',
  icon: Icons.track_changes_rounded,
  color: DesignSystem.gameBlue,
  builder: (context) => SpotlightTrackScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.low,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.spotlightTrackTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.spotlightTrackSubtitle;
