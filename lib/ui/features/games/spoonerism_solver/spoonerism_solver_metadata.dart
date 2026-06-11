import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'spoonerism_solver_screen.dart';

final spoonerismSolverMetadata = GameMetadata(
  id: 'spoonerism_solver',
  category: 'WORD',
  icon: Icons.swap_horiz_rounded,
  color: DesignSystem.gameIndigo,
  builder: (context) => SpoonerismSolverScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.spoonerismSolverTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.spoonerismSolverSubtitle;
