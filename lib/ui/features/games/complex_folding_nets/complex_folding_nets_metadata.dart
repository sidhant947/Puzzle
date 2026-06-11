import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'complex_folding_nets_screen.dart';

final complexFoldingNetsMetadata = GameMetadata(
  id: 'complex_folding_nets',
  category: 'SPATIAL',
  icon: Icons.unfold_more_double_rounded,
  color: DesignSystem.gameRose,
  builder: (context) => ComplexFoldingNetsScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.complexFoldingNetsTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.complexFoldingNetsSubtitle;
