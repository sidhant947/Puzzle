import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'chain_reaction_screen.dart';

final chainReactionMetadata = GameMetadata(
  id: 'chain_reaction',
  category: 'WORD',
  icon: Icons.cable_rounded,
  color: DesignSystem.gameGreen,
  builder: (context) => ChainReactionScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.chainReactionTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.chainReactionSubtitle;
