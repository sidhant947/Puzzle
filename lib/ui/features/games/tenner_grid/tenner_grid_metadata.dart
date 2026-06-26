import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'tenner_grid_screen.dart';

final tennerGridMetadata = GameMetadata(
  id: 'tenner_grid',
  category: 'LOGIC',
  icon: Icons.grid_4x4_rounded,
  color: DesignSystem.gameBlue,
  builder: (context) => const TennerGridScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.tennerGridTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.tennerGridSubtitle;
