import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'mental_rotation_screen.dart';

final mentalRotationMetadata = GameMetadata(
  id: 'mental_rotation',
  category: 'SPATIAL',
  icon: Icons.threed_rotation_rounded,
  color: DesignSystem.gameIndigo,
  builder: (context) => MentalRotationScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.mentalRotationTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.mentalRotationSubtitle;
