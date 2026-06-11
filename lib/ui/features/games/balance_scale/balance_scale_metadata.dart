import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'balance_scale_screen.dart';

final balanceScaleMetadata = GameMetadata(
  id: 'balance_scale',
  category: 'MATH',
  icon: Icons.balance_rounded,
  color: DesignSystem.gameTeal,
  builder: (context) => BalanceScaleScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.balanceScaleTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.balanceScaleSubtitle;
