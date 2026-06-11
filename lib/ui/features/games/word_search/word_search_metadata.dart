import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'word_search_screen.dart';

final wordSearchMetadata = GameMetadata(
  id: 'word_search',
  category: 'WORD',
  icon: Icons.search_rounded,
  color: DesignSystem.gameOrange,
  builder: (context) => WordSearchScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.high,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.wordSearchTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.wordSearchSubtitle;
