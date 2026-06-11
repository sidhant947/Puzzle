import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'dual_coding_screen.dart';

final dualCodingMetadata = GameMetadata(
  id: 'dual_coding',
  category: 'MEMORY',
  icon: Icons.hearing_rounded,
  color: DesignSystem.gameRose,
  builder: (context) => DualCodingScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.low,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.dualCodingTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.dualCodingSubtitle;
