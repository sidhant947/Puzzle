import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'shadow_pivot_screen.dart';

final shadowPivotMetadata = GameMetadata(
  id: 'shadow_pivot',
  category: 'SPATIAL',
  icon: Icons.brightness_6_rounded,
  color: DesignSystem.gameTeal,
  builder: (context) => ShadowPivotScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.shadowPivotTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.shadowPivotSubtitle;
