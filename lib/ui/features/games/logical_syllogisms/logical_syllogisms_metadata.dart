import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'logical_syllogisms_screen.dart';

final logicalSyllogismsMetadata = GameMetadata(
  id: 'logical_syllogisms',
  category: 'LOGIC',
  icon: Icons.account_tree_rounded,
  color: DesignSystem.gameTeal,
  builder: (context) => LogicalSyllogismsScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.logicalSyllogismsTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.logicalSyllogismsSubtitle;
