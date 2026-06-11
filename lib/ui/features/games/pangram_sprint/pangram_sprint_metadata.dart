import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'pangram_sprint_screen.dart';

final pangramSprintMetadata = GameMetadata(
  id: 'pangram_sprint',
  category: 'WORD',
  icon: Icons.abc_rounded,
  color: DesignSystem.gameBlue,
  builder: (context) => PangramSprintScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.pangramSprintTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.pangramSprintSubtitle;
