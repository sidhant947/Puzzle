import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'distractor_matrix_screen.dart';

final distractorMatrixMetadata = GameMetadata(
  id: 'distractor_matrix',
  category: 'MEMORY',
  icon: Icons.grid_off_rounded,
  color: DesignSystem.gameIndigo,
  builder: (context) => DistractorMatrixScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.low,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.distractorMatrixTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.distractorMatrixSubtitle;
