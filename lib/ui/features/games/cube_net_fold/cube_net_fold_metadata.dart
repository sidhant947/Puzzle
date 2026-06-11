import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'cube_net_fold_screen.dart';

final cubeNetFoldMetadata = GameMetadata(
  id: 'cube_net_fold',
  category: 'SPATIAL',
  icon: Icons.unfold_more_double_rounded,
  color: DesignSystem.gameBlue,
  builder: (context) => CubeNetFoldScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.cubeNetFoldTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.cubeNetFoldSubtitle;
