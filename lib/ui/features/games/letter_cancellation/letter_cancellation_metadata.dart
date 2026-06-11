import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'letter_cancellation_screen.dart';

final letterCancellationMetadata = GameMetadata(
  id: 'letter_cancellation',
  category: 'ATTENTION',
  icon: Icons.spellcheck_rounded,
  color: DesignSystem.gameRose,
  builder: (context) => LetterCancellationScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.low,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.letterCancellationTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.letterCancellationSubtitle('A');
