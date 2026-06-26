import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'word_snake_trail_screen.dart';

final wordSnakeTrailMetadata = GameMetadata(
  id: 'word_snake_trail',
  category: 'WORD',
  icon: Icons.gesture_rounded,
  color: DesignSystem.gameBlue,
  builder: (context) => const WordSnakeTrailScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.wordSnakeTrailTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.wordSnakeTrailSubtitle;
