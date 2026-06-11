import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'vocabulary_builder_screen.dart';

final vocabularyBuilderMetadata = GameMetadata(
  id: 'vocabulary_builder',
  category: 'WORD',
  icon: Icons.menu_book_rounded,
  color: DesignSystem.gameGreen,
  builder: (context) => VocabularyBuilderScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.vocabularyBuilderTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.vocabularyBuilderSubtitle;
