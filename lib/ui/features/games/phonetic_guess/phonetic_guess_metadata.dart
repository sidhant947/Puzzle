import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'phonetic_guess_screen.dart';

final phoneticGuessMetadata = GameMetadata(
  id: 'phonetic_guess',
  category: 'WORD',
  icon: Icons.record_voice_over_rounded,
  color: DesignSystem.gamePurple,
  builder: (context) => PhoneticGuessScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.phoneticGuessTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.phoneticGuessSubtitle;
