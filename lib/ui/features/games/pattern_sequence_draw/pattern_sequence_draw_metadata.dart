import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'pattern_sequence_draw_screen.dart';

final patternSequenceDrawMetadata = GameMetadata(
  id: 'pattern_sequence_draw',
  category: 'MEMORY',
  icon: Icons.gesture_rounded,
  color: DesignSystem.gameIndigo,
  builder: (context) => const PatternSequenceDrawScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.patternSequenceDrawTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.patternSequenceDrawSubtitle;
