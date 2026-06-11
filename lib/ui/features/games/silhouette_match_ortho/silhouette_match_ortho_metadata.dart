import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'silhouette_match_ortho_screen.dart';

final silhouetteMatchOrthoMetadata = GameMetadata(
  id: 'silhouette_match_ortho',
  category: 'SPATIAL',
  icon: Icons.view_in_ar_rounded,
  color: DesignSystem.gameGreen,
  builder: (context) => SilhouetteMatchOrthoScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.low,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.silhouetteMatchOrthoTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.silhouetteMatchOrthoSubtitle;
