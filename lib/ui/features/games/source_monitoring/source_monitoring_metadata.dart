import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'source_monitoring_screen.dart';

final sourceMonitoringMetadata = GameMetadata(
  id: 'source_monitoring',
  category: 'MEMORY',
  icon: Icons.source_rounded,
  color: DesignSystem.gameTeal,
  builder: (context) => SourceMonitoringScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.sourceMonitoringTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.sourceMonitoringSubtitle;
