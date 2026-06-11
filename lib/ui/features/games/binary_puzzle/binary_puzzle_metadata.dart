import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'binary_puzzle_screen.dart';

final binaryPuzzleMetadata = GameMetadata(
  id: 'binary_puzzle',
  category: 'LOGIC',
  icon: Icons.exposure_zero_rounded,
  color: DesignSystem.gameBlue,
  builder: (context) => BinaryPuzzleScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.binaryPuzzleTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.binaryPuzzleSubtitle;
