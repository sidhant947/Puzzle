import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'color_match_screen.dart';

final colorMatchMetadata = GameMetadata(
  id: 'color_match',
  category: 'ATTENTION',
  icon: Icons.palette_rounded,
  color: DesignSystem.gameRose,
  builder: (context) => ColorMatchScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.colorMatchTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.colorMatchSubtitle;
