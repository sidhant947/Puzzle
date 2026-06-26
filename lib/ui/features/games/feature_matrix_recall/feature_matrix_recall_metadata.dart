import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'feature_matrix_recall_screen.dart';

final featureMatrixRecallMetadata = GameMetadata(
  id: 'feature_matrix_recall',
  category: 'MEMORY',
  icon: Icons.table_chart_rounded,
  color: DesignSystem.gameBlue,
  builder: (context) => const FeatureMatrixRecallScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.featureMatrixRecallTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.featureMatrixRecallSubtitle;
