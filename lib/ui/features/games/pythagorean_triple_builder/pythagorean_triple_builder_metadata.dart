import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'pythagorean_triple_builder_screen.dart';

final pythagoreanTripleBuilderMetadata = GameMetadata(
  id: 'pythagorean_triple_builder',
  category: 'MATH',
  icon: Icons.change_history_rounded,
  color: DesignSystem.gameIndigo,
  builder: (context) => const PythagoreanTripleBuilderScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.high,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.pythagoreanTripleBuilderTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.pythagoreanTripleBuilderSubtitle;
