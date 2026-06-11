import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'sentence_unscramble_screen.dart';

final sentenceUnscrambleMetadata = GameMetadata(
  id: 'sentence_unscramble',
  category: 'WORD',
  icon: Icons.reorder_rounded,
  color: DesignSystem.gameBlue,
  builder: (context) => SentenceUnscrambleScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.sentenceUnscrambleTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.sentenceUnscrambleSubtitle;
