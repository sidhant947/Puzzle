import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'path_intersect_screen.dart';

final pathIntersectMetadata = GameMetadata(
  id: 'path_intersect',
  category: 'SPATIAL',
  icon: Icons.alt_route_rounded,
  color: DesignSystem.gameOrange,
  builder: (context) => PathIntersectScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.pathIntersectTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.pathIntersectSubtitle;
