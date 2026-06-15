import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'word_scramble_screen.dart';

final wordScrambleMetadata = GameMetadata(
  id: 'word_scramble',
  category: 'WORD',
  icon: Icons.shuffle_rounded,
  color: DesignSystem.gameAmber,
  builder: (context) => WordScrambleScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.low,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.wordScrambleTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.wordScrambleSubtitle;
