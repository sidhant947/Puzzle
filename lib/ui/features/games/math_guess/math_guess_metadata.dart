import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'math_guess_screen.dart';

final mathGuessMetadata = GameMetadata(
  id: 'math_guess',
  category: 'MATH',
  icon: Icons.question_mark_rounded,
  color: DesignSystem.gameIndigo,
  builder: (context) => MathGuessScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.high,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.mathGuessTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.mathGuessSubtitle;
