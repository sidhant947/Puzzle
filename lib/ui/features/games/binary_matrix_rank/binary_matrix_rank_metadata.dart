import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'binary_matrix_rank_screen.dart';

final binaryMatrixRankMetadata = GameMetadata(
  id: 'binary_matrix_rank',
  category: 'MATH',
  icon: Icons.grid_3x3_rounded,
  color: DesignSystem.gameIndigo,
  builder: (context) => const BinaryMatrixRankScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.high,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.binaryMatrixRankTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.binaryMatrixRankSubtitle;
