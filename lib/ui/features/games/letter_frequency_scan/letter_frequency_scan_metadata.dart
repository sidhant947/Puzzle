import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'letter_frequency_scan_screen.dart';

final letterFrequencyScanMetadata = GameMetadata(
  id: 'letter_frequency_scan',
  category: 'WORD',
  icon: Icons.analytics_rounded,
  color: DesignSystem.gamePurple,
  builder: (context) => LetterFrequencyScanScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.letterFrequencyScanTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.letterFrequencyScanSubtitle;
