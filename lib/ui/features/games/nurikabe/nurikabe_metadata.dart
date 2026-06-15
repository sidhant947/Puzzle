import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'nurikabe_screen.dart';

final nurikabeMetadata = GameMetadata(
  id: 'nurikabe',
  category: 'LOGIC',
  icon: Icons.landscape_rounded,
  color: DesignSystem.gameTeal,
  builder: (context) => NurikabeScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.low,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.nurikabeTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.nurikabeSubtitle;
