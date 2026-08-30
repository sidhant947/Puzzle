import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'gear_train_direction_screen.dart';

final gearTrainDirectionMetadata = GameMetadata(
  id: 'gear_train_direction',
  category: 'SPATIAL',
  icon: Icons.settings_suggest_rounded,
  color: DesignSystem.gamePurple,
  builder: (context) => const GearTrainDirectionScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.high,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.gearTrainDirectionTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.gearTrainDirectionSubtitle;
