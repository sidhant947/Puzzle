import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'paper_folding_screen.dart';

final paperFoldingMetadata = GameMetadata(
  id: 'paper_folding',
  category: 'SPATIAL',
  icon: Icons.note_rounded,
  color: DesignSystem.gameRose,
  builder: (context) => PaperFoldingScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.low,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.paperFoldingTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.paperFoldingSubtitle;
