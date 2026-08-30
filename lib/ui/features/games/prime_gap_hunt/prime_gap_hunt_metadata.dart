import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'prime_gap_hunt_screen.dart';

final primeGapHuntMetadata = GameMetadata(
  id: 'prime_gap_hunt',
  category: 'MATH',
  icon: Icons.calculate_rounded,
  color: DesignSystem.gameIndigo,
  builder: (context) => const PrimeGapHuntScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.high,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.primeGapHuntTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.primeGapHuntSubtitle;
