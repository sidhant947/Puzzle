import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'tangram_screen.dart';

final tangramMetadata = GameMetadata(
  id: 'tangram',
  category: 'SPATIAL',
  icon: Icons.dashboard_customize_rounded,
  color: DesignSystem.gameRose,
  builder: (context) => const TangramScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.tangramTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.tangramSubtitle;
