import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'graph_coordinate_plot_screen.dart';

final graphCoordinatePlotMetadata = GameMetadata(
  id: 'graph_coordinate_plot',
  category: 'MATH',
  icon: Icons.show_chart_rounded,
  color: DesignSystem.gameBlue,
  builder: (context) => const GraphCoordinatePlotScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.graphCoordinatePlotTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.graphCoordinatePlotSubtitle;
