import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'venn_numbers_screen.dart';

final vennNumbersMetadata = GameMetadata(
  id: 'venn_numbers',
  category: 'MATH',
  icon: Icons.vignette_rounded,
  color: DesignSystem.gamePurple,
  builder: (context) => VennNumbersScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.vennNumbersTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.vennNumbersSubtitle;
