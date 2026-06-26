import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'triplets_logic_screen.dart';

final tripletsLogicMetadata = GameMetadata(
  id: 'triplets_logic',
  category: 'LOGIC',
  icon: Icons.insights_rounded,
  color: DesignSystem.gameBlue,
  builder: (context) => const TripletsLogicScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.tripletsLogicTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.tripletsLogicSubtitle;
