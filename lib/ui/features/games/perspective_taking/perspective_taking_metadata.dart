import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'perspective_taking_screen.dart';

final perspectiveTakingMetadata = GameMetadata(
  id: 'perspective_taking',
  category: 'SPATIAL',
  icon: Icons.view_in_ar_rounded,
  color: DesignSystem.gamePurple,
  builder: (context) => PerspectiveTakingScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.low,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.perspectiveTakingTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.perspectiveTakingSubtitle('North');
