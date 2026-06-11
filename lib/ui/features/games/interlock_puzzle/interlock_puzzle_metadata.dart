import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'interlock_puzzle_screen.dart';

final interlockPuzzleMetadata = GameMetadata(
  id: 'interlock_puzzle',
  category: 'SPATIAL',
  icon: Icons.extension_rounded,
  color: DesignSystem.gameBlue,
  builder: (context) => InterlockPuzzleScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.interlockPuzzleTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.interlockPuzzleSubtitle;
