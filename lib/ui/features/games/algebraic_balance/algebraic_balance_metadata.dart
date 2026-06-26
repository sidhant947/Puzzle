import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'algebraic_balance_screen.dart';

final algebraicBalanceMetadata = GameMetadata(
  id: 'algebraic_balance',
  category: 'MATH',
  icon: Icons.scale_rounded,
  color: DesignSystem.gameOrange,
  builder: (context) => const AlgebraicBalanceScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.algebraicBalanceTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.algebraicBalanceSubtitle;
