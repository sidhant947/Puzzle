import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'shape_shifter_screen.dart';

final shapeShifterMetadata = GameMetadata(
  id: 'shape_shifter',
  category: 'ATTENTION',
  icon: Icons.track_changes_rounded,
  color: DesignSystem.gameIndigo,
  builder: (context) => const ShapeShifterScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.shapeShifterTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.shapeShifterSubtitle;
