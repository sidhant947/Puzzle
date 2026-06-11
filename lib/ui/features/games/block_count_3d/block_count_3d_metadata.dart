import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'block_count_3d_screen.dart';

final blockCount_3dMetadata = GameMetadata(
  id: 'block_count_3d',
  category: 'SPATIAL',
  icon: Icons.view_in_ar_rounded,
  color: DesignSystem.gameTeal,
  builder: (context) => BlockCount3DScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.blockCount3dTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.blockCount3dSubtitle;
