import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'arithmetic_chain_screen.dart';

final arithmeticChainMetadata = GameMetadata(
  id: 'arithmetic_chain',
  category: 'MATH',
  icon: Icons.link_rounded,
  color: DesignSystem.gameBlue,
  builder: (context) => ArithmeticChainScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.arithmeticChainTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.arithmeticChainSubtitle;
