import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'sdmt_screen.dart';

final sdmtMetadata = GameMetadata(
  id: 'sdmt',
  category: 'ATTENTION',
  icon: Icons.fact_check_rounded,
  color: DesignSystem.gameTeal,
  builder: (context) => SDMTScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.low,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.sdmtTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.sdmtSubtitle;
