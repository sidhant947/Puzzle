import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'visual_statistical_learning_screen.dart';

final visualStatisticalLearningMetadata = GameMetadata(
  id: 'visual_statistical_learning',
  category: 'MEMORY',
  icon: Icons.pattern_rounded,
  color: DesignSystem.gameTeal,
  builder: (context) => VisualStatisticalLearningScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.low,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.visualStatisticalLearningTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.visualStatisticalLearningSubtitle;
