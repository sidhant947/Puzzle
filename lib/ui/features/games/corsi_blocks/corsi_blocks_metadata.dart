import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'corsi_blocks_screen.dart';

final corsiBlocksMetadata = GameMetadata(
  id: 'corsi_blocks',
  category: 'MEMORY',
  icon: Icons.grid_view_rounded,
  color: DesignSystem.gameIndigo,
  builder: (context) => CorsiBlocksScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.low,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.corsiBlocksTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.corsiBlocksSubtitle;
