import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'anagram_definition_screen.dart';

final anagramDefinitionMetadata = GameMetadata(
  id: 'anagram_definition',
  category: 'WORD',
  icon: Icons.find_replace_rounded,
  color: DesignSystem.gameGreen,
  builder: (context) => AnagramDefinitionScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.anagramDefinitionTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.anagramDefinitionSubtitle;
