import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'prime_factor_trees_screen.dart';

final primeFactorTreesMetadata = GameMetadata(
  id: 'prime_factor_trees',
  category: 'MATH',
  icon: Icons.account_tree_rounded,
  color: DesignSystem.gameBlue,
  builder: (context) => const PrimeFactorTreesScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.primeFactorTreesTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.primeFactorTreesSubtitle;
