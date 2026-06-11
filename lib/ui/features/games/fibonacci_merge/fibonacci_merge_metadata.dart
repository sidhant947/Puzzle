import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'fibonacci_merge_screen.dart';

final fibonacciMergeMetadata = GameMetadata(
  id: 'fibonacci_merge',
  category: 'MATH',
  icon: Icons.merge_type_rounded,
  color: DesignSystem.gameTeal,
  builder: (context) => FibonacciMergeScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.fibonacciMergeTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.fibonacciMergeSubtitle;
