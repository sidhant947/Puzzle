import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'n_back_screen.dart';

final nBackMetadata = GameMetadata(
  id: 'n_back',
  category: 'MEMORY',
  icon: Icons.psychology_rounded,
  color: DesignSystem.gameBlue,
  builder: (context) => NBackScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.low,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.nBackTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.nBackSubtitle;
