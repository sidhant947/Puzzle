import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'digit_swap_eq_screen.dart';

final digitSwapEqMetadata = GameMetadata(
  id: 'digit_swap_eq',
  category: 'MATH',
  icon: Icons.swap_horiz_rounded,
  color: DesignSystem.gameBlue,
  builder: (context) => const DigitSwapEqScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.digitSwapEqTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.digitSwapEqSubtitle;
