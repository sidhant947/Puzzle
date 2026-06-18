import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'countdown_math_screen.dart';

final countdownMathMetadata = GameMetadata(
  id: 'countdown_math',
  category: 'MATH',
  icon: Icons.calculate_rounded,
  color: DesignSystem.gameOrange,
  builder: (context) => const CountdownMathScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.countdownMathTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.countdownMathSubtitle;
