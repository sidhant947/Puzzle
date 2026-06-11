import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'word_surge_screen.dart';

final wordSurgeMetadata = GameMetadata(
  id: 'word_surge',
  category: 'WORD',
  icon: Icons.trending_up_rounded,
  color: DesignSystem.gameIndigo,
  builder: (context) => WordSurgeScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.low,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.wordSurgeTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.wordSurgeSubtitle;
