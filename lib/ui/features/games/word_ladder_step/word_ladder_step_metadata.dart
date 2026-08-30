import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'word_ladder_step_screen.dart';

final wordLadderStepMetadata = GameMetadata(
  id: 'word_ladder_step',
  category: 'WORD',
  icon: Icons.stairs_rounded,
  color: DesignSystem.gameRose,
  builder: (context) => const WordLadderStepScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.high,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.wordLadderStepTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.wordLadderStepSubtitle;
