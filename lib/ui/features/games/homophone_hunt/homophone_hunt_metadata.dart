import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'homophone_hunt_screen.dart';

final homophoneHuntMetadata = GameMetadata(
  id: 'homophone_hunt',
  category: 'WORD',
  icon: Icons.hearing_rounded,
  color: DesignSystem.gameBlue,
  builder: (context) => HomophoneHuntScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.homophoneHuntTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.homophoneHuntSubtitle;
