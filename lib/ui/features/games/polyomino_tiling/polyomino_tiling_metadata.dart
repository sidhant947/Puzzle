import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'polyomino_tiling_screen.dart';

final polyominoTilingMetadata = GameMetadata(
  id: 'polyomino_tiling',
  category: 'SPATIAL',
  icon: Icons.dashboard_customize_rounded,
  color: DesignSystem.gamePurple,
  builder: (context) => const PolyominoTilingScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.high,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.polyominoTilingTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.polyominoTilingSubtitle;
