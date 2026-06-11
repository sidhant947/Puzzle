import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'roman_arithmetic_screen.dart';

final romanArithmeticMetadata = GameMetadata(
  id: 'roman_arithmetic',
  category: 'MATH',
  icon: Icons.account_balance_rounded,
  color: DesignSystem.gameOrange,
  builder: (context) => RomanArithmeticScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.romanArithmeticTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.romanArithmeticSubtitle;
