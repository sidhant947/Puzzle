import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'dynamic_salience_screen.dart';

final dynamicSalienceMetadata = GameMetadata(
  id: 'dynamic_salience',
  category: 'ATTENTION',
  icon: Icons.wb_sunny_rounded,
  color: DesignSystem.gameBlue,
  builder: (context) => const DynamicSalienceScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.dynamicSalienceTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.dynamicSalienceSubtitle;
