import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'schulte_table_screen.dart';

final schulteTableMetadata = GameMetadata(
  id: 'schulte_table',
  category: 'ATTENTION',
  icon: Icons.speed_rounded,
  color: DesignSystem.gameViolet,
  builder: (context) => SchulteTableScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.high,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.schulteTableTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.schulteTableSubtitle;
