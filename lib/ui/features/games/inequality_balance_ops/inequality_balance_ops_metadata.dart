import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'inequality_balance_ops_screen.dart';

final inequalityBalanceOpsMetadata = GameMetadata(
  id: 'inequality_balance_ops',
  category: 'MATH',
  icon: Icons.compare_arrows_rounded,
  color: DesignSystem.gameBlue,
  builder: (context) => const InequalityBalanceOpsScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.inequalityBalanceOpsTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.inequalityBalanceOpsSubtitle;
