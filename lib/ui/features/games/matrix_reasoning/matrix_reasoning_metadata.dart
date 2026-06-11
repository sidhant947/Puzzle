import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'matrix_reasoning_screen.dart';

final matrixReasoningMetadata = GameMetadata(
  id: 'matrix_reasoning',
  category: 'LOGIC',
  icon: Icons.grid_view_rounded,
  color: DesignSystem.gameAmber,
  builder: (context) => MatrixReasoningScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.matrixReasoningTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.matrixReasoningSubtitle;
