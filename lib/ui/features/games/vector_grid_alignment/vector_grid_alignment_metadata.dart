import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'vector_grid_alignment_screen.dart';

final vectorGridAlignmentMetadata = GameMetadata(
  id: 'vector_grid_alignment',
  category: 'SPATIAL',
  icon: Icons.filter_center_focus_rounded,
  color: DesignSystem.gameBlue,
  builder: (context) => const VectorGridAlignmentScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.vectorGridAlignmentTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.vectorGridAlignmentSubtitle;
