import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'quick_math_screen.dart';

final quickMathMetadata = GameMetadata(
  id: 'quick_math',
  category: 'MATH',
  icon: Icons.bolt_rounded,
  color: DesignSystem.gameAmber,
  builder: (context) => QuickMathScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.high,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.quickMathTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.quickMathSubtitle;
