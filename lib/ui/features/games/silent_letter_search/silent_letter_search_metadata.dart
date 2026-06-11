import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'silent_letter_search_screen.dart';

final silentLetterSearchMetadata = GameMetadata(
  id: 'silent_letter_search',
  category: 'WORD',
  icon: Icons.volume_off_rounded,
  color: DesignSystem.gameGreen,
  builder: (context) => SilentLetterSearchScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.silentLetterSearchTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.silentLetterSearchSubtitle;
