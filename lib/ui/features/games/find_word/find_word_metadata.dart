import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'find_word_screen.dart';

final findWordMetadata = GameMetadata(
  id: 'find_word',
  category: 'WORD',
  icon: Icons.abc_rounded,
  color: DesignSystem.gameGreen,
  builder: (context) => FindWordScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.findWordTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.findWordSubtitle(5, 5);
