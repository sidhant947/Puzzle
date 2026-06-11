import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'silhouette_match_screen.dart';

final silhouetteMatchMetadata = GameMetadata(
  id: 'silhouette_match',
  category: 'SPATIAL',
  icon: Icons.auto_fix_normal_rounded,
  color: DesignSystem.gameAmber,
  builder: (context) => SilhouetteMatchScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.silhouetteMatchTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.silhouetteMatchSubtitle;
