import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'laser_link_screen.dart';

final laserLinkMetadata = GameMetadata(
  id: 'laser_link',
  category: 'SPATIAL',
  icon: Icons.vignette_rounded,
  color: DesignSystem.gameRose,
  builder: (context) => LaserLinkScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.laserLinkTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.laserLinkSubtitle;
