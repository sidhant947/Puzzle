import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'odd_rotation_screen.dart';

final oddRotationMetadata = GameMetadata(
  id: 'odd_rotation',
  category: 'SPATIAL',
  icon: Icons.flip_rounded,
  color: DesignSystem.gameRose,
  builder: (context) => OddRotationScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.low,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.oddRotationTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.oddRotationSubtitle;
