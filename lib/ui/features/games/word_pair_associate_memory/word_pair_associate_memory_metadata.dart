import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'word_pair_associate_memory_screen.dart';

final wordPairAssociateMemoryMetadata = GameMetadata(
  id: 'word_pair_associate_memory',
  category: 'MEMORY',
  icon: Icons.sync_alt_rounded,
  color: DesignSystem.gameIndigo,
  builder: (context) => const WordPairAssociateMemoryScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.high,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.wordPairAssociateMemoryTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.wordPairAssociateMemorySubtitle;
