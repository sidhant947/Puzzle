import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'visual_search_screen.dart';

final visualSearchMetadata = GameMetadata(
  id: 'visual_search',
  category: 'ATTENTION',
  icon: Icons.center_focus_strong_rounded,
  color: DesignSystem.gameIndigo,
  builder: (context) => VisualSearchScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.visualSearchTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.visualSearchSubtitle;
