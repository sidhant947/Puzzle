import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'pipes_screen.dart';

final pipesMetadata = GameMetadata(
  id: 'pipes',
  category: 'LOGIC',
  icon: Icons.hub_rounded,
  color: DesignSystem.gameTeal,
  builder: (context) => PipesScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.high,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.pipesTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.pipesSubtitle;
