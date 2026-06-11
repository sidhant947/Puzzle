import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'grammar_sort_screen.dart';

final grammarSortMetadata = GameMetadata(
  id: 'grammar_sort',
  category: 'WORD',
  icon: Icons.rule_folder_rounded,
  color: DesignSystem.gameGreen,
  builder: (context) => GrammarSortScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.grammarSortTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.grammarSortSubtitle;
