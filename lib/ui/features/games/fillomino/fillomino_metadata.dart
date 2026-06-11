import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'fillomino_screen.dart';

final fillominoMetadata = GameMetadata(
  id: 'fillomino',
  category: 'LOGIC',
  icon: Icons.grid_3x3_rounded,
  color: DesignSystem.gameAmber,
  builder: (context) => FillominoScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.fillominoTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.fillominoSubtitle;
