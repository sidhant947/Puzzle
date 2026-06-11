import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'game_2048_screen.dart';

final game_2048Metadata = GameMetadata(
  id: 'game_2048',
  category: 'MATH',
  icon: Icons.grid_view_rounded,
  color: DesignSystem.gamePink,
  builder: (context) => Game2048Screen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.high,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.game2048Title;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.game2048Subtitle;
