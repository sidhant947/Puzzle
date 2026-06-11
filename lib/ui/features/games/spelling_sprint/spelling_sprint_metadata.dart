import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'spelling_sprint_screen.dart';

final spellingSprintMetadata = GameMetadata(
  id: 'spelling_sprint',
  category: 'WORD',
  icon: Icons.speed_rounded,
  color: DesignSystem.gameAmber,
  builder: (context) => SpellingSprintScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.spellingSprintTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.spellingSprintSubtitle;
