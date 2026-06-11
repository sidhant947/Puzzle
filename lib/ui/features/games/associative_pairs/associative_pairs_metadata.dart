import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'associative_pairs_screen.dart';

final associativePairsMetadata = GameMetadata(
  id: 'associative_pairs',
  category: 'MEMORY',
  icon: Icons.join_inner_rounded,
  color: DesignSystem.gamePurple,
  builder: (context) => AssociativePairsScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.associativePairsTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.associativePairsSubtitle;
