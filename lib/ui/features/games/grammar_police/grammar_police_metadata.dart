import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'grammar_police_screen.dart';

final grammarPoliceMetadata = GameMetadata(
  id: 'grammar_police',
  category: 'WORD',
  icon: Icons.spellcheck_rounded,
  color: DesignSystem.gameBlue,
  builder: (context) => GrammarPoliceScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.grammarPoliceTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.grammarPoliceSubtitle;
