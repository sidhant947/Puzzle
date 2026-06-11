import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'path_finder_screen.dart';

final pathFinderMetadata = GameMetadata(
  id: 'path_finder',
  category: 'LOGIC',
  icon: Icons.route_rounded,
  color: DesignSystem.gameTeal,
  builder: (context) => PathFinderScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.pathFinderTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.pathFinderSubtitle;
