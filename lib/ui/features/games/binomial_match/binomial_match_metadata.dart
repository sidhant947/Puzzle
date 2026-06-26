import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'binomial_match_screen.dart';

final binomialMatchMetadata = GameMetadata(
  id: 'binomial_match',
  category: 'MATH',
  icon: Icons.calculate_rounded,
  color: DesignSystem.gameBlue,
  builder: (context) => const BinomialMatchScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.binomialMatchTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.binomialMatchSubtitle;
