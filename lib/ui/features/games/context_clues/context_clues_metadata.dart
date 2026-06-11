import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'context_clues_screen.dart';

final contextCluesMetadata = GameMetadata(
  id: 'context_clues',
  category: 'WORD',
  icon: Icons.find_in_page_rounded,
  color: DesignSystem.gameGreen,
  builder: (context) => ContextCluesScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.contextCluesTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.contextCluesSubtitle;
