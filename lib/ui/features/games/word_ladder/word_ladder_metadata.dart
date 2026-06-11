import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'word_ladder_screen.dart';

final wordLadderMetadata = GameMetadata(
  id: 'word_ladder',
  category: 'WORD',
  icon: Icons.format_list_numbered_rounded,
  color: DesignSystem.gameViolet,
  builder: (context) => WordLadderScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.wordLadderTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.wordLadderSubtitle;
