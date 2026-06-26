import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'gear_rotation_screen.dart';

final gearRotationMetadata = GameMetadata(
  id: 'gear_rotation',
  category: 'SPATIAL',
  icon: Icons.settings_rounded,
  color: DesignSystem.gameTeal,
  builder: (context) => const GearRotationScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.gearRotationTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.gearRotationSubtitle;
