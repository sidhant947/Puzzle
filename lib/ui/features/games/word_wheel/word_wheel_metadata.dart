import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'word_wheel_screen.dart';

final wordWheelMetadata = GameMetadata(
  id: 'word_wheel',
  category: 'WORD',
  icon: Icons.donut_large_rounded,
  color: DesignSystem.gamePink,
  builder: (context) => const WordWheelScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.wordWheelTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.wordWheelSubtitle;
