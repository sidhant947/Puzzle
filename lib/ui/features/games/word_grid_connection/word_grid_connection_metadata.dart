import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'word_grid_connection_screen.dart';

final wordGridConnectionMetadata = GameMetadata(
  id: 'word_grid_connection',
  category: 'WORD',
  icon: Icons.grid_on_rounded,
  color: DesignSystem.gamePink,
  builder: (context) => const WordGridConnectionScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.wordGridConnectionTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.wordGridConnectionSubtitle;
