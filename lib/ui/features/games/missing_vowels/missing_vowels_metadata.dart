import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'missing_vowels_screen.dart';

final missingVowelsMetadata = GameMetadata(
  id: 'missing_vowels',
  category: 'WORD',
  icon: Icons.spellcheck_rounded,
  color: DesignSystem.gameBlue,
  builder: (context) => MissingVowelsScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.missingVowelsTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.missingVowelsSubtitle;
